class IModalidadesLicitacoesController < ApplicationController
  include Validates
  before_action :set_i_modalidade_licitacao, only: %i[ show edit update destroy ]

  def index
    @q = IModalidadeLicitacao.ransack(params[:q])
    @pagy, @i_modalidades_licitacoes = pagy(@q.result)
  end

  def new
    @i_modalidade_licitacao = IModalidadeLicitacao.new
  end

  def edit
  end

  def create
    @i_modalidade_licitacao = IModalidadeLicitacao.new(i_modalidade_licitacao_params)

    if @i_modalidade_licitacao.save
      redirect_to i_modalidades_licitacoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_modalidade_licitacao.update(i_modalidade_licitacao_params)
      redirect_to i_modalidades_licitacoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_modalidade_licitacao.soft_delete
      redirect_to i_modalidades_licitacoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_modalidades_licitacoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_modalidade_licitacao
    @i_modalidade_licitacao = IModalidadeLicitacao.find(params[:id])
  end

  def i_modalidade_licitacao_params
    params.require(:i_modalidade_licitacao).permit(IModalidadeLicitacao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
