class INiveisAcordoController < ApplicationController
  include Validates
  before_action :set_i_nivel_acordo, only: %i[ show edit update destroy ]

  def index
    @q = INivelAcordo.ransack(params[:q])
    @pagy, @i_niveis_acordo = pagy(@q.result)
  end

  def new
    @i_nivel_acordo = INivelAcordo.new
  end

  def edit
  end

  def create
    @i_nivel_acordo = INivelAcordo.new(i_nivel_acordo_params)

    if @i_nivel_acordo.save
      redirect_to i_niveis_acordo_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_nivel_acordo.update(i_nivel_acordo_params)
      redirect_to i_niveis_acordo_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_nivel_acordo.soft_delete
      redirect_to i_niveis_acordo_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_niveis_acordo_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_nivel_acordo
    @i_nivel_acordo = INivelAcordo.find(params[:id])
  end

  def i_nivel_acordo_params
    params.require(:i_nivel_acordo).permit(INivelAcordo.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
