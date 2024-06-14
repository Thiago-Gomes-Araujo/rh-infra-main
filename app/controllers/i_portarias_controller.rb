class IPortariasController < ApplicationController
  include Validates
  before_action :set_i_portaria, only: %i[ show edit update destroy ]

  def index
    @q = IPortaria.ransack(params[:q])
    @pagy, @i_portarias = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_portaria = IPortaria.new
  end

  def edit
  end

  def create
    @i_portaria = IPortaria.new(i_portaria_params)

    if @i_portaria.save
      redirect_to i_portarias_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_portaria.update(i_portaria_params)
      redirect_to i_portarias_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_portaria.soft_delete
      redirect_to i_portarias_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_portarias_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_portaria
    @i_portaria = IPortaria.find(params[:id])
  end

  def i_portaria_params
    params.require(:i_portaria).permit(IPortaria.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
