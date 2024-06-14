class GTiposCertidoesCivisController < ApplicationController
  include Validates
  before_action :set_g_tipo_certidao_civil, only: %i[ edit update destroy ]

  def index
    @q = GTipoCertidaoCivil.ransack(params[:q])
    @pagy, @g_tipos_certidoes_civis = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_tipo_certidao_civil = GTipoCertidaoCivil.new
  end

  def edit
  end

  def create
    @g_tipo_certidao_civil = GTipoCertidaoCivil.new(g_tipo_certidao_civil_params)

    if @g_tipo_certidao_civil.save
      redirect_to g_tipos_certidoes_civis_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_tipo_certidao_civil.update(g_tipo_certidao_civil_params)
      redirect_to g_tipos_certidoes_civis_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipo_certidao_civil.soft_delete
      redirect_to g_tipos_certidoes_civis_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_tipos_certidoes_civis_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_tipo_certidao_civil
    @g_tipo_certidao_civil = GTipoCertidaoCivil.find(params[:id])
  end

  def g_tipo_certidao_civil_params
    params.require(:g_tipo_certidao_civil).permit(GTipoCertidaoCivil.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
