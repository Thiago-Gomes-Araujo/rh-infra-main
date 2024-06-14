class GSedamIcmsAreasController < ApplicationController
  include Validates
  before_action :set_g_sedam_icms_area, only: %i[ show edit update destroy ]

  def index
    @q = GSedamIcmsArea.ransack(params[:q])
    @pagy, @g_sedam_icms_areas = pagy(@q.result)
  end

  def index_relatorio
    @q = GSedamIcmsArea.ransack(params[:q])
    @pagy, @g_sedam_icms_areas = pagy(@q.result)
  end
  

  def new
    @g_sedam_icms_area = GSedamIcmsArea.new
  end

  def edit
  end

  def create
    @g_sedam_icms_area = GSedamIcmsArea.new(g_sedam_icms_area_params)

    if @g_sedam_icms_area.save
      redirect_to g_sedam_icms_areas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_sedam_icms_area.update(g_sedam_icms_area_params)
      redirect_to g_sedam_icms_areas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_sedam_icms_area.soft_delete
      redirect_to g_sedam_icms_areas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_sedam_icms_areas_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  def relatorio_sedam
    params.permit![:format]
    @q = GSedamIcmsArea.includes(:g_municipio).ransack(params[:q])
    @g_areas_sedam = @q.result.order(:ano)
  
    if @g_areas_sedam.blank?
      redirect_to request.referer, alert: "Não existem registros com os dados informados."
    else
      @total_area_protegida = @g_areas_sedam.sum(:area_protegida)
      @total_area_antropizada = @g_areas_sedam.sum(:area_antropizada)
      @total_area_liquida = @g_areas_sedam.sum(:area_liquida)
  
      respond_to do |format|
        format.html do
          @ano = params[:q]["ano_lteq"]
          render layout: "sedam", template: "relatorios/sedam"
        end
      end
    end
  end
  


  private

  def set_g_sedam_icms_area
    @g_sedam_icms_area = GSedamIcmsArea.find(params[:id])
  end

  def g_sedam_icms_area_params
    params.require(:g_sedam_icms_area).permit(GSedamIcmsArea.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by', 'area_liquida'].include?(col) }.map(&:to_sym))    
  end
end
