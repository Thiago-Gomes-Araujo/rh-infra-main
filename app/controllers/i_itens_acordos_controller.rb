class IItensAcordosController < ApplicationController
  include Validates
  before_action :set_i_item_acordo, only: %i[ show edit update destroy ]

  def index
    @q = IItemAcordo.includes(:i_acordo, :i_tipo_item_acordo).ransack(params[:q])
    @pagy, @i_itens_acordos = pagy(@q.result.order(:descricao))
  end

  def new
    @i_item_acordo = IItemAcordo.new
  end

  def edit
  end

  def create
    @i_item_acordo = IItemAcordo.new(i_item_acordo_params)

    if @i_item_acordo.save
      redirect_to i_itens_acordos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_item_acordo.update(i_item_acordo_params)
      redirect_to i_itens_acordos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_item_acordo.soft_delete
      redirect_to i_itens_acordos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_itens_acordos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_item_acordo
    @i_item_acordo = IItemAcordo.find(params[:id])
  end

  def i_item_acordo_params
    params.require(:i_item_acordo).permit(IItemAcordo.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
