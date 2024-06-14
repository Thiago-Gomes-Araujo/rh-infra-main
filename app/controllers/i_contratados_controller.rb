class IContratadosController < ApplicationController
  include Validates
  before_action :set_i_contratado, only: %i[ show edit update destroy ]

  def index
    @q = IContratado.ransack(params[:q])
    @pagy, @i_contratados = pagy(@q.result(distinct: true).order(:razao_social))
  end

  def new
    @i_contratado = IContratado.new
  end

  def edit
  end

  def create
    @i_contratado = IContratado.new(i_contratado_params)

    if @i_contratado.save
      redirect_to i_contratados_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_contratado.update(i_contratado_params)
      redirect_to i_contratados_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_contratado.soft_delete
      redirect_to i_contratados_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_contratados_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_contratado
    @i_contratado = IContratado.find(params[:id])
  end

  def i_contratado_params
    params.require(:i_contratado).permit(IContratado.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
