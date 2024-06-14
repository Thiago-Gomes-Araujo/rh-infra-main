class GInstituicoesController < ApplicationController
  include Validates
  before_action :set_g_instituicao, only: %i[ edit update destroy ]

  def index
    @q = GInstituicao.ransack(params[:q])
    @pagy, @g_instituicoes = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_instituicao = GInstituicao.new
  end

  def edit
  end

  def create
    @g_instituicao = GInstituicao.new(g_instituicao_params)

    if @g_instituicao.save
      redirect_to g_instituicoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_instituicao.update(g_instituicao_params)
      redirect_to g_instituicoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_instituicao.soft_delete
      redirect_to g_instituicoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_instituicoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_instituicao
    @g_instituicao = GInstituicao.find(params[:id])
  end

  def g_instituicao_params
    params.require(:g_instituicao).permit(GInstituicao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
