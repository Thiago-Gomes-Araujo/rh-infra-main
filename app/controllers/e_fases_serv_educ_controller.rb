class EFasesServEducController < ApplicationController
  include Validates
  before_action :set_e_fase_serv_educ, only: %i[ show edit update destroy ]

  def index
    @q = EFaseServEduc.includes(:e_servico_educacional).ransack(params[:q])
    @pagy, @e_fases_serv_educ = pagy(@q.result)
  end

  def new
    @e_fase_serv_educ = EFaseServEduc.new
  end

  def edit
  end

  def create
    @e_fase_serv_educ = EFaseServEduc.new(e_fase_serv_educ_params)

    if @e_fase_serv_educ.save
      redirect_to e_fases_serv_educ_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_fase_serv_educ.update(e_fase_serv_educ_params)
      redirect_to e_fases_serv_educ_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_fase_serv_educ.soft_delete
      redirect_to e_fases_serv_educ_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_fases_serv_educ_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_e_fase_serv_educ
    @e_fase_serv_educ = EFaseServEduc.find(params[:id])
  end

  def e_fase_serv_educ_params
    params.require(:e_fase_serv_educ).permit(EFaseServEduc.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
