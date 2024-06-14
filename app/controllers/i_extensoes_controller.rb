class IExtensoesController < ApplicationController
  include Validates
  before_action :set_i_extensao, only: %i[ edit update destroy ]

  def index
    @q = IExtensao.query_index.order(:descricao).ransack(params[:q])
    @pagy, @i_extensoes = pagy(@q.result)
  end

  def new
    @i_extensao = IExtensao.new
  end

  def edit
  end

  def create
    @i_extensao = IExtensao.new(i_extensao_params)

    if @i_extensao.save
      redirect_to i_extensoes_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_extensao.update(i_extensao_params)
      redirect_to i_extensoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_extensao.soft_delete
      redirect_to i_extensoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_extensoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  def relatorios
    params.permit![:format]
    @q = IExtensao.query_index.ransack(params[:q])
    @i_extensoes = @q.result.order(:descricao)

    if @i_extensoes.blank?
      redirect_to request.referer, alert: "Não existem registros com os dados informados."
    else
      respond_to do |format|
        format.html do
          render layout: "acordos", template: "relatorios/extensoes"
        end

        format.xlsx do
          @i_extensoes = @q.result.order(:data_fim)
          response.headers["Content-Disposition"] = 'attachment; filename="Acordo.xlsx"'
          render "relatorios/extensoes"
        end
      end
    end
  end

  private

  def set_i_extensao
    @i_extensao = IExtensao.find(params[:id])
  end

  def i_extensao_params
    params.require(:i_extensao).permit(IExtensao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
