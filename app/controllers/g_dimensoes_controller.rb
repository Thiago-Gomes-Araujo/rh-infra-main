class GDimensoesController < ApplicationController
  include Validates
  before_action :set_g_dimensao, only: %i[ edit update destroy ]

  def index
    @q = GDimensao.ransack(params[:q])
    @pagy, @g_dimensoes = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_dimensao = GDimensao.new
  end

  def edit
  end

  def create
    @g_dimensao = GDimensao.new(g_dimensao_params)

    if @g_dimensao.save
      redirect_to g_dimensoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_dimensao.update(g_dimensao_params)
      redirect_to g_dimensoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_dimensao.soft_delete
      redirect_to g_dimensoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_dimensoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_dimensao
    @g_dimensao = GDimensao.find(params[:id])
  end

  def g_dimensao_params
    params.require(:g_dimensao).permit(GDimensao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
