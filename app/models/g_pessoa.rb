class GPessoa < ApplicationRecord
  belongs_to :g_estado_civil
  belongs_to :g_nacionalidade
  belongs_to :g_tipo_certidao_civil
  belongs_to :g_deficiencia
  belongs_to :g_tipo_moradia
  belongs_to :g_categoria_cnh
  belongs_to :g_raca
  # FKs como nome personalizado
  belongs_to :ctps_uf, class_name: "GEstado"
  belongs_to :identidade_uf, class_name: "GEstado"
  belongs_to :titulo_uf, class_name: "GEstado"

  has_many :g_niveis_escolaridades
  has_many :g_cursos_idiomas
  has_many :g_treinamentos
  has_many :g_dependentes
  has_many :i_predios

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: { scope: :deleted_at }

  def cpf=(cpf)
    super cpf = cpf.gsub(/[.-]/, "").strip
  end

  STRINGS_TO_UPCASE_AND_STRIP = [:nome, :nome_social, :nome_pai, :nome_mae]
  STRINGS_TO_UPCASE_AND_STRIP.each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end
end
