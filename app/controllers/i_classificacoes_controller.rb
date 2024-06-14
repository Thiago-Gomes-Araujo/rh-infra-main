class IClassificacoesController < ApplicationController
  include Validates
  before_action :set_i_classificacao, only: %i[ show edit update destroy ]

  def index
    @q = IClassificacao.ransack(params[:q])
    @pagy, @i_classificacoes = pagy(@q.result)
  end

  def new
    @i_classificacao = IClassificacao.new
  end

  def edit
  end

  def create
    @i_classificacao = IClassificacao.new(i_classificacao_params)

    if @i_classificacao.save
      redirect_to i_classificacoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_classificacao.update(i_classificacao_params)
      redirect_to i_classificacoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_classificacao.soft_delete
      redirect_to i_classificacoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_classificacoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_classificacao
    @i_classificacao = IClassificacao.find(params[:id])
  end

  def i_classificacao_params
    params.require(:i_classificacao).permit(IClassificacao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
