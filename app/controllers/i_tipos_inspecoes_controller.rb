class ITiposInspecoesController < ApplicationController
  include Validates
  before_action :set_i_tipo_inspecao, only: %i[ show edit update destroy ]

  def index
    @q = ITipoInspecao.ransack(params[:q])
    @pagy, @i_tipos_inspecoes = pagy(@q.result)
  end

  def new
    @i_tipo_inspecao = ITipoInspecao.new
  end

  def edit
  end

  def create
    @i_tipo_inspecao = ITipoInspecao.new(i_tipo_inspecao_params)

    if @i_tipo_inspecao.save
      redirect_to i_tipos_inspecoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipo_inspecao.update(i_tipo_inspecao_params)
      redirect_to i_tipos_inspecoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipo_inspecao.soft_delete
      redirect_to i_tipos_inspecoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipos_inspecoes_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_tipo_inspecao
    @i_tipo_inspecao = ITipoInspecao.find(params[:id])
  end

  def i_tipo_inspecao_params
    params.require(:i_tipo_inspecao).permit(ITipoInspecao.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
