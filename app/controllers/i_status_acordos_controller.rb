class IStatusAcordosController < ApplicationController
  include Validates
  before_action :set_i_status_acordo, only: %i[ show edit update destroy ]

  def index
    @q = IStatusAcordo.ransack(params[:q])
    @pagy, @i_status_acordos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_status_acordo = IStatusAcordo.new
  end

  def edit
  end

  def create
    @i_status_acordo = IStatusAcordo.new(i_status_acordo_params)

    if @i_status_acordo.save
      redirect_to i_status_acordos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_status_acordo.update(i_status_acordo_params)
      redirect_to i_status_acordos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_status_acordo.soft_delete
      redirect_to i_status_acordos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_status_acordos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_status_acordo
    @i_status_acordo = IStatusAcordo.find(params[:id])
  end

  def i_status_acordo_params
    params.require(:i_status_acordo).permit(IStatusAcordo.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
