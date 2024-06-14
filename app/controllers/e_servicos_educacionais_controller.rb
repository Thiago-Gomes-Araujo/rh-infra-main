class EServicosEducacionaisController < ApplicationController
  include Validates
  before_action :set_e_servico_educacional, only: %i[ show edit update destroy ]

  def index
    @q = EServicoEducacional.includes(e_ato_normativo: :i_predio).ransack(params[:q])
    @pagy, @e_servicos_educacionais = pagy(@q.result.order(:nome))
  end

  def new
    @e_servico_educacional = EServicoEducacional.new
  end

  def edit
  end

  def create
    @e_servico_educacional = EServicoEducacional.new(e_servico_educacional_params)

    if @e_servico_educacional.save
      redirect_to e_servicos_educacionais_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_servico_educacional.update(e_servico_educacional_params)
      redirect_to e_servicos_educacionais_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_servico_educacional.soft_delete
      redirect_to e_servicos_educacionais_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_servicos_educacionais_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_servico_educacional
    @e_servico_educacional = EServicoEducacional.find(params[:id])
  end

  def e_servico_educacional_params
    params.require(:e_servico_educacional).permit(EServicoEducacional.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
