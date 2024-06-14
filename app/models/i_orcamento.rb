class IOrcamento < ApplicationRecord
  belongs_to :i_acordo, optional: true
  belongs_to :i_medicao, optional: true
  belongs_to :i_metafisica, optional: true
  before_save :acordo_medicao
  after_save :preenche_percentual_acordo, if: -> { self.i_acordo_id.present? && self.i_medicao_id.nil? }
  after_save :preenche_percentual_medicao, if: -> { self.i_medicao_id.present? }

  scope :acordo_medicao, ->(acordo, medicao) {
          where(i_acordo_id: acordo.id) if acordo
          where(i_medicao_id: medicao.id) if medicao
        }

  DECIMAL_VALUES = [:valor]

  DECIMAL_VALUES.each do |attr|
    define_method("#{attr}=") do |val|
      super val = string_to_decimal(val)
    end
  end

  def preenche_percentual(condition)
    orcamentos = IOrcamento.where(condition)
    if orcamentos.exists?
      soma_orcamento = orcamentos.sum(:valor).to_f
      if soma_orcamento > 0
        orcamentos.each do |orcamento|
          percentual = (orcamento.valor.to_f / soma_orcamento) * 100
          orcamento.update_column(:percentual, percentual)
        end
      end
    end
  end

  private

  def preenche_percentual_acordo
    preenche_percentual(i_acordo_id: self.i_acordo_id, i_medicao_id: nil)
  end

  def preenche_percentual_medicao
    preenche_percentual(i_medicao_id: self.i_medicao_id)
  end

  def acordo_medicao
    self.i_acordo_id = IMedicao.find(i_medicao_id).i_acordo_id if i_medicao
  end
end
