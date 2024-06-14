class GDistritosController < ApplicationController
  include Validates
  before_action :set_g_distrito, only: %i[ edit update destroy ]

  def index
    @q = GDistrito.includes(:g_municipio).ransack(params[:q])
    @pagy, @g_distritos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def show
  end

  def new
    @g_distrito = GDistrito.new
  end

  def edit
  end

  def create
    @g_distrito = GDistrito.new(g_distrito_params)

    if @g_distrito.save
      redirect_to g_distritos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_distrito.update(g_distrito_params)
      redirect_to g_distritos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_distrito.soft_delete
      redirect_to g_distritos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_distritos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_distrito
    @g_distrito = GDistrito.find(params[:id])
  end

  def g_distrito_params
    params.require(:g_distrito).permit(GDistrito.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
