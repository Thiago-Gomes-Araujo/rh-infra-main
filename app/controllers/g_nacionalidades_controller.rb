class GNacionalidadesController < ApplicationController
  include Validates
  before_action :set_g_nacionalidade, only: %i[ edit update destroy ]

  def index
    @q = GNacionalidade.includes(:g_pais).ransack(params[:q])
    @pagy, @g_nacionalidades = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_nacionalidade = GNacionalidade.new
  end

  def edit
  end

  def create
    @g_nacionalidade = GNacionalidade.new(g_nacionalidade_params)

    if @g_nacionalidade.save
      redirect_to g_nacionalidades_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_nacionalidade.update(g_nacionalidade_params)
      redirect_to g_nacionalidades_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_nacionalidade.soft_delete
      redirect_to g_nacionalidades_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_nacionalidades_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_nacionalidade
    @g_nacionalidade = GNacionalidade.find(params[:id])
  end

  def g_nacionalidade_params
    params.require(:g_nacionalidade).permit(GNacionalidade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
