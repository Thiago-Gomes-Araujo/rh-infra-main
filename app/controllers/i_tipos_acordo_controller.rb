class ITiposAcordoController < ApplicationController
  include Validates
  before_action :set_i_tipo_acordo, only: %i[ show edit update destroy ]

  def index
    @q = ITipoAcordo.ransack(params[:q])
    @pagy, @i_tipos_acordo = pagy(@q.result)
  end

  def new
    @i_tipo_acordo = ITipoAcordo.new
  end

  def edit
  end

  def create
    @i_tipo_acordo = ITipoAcordo.new(i_tipo_acordo_params)

    if @i_tipo_acordo.save
      redirect_to i_tipos_acordo_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_tipo_acordo.update(i_tipo_acordo_params)
      redirect_to i_tipos_acordo_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_tipo_acordo.soft_delete
      redirect_to i_tipos_acordo_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_tipos_acordo_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_tipo_acordo
    @i_tipo_acordo = ITipoAcordo.find(params[:id])
  end

  def i_tipo_acordo_params
    params.require(:i_tipo_acordo).permit(ITipoAcordo.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
