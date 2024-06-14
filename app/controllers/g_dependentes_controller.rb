class GDependentesController < ApplicationController
  include Validates
  before_action :set_g_dependente, only: %i[ show edit update destroy ]
  before_action :set_g_pessoa

  def index
    @q = GDependente.ransack(params[:q])
    @pagy, @g_dependentes = pagy(@q.result)
  end

  def new
    @g_dependente = GDependente.new
  end

  def edit
  end

  def create
    @g_dependente = GDependente.new(g_dependente_params.merge(g_pessoa_id: @g_pessoa.id))

    if @g_dependente.save
      redirect_to g_pessoa_g_dependentes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_dependente.update(g_dependente_params)
      redirect_to g_pessoa_g_dependentes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_dependente.soft_delete
      redirect_to g_pessoa_g_dependentes_path, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_pessoa_g_dependentes_path, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_dependente
    @g_dependente = GDependente.find(params[:id])
  end

  def set_g_pessoa
    @g_pessoa = GPessoa.find(params[:g_pessoa_id])
  end

  def g_dependente_params
    params.require(:g_dependente).permit(GDependente.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
