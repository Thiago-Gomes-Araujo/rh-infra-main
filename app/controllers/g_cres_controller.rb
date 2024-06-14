class GCresController < ApplicationController
  include Validates
  before_action :set_g_cre, only: %i[ edit update destroy ]

  def index
    @q = GCre.includes(:g_tipologia_cre, :g_municipio).ransack(params[:q])
    @pagy, @g_cres = pagy(@q.result.order(:descricao))
  end

  def new
    @g_cre = GCre.new
  end

  def edit
  end

  def create
    @g_cre = GCre.new(g_cre_params)

    if @g_cre.save
      redirect_to g_cres_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_cre.update(g_cre_params)
      redirect_to g_cres_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_cre.soft_delete
      redirect_to g_cres_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_cres_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_cre
    @g_cre = GCre.find(params[:id])
  end

  def g_cre_params
    params.require(:g_cre).permit(GCre.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
