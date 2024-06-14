class GMunicipio < ApplicationRecord
  belongs_to :g_estado

  has_many :g_distritos
  has_many :g_cres
  has_many :g_cartorios
  has_many :g_saero_municipios
  has_many :g_taxas_aprovacoes
  has_many :g_indices_socioeconomicos
  has_many :g_sedam_icms_areas

  validates :codigo_ibge, presence: true
  validates :descricao, presence: true, uniqueness: { scope: :deleted_at }

  [:descricao].each do |attr|
    define_method("#{attr}=") do |val|
      super(val.upcase.strip)
    end
  end

  def uf_descricao
    "#{g_estado.uf} - #{descricao}"
  end

  def to_s
    codigo_ibge + " - " + descricao
  end

  scope :rondonia, -> { includes(:g_estado).where(g_estado_id: 1) }

  scope :relatorio_idero, -> {
  joins(:g_taxas_aprovacoes, :g_indices_socioeconomicos, :g_saero_municipios)
    .left_joins(:g_sedam_icms_areas)
    .select("DISTINCT ON (g_municipios.codigo_ibge, g_saero_municipios.ano)
      g_municipios.descricao AS municipio, 
      g_taxas_aprovacoes.taxa_aprovacao AS ta,
      g_taxas_aprovacoes.media_taxa_aprovacao AS mta,
      g_indices_socioeconomicos.indice AS ise, 
      g_saero_municipios.ano,
      g_saero_municipios.iqa AS iqa, 
      g_saero_municipios.iqf AS iqf,
      g_sedam_icms_areas.area_protegida AS area_protegida,
      g_sedam_icms_areas.area_antropizada AS area_antropizada,
      g_sedam_icms_areas.area_liquida AS area_liquida,
      g_municipios.codigo_ibge AS codigo_ibge,
      g_sedam_icms_areas.updated_at AS updated_at_sedam,
      g_indices_socioeconomicos.updated_at AS updated_at_seduc")
    .order('g_municipios.codigo_ibge, g_saero_municipios.ano, g_sedam_icms_areas.updated_at DESC, g_indices_socioeconomicos.updated_at DESC')
    .map do |record|
    {
      municipio: record.municipio,
      ta: record.ta,
      mta: record.mta,
      ise: record.ise,
      ano: record.ano,
      iqa: record.iqa,
      iqf: record.iqf,
      idero: calcula_idero(record.iqa, record.iqf, record.ta, record.ise),
      area_protegida: record.area_protegida,
      area_antropizada: record.area_antropizada,
      area_liquida: record.area_liquida,
      codigo_ibge: record.codigo_ibge,
      updated_at_sedam: record.updated_at_sedam,
      updated_at_seduc: record.updated_at_seduc
    }
  end
}
def self.relatorio_idero_filtered_by_municipio(municipio_id = nil, ano = nil)
  query = all
  query = query.where(id: municipio_id) if municipio_id.present?
  query = query.joins(:g_taxas_aprovacoes, :g_indices_socioeconomicos, :g_saero_municipios).left_joins(:g_sedam_icms_areas)
  query = query.where(g_saero_municipios: { ano: ano }) if ano.present?

  query.select("DISTINCT ON (g_municipios.codigo_ibge, g_saero_municipios.ano)
    g_municipios.descricao AS municipio, 
    g_taxas_aprovacoes.taxa_aprovacao AS ta,
    g_taxas_aprovacoes.media_taxa_aprovacao AS mta,
    g_indices_socioeconomicos.indice AS ise, 
    g_saero_municipios.ano AS ano,
    g_saero_municipios.iqa AS iqa, 
    g_saero_municipios.iqf AS iqf,
    g_sedam_icms_areas.area_protegida AS area_protegida,
    g_sedam_icms_areas.area_antropizada AS area_antropizada,
    g_sedam_icms_areas.area_liquida AS area_liquida,
    g_municipios.codigo_ibge AS codigo_ibge,
    g_sedam_icms_areas.updated_at AS updated_at_sedam,
    g_indices_socioeconomicos.updated_at AS updated_at_seduc")
    .map do |record|
      {
        municipio: record.municipio,
        ta: record.ta,
        mta: record.mta,
        ise: record.ise,
        ano: record.ano,
        iqa: record.iqa,
        iqf: record.iqf,
        idero: calcula_idero(record.iqa, record.iqf, record.ta, record.ise),
        area_protegida: record.area_protegida,
        area_antropizada: record.area_antropizada,
        area_liquida: record.area_liquida,
        codigo_ibge: record.codigo_ibge,
        updated_at_sedam: record.updated_at_sedam,
        updated_at_seduc: record.updated_at_seduc
      }
    end
end







def self.calcula_idero(iqa, iqf, ta, ise)
  return nil if iqa.nil? || iqf.nil? || ta.nil? || ise.nil?

  ((0.50 * iqa.to_f) + (0.42 * iqf.to_f) + (0.04 * ta.to_f) + (0.04 * ise.to_f)).floor(5)
end

  

=begin   
scope :relatorio_idero, -> {
          joins(:g_taxas_aprovacoes, :g_indices_socioeconomicos, :g_saero_municipios).left_joins(:g_sedam_icms_areas)
            .select("g_municipios.descricao AS municipio, g_taxas_aprovacoes.total AS ta,
            g_indices_socioeconomicos.indice AS ise, g_saero_municipios.ano,
            g_saero_municipios.indice_lp_segundo_ano AS indice_lp_segundo_ano,
            g_saero_municipios.indice_mt_segundo_ano AS indice_mt_segundo_ano,
            g_saero_municipios.indice_lp_quinto_ano AS indice_lp_quinto_ano, 
            g_saero_municipios.indice_mt_quinto_ano AS indice_mt_quinto_ano,
            g_saero_municipios.iqa AS iqa, g_saero_municipios.iqf AS iqf,
            g_sedam_icms_areas.area_protegida AS area_protegida,
            g_sedam_icms_areas.area_antropizada AS area_antropizada,
            g_sedam_icms_areas.area_liquida AS area_liquida
            ")
            .map do |record|
            {
              municipio: record.municipio,
              ta: record.ta,
              ise: record.ise,
              ano: record.ano,
              iqa: record.iqa,
              iqf: record.iqf,
              idero: calcula_idero(record.iqa, record.iqf, record.ta, record.ise),
              area_protegida: record.area_protegida,
              area_antropizada: record.area_antropizada,
              area_liquida: record.area_liquida,
            }
          end
        }
=end
end
