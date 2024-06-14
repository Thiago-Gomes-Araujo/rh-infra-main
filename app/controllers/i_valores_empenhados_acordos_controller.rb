class IValoresEmpenhadosAcordosController < ApplicationController
  include Validates
  before_action :set_i_valor_empenhado_acordo, only: %i[ show edit update destroy ]
  before_action :set_i_acordo

  def index
    @q = IValorEmpenhadoAcordo.includes(:i_acordo).where(i_acordo: @i_acordo).ransack(params[:q])
    @pagy, @i_valores_empenhados_acordos = pagy(@q.result)
  end

  def new
    @i_valor_empenhado_acordo = IValorEmpenhadoAcordo.new
  end

  def edit
  end

  def create
    @i_valor_empenhado_acordo = IValorEmpenhadoAcordo.new(i_valor_empenhado_acordo_params.merge(i_acordo: @i_acordo))

    if @i_valor_empenhado_acordo.save
      redirect_to i_acordo_i_valores_empenhados_acordos_path(@i_acordo), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_valor_empenhado_acordo.update(i_valor_empenhado_acordo_params)
      redirect_to i_acordo_i_valores_empenhados_acordos_path(@i_acordo), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_valor_empenhado_acordo.soft_delete
      redirect_to i_acordo_i_valores_empenhados_acordos_path(@i_acordo), notice: "Registro foi marcado como excluído."
    else
      redirect_to i_acordo_i_valores_empenhados_acordos_path(@i_acordo), alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_acordo
    @i_acordo = IAcordo.find(params[:i_acordo_id])
  end

  def set_i_valor_empenhado_acordo
    @i_valor_empenhado_acordo = IValorEmpenhadoAcordo.find(params[:id])
  end

  def i_valor_empenhado_acordo_params
    params.require(:i_valor_empenhado_acordo).permit(IValorEmpenhadoAcordo.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
