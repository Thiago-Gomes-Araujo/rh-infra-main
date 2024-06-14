class ITiposEquipamentosController < ApplicationController
  include Validates
  before_action :set_i_tipo_equipamento, only: %i[ show edit update destroy ]

  def index
    @q = ITipoEquipamento.ransack(params[:q])
    @pagy, @i_tipos_equipamentos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @i_tipo_equipamento = ITipoEquipamento.new
  end

  def edit
  end

  def create
    @i_tipo_equipamento = ITipoEquipamento.new(i_tipo_equipamento_params)

    if @i_tipo_equipamento.save
      redirect_to i_tipos_equipamentos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipo_equipamento.update(i_tipo_equipamento_params)
      redirect_to i_tipos_equipamentos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipo_equipamento.soft_delete
      redirect_to i_tipos_equipamentos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipos_equipamentos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_i_tipo_equipamento
    @i_tipo_equipamento = ITipoEquipamento.find(params[:id])
  end

  def i_tipo_equipamento_params
    params.require(:i_tipo_equipamento).permit(ITipoEquipamento.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
