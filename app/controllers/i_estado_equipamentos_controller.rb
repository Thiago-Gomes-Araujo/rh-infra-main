class IEstadoEquipamentosController < ApplicationController
  include Validates
  before_action :set_i_estado_equipamento, only: %i[ show edit update destroy ]

  def index
    @q = IEstadoEquipamento.ransack(params[:q])
    @pagy, @i_estado_equipamentos = pagy(@q.result)
  end

  def new
    @i_estado_equipamento = IEstadoEquipamento.new
  end

  def edit
  end

  def create
    @i_estado_equipamento = IEstadoEquipamento.new(i_estado_equipamento_params)

    if @i_estado_equipamento.save
      redirect_to i_estado_equipamentos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_estado_equipamento.update(i_estado_equipamento_params)
      redirect_to i_estado_equipamentos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_estado_equipamento.soft_delete
      redirect_to i_estado_equipamentos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_estado_equipamentos_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_estado_equipamento
    @i_estado_equipamento = IEstadoEquipamento.find(params[:id])
  end

  def i_estado_equipamento_params
    params.require(:i_estado_equipamento).permit(IEstadoEquipamento.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
