class ITiposAmbientesPrediaisController < ApplicationController
  include Validates
  before_action :set_i_tipo_ambiente_predial, only: %i[ show edit update destroy ]

  def index
    @q = ITipoAmbientePredial.ransack(params[:q])
    @pagy, @i_tipos_ambientes_prediais = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_tipo_ambiente_predial = ITipoAmbientePredial.new
  end

  def edit
  end

  def create
    @i_tipo_ambiente_predial = ITipoAmbientePredial.new(i_tipo_ambiente_predial_params)

    if @i_tipo_ambiente_predial.save
      redirect_to i_tipos_ambientes_prediais_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipo_ambiente_predial.update(i_tipo_ambiente_predial_params)
      redirect_to i_tipos_ambientes_prediais_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipo_ambiente_predial.soft_delete
      redirect_to i_tipos_ambientes_prediais_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipos_ambientes_prediais_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_tipo_ambiente_predial
    @i_tipo_ambiente_predial = ITipoAmbientePredial.find(params[:id])
  end

  def i_tipo_ambiente_predial_params
    params.require(:i_tipo_ambiente_predial).permit(ITipoAmbientePredial.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
