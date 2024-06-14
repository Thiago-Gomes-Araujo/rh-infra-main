class GStatusTreinamentosController < ApplicationController
  include Validates
  before_action :set_g_status_treinamento, only: %i[ edit update destroy ]

  def index
    @q = GStatusTreinamento.ransack(params[:q])
    @pagy, @g_status_treinamentos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_status_treinamento = GStatusTreinamento.new
  end

  def edit
  end

  def create
    @g_status_treinamento = GStatusTreinamento.new(g_status_treinamento_params)

    if @g_status_treinamento.save
      redirect_to g_status_treinamentos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_status_treinamento.update(g_status_treinamento_params)
      redirect_to g_status_treinamentos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_status_treinamento.soft_delete
      redirect_to g_status_treinamentos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_status_treinamentos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_status_treinamento
    @g_status_treinamento = GStatusTreinamento.find(params[:id])
  end

  def g_status_treinamento_params
    params.require(:g_status_treinamento).permit(GStatusTreinamento.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
