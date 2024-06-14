class GEstadosCivisController < ApplicationController
  include Validates
  before_action :set_g_estado_civil, only: %i[ edit update destroy ]

  def index
    @q = GEstadoCivil.ransack(params[:q])
    @pagy, @g_estados_civis = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_estado_civil = GEstadoCivil.new
  end

  def edit
  end

  def create
    @g_estado_civil = GEstadoCivil.new(g_estado_civil_params)

    if @g_estado_civil.save
      redirect_to g_estados_civis_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_estado_civil.update(g_estado_civil_params)
      redirect_to g_estados_civis_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_estado_civil.soft_delete
      redirect_to g_estados_civis_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_estados_civis_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_estado_civil
    @g_estado_civil = GEstadoCivil.find(params[:id])
  end

  def g_estado_civil_params
    params.require(:g_estado_civil).permit(GEstadoCivil.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
