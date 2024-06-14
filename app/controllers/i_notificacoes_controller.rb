class INotificacoesController < ApplicationController
  include Validates
  before_action :set_i_notificacao, only: %i[ show edit update destroy ]
  before_action :set_i_acordo

  def index
    @q = INotificacao.includes(:i_acordo).where(i_acordo: @i_acordo).ransack(params[:q])
    @pagy, @i_notificacoes = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_notificacao = INotificacao.new
  end

  def edit
  end

  def create
    @i_notificacao = INotificacao.new(i_notificacao_params.merge(i_acordo: @i_acordo))

    if @i_notificacao.save
      redirect_to i_acordo_i_notificacoes_path(@i_acordo), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_notificacao.update(i_notificacao_params.merge(i_acordo: @i_acordo))
      redirect_to i_acordo_i_notificacoes_path(@i_acordo), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_notificacao.soft_delete
      redirect_to i_acordo_i_notificacoes_path(@i_acordo), notice: "Registro foi marcado como excluído."
    else
      redirect_to i_acordo_i_notificacoes_path(@i_acordo), alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_acordo
    @i_acordo = IAcordo.find(params[:i_acordo_id])
  end

  def set_i_notificacao
    @i_notificacao = INotificacao.find(params[:id])
  end

  def i_notificacao_params
    params.require(:i_notificacao).permit(INotificacao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
