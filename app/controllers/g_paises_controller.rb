class GPaisesController < ApplicationController
  include Validates
  before_action :set_g_pais, only: %i[ show edit update destroy ]

  def index
    @q = GPais.ransack(params[:q])
    @pagy, @g_paises = pagy(@q.result(distinct: true).order(:descricao))
  end

  def show
  end

  def new
    @g_pais = GPais.new
  end

  def edit
  end

  def create
    @g_pais = GPais.new(g_pais_params)

    if @g_pais.save
      redirect_to g_paises_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_pais.update(g_pais_params)
      redirect_to g_paises_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_pais.soft_delete
      redirect_to g_paises_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_paises_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_pais
    @g_pais = GPais.find(params[:id])
  end

  def g_pais_params
    params.require(:g_pais).permit(GPais.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
