class ITiposFornecimentosExecucaoController < ApplicationController
  include Validates
  before_action :set_i_tipo_fornecimento_execucao, only: %i[ show edit update destroy ]

  def index
    @q = ITipoFornecimentoExecucao.ransack(params[:q])
    @pagy, @i_tipos_fornecimentos_execucao = pagy(@q.result)
  end

  def new
    @i_tipo_fornecimento_execucao = ITipoFornecimentoExecucao.new
  end

  def edit
  end

  def create
    @i_tipo_fornecimento_execucao = ITipoFornecimentoExecucao.new(i_tipo_fornecimento_execucao_params)

    if @i_tipo_fornecimento_execucao.save
      redirect_to i_tipos_fornecimentos_execucao_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipo_fornecimento_execucao.update(i_tipo_fornecimento_execucao_params)
      redirect_to i_tipos_fornecimentos_execucao_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipo_fornecimento_execucao.soft_delete
      redirect_to i_tipos_fornecimentos_execucao_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipos_fornecimentos_execucao_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_tipo_fornecimento_execucao
    @i_tipo_fornecimento_execucao = ITipoFornecimentoExecucao.find(params[:id])
  end

  def i_tipo_fornecimento_execucao_params
    params.require(:i_tipo_fornecimento_execucao).permit(ITipoFornecimentoExecucao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
