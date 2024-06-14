# app/controllers/concerns/password_change_required_concern.rb

module Validates
  extend ActiveSupport::Concern
  
  included do
    before_action :check_password_change_required
  end

  private

  # Verifica se o usuário está logado, se é o primeiro acesso dele, e não vem da controller do devise.
  # Redireciona para trocar a senha.
  def check_password_change_required
    if user_signed_in? && current_user.password_change_required && !devise_controller?
      redirect_to primeiro_acesso_path, alert: "Você precisa alterar sua senha antes de continuar."
    end
  end
end
