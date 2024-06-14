class IPrediosTiposLocalizacoesDiferenciadasController < ApplicationController
  include Validates
  before_action :set_i_predio_tipo_localizacao_diferenciada, only: %i[ show edit update destroy ]

  def index
    @q = IPredioTipoLocalizacaoDiferenciada.ransack(params[:q])
    @pagy, @i_predios_tipos_localizacoes_diferenciadas = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_predio_tipo_localizacao_diferenciada = IPredioTipoLocalizacaoDiferenciada.new
  end

  def edit
  end

  def create
    @i_predio_tipo_localizacao_diferenciada = IPredioTipoLocalizacaoDiferenciada.new(i_predio_tipo_localizacao_diferenciada_params)

    if @i_predio_tipo_localizacao_diferenciada.save
      redirect_to i_predios_tipos_localizacoes_diferenciadas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_tipo_localizacao_diferenciada.update(i_predio_tipo_localizacao_diferenciada_params)
      redirect_to i_predios_tipos_localizacoes_diferenciadas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_tipo_localizacao_diferenciada.soft_delete
      redirect_to i_predios_tipos_localizacoes_diferenciadas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_tipos_localizacoes_diferenciadas_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_predio_tipo_localizacao_diferenciada
    @i_predio_tipo_localizacao_diferenciada = IPredioTipoLocalizacaoDiferenciada.find(params[:id])
  end

  def i_predio_tipo_localizacao_diferenciada_params
    params.require(:i_predio_tipo_localizacao_diferenciada).permit(IPredioTipoLocalizacaoDiferenciada.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
