class IContratado < ApplicationRecord
  has_many :i_acordos
  #has_many :i_equipamentos
  belongs_to :i_tipo_contratado

  validates_uniqueness_of :cnpj, conditions: -> { where(deleted_at: nil) }, if: -> { cnpj.present? }
  validates_uniqueness_of :cpf, conditions: -> { where(deleted_at: nil) }, if: -> { cpf.present? }
  validates :email, presence: true, uniqueness: { scope: :deleted_at }
  validates :telefone, presence: true, uniqueness: { scope: :deleted_at }

  validates :i_tipo_contratado_id, presence: true

  before_validation :limpar_campos, on: :update

  CNPJ = 1
  CPF = 2

  STRINGS_TO_UPCASE_AND_STRIP = [:razao_social, :nome_fantasia, :nome_proprietario]
  STRINGS_TO_UPCASE_AND_STRIP.each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def email=(email)
    super email = email.downcase.strip
  end

  def cnpj=(cnpj)
    if cnpj.present?
      super cnpj = cnpj.gsub(/[.\/-]/, "").strip
    else
      super(nil)
    end
  end

  def cpf=(cpf)
    if cpf.present?
      super cpf = cpf.gsub(/[.-]/, "")
    else
      super(nil)
    end
  end

  def telefone=(telefone)
    super telefone = telefone.gsub(/[()-]/, "").strip
  end

  def to_s
    razao_social
  end

  private

  def limpar_campos
    self.cpf = nil if self.i_tipo_contratado_id == IContratado::CNPJ
    self.cnpj = nil if self.i_tipo_contratado_id == IContratado::CPF
  end
end
