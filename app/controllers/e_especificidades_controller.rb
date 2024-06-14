class EEspecificidadesController < ApplicationController
  include Validates
  before_action :set_e_especificidade, only: %i[ show edit update destroy ]

  def index
    @q = EEspecificidade.ransack(params[:q])
    @pagy, @e_especificidades = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @e_especificidade = EEspecificidade.new
  end

  def edit
  end

  def create
    @e_especificidade = EEspecificidade.new(e_especificidade_params)

    if @e_especificidade.save
      redirect_to e_especificidades_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_especificidade.update(e_especificidade_params)
      redirect_to e_especificidades_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_especificidade.soft_delete
      redirect_to e_especificidades_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_especificidades_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_especificidade
    @e_especificidade = EEspecificidade.find(params[:id])
  end

  def e_especificidade_params
    params.require(:e_especificidade).permit(EEspecificidade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
