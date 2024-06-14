class IPrediosLocalizacoesController < ApplicationController
  include Validates
  before_action :set_i_predio_localizacao, only: %i[ show edit update destroy ]

  def index
    @q = IPredioLocalizacao.ransack(params[:q])
    @pagy, @i_predios_localizacoes = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_predio_localizacao = IPredioLocalizacao.new
  end

  def edit
  end

  def create
    @i_predio_localizacao = IPredioLocalizacao.new(i_predio_localizacao_params)

    if @i_predio_localizacao.save
      redirect_to i_predios_localizacoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_localizacao.update(i_predio_localizacao_params)
      redirect_to i_predios_localizacoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_localizacao.soft_delete
      redirect_to i_predios_localizacoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_localizacoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_predio_localizacao
    @i_predio_localizacao = IPredioLocalizacao.find(params[:id])
  end

  def i_predio_localizacao_params
    params.require(:i_predio_localizacao).permit(IPredioLocalizacao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
