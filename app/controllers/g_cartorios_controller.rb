class GCartoriosController < ApplicationController
  include Validates
  before_action :set_g_cartorio, only: %i[ edit update destroy ]

  def index
    @q = GCartorio.includes(:g_municipio).ransack(params[:q])
    @pagy, @g_cartorios = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_cartorio = GCartorio.new
  end

  def edit
  end

  def create
    @g_cartorio = GCartorio.new(g_cartorio_params)

    if @g_cartorio.save
      redirect_to g_cartorios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_cartorio.update(g_cartorio_params)
      redirect_to g_cartorios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_cartorio.soft_delete
      redirect_to g_cartorios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_cartorios_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_cartorio
    @g_cartorio = GCartorio.find(params[:id])
  end

  def g_cartorio_params
    params.require(:g_cartorio).permit(GCartorio.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
