class IAditivosController < ApplicationController
  include Validates
  before_action :set_i_aditivo, only: %i[ show edit update destroy ]
  before_action :set_i_acordo

  def index
    @q = IAditivo.includes(:i_acordo)
      .where(i_acordo: @i_acordo)
      .ransack(params[:q])
    @pagy, @i_aditivos = pagy(@q.result)
  end

  def new
    @i_aditivo = IAditivo.new
  end

  def edit
  end

  def create
    @i_aditivo = IAditivo.new(i_aditivo_params.merge(i_acordo: @i_acordo))

    if @i_aditivo.save
      redirect_to i_acordo_i_aditivos_path(@i_acordo), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_aditivo.update(i_aditivo_params)
      redirect_to i_acordo_i_aditivos_path(@i_acordo), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_aditivo.soft_delete
      redirect_to i_acordo_i_aditivos_path(@i_acordo), notice: "Registro foi marcado como excluído."
    else
      redirect_to i_acordo_i_aditivos_path(@i_acordo), alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_acordo
    @i_acordo = IAcordo.find(params[:i_acordo_id])
  end

  def set_i_aditivo
    @i_aditivo = IAditivo.find(params[:id])
  end

  def i_aditivo_params
    params.require(:i_aditivo).permit(IAditivo.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
