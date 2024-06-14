class GTreinamentosController < ApplicationController
  include Validates
  before_action :set_g_treinamento, only: %i[ show edit update destroy ]
  before_action :set_g_pessoa

  def index
    @q = GTreinamento.ransack(params[:q])
    @pagy, @g_treinamentos = pagy(@q.result)
  end

  def new
    @g_treinamento = GTreinamento.new
  end

  def edit
  end

  def create
    @g_treinamento = GTreinamento.new(g_treinamento_params.merge(g_pessoa_id: @g_pessoa.id))

    if @g_treinamento.save
      redirect_to g_pessoa_g_treinamentos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_treinamento.update(g_treinamento_params)
      redirect_to g_pessoa_g_treinamentos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_treinamento.soft_delete
      redirect_to g_pessoa_g_treinamentos_path, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_pessoa_g_treinamentos_path, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_treinamento
    @g_treinamento = GTreinamento.find(params[:id])
  end

  def set_g_pessoa
    @g_pessoa = GPessoa.find(params[:g_pessoa_id])
  end

  def g_treinamento_params
    params.require(:g_treinamento).permit(GTreinamento.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
