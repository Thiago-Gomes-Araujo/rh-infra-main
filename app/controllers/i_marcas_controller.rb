class IMarcasController < ApplicationController
  include Validates
  before_action :set_i_marca, only: %i[ show edit update destroy ]

  def index
    @q = IMarca.ransack(params[:q])
    @pagy, @i_marcas = pagy(@q.result)
  end

  def new
    @i_marca = IMarca.new
  end

  def edit
  end

  def create
    @i_marca = IMarca.new(i_marca_params)

    if @i_marca.save
      redirect_to i_marcas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_marca.update(i_marca_params)
      redirect_to i_marcas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_marca.soft_delete
      redirect_to i_marcas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_marcas_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_marca
    @i_marca = IMarca.find(params[:id])
  end

  def i_marca_params
    params.require(:i_marca).permit(IMarca.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
