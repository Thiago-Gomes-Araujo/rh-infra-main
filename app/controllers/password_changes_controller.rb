class PasswordChangesController < ApplicationController
  before_action :is_new_user

  def index
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_password = false
    if @user.update(user_params)
      redirect_to '/', notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, notice: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(
      :password,
      :password_confirmation,
      )
  end

  def is_new_user
    unless current_user.password_change_required
      redirect_to '/'
    end
  end

end
