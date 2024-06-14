class GTiposNiveisEscolaridadesController < ApplicationController
  include Validates
  before_action :set_g_tipo_nivel_escolaridade, only: %i[ edit update destroy ]

  def index
    @q = GTipoNivelEscolaridade.ransack(params[:q])
    @pagy, @g_tipos_niveis_escolaridades = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_tipo_nivel_escolaridade = GTipoNivelEscolaridade.new
  end

  def edit
  end

  def create
    @g_tipo_nivel_escolaridade = GTipoNivelEscolaridade.new(g_tipo_nivel_escolaridade_params)

    if @g_tipo_nivel_escolaridade.save
      redirect_to g_tipos_niveis_escolaridades_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_tipo_nivel_escolaridade.update(g_tipo_nivel_escolaridade_params)
      redirect_to g_tipos_niveis_escolaridades_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipo_nivel_escolaridade.soft_delete
      redirect_to g_tipos_niveis_escolaridades_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_tipos_niveis_escolaridades_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_tipo_nivel_escolaridade
    @g_tipo_nivel_escolaridade = GTipoNivelEscolaridade.find(params[:id])
  end

  def g_tipo_nivel_escolaridade_params
    params.require(:g_tipo_nivel_escolaridade).permit(GTipoNivelEscolaridade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
