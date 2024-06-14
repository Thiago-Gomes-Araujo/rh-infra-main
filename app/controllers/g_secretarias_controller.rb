class GSecretariasController < ApplicationController
  include Validates
  before_action :set_g_secretaria, only: %i[ show edit update destroy ]

  def index
    @q = GSecretaria.ransack(params[:q])
    @pagy, @g_secretarias = pagy(@q.result)
  end

  def new
    @g_secretaria = GSecretaria.new
  end

  def edit
  end

  def create
    @g_secretaria = GSecretaria.new(g_secretaria_params)

    if @g_secretaria.save
      redirect_to g_secretarias_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_secretaria.update(g_secretaria_params)
      redirect_to g_secretarias_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_secretaria.soft_delete
      redirect_to g_secretarias_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_secretarias_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_secretaria
    @g_secretaria = GSecretaria.find(params[:id])
  end

  def g_secretaria_params
    params.require(:g_secretaria).permit(GSecretaria.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
