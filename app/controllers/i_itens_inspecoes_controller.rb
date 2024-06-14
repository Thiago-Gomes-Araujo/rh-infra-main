class IItensInspecoesController < ApplicationController
  include Validates
  before_action :set_i_item_inspecao, only: %i[ show edit update destroy ]

  def index
    @q = IItemInspecao.ransack(params[:q])
    @pagy, @i_itens_inspecoes = pagy(@q.result)
  end

  def new
    @i_item_inspecao = IItemInspecao.new
  end

  def edit
  end

  def create
    @i_item_inspecao = IItemInspecao.new(i_item_inspecao_params)

    if @i_item_inspecao.save
      redirect_to i_itens_inspecoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_item_inspecao.update(i_item_inspecao_params)
      redirect_to i_itens_inspecoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_item_inspecao.soft_delete
      redirect_to i_itens_inspecoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_itens_inspecoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_item_inspecao
    @i_item_inspecao = IItemInspecao.find(params[:id])
  end

  def i_item_inspecao_params
    params.require(:i_item_inspecao).permit(IItemInspecao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
