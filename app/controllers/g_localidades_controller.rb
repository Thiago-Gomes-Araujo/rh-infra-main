class GLocalidadesController < ApplicationController
  include Validates
  before_action :set_g_localidade, only: %i[ edit update destroy ]

  def index
    @q = GLocalidade.includes(:g_distrito).ransack(params[:q])
    @pagy, @g_localidades = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_localidade = GLocalidade.new
  end

  def edit
  end

  def create
    @g_localidade = GLocalidade.new(g_localidade_params)

    if @g_localidade.save
      redirect_to g_localidades_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_localidade.update(g_localidade_params)
      redirect_to g_localidades_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_localidade.soft_delete
      redirect_to g_localidades_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_localidades_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_localidade
    @g_localidade = GLocalidade.find(params[:id])
  end

  def g_localidade_params
    params.require(:g_localidade).permit(GLocalidade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
