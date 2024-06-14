class GSistemasController < ApplicationController
  include Validates
  before_action :set_g_sistema, only: %i[ edit update destroy ]

  def index
    @q = GSistema.ransack(params[:q])
    @pagy, @g_sistemas = pagy(@q.result(distinct: true).order(:letra))
  end

  def new
    @g_sistema = GSistema.new
  end

  def edit
  end

  def create
    @g_sistema = GSistema.new(g_sistema_params)

    if @g_sistema.save
      redirect_to g_sistemas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_sistema.update(g_sistema_params)
      redirect_to g_sistemas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_sistema.soft_delete
      redirect_to g_sistemas_path, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_sistemas_path, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_sistema
    @g_sistema = GSistema.find(params[:id])
  end

  def g_sistema_params
    params.require(:g_sistema).permit(GSistema.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
