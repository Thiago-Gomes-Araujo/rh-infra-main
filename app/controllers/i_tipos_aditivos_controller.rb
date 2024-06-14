class ITiposAditivosController < ApplicationController
  include Validates
  before_action :set_i_tipo_aditivo, only: %i[ show edit update destroy ]

  def index
    @q = ITipoAditivo.ransack(params[:q])
    @pagy, @i_tipos_aditivos = pagy(@q.result)
  end

  def new
    @i_tipo_aditivo = ITipoAditivo.new
  end

  def edit
  end

  def create
    @i_tipo_aditivo = ITipoAditivo.new(i_tipo_aditivo_params)

    if @i_tipo_aditivo.save
      redirect_to i_tipos_aditivos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipo_aditivo.update(i_tipo_aditivo_params)
      redirect_to i_tipos_aditivos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipo_aditivo.soft_delete
      redirect_to i_tipos_aditivos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipos_aditivos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_tipo_aditivo
    @i_tipo_aditivo = ITipoAditivo.find(params[:id])
  end

  def i_tipo_aditivo_params
    params.require(:i_tipo_aditivo).permit(ITipoAditivo.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
