class GRacasController < ApplicationController
  include Validates
  before_action :set_g_raca, only: %i[ edit update destroy ]

  def index
    @q = GRaca.ransack(params[:q])
    @pagy, @g_racas = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_raca = GRaca.new
  end

  def edit
  end

  def create
    @g_raca = GRaca.new(g_raca_params)

    if @g_raca.save
      redirect_to g_racas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_raca.update(g_raca_params)
      redirect_to g_racas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_raca.soft_delete
      redirect_to g_racas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_racas_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_raca
    @g_raca = GRaca.find(params[:id])
  end

  def g_raca_params
    params.require(:g_raca).permit(GRaca.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
