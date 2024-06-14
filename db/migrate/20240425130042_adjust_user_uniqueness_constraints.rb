class AdjustUserUniquenessConstraints < ActiveRecord::Migration[7.0]
  def up
    # Remove os índices únicos antigos
    remove_index :users, :name => :index_users_on_cpf if index_exists?(:users, :cpf, unique: true, :name => :index_users_on_cpf)
    remove_index :users, :name => :index_users_on_email if index_exists?(:users, :email, unique: true, :name => :index_users_on_email)
    
    # Adiciona novos índices únicos condicionais
    add_index :users, :cpf, unique: true, where: 'deleted_at IS NULL'
    add_index :users, :email, unique: true, where: 'deleted_at IS NULL'
  end

  def down
    # Remove os índices únicos condicionais
    remove_index :users, :cpf if index_exists?(:users, :cpf, unique: true, where: 'deleted_at IS NULL')
    remove_index :users, :email if index_exists?(:users, :email, unique: true, where: 'deleted_at IS NULL')
    
    # Re-adiciona os índices únicos antigos
    add_index :users, :cpf, unique: true
    add_index :users, :email, unique: true
  end
end