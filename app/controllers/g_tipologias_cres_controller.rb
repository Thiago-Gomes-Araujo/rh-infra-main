class GTipologiasCresController < ApplicationController
  include Validates
  before_action :set_g_tipologia_cre, only: %i[ show edit update destroy ]

  def index
    @q = GTipologiaCre.ransack(params[:q])
    @pagy, @g_tipologias_cres = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_tipologia_cre = GTipologiaCre.new
  end

  def edit
  end

  def create
    @g_tipologia_cre = GTipologiaCre.new(g_tipologia_cre_params)

    if @g_tipologia_cre.save
      redirect_to g_tipologias_cres_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_tipologia_cre.update(g_tipologia_cre_params)
      redirect_to g_tipologias_cres_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipologia_cre.soft_delete
      redirect_to g_tipologias_cres_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_tipologias_cres_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_tipologia_cre
    @g_tipologia_cre = GTipologiaCre.find(params[:id])
  end

  def g_tipologia_cre_params
    params.require(:g_tipologia_cre).permit(GTipologiaCre.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
