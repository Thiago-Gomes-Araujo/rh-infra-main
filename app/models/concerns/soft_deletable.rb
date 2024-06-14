module SoftDeletable
  extend ActiveSupport::Concern

  # Definindo um escopo padrão para excluir registros que foram "soft deleted"
  included do
    default_scope -> { where(deleted_at: nil) }
  end

  # Método para realizar a "soft delete" de um registro e suas dependências
  def soft_delete(user = nil)
    # Obter todas as associações do tipo :has_many e :has_one
    associacoes = self.class.reflect_on_all_associations(:has_many) + self.class.reflect_on_all_associations(:has_one)

    # Se existem associações
    if associacoes.present?
      associacoes.each do |assoc|
        registros_dependentes = send(assoc.name)

        # Pular se a associação possui registros dependentes que não estão "soft deleted"
        return false if registros_dependentes.present? && !todos_soft_deleted?(registros_dependentes)

        # Realizar a "soft delete" nos registros dependentes se eles ainda não estiverem "soft deleted"
        soft_delete_dependentes(registros_dependentes)
      end
    end

    # Realizar a "soft delete" no registro atual
    update_columns(deleted_at: Time.current)
    # update(deleted_at: Time.current)
    return true
  end

  private

  # Verificar se todos os registros de uma associação estão "soft deleted"
  def todos_soft_deleted?(registros)
    Array(registros).all? { |registro| registro.deleted_at.present? }
  end

  # Realizar a "soft delete" em todos os registros de uma associação
  def soft_delete_dependentes(registros)
    Array(registros).each do |registro|
      registro.soft_delete if registro.deleted_at.nil?
    end
  end
end
