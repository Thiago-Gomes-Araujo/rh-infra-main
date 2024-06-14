class IAndaresController < ApplicationController
  include Validates
  before_action :set_i_andar, only: %i[ show edit update destroy ]

  def index
    @q = IAndar.ransack(params[:q])
    @pagy, @i_andares = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_andar = IAndar.new
  end

  def edit
  end

  def create
    @i_andar = IAndar.new(i_andar_params)

    if @i_andar.save
      redirect_to i_andares_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_andar.update(i_andar_params)
      redirect_to i_andares_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_andar.soft_delete
      redirect_to i_andares_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_andares_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_andar
    @i_andar = IAndar.find(params[:id])
  end

  def i_andar_params
    params.require(:i_andar).permit(IAndar.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
