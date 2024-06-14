class ResetPasswordController < Devise::PasswordsController
  def update_password
    # Busca o usuário pelo token
    @user = User.with_reset_password_token(params[:reset_password_token])
    if @user.present?
      @user.update_password_request = true
      if @user.update(user_params)
        redirect_to '/', notice: "Registro atualizado com sucesso!", status: :see_other
      else
        redirect_back(fallback_location: root_path, alert: @user.errors.full_messages.to_sentence) 
      end
    else
        redirect_back(fallback_location: root_path, alert: "Usuário não encotrado ou o token expirou!")
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :password,
      :password_confirmation,
    )
  end
end
