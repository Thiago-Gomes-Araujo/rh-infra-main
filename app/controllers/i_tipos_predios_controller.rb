class ITiposPrediosController < ApplicationController
  include Validates
  before_action :set_i_tipo_predio, only: %i[ edit update destroy ]

  def index
    @q = ITipoPredio
      .where(g_secretaria_id: current_user.g_secretaria_id)
      .ransack(params[:q])
    @pagy, @i_tipos_predios = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_tipo_predio = ITipoPredio.new
  end

  def edit
  end

  def create
    @i_tipo_predio = ITipoPredio.new(i_tipo_predio_params.merge(g_secretaria_id: current_user.g_secretaria_id))
    if @i_tipo_predio.save
      redirect_to i_tipos_predios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipo_predio.update(i_tipo_predio_params.merge(g_secretaria_id: current_user.g_secretaria_id))
      redirect_to i_tipos_predios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipo_predio.soft_delete
      redirect_to i_tipos_predios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipos_predios_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_tipo_predio
    @i_tipo_predio = ITipoPredio.find(params[:id])
    if @i_tipo_predio.g_secretaria_id != current_user.g_secretaria_id
      redirect_to i_tipos_predios_path, alert: "Seu usuário não possui acesso"
    end
  end

  def i_tipo_predio_params
    params.require(:i_tipo_predio).permit(ITipoPredio.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
