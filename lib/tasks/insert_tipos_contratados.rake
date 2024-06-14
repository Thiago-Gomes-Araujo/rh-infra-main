namespace :db do
  desc "Insere dois registros na tabela de i_tipos_contratados"
  task inserir_registros: :environment do
    ITipoContratado.create(descricao: "Pessoa Jurídica")
    ITipoContratado.create(descricao: "Pessoa Física")
    puts "Registros inseridos com sucesso!"
  end
end
