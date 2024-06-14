class IFiscaisController < ApplicationController
  include Validates
  before_action :set_i_fiscal, only: %i[ show edit update destroy ]

  def index
    @q = IFiscal.includes(:i_portaria).ransack(params[:q])
    @pagy, @i_fiscais = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_fiscal = IFiscal.new
  end

  def edit
  end

  def create
    @i_fiscal = IFiscal.new(i_fiscal_params)

    if @i_fiscal.save
      redirect_to i_fiscais_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_fiscal.update(i_fiscal_params)
      redirect_to i_fiscais_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_fiscal.soft_delete
      redirect_to i_fiscais_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_fiscais_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_fiscal
    @i_fiscal = IFiscal.find(params[:id])
  end

  def i_fiscal_params
    params.require(:i_fiscal).permit(IFiscal.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
