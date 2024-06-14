class IFormasIngressoController < ApplicationController
  include Validates
  before_action :set_i_forma_ingresso, only: %i[ show edit update destroy ]

  def index
    @q = IFormaIngresso.ransack(params[:q])
    @pagy, @i_formas_ingresso = pagy(@q.result)
  end

  def new
    @i_forma_ingresso = IFormaIngresso.new
  end

  def edit
  end

  def create
    @i_forma_ingresso = IFormaIngresso.new(i_forma_ingresso_params)

    if @i_forma_ingresso.save
      redirect_to i_formas_ingresso_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_forma_ingresso.update(i_forma_ingresso_params)
      redirect_to i_formas_ingresso_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_forma_ingresso.soft_delete
      redirect_to i_formas_ingresso_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_formas_ingresso_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_i_forma_ingresso
    @i_forma_ingresso = IFormaIngresso.find(params[:id])
  end

  def i_forma_ingresso_params
    params.require(:i_forma_ingresso).permit(IFormaIngresso.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
