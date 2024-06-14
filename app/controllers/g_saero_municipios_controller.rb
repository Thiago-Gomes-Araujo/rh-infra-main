class GSaeroMunicipiosController < ApplicationController
  include Validates
  before_action :set_g_saero_municipio, only: %i[ show edit update destroy ]

  def index
    @q = GSaeroMunicipio.ransack(params[:q])
    @pagy, @g_saero_municipios = pagy(@q.result)
  end

  def new
    @g_saero_municipio = GSaeroMunicipio.new
  end

  def edit
  end

  def create
    @g_saero_municipio = GSaeroMunicipio.new(g_saero_municipio_params)

    if @g_saero_municipio.save
      redirect_to g_saero_municipios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_saero_municipio.update(g_saero_municipio_params)
      redirect_to g_saero_municipios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_saero_municipio.soft_delete
      redirect_to g_saero_municipios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_saero_municipios_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_saero_municipio
    @g_saero_municipio = GSaeroMunicipio.find(params[:id])
  end

  def g_saero_municipio_params
    params.require(:g_saero_municipio).permit(GSaeroMunicipio.column_names.reject { |col|
      ["deleted_at", "created_by", "updated_by", "indice_lp_segundo_ano",
       "indice_mt_segundo_ano", "indice_lp_quinto_ano", "indice_mt_quinto_ano"].include?(col)
    }.map(&:to_sym))
  end
end
