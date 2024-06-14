class GListasOrganizacionaisController < ApplicationController
  include Validates
  before_action :set_g_lista_organizacional, only: %i[ show edit update destroy ]

  def index
    @q = GListaOrganizacional.ransack(params[:q])
    @pagy, @g_listas_organizacionais = pagy(@q.result)
  end

  def new
    @g_lista_organizacional = GListaOrganizacional.new
  end

  def edit
  end

  def create
    @g_lista_organizacional = GListaOrganizacional.new(g_lista_organizacional_params)

    if @g_lista_organizacional.save
      redirect_to g_listas_organizacionais_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_lista_organizacional.update(g_lista_organizacional_params)
      redirect_to g_listas_organizacionais_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_lista_organizacional.soft_delete
      redirect_to g_listas_organizacionais_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_listas_organizacionais_url, alert: "Ainda existem dependentes desse registro."
    end   
  end

  private

  def set_g_lista_organizacional
    @g_lista_organizacional = GListaOrganizacional.find(params[:id])
  end

  def g_lista_organizacional_params
    params.require(:g_lista_organizacional).permit(GListaOrganizacional.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }.map(&:to_sym))    
  end
end
