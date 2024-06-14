class IContasContabeisController < ApplicationController
  include Validates
  before_action :set_i_conta_contabil, only: %i[ show edit update destroy ]

  def index
    @q = IContaContabil.ransack(params[:q])
    @pagy, @i_contas_contabeis = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_conta_contabil = IContaContabil.new
  end

  def edit
  end

  def create
    @i_conta_contabil = IContaContabil.new(i_conta_contabil_params)

    if @i_conta_contabil.save
      redirect_to i_contas_contabeis_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_conta_contabil.update(i_conta_contabil_params)
      redirect_to i_contas_contabeis_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_conta_contabil.soft_delete
      redirect_to i_contas_contabeis_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_contas_contabeis_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_conta_contabil
    @i_conta_contabil = IContaContabil.find(params[:id])
  end

  def i_conta_contabil_params
    params.require(:i_conta_contabil).permit(IContaContabil.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
