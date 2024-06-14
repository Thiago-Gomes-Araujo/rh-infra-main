class GDivisoesController < ApplicationController
  include Validates
  before_action :set_g_divisao, only: %i[ edit update destroy ]

  def index
    @q = GDivisao.ransack(params[:q])
    @pagy, @g_divisoes = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_divisao = GDivisao.new
  end

  def edit
  end

  def create
    @g_divisao = GDivisao.new(g_divisao_params)

    if @g_divisao.save
      redirect_to g_divisoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_divisao.update(g_divisao_params)
      redirect_to g_divisoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_divisao.soft_delete
      redirect_to g_divisoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_divisoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_divisao
    @g_divisao = GDivisao.find(params[:id])
  end

  def g_divisao_params
    params.require(:g_divisao).permit(GDivisao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
