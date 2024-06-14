class IPrediosMantenedoresProprietariosController < ApplicationController
  include Validates
  before_action :set_i_predio_mantenedor_proprietario, only: %i[ show edit update destroy ]

  def index
    @q = IPredioMantenedorProprietario.ransack(params[:q])
    @pagy, @i_predios_mantenedores_proprietarios = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_predio_mantenedor_proprietario = IPredioMantenedorProprietario.new
  end

  def edit
  end

  def create
    @i_predio_mantenedor_proprietario = IPredioMantenedorProprietario.new(i_predio_mantenedor_proprietario_params)

    if @i_predio_mantenedor_proprietario.save
      redirect_to i_predios_mantenedores_proprietarios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_mantenedor_proprietario.update(i_predio_mantenedor_proprietario_params)
      redirect_to i_predios_mantenedores_proprietarios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_mantenedor_proprietario.soft_delete
      redirect_to i_predios_mantenedores_proprietarios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_mantenedores_proprietarios_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_predio_mantenedor_proprietario
    @i_predio_mantenedor_proprietario = IPredioMantenedorProprietario.find(params[:id])
  end

  def i_predio_mantenedor_proprietario_params
    params.require(:i_predio_mantenedor_proprietario).permit(IPredioMantenedorProprietario.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
