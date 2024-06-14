class GEstadosController < ApplicationController
  include Validates
  before_action :set_g_estado, only: %i[ edit update destroy ]

  def index
    @q = GEstado.includes(:g_pais).ransack(params[:q])
    @pagy, @g_estados = pagy(@q.result(distinct: true).order(:descricao))
  end

  def show
  end

  def new
    @g_estado = GEstado.new
  end

  def edit
  end

  def create
    @g_estado = GEstado.new(g_estado_params)

    if @g_estado.save
      redirect_to g_estados_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_estado.update(g_estado_params)
      redirect_to g_estados_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_estado.soft_delete
      redirect_to g_estados_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_estados_url, alert: "Não foi possível marcar como excluído"
    end
  end

  private

  def set_g_estado
    @g_estado = GEstado.find(params[:id])
  end

  def g_estado_params
    params.require(:g_estado).permit(GEstado.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
