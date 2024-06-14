class ERegimentosController < ApplicationController
  include Validates
  before_action :set_e_regimento, only: %i[ show edit update destroy ]

  def index
    @q = ERegimento.includes(:i_predio).order("i_predios.nome_predio").ransack(params[:q])
    @pagy, @e_regimentos = pagy(@q.result)
  end

  def new
    @e_regimento = ERegimento.new
  end

  def edit
  end

  def create
    @e_regimento = ERegimento.new(e_regimento_params)

    if @e_regimento.save
      redirect_to e_regimentos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_regimento.update(e_regimento_params)
      redirect_to e_regimentos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_regimento.soft_delete
      redirect_to e_regimentos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_regimentos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_regimento
    @e_regimento = ERegimento.find(params[:id])
  end

  def e_regimento_params
    params.require(:e_regimento).permit(ERegimento.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
