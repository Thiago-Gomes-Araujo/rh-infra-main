class IAtividadesInspecoesController < ApplicationController
  include Validates
  before_action :set_i_atividade_inspecao, only: %i[ show edit update destroy ]

  def index
    @q = IAtividadeInspecao.ransack(params[:q])
    @pagy, @i_atividades_inspecoes = pagy(@q.result)
  end

  def new
    @i_atividade_inspecao = IAtividadeInspecao.new
  end

  def edit
  end

  def create
    @i_atividade_inspecao = IAtividadeInspecao.new(i_atividade_inspecao_params)

    if @i_atividade_inspecao.save
      redirect_to i_atividades_inspecoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_atividade_inspecao.update(i_atividade_inspecao_params)
      redirect_to i_atividades_inspecoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_atividade_inspecao.soft_delete
      redirect_to i_atividades_inspecoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_atividades_inspecoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_atividade_inspecao
    @i_atividade_inspecao = IAtividadeInspecao.find(params[:id])
  end

  def i_atividade_inspecao_params
    params.require(:i_atividade_inspecao).permit(IAtividadeInspecao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
