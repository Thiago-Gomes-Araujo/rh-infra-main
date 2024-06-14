class GIndicesSocioeconomicosController < ApplicationController
  include Validates
  before_action :set_g_indice_socioeconomico, only: %i[ show edit update destroy ]

  def index
    @q = GIndiceSocioeconomico.includes(:g_municipio).ransack(params[:q])
    @pagy, @g_indices_socioeconomicos = pagy(@q.result)
  end

  def new
    @g_indice_socioeconomico = GIndiceSocioeconomico.new
  end

  def edit
  end

  def create
    @g_indice_socioeconomico = GIndiceSocioeconomico.new(g_indice_socioeconomico_params)

    if @g_indice_socioeconomico.save
      redirect_to g_indices_socioeconomicos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_indice_socioeconomico.update(g_indice_socioeconomico_params)
      redirect_to g_indices_socioeconomicos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_indice_socioeconomico.soft_delete
      redirect_to g_indices_socioeconomicos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_indices_socioeconomicos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_indice_socioeconomico
    @g_indice_socioeconomico = GIndiceSocioeconomico.find(params[:id])
  end

  def g_indice_socioeconomico_params
    params.require(:g_indice_socioeconomico).permit(GIndiceSocioeconomico.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
