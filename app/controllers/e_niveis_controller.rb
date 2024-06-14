class ENiveisController < ApplicationController
  include Validates
  before_action :set_e_nivel, only: %i[ show edit update destroy ]

  def index
    @q = ENivel.ransack(params[:q])
    @pagy, @e_niveis = pagy(@q.result)
  end

  def new
    @e_nivel = ENivel.new
  end

  def edit
  end

  def create
    @e_nivel = ENivel.new(e_nivel_params)

    if @e_nivel.save
      redirect_to e_niveis_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @e_nivel.update(e_nivel_params)
      redirect_to e_niveis_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @e_nivel.soft_delete
      redirect_to e_niveis_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to e_niveis_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_e_nivel
    @e_nivel = ENivel.find(params[:id])
  end

  def e_nivel_params
    params.require(:e_nivel).permit(ENivel.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
