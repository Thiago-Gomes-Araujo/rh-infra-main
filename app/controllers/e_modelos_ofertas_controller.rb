class EModelosOfertasController < ApplicationController
  include Validates
  before_action :set_e_modelo_oferta, only: %i[ show edit update destroy ]

  def index
    @q = EModeloOferta.ransack(params[:q])
    @pagy, @e_modelos_ofertas = pagy(@q.result)
  end

  def new
    @e_modelo_oferta = EModeloOferta.new
  end

  def edit
  end

  def create
    @e_modelo_oferta = EModeloOferta.new(e_modelo_oferta_params)

    if @e_modelo_oferta.save
      redirect_to e_modelos_ofertas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_modelo_oferta.update(e_modelo_oferta_params)
      redirect_to e_modelos_ofertas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_modelo_oferta.soft_delete
      redirect_to e_modelos_ofertas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_modelos_ofertas_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_e_modelo_oferta
    @e_modelo_oferta = EModeloOferta.find(params[:id])
  end

  def e_modelo_oferta_params
    params.require(:e_modelo_oferta).permit(EModeloOferta.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
