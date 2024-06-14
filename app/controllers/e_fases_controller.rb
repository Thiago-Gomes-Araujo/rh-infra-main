class EFasesController < ApplicationController
  include Validates
  before_action :set_e_fase, only: %i[ show edit update destroy ]

  def index
    @q = EFase.ransack(params[:q])
    @pagy, @e_fases = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @e_fase = EFase.new
  end

  def edit
  end

  def create
    @e_fase = EFase.new(e_fase_params)

    if @e_fase.save
      redirect_to e_fases_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_fase.update(e_fase_params)
      redirect_to e_fases_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_fase.soft_delete
      redirect_to e_fases_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_fases_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_fase
    @e_fase = EFase.find(params[:id])
  end

  def e_fase_params
    params.require(:e_fase).permit(EFase.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
