class IPredioEstruturasController < ApplicationController
  include Validates
  before_action :set_i_predio_estrutura, only: %i[ show edit update destroy ]

  def index
    @q = IPredioEstrutura.ransack(params[:q])
    @pagy, @i_predio_estruturas = pagy(@q.result)
  end

  def new
    @i_predio_estrutura = IPredioEstrutura.new
  end

  def edit
  end

  def create
    @i_predio_estrutura = IPredioEstrutura.new(i_predio_estrutura_params)

    if @i_predio_estrutura.save
      redirect_to i_predio_estruturas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_estrutura.update(i_predio_estrutura_params)
      redirect_to i_predio_estruturas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_estrutura.soft_delete
      redirect_to i_predio_estruturas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predio_estruturas_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_predio_estrutura
    @i_predio_estrutura = IPredioEstrutura.find(params[:id])
  end

  def i_predio_estrutura_params
    params.require(:i_predio_estrutura).permit(IPredioEstrutura.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
