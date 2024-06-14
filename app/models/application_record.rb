class ApplicationRecord < ActiveRecord::Base
  include SoftDeletable

  primary_abstract_class

  def self.ransackable_attributes(auth_object = nil)
    column_names + _ransackers.keys
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map do |assoc|
      assoc.name.to_s
    end
  end

  private

  def updated_by_user
    self.update_column(:updated_by, self.current_user&.cpf)
  end

  def created_by_user
    self.update_column(:created_by, self.current_user&.cpf)
  end

  def string_to_decimal(valor)
    valor = valor.gsub(/[.,]/, "")
    valor = valor.to_f / 100
  end
end
