class GMunicipiosController < ApplicationController
  include Validates
  before_action :set_g_municipio, only: %i[ edit update destroy ]

  def index
    @q = GMunicipio.includes(:g_estado).ransack(params[:q])
    @pagy, @g_municipios = pagy(@q.result(distinct: true).order(:descricao))
  end

  def show
  end

  def new
    @g_municipio = GMunicipio.new
  end

  def edit
  end

  def create
    @g_municipio = GMunicipio.new(g_municipio_params)

    if @g_municipio.save
      redirect_to g_municipios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_municipio.update(g_municipio_params)
      redirect_to g_municipios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_municipio.soft_delete
      redirect_to g_municipios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_municipios_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  def relatorio_sgis
    @relatorio_sgis = GMunicipio.relatorio_idero
  end

  def relatorio_sgis_escolar
    if params[:q].present? && (params[:q][:g_municipio_id_eq].present? || params[:q][:ano_eq].present?)
      @q = GMunicipio.includes(:g_estado).ransack(params[:q])
      @q.build_grouping(m: 'and') if @q.groupings.empty?
      @sgis_escolar = @q.result(distinct: true)
  
      if @sgis_escolar.empty?
        redirect_to request.referer, alert: "Não existem registros com os dados informados." and return
      end
  
      @relatorio_sgis = GMunicipio.relatorio_idero_filtered_by_municipio(params[:q][:g_municipio_id_eq], params[:q][:ano_eq])
  
      if @relatorio_sgis.empty?
        redirect_to request.referer, alert: "Não existem registros para o município e ano selecionados." and return
      end
  
      if @relatorio_sgis.any? { |record| record.values_at(:iqa, :iqf, :ta, :ise).any?(&:nil?) }
        redirect_to request.referer, alert: "Não existem registros completos com os dados informados para o município e ano selecionados." and return
      end
    else
      @relatorio_sgis = GMunicipio.relatorio_idero
    end
  
    respond_to do |format|
      format.html do
        render layout: "sgis_escolar", template: "relatorios/sgis_escolar"
      end
    end
  end
  
  
  
  
  private

  def set_g_municipio
    @g_municipio = GMunicipio.find(params[:id])
  end

  def g_municipio_params
    params.require(:g_municipio).permit(GMunicipio.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
