class GModalidadesController < ApplicationController
  include Validates
  before_action :set_g_modalidade, only: %i[ edit update destroy ]

  def index
    @q = GModalidade.ransack(params[:q])
    @pagy, @g_modalidades = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_modalidade = GModalidade.new
  end

  def edit
  end

  def create
    @g_modalidade = GModalidade.new(g_modalidade_params)

    if @g_modalidade.save
      redirect_to g_modalidades_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_modalidade.update(g_modalidade_params)
      redirect_to g_modalidades_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_modalidade.soft_delete
      redirect_to g_modalidades_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_modalidades_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_modalidade
    @g_modalidade = GModalidade.find(params[:id])
  end

  def g_modalidade_params
    params.require(:g_modalidade).permit(GModalidade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
