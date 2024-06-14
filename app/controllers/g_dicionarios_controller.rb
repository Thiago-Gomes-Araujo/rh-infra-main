class GDicionariosController < ApplicationController
  include Validates
  before_action :set_g_dicionario, only: %i[ show edit update destroy ]

  def index
    @q = GDicionario.includes(:g_sistema).ransack(params[:q])
    @pagy, @g_dicionarios = pagy(@q.result(distinct: true).order(:nome_tabela))
  end

  def new
    @g_dicionario = GDicionario.new
  end

  def edit
  end

  def create
    @g_dicionario = GDicionario.new(g_dicionario_params)

    if @g_dicionario.save
      redirect_to g_dicionarios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_dicionario.update(g_dicionario_params)
      redirect_to g_dicionarios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_dicionario.soft_delete
      redirect_to g_dicionarios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_dicionarios_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_dicionario
    @g_dicionario = GDicionario.find(params[:id])
  end

  def g_dicionario_params
    params.require(:g_dicionario).permit(GDicionario.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
