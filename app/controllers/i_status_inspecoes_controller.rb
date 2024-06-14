class IStatusInspecoesController < ApplicationController
  include Validates
  before_action :set_i_status_inspecao, only: %i[ show edit update destroy ]

  def index
    @q = IStatusInspecao.ransack(params[:q])
    @pagy, @i_status_inspecoes = pagy(@q.result)
  end

  def new
    @i_status_inspecao = IStatusInspecao.new
  end

  def edit
  end

  def create
    @i_status_inspecao = IStatusInspecao.new(i_status_inspecao_params)

    if @i_status_inspecao.save
      redirect_to i_status_inspecoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_status_inspecao.update(i_status_inspecao_params)
      redirect_to i_status_inspecoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_status_inspecao.soft_delete
      redirect_to i_status_inspecoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_status_inspecoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_status_inspecao
    @i_status_inspecao = IStatusInspecao.find(params[:id])
  end

  def i_status_inspecao_params
    params.require(:i_status_inspecao).permit(IStatusInspecao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
