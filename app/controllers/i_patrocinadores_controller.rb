class IPatrocinadoresController < ApplicationController
  include Validates
  before_action :set_i_patrocinador, only: %i[ show edit update destroy ]

  def index
    @q = IPatrocinador.ransack(params[:q])
    @pagy, @i_patrocinadores = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_patrocinador = IPatrocinador.new
  end

  def edit
  end

  def create
    @i_patrocinador = IPatrocinador.new(i_patrocinador_params)

    if @i_patrocinador.save
      redirect_to i_patrocinadores_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_patrocinador.update(i_patrocinador_params)
      redirect_to i_patrocinadores_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_patrocinador.soft_delete
      redirect_to i_patrocinadores_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_patrocinadores_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_patrocinador
    @i_patrocinador = IPatrocinador.find(params[:id])
  end

  def i_patrocinador_params
    params.require(:i_patrocinador).permit(IPatrocinador.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
