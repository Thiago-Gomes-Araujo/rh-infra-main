# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_06_06_155759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "dblink"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "e_atos_normativos", force: :cascade do |t|
    t.string "parecer"
    t.string "numero_doe"
    t.date "data_doe"
    t.string "link_doe"
    t.string "descricao"
    t.bigint "i_predio_id", null: false
    t.bigint "e_tipo_ato_normativo_id", null: false
    t.bigint "e_normatizacao_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "portaria"
    t.string "observacao"
    t.index ["e_normatizacao_id"], name: "index_e_atos_normativos_on_e_normatizacao_id"
    t.index ["e_tipo_ato_normativo_id"], name: "index_e_atos_normativos_on_e_tipo_ato_normativo_id"
    t.index ["i_predio_id"], name: "index_e_atos_normativos_on_i_predio_id"
  end

  create_table "e_especificidades", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_etapas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "e_nivel_id"
    t.index ["e_nivel_id"], name: "index_e_etapas_on_e_nivel_id"
  end

  create_table "e_fases", force: :cascade do |t|
    t.string "descricao"
    t.bigint "e_etapa_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "e_modelo_oferta_id"
    t.bigint "e_modalidade_id"
    t.index ["e_etapa_id"], name: "index_e_fases_on_e_etapa_id"
    t.index ["e_modalidade_id"], name: "index_e_fases_on_e_modalidade_id"
    t.index ["e_modelo_oferta_id"], name: "index_e_fases_on_e_modelo_oferta_id"
  end

  create_table "e_fases_serv_educ", force: :cascade do |t|
    t.bigint "e_servico_educacional_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "e_fase_id"
    t.index ["e_fase_id"], name: "index_e_fases_serv_educ_on_e_fase_id"
    t.index ["e_servico_educacional_id"], name: "index_e_fases_serv_educ_on_e_servico_educacional_id"
  end

  create_table "e_modalidades", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_modelos_ofertas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_niveis", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_normatizacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_regimentos", force: :cascade do |t|
    t.bigint "i_predio_id", null: false
    t.boolean "homologacao"
    t.integer "numero_homologacao"
    t.string "portaria"
    t.date "data_portaria"
    t.string "numero_doe"
    t.date "data_doe"
    t.string "url_doe"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_predio_id"], name: "index_e_regimentos_on_i_predio_id"
  end

  create_table "e_servicos_educacionais", force: :cascade do |t|
    t.string "nome"
    t.bigint "e_ato_normativo_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_ato_normativo_id"], name: "index_e_servicos_educacionais_on_e_ato_normativo_id"
  end

  create_table "e_tipos_atos_normativos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_areas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_cartorios", force: :cascade do |t|
    t.string "descricao"
    t.string "cnpj"
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_municipio_id"], name: "index_g_cartorios_on_g_municipio_id"
  end

  create_table "g_categorias_cnh", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_cres", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_municipio_id", null: false
    t.bigint "g_tipologia_cre_id", null: false
    t.boolean "nucleo_apoio"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_municipio_id"], name: "index_g_cres_on_g_municipio_id"
    t.index ["g_tipologia_cre_id"], name: "index_g_cres_on_g_tipologia_cre_id"
  end

  create_table "g_cursos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "g_area_id"
    t.index ["g_area_id"], name: "index_g_cursos_on_g_area_id"
  end

  create_table "g_cursos_idiomas", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_idioma_id", null: false
    t.bigint "g_instituicao_id", null: false
    t.bigint "g_pessoa_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_idioma_id"], name: "index_g_cursos_idiomas_on_g_idioma_id"
    t.index ["g_instituicao_id"], name: "index_g_cursos_idiomas_on_g_instituicao_id"
    t.index ["g_pessoa_id"], name: "index_g_cursos_idiomas_on_g_pessoa_id"
  end

  create_table "g_deficiencias", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_dependentes", force: :cascade do |t|
    t.string "nome"
    t.bigint "g_parentesco_id", null: false
    t.date "data_nascimento"
    t.bigint "g_pessoa_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_parentesco_id"], name: "index_g_dependentes_on_g_parentesco_id"
    t.index ["g_pessoa_id"], name: "index_g_dependentes_on_g_pessoa_id"
  end

  create_table "g_dicionarios", force: :cascade do |t|
    t.string "nome_tabela"
    t.string "campo_tabela"
    t.string "descricao"
    t.bigint "g_sistema_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_sistema_id"], name: "index_g_dicionarios_on_g_sistema_id"
  end

  create_table "g_dimensoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "g_treinamento_id"
    t.index ["g_treinamento_id"], name: "index_g_dimensoes_on_g_treinamento_id"
  end

  create_table "g_distritos", force: :cascade do |t|
    t.string "descricao"
    t.string "codigo_ibge"
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_municipio_id"], name: "index_g_distritos_on_g_municipio_id"
  end

  create_table "g_divisoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "g_treinamento_id"
    t.index ["g_treinamento_id"], name: "index_g_divisoes_on_g_treinamento_id"
  end

  create_table "g_estados", force: :cascade do |t|
    t.string "descricao"
    t.string "uf"
    t.bigint "g_pais_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_pais_id"], name: "index_g_estados_on_g_pais_id"
  end

  create_table "g_estados_civis", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_etapa_saeros", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_ideros", force: :cascade do |t|
    t.bigint "g_municipio_id", null: false
    t.decimal "iqa"
    t.decimal "iqf"
    t.bigint "g_taxa_aprovacao_id", null: false
    t.bigint "g_indice_socioeconomico_id", null: false
    t.bigint "g_saero_municipio_id", null: false
    t.decimal "idero"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_indice_socioeconomico_id"], name: "index_g_ideros_on_g_indice_socioeconomico_id"
    t.index ["g_municipio_id"], name: "index_g_ideros_on_g_municipio_id"
    t.index ["g_saero_municipio_id"], name: "index_g_ideros_on_g_saero_municipio_id"
    t.index ["g_taxa_aprovacao_id"], name: "index_g_ideros_on_g_taxa_aprovacao_id"
  end

  create_table "g_idiomas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_indices_socioeconomicos", force: :cascade do |t|
    t.decimal "indice", precision: 17, scale: 4
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ano"
    t.index ["g_municipio_id"], name: "index_g_indices_socioeconomicos_on_g_municipio_id"
  end

  create_table "g_instituicoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_listas_organizacionais", force: :cascade do |t|
    t.string "sigla"
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_localidades", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_distrito_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_distrito_id"], name: "index_g_localidades_on_g_distrito_id"
  end

  create_table "g_modalidades", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "g_treinamento_id"
    t.index ["g_treinamento_id"], name: "index_g_modalidades_on_g_treinamento_id"
  end

  create_table "g_municipios", force: :cascade do |t|
    t.string "codigo_ibge"
    t.string "descricao"
    t.bigint "g_estado_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_estado_id"], name: "index_g_municipios_on_g_estado_id"
  end

  create_table "g_nacionalidades", force: :cascade do |t|
    t.string "descricao"
    t.bigint "g_pais_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_pais_id"], name: "index_g_nacionalidades_on_g_pais_id"
  end

  create_table "g_niveis_escolaridades", force: :cascade do |t|
    t.bigint "g_tipo_nivel_escolaridade_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.bigint "g_instituicao_id", null: false
    t.bigint "g_curso_id", null: false
    t.integer "carga_horaria"
    t.bigint "g_pessoa_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_curso_id"], name: "index_g_niveis_escolaridades_on_g_curso_id"
    t.index ["g_instituicao_id"], name: "index_g_niveis_escolaridades_on_g_instituicao_id"
    t.index ["g_pessoa_id"], name: "index_g_niveis_escolaridades_on_g_pessoa_id"
    t.index ["g_tipo_nivel_escolaridade_id"], name: "index_g_niveis_escolaridades_on_g_tipo_nivel_escolaridade_id"
  end

  create_table "g_paises", force: :cascade do |t|
    t.string "descricao"
    t.string "sigla"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_parentescos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_pessoa_teste", force: :cascade do |t|
    t.string "codigo_pessoa"
    t.string "nome"
    t.string "certidao_militar_numero"
    t.string "certidao_militar_regiao"
    t.date "cnh_validade"
    t.string "cpf"
    t.string "ctps_numero"
    t.string "ctps_serie"
    t.integer "ctps_uf_id"
    t.date "data_nascimento"
    t.string "endereco"
    t.integer "g_estado_civil_id"
    t.string "identidade_numero"
    t.integer "identidade_uf_id"
    t.integer "g_nacionalidade_id"
    t.string "pis"
    t.string "nome_mae"
    t.string "nome_pai"
    t.string "nome_social"
    t.string "certidao_numero"
    t.string "certidao_folha"
    t.string "certidao_livro"
    t.string "numero_termo"
    t.integer "g_tipo_certidao_civil_id"
    t.integer "g_deficiencia_id"
    t.integer "g_tipo_moradia_id"
    t.string "titulo_numero"
    t.string "titulo_secao"
    t.string "titulo_zona"
    t.integer "titulo_uf_id"
    t.boolean "legado"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "endereco_numero"
    t.string "email"
    t.string "telefone"
    t.bigint "g_raca_id"
    t.bigint "g_categoria_cnh_id"
    t.string "cnh_numero"
    t.string "bairro"
    t.index ["ctps_uf_id"], name: "index_g_pessoa_teste_on_ctps_uf_id"
    t.index ["g_categoria_cnh_id"], name: "index_g_pessoa_teste_on_g_categoria_cnh_id"
    t.index ["g_deficiencia_id"], name: "index_g_pessoa_teste_on_g_deficiencia_id"
    t.index ["g_estado_civil_id"], name: "index_g_pessoa_teste_on_g_estado_civil_id"
    t.index ["g_nacionalidade_id"], name: "index_g_pessoa_teste_on_g_nacionalidade_id"
    t.index ["g_raca_id"], name: "index_g_pessoa_teste_on_g_raca_id"
    t.index ["g_tipo_certidao_civil_id"], name: "index_g_pessoa_teste_on_g_tipo_certidao_civil_id"
    t.index ["g_tipo_moradia_id"], name: "index_g_pessoa_teste_on_g_tipo_moradia_id"
    t.index ["identidade_uf_id"], name: "index_g_pessoa_teste_on_identidade_uf_id"
    t.index ["titulo_uf_id"], name: "index_g_pessoa_teste_on_titulo_uf_id"
  end

  create_table "g_pessoas", force: :cascade do |t|
    t.string "codigo_pessoa"
    t.string "nome"
    t.string "certidao_militar_numero"
    t.string "certidao_militar_regiao"
    t.date "cnh_validade"
    t.string "cpf"
    t.string "ctps_numero"
    t.string "ctps_serie"
    t.integer "ctps_uf_id"
    t.date "data_nascimento"
    t.string "endereco"
    t.integer "g_estado_civil_id"
    t.string "identidade_numero"
    t.integer "identidade_uf_id"
    t.integer "g_nacionalidade_id"
    t.string "pis"
    t.string "nome_mae"
    t.string "nome_pai"
    t.string "nome_social"
    t.string "certidao_numero"
    t.string "certidao_folha"
    t.string "certidao_livro"
    t.string "numero_termo"
    t.integer "g_tipo_certidao_civil_id"
    t.integer "g_deficiencia_id"
    t.integer "g_tipo_moradia_id"
    t.string "titulo_numero"
    t.string "titulo_secao"
    t.string "titulo_zona"
    t.integer "titulo_uf_id"
    t.boolean "legado"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "endereco_numero"
    t.string "email"
    t.string "telefone"
    t.bigint "g_raca_id"
    t.bigint "g_categoria_cnh_id"
    t.string "cnh_numero"
    t.string "bairro"
    t.index ["ctps_uf_id"], name: "index_g_pessoas_on_ctps_uf_id"
    t.index ["g_categoria_cnh_id"], name: "index_g_pessoas_on_g_categoria_cnh_id"
    t.index ["g_deficiencia_id"], name: "index_g_pessoas_on_g_deficiencia_id"
    t.index ["g_estado_civil_id"], name: "index_g_pessoas_on_g_estado_civil_id"
    t.index ["g_nacionalidade_id"], name: "index_g_pessoas_on_g_nacionalidade_id"
    t.index ["g_raca_id"], name: "index_g_pessoas_on_g_raca_id"
    t.index ["g_tipo_certidao_civil_id"], name: "index_g_pessoas_on_g_tipo_certidao_civil_id"
    t.index ["g_tipo_moradia_id"], name: "index_g_pessoas_on_g_tipo_moradia_id"
    t.index ["identidade_uf_id"], name: "index_g_pessoas_on_identidade_uf_id"
    t.index ["titulo_uf_id"], name: "index_g_pessoas_on_titulo_uf_id"
  end

  create_table "g_racas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_saero_municipios", force: :cascade do |t|
    t.bigint "g_municipio_id", null: false
    t.decimal "indice_lp_segundo_ano", precision: 17, scale: 4
    t.decimal "indice_mt_segundo_ano", precision: 17, scale: 4
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ano"
    t.decimal "indice_lp_quinto_ano", precision: 17, scale: 4
    t.decimal "indice_mt_quinto_ano", precision: 17, scale: 4
    t.decimal "iqa", precision: 17, scale: 4
    t.decimal "iqf", precision: 17, scale: 4
    t.index ["g_municipio_id"], name: "index_g_saero_municipios_on_g_municipio_id"
  end

  create_table "g_secretarias", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf_secretario"
    t.string "nome_secretario"
    t.string "cpf_contador"
    t.string "nome_contador"
    t.string "cpf_coordenador_patrimonio"
    t.string "nome_coordenador_patrimonio"
    t.string "sigla"
  end

  create_table "g_sedam_icms_areas", force: :cascade do |t|
    t.bigint "g_municipio_id", null: false
    t.decimal "area_protegida", precision: 17, scale: 4
    t.decimal "area_antropizada", precision: 17, scale: 4
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "area_liquida", precision: 17, scale: 4
    t.integer "ano"
    t.index ["g_municipio_id"], name: "index_g_sedam_icms_areas_on_g_municipio_id"
  end

  create_table "g_sexos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_sistemas", force: :cascade do |t|
    t.string "letra"
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_status_treinamentos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "g_treinamento_id"
    t.index ["g_treinamento_id"], name: "index_g_status_treinamentos_on_g_treinamento_id"
  end

  create_table "g_taxas_aprovacoes", force: :cascade do |t|
    t.decimal "serie_1", precision: 17, scale: 4
    t.decimal "serie_2", precision: 17, scale: 4
    t.decimal "serie_3", precision: 17, scale: 4
    t.decimal "serie_4", precision: 17, scale: 4
    t.decimal "serie_5", precision: 17, scale: 4
    t.decimal "taxa_aprovacao", precision: 17, scale: 4
    t.integer "ano"
    t.bigint "g_municipio_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "media_taxa_aprovacao", precision: 17, scale: 4
    t.index ["g_municipio_id"], name: "index_g_taxas_aprovacoes_on_g_municipio_id"
  end

  create_table "g_tipologias_cres", force: :cascade do |t|
    t.string "descricao"
    t.integer "minimo_escolas"
    t.integer "maximo_escolas"
    t.integer "numero_professores_analistas"
    t.integer "numero_tecnicos"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_certidoes_civis", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_cursos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_moradias", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_niveis_escolaridades", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_tipos_usuarios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "g_treinamentos", force: :cascade do |t|
    t.string "descricao"
    t.integer "carga_horaria"
    t.bigint "g_tipo_curso_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.bigint "g_instituicao_id", null: false
    t.bigint "g_pessoa_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["g_instituicao_id"], name: "index_g_treinamentos_on_g_instituicao_id"
    t.index ["g_pessoa_id"], name: "index_g_treinamentos_on_g_pessoa_id"
    t.index ["g_tipo_curso_id"], name: "index_g_treinamentos_on_g_tipo_curso_id"
  end

  create_table "i_acordos", force: :cascade do |t|
    t.string "descricao"
    t.date "data_inicio"
    t.date "data_fim"
    t.string "observacoes"
    t.integer "i_predio_id"
    t.decimal "valor", precision: 17, scale: 2
    t.bigint "i_patrocinador_id", null: false
    t.string "sei_financeiro"
    t.string "sei_execucao"
    t.bigint "i_categoria_acordo_id", null: false
    t.string "objeto"
    t.string "nota_empenho"
    t.string "gestor"
    t.string "ordem_servico"
    t.date "data_entrega"
    t.bigint "i_status_acordo_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "g_cartorio_id"
    t.string "numero_acordo"
    t.bigint "i_contratado_id"
    t.bigint "i_fiscal_id"
    t.bigint "i_nivel_acordo_id"
    t.bigint "i_servico_acordo_id"
    t.bigint "i_tipo_acordo_id"
    t.bigint "i_tipo_fornecimento_execucao_id"
    t.bigint "i_modalidade_licitacao_id"
    t.index ["g_cartorio_id"], name: "index_i_acordos_on_g_cartorio_id"
    t.index ["i_categoria_acordo_id"], name: "index_i_acordos_on_i_categoria_acordo_id"
    t.index ["i_contratado_id"], name: "index_i_acordos_on_i_contratado_id"
    t.index ["i_fiscal_id"], name: "index_i_acordos_on_i_fiscal_id"
    t.index ["i_modalidade_licitacao_id"], name: "index_i_acordos_on_i_modalidade_licitacao_id"
    t.index ["i_nivel_acordo_id"], name: "index_i_acordos_on_i_nivel_acordo_id"
    t.index ["i_patrocinador_id"], name: "index_i_acordos_on_i_patrocinador_id"
    t.index ["i_predio_id"], name: "index_i_acordos_on_i_predio_id"
    t.index ["i_servico_acordo_id"], name: "index_i_acordos_on_i_servico_acordo_id"
    t.index ["i_status_acordo_id"], name: "index_i_acordos_on_i_status_acordo_id"
    t.index ["i_tipo_acordo_id"], name: "index_i_acordos_on_i_tipo_acordo_id"
    t.index ["i_tipo_fornecimento_execucao_id"], name: "index_i_acordos_on_i_tipo_fornecimento_execucao_id"
  end

  create_table "i_aditivos", force: :cascade do |t|
    t.bigint "i_acordo_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.decimal "valor"
    t.text "alteracao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_tipo_aditivo_id"
    t.index ["i_acordo_id"], name: "index_i_aditivos_on_i_acordo_id"
    t.index ["i_tipo_aditivo_id"], name: "index_i_aditivos_on_i_tipo_aditivo_id"
  end

  create_table "i_ambientes_prediais", force: :cascade do |t|
    t.string "descricao"
    t.bigint "i_tipo_ambiente_predial_id", null: false
    t.bigint "i_bloco_id", null: false
    t.decimal "metros_quadrados", precision: 17, scale: 2
    t.integer "capacidade"
    t.decimal "comprimento", precision: 17, scale: 2
    t.decimal "largura", precision: 17, scale: 2
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_bloco_id"], name: "index_i_ambientes_prediais_on_i_bloco_id"
    t.index ["i_tipo_ambiente_predial_id"], name: "index_i_ambientes_prediais_on_i_tipo_ambiente_predial_id"
  end

  create_table "i_andares", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_atividades_inspecoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_blocos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_andar_id"
    t.bigint "i_predio_id"
    t.index ["i_andar_id"], name: "index_i_blocos_on_i_andar_id"
    t.index ["i_predio_id"], name: "index_i_blocos_on_i_predio_id"
  end

  create_table "i_categorias_acordos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_checklists", force: :cascade do |t|
    t.bigint "i_predio_id", null: false
    t.date "data_checklist"
    t.boolean "bic_ficha_cadastral"
    t.boolean "croqui"
    t.boolean "memorial_descritivo"
    t.boolean "certidao_narrativa_informativa"
    t.boolean "certidao_valor_venal"
    t.boolean "mapa_localizacao"
    t.boolean "licenca_operacao_provisoria"
    t.boolean "termo_doacao"
    t.boolean "termo_cessao_uso_anuencia"
    t.boolean "projeto_arquitetonico"
    t.boolean "alvara_funcionamento"
    t.boolean "alvara_sanitario"
    t.boolean "projeto_acessibilidade"
    t.boolean "laudo_tecnico_avaliacao_imoveis"
    t.boolean "reforma_adequacao_ultimos_dois_anos"
    t.string "processo_sei"
    t.string "observacao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "relatorio_fotografico_ambiental"
    t.boolean "lei_decreto_doacao"
    t.boolean "certidao_inteiro_teor"
    t.boolean "spda"
    t.boolean "projeto_combate_incendio"
    t.boolean "acordo_cooperacao_tecnica"
    t.boolean "termo_destinacao_responsabilidade"
    t.index ["i_predio_id"], name: "index_i_checklists_on_i_predio_id"
  end

  create_table "i_classificacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_conformidades", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_contas_contabeis", force: :cascade do |t|
    t.string "codigo"
    t.string "tipo_consolidacao"
    t.string "natureza"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descricao"
  end

  create_table "i_contratados", force: :cascade do |t|
    t.string "cnpj"
    t.string "razao_social"
    t.string "nome_fantasia"
    t.string "nome_proprietario"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.bigint "i_tipo_contratado_id"
    t.string "cpf"
    t.index ["i_tipo_contratado_id"], name: "index_i_contratados_on_i_tipo_contratado_id"
  end

  create_table "i_correcoes_monetarias", force: :cascade do |t|
    t.date "data_avaliacao"
    t.decimal "valor_edificacao", precision: 17, scale: 2
    t.decimal "valor_terreno", precision: 17, scale: 2
    t.date "competencia_avaliacao"
    t.integer "meses"
    t.integer "vida_util_anos"
    t.integer "vida_util_meses"
    t.string "percentual_residual"
    t.decimal "valor_residual", precision: 17, scale: 2
    t.decimal "valor_depreciavel", precision: 17, scale: 2
    t.decimal "depreciacao_mes", precision: 17, scale: 2
    t.decimal "depreciacao_acumulada", precision: 17, scale: 2
    t.decimal "valor_contabil", precision: 17, scale: 2
    t.decimal "benfeitoria", precision: 17, scale: 2
    t.date "data_benfeitoria"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_predio_id"
    t.decimal "obras_em_andamento", precision: 17, scale: 2
    t.date "data_obras_em_andamento"
    t.decimal "instalacoes", precision: 17, scale: 2
    t.date "data_instalacoes"
    t.boolean "fechada"
    t.index ["i_predio_id"], name: "index_i_correcoes_monetarias_on_i_predio_id"
  end

  create_table "i_equipamentos", force: :cascade do |t|
    t.string "descricao"
    t.integer "quantidade"
    t.bigint "i_tipo_equipamento_id", null: false
    t.bigint "i_ambiente_predial_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descricao_sintetica"
    t.string "descricao_analitica"
    t.date "data_ingresso"
    t.string "descricao_documento_habil"
    t.string "numero_sei"
    t.string "numero_tombamento"
    t.string "numero_empenho"
    t.string "numero_nfe"
    t.bigint "i_marca_id"
    t.bigint "i_classificacao_id"
    t.bigint "i_estado_equipamento_id"
    t.bigint "i_forma_ingresso_id"
    t.bigint "g_lista_organizacional_id"
    t.decimal "valor_aquisicao", precision: 17, scale: 2
    t.boolean "depreciacao"
    t.integer "valor_percentual"
    t.integer "valor_util_meses"
    t.string "numero_serie"
    t.string "modelo"
    t.integer "numero_termo_garantia"
    t.date "inicio_vigencia_termo_garantia"
    t.date "fim_vigencia_termo_garantia"
    t.string "observacao"
    t.boolean "veiculo_especial"
    t.integer "ano_fabricacao"
    t.integer "ano_modelo"
    t.string "chassi"
    t.string "cor"
    t.string "classificacao_placa"
    t.string "numero_placa"
    t.string "renavam"
    t.bigint "g_municipio_placa_id"
    t.bigint "i_fornecedor_id"
    t.bigint "i_familia_equipamento_id"
    t.string "numero_apolice"
    t.date "inicio_vigencia_apolice"
    t.date "fim_vigencia_apolice"
    t.bigint "i_seguradora_id"
    t.index ["g_lista_organizacional_id"], name: "index_i_equipamentos_on_g_lista_organizacional_id"
    t.index ["g_municipio_placa_id"], name: "index_i_equipamentos_on_g_municipio_placa_id"
    t.index ["i_ambiente_predial_id"], name: "index_i_equipamentos_on_i_ambiente_predial_id"
    t.index ["i_classificacao_id"], name: "index_i_equipamentos_on_i_classificacao_id"
    t.index ["i_estado_equipamento_id"], name: "index_i_equipamentos_on_i_estado_equipamento_id"
    t.index ["i_familia_equipamento_id"], name: "index_i_equipamentos_on_i_familia_equipamento_id"
    t.index ["i_forma_ingresso_id"], name: "index_i_equipamentos_on_i_forma_ingresso_id"
    t.index ["i_fornecedor_id"], name: "index_i_equipamentos_on_i_fornecedor_id"
    t.index ["i_marca_id"], name: "index_i_equipamentos_on_i_marca_id"
    t.index ["i_seguradora_id"], name: "index_i_equipamentos_on_i_seguradora_id"
    t.index ["i_tipo_equipamento_id"], name: "index_i_equipamentos_on_i_tipo_equipamento_id"
  end

  create_table "i_estado_equipamentos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_extensoes", force: :cascade do |t|
    t.string "descricao"
    t.string "portaria"
    t.date "data_inicio_validade"
    t.date "data_fim_validade"
    t.string "processo_sei"
    t.bigint "i_predio_id", null: false
    t.bigint "i_predio_mantenedor_proprietario_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latitude"
    t.string "longitude"
    t.bigint "g_localidade_id"
    t.bigint "i_predio_situacao_id"
    t.index ["g_localidade_id"], name: "index_i_extensoes_on_g_localidade_id"
    t.index ["i_predio_id"], name: "index_i_extensoes_on_i_predio_id"
    t.index ["i_predio_mantenedor_proprietario_id"], name: "index_i_extensoes_on_i_predio_mantenedor_proprietario_id"
    t.index ["i_predio_situacao_id"], name: "index_i_extensoes_on_i_predio_situacao_id"
  end

  create_table "i_familias_equipamentos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_familias_sevicos_acordos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_fiscais", force: :cascade do |t|
    t.string "descricao"
    t.string "area_atuacao"
    t.bigint "i_portaria_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_portaria_id"], name: "index_i_fiscais_on_i_portaria_id"
  end

  create_table "i_formas_ingresso", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_inspecoes", force: :cascade do |t|
    t.string "descricao"
    t.bigint "i_predio_id", null: false
    t.date "data_inspecao"
    t.date "data_correcao"
    t.string "processo_sei"
    t.text "observacao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inspetor"
    t.bigint "i_tipo_inspecao_id"
    t.index ["i_predio_id"], name: "index_i_inspecoes_on_i_predio_id"
    t.index ["i_tipo_inspecao_id"], name: "index_i_inspecoes_on_i_tipo_inspecao_id"
  end

  create_table "i_itens_acordos", force: :cascade do |t|
    t.string "descricao"
    t.integer "quantidade"
    t.bigint "i_acordo_id", null: false
    t.bigint "i_tipo_item_acordo_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_acordo_id"], name: "index_i_itens_acordos_on_i_acordo_id"
    t.index ["i_tipo_item_acordo_id"], name: "index_i_itens_acordos_on_i_tipo_item_acordo_id"
  end

  create_table "i_itens_inspecoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_tipo_inspecao_id"
    t.index ["i_tipo_inspecao_id"], name: "index_i_itens_inspecoes_on_i_tipo_inspecao_id"
  end

  create_table "i_marcas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_medicoes", force: :cascade do |t|
    t.decimal "percentual_fiscal", precision: 17, scale: 2
    t.date "data_inicio"
    t.string "observacoes"
    t.bigint "i_acordo_id", null: false
    t.bigint "i_notificacao_id", null: false
    t.decimal "percentual_contratante", precision: 17, scale: 2
    t.string "created_by"
    t.string "updated_by"
    t.string "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_fiscal_id"
    t.integer "numero_medicoes"
    t.decimal "valor", precision: 17, scale: 2
    t.date "data_fim"
    t.boolean "termo_provisorio"
    t.date "data_termo_provisorio"
    t.index ["i_acordo_id"], name: "index_i_medicoes_on_i_acordo_id"
    t.index ["i_fiscal_id"], name: "index_i_medicoes_on_i_fiscal_id"
    t.index ["i_notificacao_id"], name: "index_i_medicoes_on_i_notificacao_id"
  end

  create_table "i_memoriais_descritivos_terreno", force: :cascade do |t|
    t.bigint "i_predio_id", null: false
    t.string "confronte_frente"
    t.string "confronte_fundos"
    t.string "confronte_lado_esquerdo"
    t.string "confronte_lado_direito"
    t.string "area_total"
    t.string "perimetro"
    t.string "frente"
    t.string "fundos"
    t.string "lado_direito"
    t.string "lado_esquerdo"
    t.string "tipo_construcao"
    t.string "observacao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_predio_id"], name: "index_i_memoriais_descritivos_terreno_on_i_predio_id"
  end

  create_table "i_metafisicas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_modalidades_licitacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_niveis_acordo", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_notificacoes", force: :cascade do |t|
    t.string "descricao"
    t.date "data_inicio"
    t.string "motivo_notificacao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_status_notificacao_id"
    t.bigint "i_acordo_id"
    t.date "data_fim"
    t.index ["i_acordo_id"], name: "index_i_notificacoes_on_i_acordo_id"
    t.index ["i_status_notificacao_id"], name: "index_i_notificacoes_on_i_status_notificacao_id"
  end

  create_table "i_orcamentos", force: :cascade do |t|
    t.integer "i_acordo_id"
    t.integer "i_medicao_id"
    t.string "pa"
    t.string "elemento_despesa"
    t.decimal "valor"
    t.decimal "percentual"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantidade"
    t.bigint "i_metafisica_id"
    t.index ["i_acordo_id"], name: "index_i_orcamentos_on_i_acordo_id"
    t.index ["i_medicao_id"], name: "index_i_orcamentos_on_i_medicao_id"
    t.index ["i_metafisica_id"], name: "index_i_orcamentos_on_i_metafisica_id"
  end

  create_table "i_patrocinadores", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_portarias", force: :cascade do |t|
    t.string "descricao"
    t.date "data_inicio"
    t.date "data_fim"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predio_estruturas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios", force: :cascade do |t|
    t.string "nome_predio"
    t.bigint "i_tipo_predio_id", null: false
    t.string "codigo_inep"
    t.string "matricula_imovel"
    t.string "codigo_imovel"
    t.string "estrutura"
    t.bigint "i_tipologia_escola_id", null: false
    t.boolean "educacao_integral"
    t.bigint "g_localidade_id", null: false
    t.string "latitude"
    t.string "longitude"
    t.bigint "g_secretaria_id", null: false
    t.string "numero_endereco"
    t.string "complemento"
    t.string "telefone_contato"
    t.string "telefone_predio"
    t.string "email_responsavel"
    t.bigint "i_predio_situacao_id", null: false
    t.date "data_inicio_atividades"
    t.date "data_fim_atividades"
    t.bigint "i_predio_localizacao_id", null: false
    t.bigint "i_predio_mantenedor_proprietario_id", null: false
    t.bigint "i_predio_tipo_localizacao_diferenciada_id", null: false
    t.bigint "i_predio_natureza_ocupacao_id", null: false
    t.boolean "documentacao_propriedade"
    t.boolean "agua_potavel"
    t.bigint "i_predio_tipo_abastecimento_id", null: false
    t.bigint "i_predio_tipo_energia_eletrica_id", null: false
    t.bigint "i_predio_esgoto_sanitario_id", null: false
    t.bigint "i_predio_destinacao_lixo_id", null: false
    t.bigint "i_predio_tratamento_lixo_id", null: false
    t.bigint "i_predio_estrutura_id", null: false
    t.decimal "valor_original", precision: 17, scale: 2
    t.decimal "valor_reavaliado", precision: 17, scale: 2
    t.bigint "i_conta_contabil_id", null: false
    t.decimal "valor_terreno", precision: 17, scale: 2
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_conformidade_terreno_id"
    t.bigint "i_conformidade_edificacao_id"
    t.decimal "valor_edificacao_infraobras", precision: 17, scale: 2
    t.string "endereco"
    t.bigint "i_mantenedor_id"
    t.bigint "g_cre_id"
    t.bigint "g_cartorio_id"
    t.string "inscricao_cadastral"
    t.string "cep"
    t.string "logradouro"
    t.bigint "e_especificidade_id"
    t.decimal "area_interna_construida", precision: 17, scale: 2
    t.decimal "area_externa_construida", precision: 17, scale: 2
    t.integer "total_janelas"
    t.integer "total_portas"
    t.decimal "total_metros_quadrados_janelas", precision: 17, scale: 2
    t.decimal "total_metros_quadrados_portas", precision: 17, scale: 2
    t.string "bairro"
    t.bigint "g_pessoa_id"
    t.index ["e_especificidade_id"], name: "index_i_predios_on_e_especificidade_id"
    t.index ["g_cartorio_id"], name: "index_i_predios_on_g_cartorio_id"
    t.index ["g_cre_id"], name: "index_i_predios_on_g_cre_id"
    t.index ["g_localidade_id"], name: "index_i_predios_on_g_localidade_id"
    t.index ["g_pessoa_id"], name: "index_i_predios_on_g_pessoa_id"
    t.index ["g_secretaria_id"], name: "index_i_predios_on_g_secretaria_id"
    t.index ["i_conformidade_edificacao_id"], name: "index_i_predios_on_i_conformidade_edificacao_id"
    t.index ["i_conformidade_terreno_id"], name: "index_i_predios_on_i_conformidade_terreno_id"
    t.index ["i_conta_contabil_id"], name: "index_i_predios_on_i_conta_contabil_id"
    t.index ["i_mantenedor_id"], name: "index_i_predios_on_i_mantenedor_id"
    t.index ["i_predio_destinacao_lixo_id"], name: "index_i_predios_on_i_predio_destinacao_lixo_id"
    t.index ["i_predio_esgoto_sanitario_id"], name: "index_i_predios_on_i_predio_esgoto_sanitario_id"
    t.index ["i_predio_estrutura_id"], name: "index_i_predios_on_i_predio_estrutura_id"
    t.index ["i_predio_localizacao_id"], name: "index_i_predios_on_i_predio_localizacao_id"
    t.index ["i_predio_mantenedor_proprietario_id"], name: "index_i_predios_on_i_predio_mantenedor_proprietario_id"
    t.index ["i_predio_natureza_ocupacao_id"], name: "index_i_predios_on_i_predio_natureza_ocupacao_id"
    t.index ["i_predio_situacao_id"], name: "index_i_predios_on_i_predio_situacao_id"
    t.index ["i_predio_tipo_abastecimento_id"], name: "index_i_predios_on_i_predio_tipo_abastecimento_id"
    t.index ["i_predio_tipo_energia_eletrica_id"], name: "index_i_predios_on_i_predio_tipo_energia_eletrica_id"
    t.index ["i_predio_tipo_localizacao_diferenciada_id"], name: "index_i_predios_on_i_predio_tipo_localizacao_diferenciada_id"
    t.index ["i_predio_tratamento_lixo_id"], name: "index_i_predios_on_i_predio_tratamento_lixo_id"
    t.index ["i_tipo_predio_id"], name: "index_i_predios_on_i_tipo_predio_id"
    t.index ["i_tipologia_escola_id"], name: "index_i_predios_on_i_tipologia_escola_id"
  end

  create_table "i_predios_destinacoes_lixo", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_esgotos_sanitario", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_localizacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_mantenedores_proprietarios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_naturezas_ocupacao", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_situacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_tipos_abastecimento", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_tipos_energia_eletrica", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_tipos_localizacoes_diferenciadas", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_predios_tratamentos_lixo", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_relacoes_inspecoes", force: :cascade do |t|
    t.bigint "i_tipo_item_inspecao_id", null: false
    t.bigint "i_item_inspecao_id", null: false
    t.bigint "i_tipo_inspecao_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_item_inspecao_id"], name: "index_i_relacoes_inspecoes_on_i_item_inspecao_id"
    t.index ["i_tipo_inspecao_id"], name: "index_i_relacoes_inspecoes_on_i_tipo_inspecao_id"
    t.index ["i_tipo_item_inspecao_id"], name: "index_i_relacoes_inspecoes_on_i_tipo_item_inspecao_id"
  end

  create_table "i_servicos_acordos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "i_familia_servico_acordo_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_familia_servico_acordo_id"], name: "index_i_servicos_acordos_on_i_familia_servico_acordo_id"
  end

  create_table "i_status_acordos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_status_inspecoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_status_notificacoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipologias_escolas", force: :cascade do |t|
    t.string "descricao"
    t.integer "minimo_salas"
    t.integer "maximo_salas"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_acordo", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_aditivos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_ambientes_prediais", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_contratados", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_equipamentos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_fornecimentos_execucao", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_inspecoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_itens_acordos", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_itens_inspecoes", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_tipos_predios", force: :cascade do |t|
    t.string "descricao"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "g_secretaria_id"
    t.index ["g_secretaria_id"], name: "index_i_tipos_predios_on_g_secretaria_id"
  end

  create_table "i_topicos_inspecoes", force: :cascade do |t|
    t.bigint "i_status_inspecao_id", null: false
    t.datetime "deleted_at"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "i_inspecao_id"
    t.bigint "i_relacao_inspecao_id", null: false
    t.bigint "i_atividade_inspecao_id"
    t.index ["i_atividade_inspecao_id"], name: "index_i_topicos_inspecoes_on_i_atividade_inspecao_id"
    t.index ["i_inspecao_id"], name: "index_i_topicos_inspecoes_on_i_inspecao_id"
    t.index ["i_relacao_inspecao_id"], name: "index_i_topicos_inspecoes_on_i_relacao_inspecao_id"
    t.index ["i_status_inspecao_id"], name: "index_i_topicos_inspecoes_on_i_status_inspecao_id"
  end

  create_table "i_valores_empenhados_acordos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "i_acordo_id", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "valor", precision: 17, scale: 2
    t.date "data_inicial"
    t.date "data_final"
    t.index ["i_acordo_id"], name: "index_i_valores_empenhados_acordos_on_i_acordo_id"
  end

  create_table "pessoaTESTE", id: false, force: :cascade do |t|
    t.integer "id"
    t.string "codigo"
    t.string "cpf"
    t.string "nome"
    t.string "data_nascimento"
    t.string "sexo"
  end

  create_table "pessoa_sql", id: false, force: :cascade do |t|
    t.integer "id_pessoa"
    t.string "cpf", limit: 20
    t.string "rg", limit: 20
    t.string "rg_orgao", limit: 50
    t.date "rg_data"
    t.string "nome", limit: 255
    t.string "nome_pai", limit: 255
    t.string "nome_mae", limit: 255
    t.string "naturalidade", limit: 255
    t.date "data_nascimento"
    t.string "estado_civil", limit: 50
    t.string "sexo", limit: 3
    t.string "escolaridade", limit: 255
    t.string "telefone_comercial", limit: 255
    t.string "telefone_celular", limit: 255
    t.string "telefone_residencial", limit: 255
    t.string "email", limit: 255
    t.string "pis_pasep", limit: 20
    t.string "raca_cor", limit: 20
    t.string "endereco_cep", limit: 10
    t.string "tipo_logradouro", limit: 50
    t.string "endereco_logradouro", limit: 100
    t.string "endereco_numero", limit: 20
    t.string "endereco_bairro", limit: 50
    t.string "endereco_municipio", limit: 100
    t.string "endereco_uf", limit: 2
    t.string "titulo_numero", limit: 100
    t.string "titulo_zona", limit: 100
    t.string "titulo_secao", limit: 100
    t.string "titulo_orgao", limit: 50
    t.date "titulo_data"
    t.string "cert_militar_numero", limit: 20
    t.string "cert_militar_serie", limit: 20
    t.string "cert_militar_orgao", limit: 50
    t.date "cert_milita_data"
    t.string "ctps_numero", limit: 20
    t.string "ctps_serie", limit: 20
    t.date "ctps_data"
    t.string "ctps_orgao", limit: 100
    t.index ["id_pessoa"], name: "unique_id_pessoa", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "cpf"
    t.boolean "admin"
    t.bigint "g_secretaria_id"
    t.string "created_by"
    t.string "updated_by"
    t.string "nome"
    t.bigint "g_cre_id"
    t.bigint "i_predio_id"
    t.bigint "g_tipo_usuario_id"
    t.boolean "password_change_required", default: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true, where: "(deleted_at IS NULL)"
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(deleted_at IS NULL)"
    t.index ["g_cre_id"], name: "index_users_on_g_cre_id"
    t.index ["g_secretaria_id"], name: "index_users_on_g_secretaria_id"
    t.index ["g_tipo_usuario_id"], name: "index_users_on_g_tipo_usuario_id"
    t.index ["i_predio_id"], name: "index_users_on_i_predio_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "e_atos_normativos", "e_normatizacoes"
  add_foreign_key "e_atos_normativos", "e_tipos_atos_normativos"
  add_foreign_key "e_atos_normativos", "i_predios"
  add_foreign_key "e_etapas", "e_niveis"
  add_foreign_key "e_fases", "e_etapas"
  add_foreign_key "e_fases", "e_modalidades"
  add_foreign_key "e_fases", "e_modelos_ofertas"
  add_foreign_key "e_fases_serv_educ", "e_fases"
  add_foreign_key "e_fases_serv_educ", "e_servicos_educacionais"
  add_foreign_key "e_regimentos", "i_predios"
  add_foreign_key "e_servicos_educacionais", "e_atos_normativos"
  add_foreign_key "g_cartorios", "g_municipios"
  add_foreign_key "g_cres", "g_municipios"
  add_foreign_key "g_cres", "g_tipologias_cres"
  add_foreign_key "g_cursos", "g_areas"
  add_foreign_key "g_cursos_idiomas", "g_idiomas"
  add_foreign_key "g_cursos_idiomas", "g_instituicoes"
  add_foreign_key "g_cursos_idiomas", "g_pessoas"
  add_foreign_key "g_dependentes", "g_parentescos"
  add_foreign_key "g_dependentes", "g_pessoas"
  add_foreign_key "g_dicionarios", "g_sistemas"
  add_foreign_key "g_dimensoes", "g_treinamentos"
  add_foreign_key "g_distritos", "g_municipios"
  add_foreign_key "g_divisoes", "g_treinamentos"
  add_foreign_key "g_estados", "g_paises"
  add_foreign_key "g_ideros", "g_indices_socioeconomicos"
  add_foreign_key "g_ideros", "g_municipios"
  add_foreign_key "g_ideros", "g_saero_municipios"
  add_foreign_key "g_ideros", "g_taxas_aprovacoes"
  add_foreign_key "g_indices_socioeconomicos", "g_municipios"
  add_foreign_key "g_localidades", "g_distritos"
  add_foreign_key "g_modalidades", "g_treinamentos"
  add_foreign_key "g_municipios", "g_estados"
  add_foreign_key "g_nacionalidades", "g_paises"
  add_foreign_key "g_niveis_escolaridades", "g_cursos"
  add_foreign_key "g_niveis_escolaridades", "g_instituicoes"
  add_foreign_key "g_niveis_escolaridades", "g_pessoas"
  add_foreign_key "g_niveis_escolaridades", "g_tipos_niveis_escolaridades"
  add_foreign_key "g_pessoa_teste", "g_deficiencias"
  add_foreign_key "g_pessoa_teste", "g_estados", column: "ctps_uf_id"
  add_foreign_key "g_pessoa_teste", "g_estados", column: "identidade_uf_id"
  add_foreign_key "g_pessoa_teste", "g_estados", column: "titulo_uf_id"
  add_foreign_key "g_pessoa_teste", "g_estados_civis"
  add_foreign_key "g_pessoa_teste", "g_nacionalidades"
  add_foreign_key "g_pessoa_teste", "g_tipos_certidoes_civis"
  add_foreign_key "g_pessoa_teste", "g_tipos_moradias"
  add_foreign_key "g_pessoas", "g_deficiencias"
  add_foreign_key "g_pessoas", "g_estados", column: "ctps_uf_id"
  add_foreign_key "g_pessoas", "g_estados", column: "identidade_uf_id"
  add_foreign_key "g_pessoas", "g_estados", column: "titulo_uf_id"
  add_foreign_key "g_pessoas", "g_estados_civis"
  add_foreign_key "g_pessoas", "g_nacionalidades"
  add_foreign_key "g_pessoas", "g_tipos_certidoes_civis"
  add_foreign_key "g_pessoas", "g_tipos_moradias"
  add_foreign_key "g_saero_municipios", "g_municipios"
  add_foreign_key "g_sedam_icms_areas", "g_municipios"
  add_foreign_key "g_status_treinamentos", "g_treinamentos"
  add_foreign_key "g_taxas_aprovacoes", "g_municipios"
  add_foreign_key "g_treinamentos", "g_instituicoes"
  add_foreign_key "g_treinamentos", "g_pessoas"
  add_foreign_key "g_treinamentos", "g_tipos_cursos"
  add_foreign_key "i_acordos", "g_cartorios"
  add_foreign_key "i_acordos", "i_categorias_acordos"
  add_foreign_key "i_acordos", "i_contratados"
  add_foreign_key "i_acordos", "i_fiscais"
  add_foreign_key "i_acordos", "i_patrocinadores"
  add_foreign_key "i_acordos", "i_predios"
  add_foreign_key "i_acordos", "i_status_acordos"
  add_foreign_key "i_aditivos", "i_acordos"
  add_foreign_key "i_ambientes_prediais", "i_blocos"
  add_foreign_key "i_ambientes_prediais", "i_tipos_ambientes_prediais"
  add_foreign_key "i_blocos", "i_andares"
  add_foreign_key "i_blocos", "i_predios"
  add_foreign_key "i_checklists", "i_predios"
  add_foreign_key "i_correcoes_monetarias", "i_predios"
  add_foreign_key "i_equipamentos", "g_listas_organizacionais"
  add_foreign_key "i_equipamentos", "g_municipios", column: "g_municipio_placa_id"
  add_foreign_key "i_equipamentos", "i_ambientes_prediais"
  add_foreign_key "i_equipamentos", "i_classificacoes"
  add_foreign_key "i_equipamentos", "i_contratados", column: "i_fornecedor_id"
  add_foreign_key "i_equipamentos", "i_contratados", column: "i_seguradora_id"
  add_foreign_key "i_equipamentos", "i_estado_equipamentos"
  add_foreign_key "i_equipamentos", "i_familias_equipamentos"
  add_foreign_key "i_equipamentos", "i_formas_ingresso"
  add_foreign_key "i_equipamentos", "i_marcas"
  add_foreign_key "i_equipamentos", "i_tipos_equipamentos"
  add_foreign_key "i_extensoes", "g_localidades"
  add_foreign_key "i_extensoes", "i_predios"
  add_foreign_key "i_extensoes", "i_predios_mantenedores_proprietarios"
  add_foreign_key "i_fiscais", "i_portarias"
  add_foreign_key "i_inspecoes", "i_predios"
  add_foreign_key "i_itens_acordos", "i_acordos"
  add_foreign_key "i_itens_acordos", "i_tipos_itens_acordos"
  add_foreign_key "i_medicoes", "i_acordos"
  add_foreign_key "i_medicoes", "i_fiscais"
  add_foreign_key "i_medicoes", "i_notificacoes"
  add_foreign_key "i_memoriais_descritivos_terreno", "i_predios"
  add_foreign_key "i_notificacoes", "i_status_notificacoes"
  add_foreign_key "i_orcamentos", "i_acordos"
  add_foreign_key "i_orcamentos", "i_medicoes"
  add_foreign_key "i_predios", "e_especificidades"
  add_foreign_key "i_predios", "g_cartorios"
  add_foreign_key "i_predios", "g_cres"
  add_foreign_key "i_predios", "g_localidades"
  add_foreign_key "i_predios", "g_pessoas"
  add_foreign_key "i_predios", "g_secretarias"
  add_foreign_key "i_predios", "i_conformidades", column: "i_conformidade_edificacao_id"
  add_foreign_key "i_predios", "i_conformidades", column: "i_conformidade_terreno_id"
  add_foreign_key "i_predios", "i_contas_contabeis"
  add_foreign_key "i_predios", "i_predio_estruturas"
  add_foreign_key "i_predios", "i_predios_destinacoes_lixo"
  add_foreign_key "i_predios", "i_predios_esgotos_sanitario"
  add_foreign_key "i_predios", "i_predios_localizacoes"
  add_foreign_key "i_predios", "i_predios_mantenedores_proprietarios"
  add_foreign_key "i_predios", "i_predios_mantenedores_proprietarios", column: "i_mantenedor_id"
  add_foreign_key "i_predios", "i_predios_naturezas_ocupacao"
  add_foreign_key "i_predios", "i_predios_situacoes"
  add_foreign_key "i_predios", "i_predios_tipos_abastecimento"
  add_foreign_key "i_predios", "i_predios_tipos_energia_eletrica"
  add_foreign_key "i_predios", "i_predios_tipos_localizacoes_diferenciadas"
  add_foreign_key "i_predios", "i_predios_tratamentos_lixo"
  add_foreign_key "i_predios", "i_tipologias_escolas"
  add_foreign_key "i_predios", "i_tipos_predios"
  add_foreign_key "i_relacoes_inspecoes", "i_itens_inspecoes"
  add_foreign_key "i_relacoes_inspecoes", "i_tipos_inspecoes"
  add_foreign_key "i_relacoes_inspecoes", "i_tipos_itens_inspecoes"
  add_foreign_key "i_servicos_acordos", "i_familias_sevicos_acordos"
  add_foreign_key "i_tipos_predios", "g_secretarias"
  add_foreign_key "i_topicos_inspecoes", "i_atividades_inspecoes"
  add_foreign_key "i_topicos_inspecoes", "i_inspecoes"
  add_foreign_key "i_topicos_inspecoes", "i_relacoes_inspecoes"
  add_foreign_key "i_topicos_inspecoes", "i_status_inspecoes"
  add_foreign_key "i_valores_empenhados_acordos", "i_acordos"
  add_foreign_key "users", "g_secretarias"
end
