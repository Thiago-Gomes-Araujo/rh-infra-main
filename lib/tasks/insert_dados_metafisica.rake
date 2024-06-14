namespace :db do
  desc "Insere dois registros na tabela de i_tipos_contratados"
  task inserir_registros_metafisica: :environment do
    IMetafisica.create(descricao: "ESTUDANTE")
    IMetafisica.create(descricao: "ESCOLA")
    IMetafisica.create(descricao: "UNIDADE ADMINISTRATIVA")
    puts "Registros inseridos com sucesso!"
  end
end
