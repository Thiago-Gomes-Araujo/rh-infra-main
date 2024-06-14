class IStatusNotificacoesController < ApplicationController
  include Validates
  before_action :set_i_status_notificacao, only: %i[ show edit update destroy ]

  def index
    @q = IStatusNotificacao.ransack(params[:q])
    @pagy, @i_status_notificacoes = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_status_notificacao = IStatusNotificacao.new
  end

  def edit
  end

  def create
    @i_status_notificacao = IStatusNotificacao.new(i_status_notificacao_params)

    if @i_status_notificacao.save
      redirect_to i_status_notificacoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_status_notificacao.update(i_status_notificacao_params)
      redirect_to i_status_notificacoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_status_notificacao.soft_delete
      redirect_to i_status_notificacoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_status_notificacoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_status_notificacao
    @i_status_notificacao = IStatusNotificacao.find(params[:id])
  end

  def i_status_notificacao_params
    params.require(:i_status_notificacao).permit(IStatusNotificacao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
