class IConformidadesController < ApplicationController
  include Validates
  before_action :set_i_conformidade, only: %i[ show edit update destroy ]

  def index
    @q = IConformidade.ransack(params[:q])
    @pagy, @i_conformidades = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_conformidade = IConformidade.new
  end

  def edit
  end

  def create
    @i_conformidade = IConformidade.new(i_conformidade_params)

    if @i_conformidade.save
      redirect_to i_conformidades_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_conformidade.update(i_conformidade_params)
      redirect_to i_conformidades_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_conformidade.soft_delete
      redirect_to i_conformidades_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_conformidades_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_conformidade
    @i_conformidade = IConformidade.find(params[:id])
  end

  def i_conformidade_params
    params.require(:i_conformidade).permit(IConformidade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
