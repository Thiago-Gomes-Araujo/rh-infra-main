class GNiveisEscolaridadesController < ApplicationController
  include Validates
  before_action :set_g_nivel_escolaridade, only: %i[ edit update destroy ]
  before_action :set_g_pessoa

  def index
    @q = GNivelEscolaridade.ransack(params[:q])
    @pagy, @g_niveis_escolaridades = pagy(@q.result.includes(:g_tipo_nivel_escolaridade))
  end

  def new
    @g_nivel_escolaridade = GNivelEscolaridade.new
  end

  def edit
  end

  def create
    @g_nivel_escolaridade = GNivelEscolaridade.new(g_nivel_escolaridade_params)
    @g_nivel_escolaridade.g_pessoa = @g_pessoa

    if @g_nivel_escolaridade.save
      redirect_to g_pessoa_g_niveis_escolaridades_path(@g_pessoa), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_nivel_escolaridade.update(g_nivel_escolaridade_params)
      redirect_to g_pessoa_g_niveis_escolaridades_path(@g_pessoa), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_nivel_escolaridade.soft_delete
      redirect_to g_pessoa_g_niveis_escolaridades_path(@g_pessoa), notice: "Registro foi marcado como excluído."
    else
      redirect_to g_pessoa_g_niveis_escolaridades_path(@g_pessoa), alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_nivel_escolaridade
    @g_nivel_escolaridade = GNivelEscolaridade.find(params[:id])
  end

  def set_g_pessoa
    @g_pessoa = GPessoa.find(params[:g_pessoa_id])
  end

  def g_nivel_escolaridade_params
    params.require(:g_nivel_escolaridade).permit(GNivelEscolaridade.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
