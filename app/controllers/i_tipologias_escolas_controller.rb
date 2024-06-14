class ITipologiasEscolasController < ApplicationController
  include Validates
  before_action :set_i_tipologia_escola, only: %i[ show edit update destroy ]

  def index
    @q = ITipologiaEscola.ransack(params[:q])
    @pagy, @i_tipologias_escolas = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_tipologia_escola = ITipologiaEscola.new
  end

  def edit
  end

  def create
    @i_tipologia_escola = ITipologiaEscola.new(i_tipologia_escola_params)

    if @i_tipologia_escola.save
      redirect_to i_tipologias_escolas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipologia_escola.update(i_tipologia_escola_params)
      redirect_to i_tipologias_escolas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipologia_escola.soft_delete
      redirect_to i_tipologias_escolas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipologias_escolas_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_tipologia_escola
    @i_tipologia_escola = ITipologiaEscola.find(params[:id])
  end

  def i_tipologia_escola_params
    params.require(:i_tipologia_escola).permit(ITipologiaEscola.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
