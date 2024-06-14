class GCategoriasCnhController < ApplicationController
  include Validates
  before_action :set_g_categoria_cnh, only: %i[ edit update destroy ]

  def index
    @q = GCategoriaCnh.ransack(params[:q])
    @pagy, @g_categorias_cnh = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_categoria_cnh = GCategoriaCnh.new
  end

  def edit
  end

  def create
    @g_categoria_cnh = GCategoriaCnh.new(g_categoria_cnh_params)

    if @g_categoria_cnh.save
      redirect_to g_categorias_cnh_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_categoria_cnh.update(g_categoria_cnh_params)
      redirect_to g_categorias_cnh_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_categoria_cnh.soft_delete
      redirect_to g_categorias_cnh_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_categorias_cnh_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_categoria_cnh
    @g_categoria_cnh = GCategoriaCnh.find(params[:id])
  end

  def g_categoria_cnh_params
    params.require(:g_categoria_cnh).permit(GCategoriaCnh.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
