class IEquipamentosMoveisController < ApplicationController
  include Validates
  before_action :set_i_equipamento, only: %i[ show edit update destroy ]
  before_action :set_i_predio_i_bloco_i_ambiente_predial

  def new
    @i_equipamento = IEquipamentoMovel.new
  end

  def edit
  end

  def create
    @i_equipamento = IEquipamentoMovel.new(i_equipamento_params.merge(i_ambiente_predial: @i_ambiente_predial))
    if @i_equipamento.save
      redirect_to i_predio_i_bloco_i_ambiente_predial_i_equipamentos_path(@i_predio, @i_bloco, @i_ambiente_predial), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_equipamento.update(i_equipamento_params)
      redirect_to i_predio_i_bloco_i_ambiente_predial_i_equipamentos_path(@i_predio, @i_bloco, @i_ambiente_predial), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_i_equipamento
    @i_equipamento = IEquipamentoMovel.find(params[:id])
  end

  def set_i_predio_i_bloco_i_ambiente_predial
    @i_ambiente_predial = IAmbientePredial.find(params[:i_ambiente_predial_id])
    @i_bloco = IBloco.find(@i_ambiente_predial.i_bloco_id)
    @i_predio = IPredio.find(@i_bloco.i_predio_id)
  end

  def i_equipamento_params
    params.require(:i_equipamento_movel).permit(IEquipamentoMovel.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
