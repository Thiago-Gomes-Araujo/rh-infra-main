Rails.application.routes.draw do
  resources :g_sedam_icms_areas
  get "g_municipios/relatorio_sgis", to: "g_municipios#relatorio_sgis"
  resources :g_saero_municipios
  resources :g_indices_socioeconomicos
  resources :g_taxas_aprovacoes
  resources :i_atividades_inspecoes
  resources :i_relacoes_inspecoes
  resources :i_tipos_inspecoes
  get "g_sedam_icms", to: "g_sedam_icms_areas#index_relatorio"
  get "i_inspecoes/new_coinfra", to: "i_inspecoes#new_coinfra"
  get "i_inspecoes/new_mensal", to: "i_inspecoes#new_mensal"
  get "i_inspecoes/new_semanal", to: "i_inspecoes#new_semanal"
  resources :i_topicos_inspecoes
  resources :i_status_inspecoes
  resources :i_itens_inspecoes
  resources :i_tipos_aditivos
  resources :i_modalidades_licitacoes
  resources :i_servicos_acordos
  resources :i_familias_sevicos_acordos
  resources :i_tipos_fornecimentos_execucao
  resources :i_tipos_acordo
  resources :i_niveis_acordo
  resources :g_tipos_usuarios
  resources :i_formas_ingresso
  resources :i_estado_equipamentos
  resources :i_classificacoes
  resources :i_marcas
  resources :i_familias_equipamentos
  resources :g_listas_organizacionais
  resources :e_niveis
  resources :e_modelos_ofertas
  resources :e_fases_serv_educ
  resources :e_servicos_educacionais
  resources :e_fases
  resources :e_etapas
  resources :e_modalidades
  resources :e_atos_normativos
  resources :e_normatizacoes
  resources :e_tipos_atos_normativos
  resources :e_regimentos
  resources :e_especificidades
  resources :i_status_notificacoes
  resources :i_fiscais
  resources :i_contratados
  resources :g_cartorios
  resources :g_cres
  resources :g_tipologias_cres
  resources :i_checklists
  resources :i_acordos do
    resources :i_aditivos
    resources :i_medicoes do
      resources :i_orcamentos
    end
    resources :i_notificacoes
    resources :i_orcamentos
    resources :i_valores_empenhados_acordos
  end
  resources :i_itens_acordos
  resources :i_conformidades
  resources :i_tipos_itens_acordos
  resources :i_portarias
  resources :i_categorias_acordos
  resources :i_status_acordos
  resources :i_patrocinadores
  resources :i_extensoes
  resources :i_inspecoes
  resources :i_tipos_itens_inspecoes
  resources :i_memoriais_descritivos_terreno
  resources :i_predios do
    resources :i_blocos do
      resources :i_ambientes_prediais do
        #resources :i_equipamentos, only: %i[ index destroy ]
        #resources :i_equipamentos_veiculos, only: %i[ new create edit update ]
        #resources :i_equipamentos_moveis, only: %i[ new create edit update ]
        #resources :i_equipamentos_softwares, only: %i[ new create edit update ]
      end
    end
  end
  resources :i_predio_estruturas
  resources :i_predios_tratamentos_lixo
  resources :i_predios_destinacoes_lixo
  resources :i_predios_esgotos_sanitario
  resources :i_predios_tipos_energia_eletrica
  resources :i_predios_tipos_abastecimento
  resources :i_predios_naturezas_ocupacao
  resources :i_predios_tipos_localizacoes_diferenciadas
  resources :i_predios_mantenedores_proprietarios
  resources :i_predios_localizacoes
  resources :i_predios_situacoes
  resources :i_correcoes_monetarias
  resources :i_contas_contabeis
  resources :i_tipologias_escolas
  resources :i_tipos_predios
  resources :i_andares
  resources :i_tipos_ambientes_prediais
  resources :i_tipos_equipamentos
  devise_for :users, skip: [:registrations], path: "auth"
  as :user do
    put "auth/reset_password", to: "reset_password#update_password"
  end
  resources :users, path: "usuarios"
  resources :g_dicionarios
  resources :g_dimensoes
  resources :g_divisoes
  resources :g_modalidades
  resources :g_status_treinamentos
  resources :g_categorias_cnh
  resources :g_racas
  resources :g_pessoas do
    resources :g_niveis_escolaridades
    resources :g_cursos_idiomas
    resources :g_treinamentos
    resources :g_dependentes
  end
  resources :g_idiomas
  resources :g_parentescos
  resources :g_tipos_cursos
  resources :g_instituicoes
  resources :g_cursos
  resources :g_areas
  resources :g_tipos_niveis_escolaridades
  resources :g_secretarias
  resources :g_tipos_moradias
  resources :g_deficiencias
  resources :g_estados_civis
  resources :g_tipos_certidoes_civis
  resources :g_nacionalidades
  resources :g_localidades
  resources :g_distritos
  resources :g_municipios
  resources :g_estados
  resources :g_paises
  resources :g_sistemas
  resources :e_escolas, only: %i[ index ]

  get "relatorios/correcoes_monetarias", to: "relatorios#correcoes_monetarias"
  get "relatorios/tc16", to: "relatorios#tc16"
  get "relatorios/tc16_analitico", to: "relatorios#tc16_analitico"
  get "relatorios/acordos", to: "i_acordos#relatorios"
  get "relatorios/inspecoes", to: "i_inspecoes#relatorio_inspecoes"
  get "relatorios/inspecoes_geral", to: "i_inspecoes#relatorio_inspecoes_geral"
  get "relatorios/extensoes", to: "i_extensoes#relatorios"
  get "relatorios/checklists", to: "i_checklists#relatorios"
  get "relatorios/predios", to: "i_predios#relatorios"
  get "relatorios/sedam", to: "g_sedam_icms_areas#relatorio_sedam"
  get  "relatorios/sgis_escolar", to: "g_municipios#relatorio_sgis_escolar"


  root "home#index"

  get "primeiro_acesso", to: "password_changes#index"
  put "atualiza_senha", to: "password_changes#update"

  get "correcao_mensal", to: "relatorios#correcao_mensal"
  get "relatorios/tc16_sintetico", to: "relatorios#tc16_sintetico"
  get "relatorios/relatorio_icms", to: "relatorios#relatorio_icms"
  delete "deleted_file/:file_id", to: "i_checklists#destroy_file", as: :destroy_file

  namespace :api do
    namespace :v1 do
      get 'relatorio_icms_api/', to: 'relatorio_icms_informes#index', defaults: { format: :json }
    end
  end
  
end
