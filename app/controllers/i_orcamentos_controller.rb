class IOrcamentosController < ApplicationController
  include Validates
  before_action :set_i_orcamento, only: %i[ show edit update destroy ]
  before_action :set_i_acordo
  before_action :set_i_acordo_i_medicao
  before_action :model_references

  def index
    if @i_medicao
      @q = IOrcamento.includes(:i_medicao, :i_acordo)
        .where(i_medicao: @i_medicao)
        .where.not(i_medicao: nil)
        .ransack(params[:q])
    elsif @i_acordo
      @q = IOrcamento.includes(:i_acordo)
        .where(i_acordo: @i_acordo)
        .where(i_medicao: nil)
        .ransack(params[:q])
    end
    @pagy, @i_orcamentos = pagy(@q.result)
  end

  def new
    @i_orcamento = IOrcamento.new
  end

  def edit
  end

  def create
    @i_orcamento = IOrcamento.new(i_orcamento_params.merge(i_acordo: @i_acordo, i_medicao: @i_medicao))
    if @i_orcamento.save
      redirect_to @index_url, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_orcamento.update(i_orcamento_params)
      redirect_to @index_url, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_orcamento.soft_delete
      redirect_to @index_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to request.referer, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_acordo
    @i_acordo = IAcordo.find(params[:i_acordo_id]) if params[:i_acordo_id]
  end

  def model_references
    if @i_medicao
      @index_url = i_acordo_i_medicao_i_orcamentos_path(@i_acordo, @i_medicao)
      @new_url = new_i_acordo_i_medicao_i_orcamento_path(@i_acordo, @i_medicao)
      @model_references = @i_medicao
    elsif @i_acordo
      @index_url = i_acordo_i_orcamentos_path(@i_acordo)
      @new_url = new_i_acordo_i_orcamento_path(@i_acordo)
      @model_references = @i_acordo
    end
  end

  def set_i_acordo_i_medicao
    @i_medicao = IMedicao.find(params[:i_medicao_id]) if params[:i_medicao_id]
    @i_acordo = @i_medicao.i_acordo if @i_medicao
  end

  def set_i_orcamento
    @i_orcamento = IOrcamento.find(params[:id])
  end

  def i_orcamento_params
    params.require(:i_orcamento).permit(IOrcamento.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
