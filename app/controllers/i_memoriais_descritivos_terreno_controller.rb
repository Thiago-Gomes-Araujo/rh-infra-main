class IMemoriaisDescritivosTerrenoController < ApplicationController
  include Validates
  before_action :set_i_memorial_descritivo_terreno, only: %i[ show edit update destroy ]

  def index
    @q = IMemorialDescritivoTerreno.includes(:i_predio).order("i_predios.nome_predio").ransack(params[:q])
    @pagy, @i_memoriais_descritivos_terreno = pagy(@q.result)
  end

  def new
    @i_memorial_descritivo_terreno = IMemorialDescritivoTerreno.new
  end

  def edit
  end

  def create
    @i_memorial_descritivo_terreno = IMemorialDescritivoTerreno.new(i_memorial_descritivo_terreno_params)

    if @i_memorial_descritivo_terreno.save
      redirect_to i_memoriais_descritivos_terreno_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_memorial_descritivo_terreno.update(i_memorial_descritivo_terreno_params)
      redirect_to i_memoriais_descritivos_terreno_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_memorial_descritivo_terreno.soft_delete
      redirect_to i_memoriais_descritivos_terreno_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_memoriais_descritivos_terreno_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_memorial_descritivo_terreno
    @i_memorial_descritivo_terreno = IMemorialDescritivoTerreno.find(params[:id])
  end

  def i_memorial_descritivo_terreno_params
    params.require(:i_memorial_descritivo_terreno).permit(IMemorialDescritivoTerreno.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
