class ETiposAtosNormativosController < ApplicationController
  include Validates
  before_action :set_e_tipo_ato_normativo, only: %i[ show edit update destroy ]

  def index
    @q = ETipoAtoNormativo.ransack(params[:q])
    @pagy, @e_tipos_atos_normativos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @e_tipo_ato_normativo = ETipoAtoNormativo.new
  end

  def edit
  end

  def create
    @e_tipo_ato_normativo = ETipoAtoNormativo.new(e_tipo_ato_normativo_params)

    if @e_tipo_ato_normativo.save
      redirect_to e_tipos_atos_normativos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_tipo_ato_normativo.update(e_tipo_ato_normativo_params)
      redirect_to e_tipos_atos_normativos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_tipo_ato_normativo.soft_delete
      redirect_to e_tipos_atos_normativos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_tipos_atos_normativos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_tipo_ato_normativo
    @e_tipo_ato_normativo = ETipoAtoNormativo.find(params[:id])
  end

  def e_tipo_ato_normativo_params
    params.require(:e_tipo_ato_normativo).permit(ETipoAtoNormativo.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
