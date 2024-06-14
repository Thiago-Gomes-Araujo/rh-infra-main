class ENormatizacoesController < ApplicationController
  include Validates
  before_action :set_e_normatizacao, only: %i[ show edit update destroy ]

  def index
    @q = ENormatizacao.ransack(params[:q])
    @pagy, @e_normatizacoes = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @e_normatizacao = ENormatizacao.new
  end

  def edit
  end

  def create
    @e_normatizacao = ENormatizacao.new(e_normatizacao_params)

    if @e_normatizacao.save
      redirect_to e_normatizacoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_normatizacao.update(e_normatizacao_params)
      redirect_to e_normatizacoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_normatizacao.soft_delete
      redirect_to e_normatizacoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_normatizacoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_normatizacao
    @e_normatizacao = ENormatizacao.find(params[:id])
  end

  def e_normatizacao_params
    params.require(:e_normatizacao).permit(ENormatizacao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
