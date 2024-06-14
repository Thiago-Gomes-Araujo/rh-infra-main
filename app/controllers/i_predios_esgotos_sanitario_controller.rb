class IPrediosEsgotosSanitarioController < ApplicationController
  include Validates
  before_action :set_i_predio_esgoto_sanitario, only: %i[ show edit update destroy ]

  def index
    @q = IPredioEsgotoSanitario.ransack(params[:q])
    @pagy, @i_predios_esgotos_sanitario = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_predio_esgoto_sanitario = IPredioEsgotoSanitario.new
  end

  def edit
  end

  def create
    @i_predio_esgoto_sanitario = IPredioEsgotoSanitario.new(i_predio_esgoto_sanitario_params)

    if @i_predio_esgoto_sanitario.save
      redirect_to i_predios_esgotos_sanitario_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_esgoto_sanitario.update(i_predio_esgoto_sanitario_params)
      redirect_to i_predios_esgotos_sanitario_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_esgoto_sanitario.soft_delete
      redirect_to i_predios_esgotos_sanitario_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_esgotos_sanitario_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_predio_esgoto_sanitario
    @i_predio_esgoto_sanitario = IPredioEsgotoSanitario.find(params[:id])
  end

  def i_predio_esgoto_sanitario_params
    params.require(:i_predio_esgoto_sanitario).permit(IPredioEsgotoSanitario.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
