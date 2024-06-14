class IPrediosDestinacoesLixoController < ApplicationController
  include Validates
  before_action :set_i_predio_destinacao_lixo, only: %i[ show edit update destroy ]

  def index
    @q = IPredioDestinacaoLixo.ransack(params[:q])
    @pagy, @i_predios_destinacoes_lixo = pagy(@q.result)
  end

  def new
    @i_predio_destinacao_lixo = IPredioDestinacaoLixo.new
  end

  def edit
  end

  def create
    @i_predio_destinacao_lixo = IPredioDestinacaoLixo.new(i_predio_destinacao_lixo_params)

    if @i_predio_destinacao_lixo.save
      redirect_to i_predios_destinacoes_lixo_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio_destinacao_lixo.update(i_predio_destinacao_lixo_params)
      redirect_to i_predios_destinacoes_lixo_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio_destinacao_lixo.soft_delete
      redirect_to i_predios_destinacoes_lixo_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_destinacoes_lixo_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_predio_destinacao_lixo
    @i_predio_destinacao_lixo = IPredioDestinacaoLixo.find(params[:id])
  end

  def i_predio_destinacao_lixo_params
    params.require(:i_predio_destinacao_lixo).permit(IPredioDestinacaoLixo.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
