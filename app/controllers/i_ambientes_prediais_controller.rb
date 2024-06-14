class IAmbientesPrediaisController < ApplicationController
  include Validates
  before_action :set_i_ambiente_predial, only: %i[ show edit update destroy ]
  before_action :set_i_bloco_i_predio

  def index
    @q = IAmbientePredial.includes(:i_tipo_ambiente_predial, :i_bloco).where(i_bloco: @i_bloco).ransack(params[:q])
    @pagy, @i_ambientes_prediais = pagy(@q.result)
  end

  def new
    @i_ambiente_predial = IAmbientePredial.new
  end

  def edit
  end

  def create
    @i_ambiente_predial = IAmbientePredial.new(i_ambiente_predial_params.merge(i_bloco: @i_bloco))

    if @i_ambiente_predial.save
      redirect_to i_predio_i_bloco_i_ambientes_prediais_path(@i_predio, @i_bloco), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_ambiente_predial.update(i_ambiente_predial_params)
      redirect_to i_predio_i_bloco_i_ambientes_prediais_path(@i_predio, @i_bloco), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_ambiente_predial.soft_delete
      redirect_to i_predio_i_bloco_i_ambientes_prediais_path(@i_predio, @i_bloco), notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predio_i_bloco_i_ambientes_prediais_path(@i_predio, @i_bloco), alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_ambiente_predial
    @i_ambiente_predial = IAmbientePredial.find(params[:id])
  end

  def set_i_bloco_i_predio
    @i_bloco = IBloco.find(params[:i_bloco_id])
    @i_predio = @i_bloco.i_predio
  end

  def i_ambiente_predial_params
    params.require(:i_ambiente_predial).permit(IAmbientePredial.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
