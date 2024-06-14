class IFamiliasEquipamentosController < ApplicationController
  include Validates
  before_action :set_i_familia_equipamento, only: %i[ show edit update destroy ]

  def index
    @q = IFamiliaEquipamento.ransack(params[:q])
    @pagy, @i_familias_equipamentos = pagy(@q.result)
  end

  def new
    @i_familia_equipamento = IFamiliaEquipamento.new
  end

  def edit
  end

  def create
    @i_familia_equipamento = IFamiliaEquipamento.new(i_familia_equipamento_params)

    if @i_familia_equipamento.save
      redirect_to i_familias_equipamentos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_familia_equipamento.update(i_familia_equipamento_params)
      redirect_to i_familias_equipamentos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_familia_equipamento.soft_delete
      redirect_to i_familias_equipamentos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_familias_equipamentos_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_familia_equipamento
    @i_familia_equipamento = IFamiliaEquipamento.find(params[:id])
  end

  def i_familia_equipamento_params
    params.require(:i_familia_equipamento).permit(IFamiliaEquipamento.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
