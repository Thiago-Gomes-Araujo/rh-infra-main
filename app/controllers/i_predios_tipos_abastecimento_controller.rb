class IPrediosTiposAbastecimentoController < ApplicationController
  include Validates
  before_action :set_i_predio_tipo_abastecimento, only: %i[ show edit update destroy ]

  def index
    @q = IPredioTipoAbastecimento.ransack(params[:q])
    @pagy, @i_predios_tipos_abastecimento = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_predio_tipo_abastecimento = IPredioTipoAbastecimento.new
  end

  def edit
  end

  def create
    @i_predio_tipo_abastecimento = IPredioTipoAbastecimento.new(i_predio_tipo_abastecimento_params)

    if @i_predio_tipo_abastecimento.save
      redirect_to i_predios_tipos_abastecimento_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_tipo_abastecimento.update(i_predio_tipo_abastecimento_params)
      redirect_to i_predios_tipos_abastecimento_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_tipo_abastecimento.soft_delete
      redirect_to i_predios_tipos_abastecimento_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_tipos_abastecimento_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_predio_tipo_abastecimento
    @i_predio_tipo_abastecimento = IPredioTipoAbastecimento.find(params[:id])
  end

  def i_predio_tipo_abastecimento_params
    params.require(:i_predio_tipo_abastecimento).permit(IPredioTipoAbastecimento.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
