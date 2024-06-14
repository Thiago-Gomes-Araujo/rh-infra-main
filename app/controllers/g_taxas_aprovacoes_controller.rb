class GTaxasAprovacoesController < ApplicationController
  include Validates
  before_action :set_g_taxa_aprovacao, only: %i[ show edit update destroy ]

  def index
    @q = GTaxaAprovacao.ransack(params[:q])
    @pagy, @g_taxas_aprovacoes = pagy(@q.result)
  end

  def new
    @g_taxa_aprovacao = GTaxaAprovacao.new
  end

  def edit
  end

  def create
    @g_taxa_aprovacao = GTaxaAprovacao.new(g_taxa_aprovacao_params)

    if @g_taxa_aprovacao.save
      redirect_to g_taxas_aprovacoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_taxa_aprovacao.update(g_taxa_aprovacao_params)
      redirect_to g_taxas_aprovacoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_taxa_aprovacao.soft_delete
      redirect_to g_taxas_aprovacoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_taxas_aprovacoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_taxa_aprovacao
    @g_taxa_aprovacao = GTaxaAprovacao.find(params[:id])
  end

  def g_taxa_aprovacao_params
    params.require(:g_taxa_aprovacao).permit(GTaxaAprovacao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by", "serie_1", "serie_2", "serie_3", "serie_4", "serie_5"].include?(col) }.map(&:to_sym))
  end
end
