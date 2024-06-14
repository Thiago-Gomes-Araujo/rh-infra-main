class IServicosAcordosController < ApplicationController
  include Validates
  before_action :set_i_servico_acordo, only: %i[ show edit update destroy ]

  def index
    @q = IServicoAcordo.ransack(params[:q])
    @pagy, @i_servicos_acordos = pagy(@q.result)
  end

  def new
    @i_servico_acordo = IServicoAcordo.new
  end

  def edit
  end

  def create
    @i_servico_acordo = IServicoAcordo.new(i_servico_acordo_params)

    if @i_servico_acordo.save
      redirect_to i_servicos_acordos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_servico_acordo.update(i_servico_acordo_params)
      redirect_to i_servicos_acordos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_servico_acordo.soft_delete
      redirect_to i_servicos_acordos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_servicos_acordos_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_servico_acordo
    @i_servico_acordo = IServicoAcordo.find(params[:id])
  end

  def i_servico_acordo_params
    params.require(:i_servico_acordo).permit(IServicoAcordo.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
