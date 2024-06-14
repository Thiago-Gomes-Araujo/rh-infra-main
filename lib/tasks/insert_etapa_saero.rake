namespace :db do
  desc "Insere dois registros na tabela de i_tipos_contratados"
  task insere_dados_etapa_saero: :environment do
    GEtapaSaero.create(descricao: "2° ano")
    GEtapaSaero.create(descricao: "5° ano")
    puts "Registros inseridos com sucesso!"
  end
end
