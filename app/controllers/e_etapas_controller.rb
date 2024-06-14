class EEtapasController < ApplicationController
  include Validates
  before_action :set_e_etapa, only: %i[ show edit update destroy ]

  def index
    @q = EEtapa.ransack(params[:q])
    @pagy, @e_etapas = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @e_etapa = EEtapa.new
  end

  def edit
  end

  def create
    @e_etapa = EEtapa.new(e_etapa_params)

    if @e_etapa.save
      redirect_to e_etapas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_etapa.update(e_etapa_params)
      redirect_to e_etapas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_etapa.soft_delete
      redirect_to e_etapas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_etapas_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_etapa
    @e_etapa = EEtapa.find(params[:id])
  end

  def e_etapa_params
    params.require(:e_etapa).permit(EEtapa.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
