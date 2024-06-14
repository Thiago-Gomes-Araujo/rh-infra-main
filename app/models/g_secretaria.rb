class GSecretaria < ApplicationRecord
  has_many :users
  has_many :i_predios
  has_many :i_tipos_predios
  has_many :g_cre

  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }
  validates :sigla, presence: true, uniqueness: { scope: :deleted_at }
  # validates :nome_secretario, presence: true, uniqueness: { scope: :deleted_at }
  # validates :cpf_secretario, presence: true, uniqueness: { scope: :deleted_at }
  # validates :nome_contador, presence: true, uniqueness: { scope: :deleted_at }
  # validates :cpf_contador, presence: true, uniqueness: { scope: :deleted_at }
  # validates :nome_coordenador_patrimonio, presence: true, uniqueness: { scope: :deleted_at }
  # validates :cpf_coordenador_patrimonio, presence: true, uniqueness: { scope: :deleted_at }
  # validate :custom_validates

  STRINGS_TO_UPCASE = [:descricao, :sigla, :nome_secretario, :nome_secretario, :nome_coordenador_patrimonio]
  REMOVE_MASK = [:cpf_secretario, :cpf_contador, :cpf_coordenador_patrimonio]

  STRINGS_TO_UPCASE.each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  REMOVE_MASK.each do |attr|
    define_method("#{attr}=") do |val|
      super(val.gsub(/[.-]/, ""))
    end
  end

  def to_s
    descricao
  end

  def sigla_descricao
    sigla + " - " + descricao
  end

  private

  # def custom_validates
  #   validate_cpf(:cpf_secretario)
  #   validate_cpf(:cpf_contador)
  #   validate_cpf(:cpf_coordenador_patrimonio)

  #   compare_cpfs(:cpf_secretario, :cpf_contador, "Secretário(a)", "Contador(a)")
  #   compare_cpfs(:cpf_secretario, :cpf_coordenador_patrimonio, "Secretário(a)", "Coordenador(a) de Patrimônio")
  #   compare_cpfs(:cpf_contador, :cpf_coordenador_patrimonio, "Contador(a)", "Coordenador(a) de Patrimônio")
  # end

  # def validate_cpf(cpf_field)
  #   if send(cpf_field).present? && !CPF.valid?(send(cpf_field))
  #     errors.add(cpf_field, "não é válido")
  #   end
  # end

  # def compare_cpfs(cpf1_field, cpf2_field, role1, role2)
  #   if send(cpf1_field).present? && send(cpf2_field).present? && send(cpf1_field) == send(cpf2_field)
  #     errors.add(cpf1_field, "não pode ser igual ao do(a) #{role2}")
  #     errors.add(cpf2_field, "não pode ser igual ao do(a) #{role1}")
  #   end
  # end
end
