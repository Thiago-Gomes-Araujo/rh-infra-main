class IBlocosController < ApplicationController
  include Validates
  before_action :set_i_bloco, only: %i[ show edit update destroy ]
  before_action :set_i_predio

  def index
    @q = IBloco.includes(:i_predio, :i_andar).where(i_predio: @i_predio).ransack(params[:q])
    @pagy, @i_blocos = pagy(@q.result)
  end

  def new
    @i_bloco = IBloco.new
  end

  def edit
  end

  def create
    @i_bloco = IBloco.new(i_bloco_params.merge(i_predio: @i_predio))

    if @i_bloco.save
      redirect_to i_predio_i_blocos_path(@i_predio), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_bloco.update(i_bloco_params)
      redirect_to i_predio_i_blocos_path(@i_predio), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_bloco.soft_delete
      redirect_to i_predio_i_blocos_path(@i_predio), notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predio_i_blocos_path(@i_predio), alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_bloco
    @i_bloco = IBloco.find(params[:id])
  end

  def set_i_predio
    @i_predio = IPredio.find(params[:i_predio_id])
  end

  def i_bloco_params
    params.require(:i_bloco).permit(IBloco.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
