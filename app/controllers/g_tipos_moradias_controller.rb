class GTiposMoradiasController < ApplicationController
  include Validates
  before_action :set_g_tipo_moradia, only: %i[ edit update destroy ]

  def index
    @q = GTipoMoradia.ransack(params[:q])
    @pagy, @g_tipos_moradias = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_tipo_moradia = GTipoMoradia.new
  end

  def edit
  end

  def create
    @g_tipo_moradia = GTipoMoradia.new(g_tipo_moradia_params)

    if @g_tipo_moradia.save
      redirect_to g_tipos_moradias_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_tipo_moradia.update(g_tipo_moradia_params)
      redirect_to g_tipos_moradias_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipo_moradia.soft_delete
      redirect_to g_tipos_moradias_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_tipos_moradias_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_tipo_moradia
    @g_tipo_moradia = GTipoMoradia.find(params[:id])
  end

  def g_tipo_moradia_params
    params.require(:g_tipo_moradia).permit(GTipoMoradia.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
