class GParentescosController < ApplicationController
  include Validates
  before_action :set_g_parentesco, only: %i[ edit update destroy ]

  def index
    @q = GParentesco.ransack(params[:q])
    @pagy, @g_parentescos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_parentesco = GParentesco.new
  end

  def edit
  end

  def create
    @g_parentesco = GParentesco.new(g_parentesco_params)

    if @g_parentesco.save
      redirect_to g_parentescos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_parentesco.update(g_parentesco_params)
      redirect_to g_parentescos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_parentesco.soft_delete
      redirect_to g_parentescos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_parentescos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_parentesco
    @g_parentesco = GParentesco.find(params[:id])
  end

  def g_parentesco_params
    params.require(:g_parentesco).permit(GParentesco.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
