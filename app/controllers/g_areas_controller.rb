class GAreasController < ApplicationController
  include Validates
  before_action :set_g_area, only: %i[ edit update destroy ]

  def index
    @q = GArea.ransack(params[:q])
    @pagy, @g_areas = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_area = GArea.new
  end

  def edit
  end

  def create
    @g_area = GArea.new(g_area_params)

    if @g_area.save
      redirect_to g_areas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_area.update(g_area_params)
      redirect_to g_areas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_area.soft_delete
      redirect_to g_areas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_areas_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_area
    @g_area = GArea.find(params[:id])
  end

  def g_area_params
    params.require(:g_area).permit(GArea.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
