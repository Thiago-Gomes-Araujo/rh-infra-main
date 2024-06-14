class IPrediosNaturezasOcupacaoController < ApplicationController
  include Validates
  before_action :set_i_predio_natureza_ocupacao, only: %i[ show edit update destroy ]

  def index
    @q = IPredioNaturezaOcupacao.ransack(params[:q])
    @pagy, @i_predios_naturezas_ocupacao = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_predio_natureza_ocupacao = IPredioNaturezaOcupacao.new
  end

  def edit
  end

  def create
    @i_predio_natureza_ocupacao = IPredioNaturezaOcupacao.new(i_predio_natureza_ocupacao_params)

    if @i_predio_natureza_ocupacao.save
      redirect_to i_predios_naturezas_ocupacao_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_natureza_ocupacao.update(i_predio_natureza_ocupacao_params)
      redirect_to i_predios_naturezas_ocupacao_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_natureza_ocupacao.soft_delete
      redirect_to i_predios_naturezas_ocupacao_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_naturezas_ocupacao_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_predio_natureza_ocupacao
    @i_predio_natureza_ocupacao = IPredioNaturezaOcupacao.find(params[:id])
  end

  def i_predio_natureza_ocupacao_params
    params.require(:i_predio_natureza_ocupacao).permit(IPredioNaturezaOcupacao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
