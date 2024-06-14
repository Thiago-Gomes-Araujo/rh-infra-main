class CreateIPrestadoresServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :i_prestadores_servicos do |t|
      t.string :cnpj
      t.string :razao_social
      t.string :nome_fantasia
      t.string :nome_proprietario
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
