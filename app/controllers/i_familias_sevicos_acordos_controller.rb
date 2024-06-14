class IFamiliasSevicosAcordosController < ApplicationController
  include Validates
  before_action :set_i_familia_servico_acordo, only: %i[ show edit update destroy ]

  def index
    @q = IFamiliaServicoAcordo.ransack(params[:q])
    @pagy, @i_familias_sevicos_acordos = pagy(@q.result)
  end

  def new
    @i_familia_servico_acordo = IFamiliaServicoAcordo.new
  end

  def edit
  end

  def create
    @i_familia_servico_acordo = IFamiliaServicoAcordo.new(i_familia_servico_acordo_params)

    if @i_familia_servico_acordo.save
      redirect_to i_familias_sevicos_acordos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_familia_servico_acordo.update(i_familia_servico_acordo_params)
      redirect_to i_familias_sevicos_acordos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_familia_servico_acordo.soft_delete
      redirect_to i_familias_sevicos_acordos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_familias_sevicos_acordos_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_familia_servico_acordo
    @i_familia_servico_acordo = IFamiliaServicoAcordo.find(params[:id])
  end

  def i_familia_servico_acordo_params
    params.require(:i_familia_servico_acordo).permit(IFamiliaServicoAcordo.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
