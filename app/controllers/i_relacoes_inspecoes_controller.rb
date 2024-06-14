class IRelacoesInspecoesController < ApplicationController
  include Validates
  before_action :set_i_relacao_inspecao, only: %i[ show edit update destroy ]

  def index
    @q = IRelacaoInspecao.ransack(params[:q])
    @pagy, @i_relacoes_inspecoes = pagy(@q.result)
  end

  def new
    @i_relacao_inspecao = IRelacaoInspecao.new
  end

  def edit
  end

  def create
    @i_relacao_inspecao = IRelacaoInspecao.new(i_relacao_inspecao_params)

    if @i_relacao_inspecao.save
      redirect_to i_relacoes_inspecoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_relacao_inspecao.update(i_relacao_inspecao_params)
      redirect_to i_relacoes_inspecoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_relacao_inspecao.soft_delete
      redirect_to i_relacoes_inspecoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_relacoes_inspecoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_relacao_inspecao
    @i_relacao_inspecao = IRelacaoInspecao.find(params[:id])
  end

  def i_relacao_inspecao_params
    params.require(:i_relacao_inspecao).permit(IRelacaoInspecao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
