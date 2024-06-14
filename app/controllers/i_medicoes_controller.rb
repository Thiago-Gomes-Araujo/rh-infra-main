class IMedicoesController < ApplicationController
  include Validates
  before_action :set_i_medicao, only: %i[ show edit update destroy ]
  before_action :set_i_acordo

  def index
    params.permit![:format]
    @q = IMedicao.includes(:i_notificacao, :i_acordo)
      .where(i_acordo: @i_acordo).order("i_acordos.descricao").ransack(params[:q])
    respond_to do |format|
      format.html { @pagy, @i_medicoes = pagy(@q.result) }
      format.xlsx do
        @i_medicoes = @q.result.order("i_acordos.descricao")
        headers["Content-Disposition"] = 'attachment; filename="Medicoes"'
      end
    end
  end

  def new
    @i_medicao = IMedicao.new
  end

  def edit
  end

  def create
    @i_medicao = IMedicao.new(i_medicao_params.merge(i_acordo: @i_acordo))

    if @i_medicao.save
      redirect_to i_acordo_i_medicoes_path(@i_acordo), notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_medicao.update(i_medicao_params)
      redirect_to i_acordo_i_medicoes_path(@i_acordo), notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_medicao.soft_delete
      redirect_to i_acordo_i_medicoes_path(@i_acordo), notice: "Registro foi marcado como excluído."
    else
      redirect_to i_acordo_i_medicoes_path(@i_acordo), alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_acordo
    @i_acordo = IAcordo.find(params[:i_acordo_id])
  end

  def set_i_medicao
    @i_medicao = IMedicao.find(params[:id])
  end

  def i_medicao_params
    params.require(:i_medicao).permit(IMedicao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
