class GDeficienciasController < ApplicationController
  include Validates
  before_action :set_g_deficiencia, only: %i[ edit update destroy ]

  def index
    @q = GDeficiencia.ransack(params[:q])
    @pagy, @g_deficiencias = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_deficiencia = GDeficiencia.new
  end

  def edit
  end

  def create
    @g_deficiencia = GDeficiencia.new(g_deficiencia_params)

    if @g_deficiencia.save
      redirect_to g_deficiencias_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_deficiencia.update(g_deficiencia_params)
      redirect_to g_deficiencias_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_deficiencia.soft_delete
      redirect_to g_deficiencias_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_deficiencias_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_deficiencia
    @g_deficiencia = GDeficiencia.find(params[:id])
  end

  def g_deficiencia_params
    params.require(:g_deficiencia).permit(GDeficiencia.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
