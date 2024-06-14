class EModalidadesController < ApplicationController
  include Validates
  before_action :set_e_modalidade, only: %i[ show edit update destroy ]

  def index
    @q = EModalidade.ransack(params[:q])
    @pagy, @e_modalidades = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @e_modalidade = EModalidade.new
  end

  def edit
  end

  def create
    @e_modalidade = EModalidade.new(e_modalidade_params)

    if @e_modalidade.save
      redirect_to e_modalidades_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_modalidade.update(e_modalidade_params)
      redirect_to e_modalidades_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_modalidade.soft_delete
      redirect_to e_modalidades_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_modalidades_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_modalidade
    @e_modalidade = EModalidade.find(params[:id])
  end

  def e_modalidade_params
    params.require(:e_modalidade).permit(EModalidade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
