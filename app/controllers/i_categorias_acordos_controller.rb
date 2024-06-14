class ICategoriasAcordosController < ApplicationController
  include Validates
  before_action :set_i_categoria_acordo, only: %i[ show edit update destroy ]

  def index
    @q = ICategoriaAcordo.ransack(params[:q])
    @pagy, @i_categorias_acordos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_categoria_acordo = ICategoriaAcordo.new
  end

  def edit
  end

  def create
    @i_categoria_acordo = ICategoriaAcordo.new(i_categoria_acordo_params)

    if @i_categoria_acordo.save
      redirect_to i_categorias_acordos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_categoria_acordo.update(i_categoria_acordo_params)
      redirect_to i_categorias_acordos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_categoria_acordo.soft_delete
      redirect_to i_categorias_acordos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_categorias_acordos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_categoria_acordo
    @i_categoria_acordo = ICategoriaAcordo.find(params[:id])
  end

  def i_categoria_acordo_params
    params.require(:i_categoria_acordo).permit(ICategoriaAcordo.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
