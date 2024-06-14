class ICorrecoesMonetariasController < ApplicationController
  include Validates
  before_action :set_i_correcao_monetaria, only: %i[ edit update destroy ]
  
  def index
    @predios_selecao = IPredio
      .where(g_secretaria_id: current_user.g_secretaria_id)
      .includes(:g_localidade) # Inclui g_localidade para evitar consultas N+1
      .map { |predio| [predio.predio_localidade, predio.id] }

    @q = ICorrecaoMonetaria
      .includes(i_predio: :g_cre)
      .where(i_predio: { g_secretaria_id: current_user.g_secretaria_id })
      .ransack(params[:q])
    @pagy, @i_correcoes_monetarias = pagy(@q.result)
  end

  def new
    @i_correcao_monetaria = ICorrecaoMonetaria.new
  end

  def edit
  end

  def create
    @i_correcao_monetaria = ICorrecaoMonetaria.new(i_correcao_monetaria_params)

    if @i_correcao_monetaria.save
      redirect_to i_correcoes_monetarias_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_correcao_monetaria.update(i_correcao_monetaria_params)
      redirect_to i_correcoes_monetarias_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_correcao_monetaria.soft_delete
      redirect_to i_correcoes_monetarias_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_correcoes_monetarias_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_correcao_monetaria
    @i_correcao_monetaria = ICorrecaoMonetaria.joins(:i_predio).find_by(id: params[:id], i_predio: { g_secretaria_id: current_user.g_secretaria_id })
  end

  def i_correcao_monetaria_params
    params.require(:i_correcao_monetaria).permit(ICorrecaoMonetaria.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
