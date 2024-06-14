class IEquipamentosController < ApplicationController
  include Validates
  before_action :set_i_equipamento, only: :destroy
  before_action :set_i_predio_i_bloco_i_ambiente_predial

   def index
    @q = IEquipamento
      .includes(:i_tipo_equipamento, :i_ambiente_predial)
      .where(i_ambiente_predial: @i_ambiente_predial)
      .ransack(params[:q])
    @pagy, @i_equipamentos = pagy(@q.result)
  end

  def destroy
    if @i_equipamento.soft_delete
      redirect_to i_predio_i_bloco_i_ambiente_predial_i_equipamentos_path(@i_predio, @i_bloco, @i_ambiente_predial), notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predio_i_bloco_i_ambiente_predial_i_equipamentos_path(@i_predio, @i_bloco, @i_ambiente_predial), alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_equipamento
    @i_equipamento = IEquipamento.find(params[:id])
  end

  def set_i_predio_i_bloco_i_ambiente_predial
    @i_ambiente_predial = IAmbientePredial.find(params[:i_ambiente_predial_id])
    @i_bloco = IBloco.find(@i_ambiente_predial.i_bloco_id)
    @i_predio = IPredio.find(@i_bloco.i_predio_id)
  end

  def i_equipamento_params
    params.require(:i_equipamento).permit(IEquipamento.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
