class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pagy::Backend

  layout :layout_by_resource

  protected

  def usuario_seduc
    current_user.g_secretaria_id == 1
  end

  def layout_by_resource
    # Se estiver vindo do devise controller ou se estiver logado mas não confirmou a senha utiliza o layout do devise.
    (devise_controller? || user_signed_in? && current_user.password_change_required) ? "devise" : "application"
  end
end
