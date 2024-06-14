class IPrediosTiposEnergiaEletricaController < ApplicationController
  include Validates
  before_action :set_i_predio_tipo_energia_eletrica, only: %i[ show edit update destroy ]

  def index
    @q = IPredioTipoEnergiaEletrica.ransack(params[:q])
    @pagy, @i_predios_tipos_energia_eletrica = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_predio_tipo_energia_eletrica = IPredioTipoEnergiaEletrica.new
  end

  def edit
  end

  def create
    @i_predio_tipo_energia_eletrica = IPredioTipoEnergiaEletrica.new(i_predio_tipo_energia_eletrica_params)

    if @i_predio_tipo_energia_eletrica.save
      redirect_to i_predios_tipos_energia_eletrica_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_tipo_energia_eletrica.update(i_predio_tipo_energia_eletrica_params)
      redirect_to i_predios_tipos_energia_eletrica_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_tipo_energia_eletrica.soft_delete
      redirect_to i_predios_tipos_energia_eletrica_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_tipos_energia_eletrica_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_predio_tipo_energia_eletrica
    @i_predio_tipo_energia_eletrica = IPredioTipoEnergiaEletrica.find(params[:id])
  end

  def i_predio_tipo_energia_eletrica_params
    params.require(:i_predio_tipo_energia_eletrica).permit(IPredioTipoEnergiaEletrica.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
