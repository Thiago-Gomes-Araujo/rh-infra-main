class GTiposUsuariosController < ApplicationController
  include Validates
  before_action :set_g_tipo_usuario, only: %i[ show edit update destroy ]

  def index
    @q = GTipoUsuario.ransack(params[:q])
    @pagy, @g_tipos_usuarios = pagy(@q.result)
  end

  def new
    @g_tipo_usuario = GTipoUsuario.new
  end

  def edit
  end

  def create
    @g_tipo_usuario = GTipoUsuario.new(g_tipo_usuario_params)

    if @g_tipo_usuario.save
      redirect_to g_tipos_usuarios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_tipo_usuario.update(g_tipo_usuario_params)
      redirect_to g_tipos_usuarios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipo_usuario.soft_delete
      redirect_to g_tipos_usuarios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_tipos_usuarios_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_g_tipo_usuario
    @g_tipo_usuario = GTipoUsuario.find(params[:id])
  end

  def g_tipo_usuario_params
    params.require(:g_tipo_usuario).permit(GTipoUsuario.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
