class GIdiomasController < ApplicationController
  include Validates
  before_action :set_g_idioma, only: %i[ edit update destroy ]

  def index
    @q = GIdioma.ransack(params[:q])
    @pagy, @g_idiomas = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_idioma = GIdioma.new
  end

  def edit
  end

  def create
    @g_idioma = GIdioma.new(g_idioma_params)

    if @g_idioma.save
      redirect_to g_idiomas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_idioma.update(g_idioma_params)
      redirect_to g_idiomas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_idioma.soft_delete
      redirect_to g_idiomas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_idiomas_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_idioma
    @g_idioma = GIdioma.find(params[:id])
  end

  def g_idioma_params
    params.require(:g_idioma).permit(GIdioma.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
