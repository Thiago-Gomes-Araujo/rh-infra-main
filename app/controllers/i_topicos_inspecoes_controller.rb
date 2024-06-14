class ITopicosInspecoesController < ApplicationController
  include Validates
  before_action :set_i_topico_inspecao, only: %i[ show edit update destroy ]

  def index
    @q = ITopicoInspecao.ransack(params[:q])
    @pagy, @i_topicos_inspecoes = pagy(@q.result)
  end

  def new
    @i_topico_inspecao = ITopicoInspecao.new
  end

  def edit
  end

  def create
    @i_topico_inspecao = ITopicoInspecao.new(i_topico_inspecao_params)

    if @i_topico_inspecao.save
      redirect_to i_topicos_inspecoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_topico_inspecao.update(i_topico_inspecao_params)
      redirect_to i_topicos_inspecoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_topico_inspecao.soft_delete
      redirect_to i_topicos_inspecoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_topicos_inspecoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_topico_inspecao
    @i_topico_inspecao = ITopicoInspecao.find(params[:id])
  end

  def i_topico_inspecao_params
    params.require(:i_topico_inspecao).permit(ITopicoInspecao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
