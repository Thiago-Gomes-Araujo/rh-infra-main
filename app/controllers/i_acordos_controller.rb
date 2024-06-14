class IAcordosController < ApplicationController
  include Validates
  before_action :set_i_acordo, only: %i[ show edit update destroy ]

  def index
    params.permit![:format]
    @q = IAcordo.includes(:i_predio, :i_status_acordo).ransack(params[:q])
    respond_to do |format|
      format.html { @pagy, @i_acordos = pagy(@q.result.order("i_predios.nome_predio")) }
      format.xlsx do
        @i_acordos = @q.result.order("i_predios.nome_predio")
        headers["Content-Disposition"] = 'attachment; filename="Acordo"'
      end
    end
  end

  def new
    @i_acordo = IAcordo.new
  end

  def edit
  end

  def create
    @i_acordo = IAcordo.new(i_acordo_params)

    if @i_acordo.save
      redirect_to i_acordos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_acordo.update(i_acordo_params)
      redirect_to i_acordos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_acordo.soft_delete
      redirect_to i_acordos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_acordos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  def relatorios
    params.permit![:format]
    @q = IAcordo.includes(:i_status_acordo, :i_servico_acordo).ransack(params[:q])
    @i_acordos = @q.result.order(:data_fim)
    @escola = params[:q][:i_tipo_predio_id_eq]

    if @i_acordos.blank?
      redirect_to request.referer, alert: "Não existem registros com os dados informados."
    else
      respond_to do |format|
        format.html do
          @data_fim = params[:q]["data_fim_lteq"]
          render layout: "acordos", template: "relatorios/acordos"
        end

        format.xlsx do
          @i_acordos = @q.result.order(:data_fim)
          response.headers["Content-Disposition"] = 'attachment; filename="Acordo.xlsx"'
          render "relatorios/acordos"
        end
      end
    end
  end

  private

  def set_i_acordo
    @i_acordo = IAcordo.find(params[:id])
  end

  def i_acordo_params
    params.require(:i_acordo).permit(IAcordo.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
