class IPrediosController < ApplicationController
  include Validates
  before_action :verifica_tipo_usuario, only: %i[create destroy]
  before_action :set_i_predio, only: %i[ edit update destroy ]
  before_action :set_i_tipos_predios, only: %i[ new create edit update ]

  def index
    @consulta_ransack = usuario_seduc ?
      "codigo_inep_or_nome_predio_or_g_cre_descricao_or_i_tipo_predio_descricao_or_g_localidade_descricao_i_cont" :
      "nome_predio_or_i_tipo_predio_descricao_or_g_localidade_descricao_i_cont"
    @q = IPredio.filtro_por_usuario(current_user).ransack(params[:q])
    @pagy, @i_predios = pagy(@q.result)
  end

  def new
    @i_predio = IPredio.new
  end

  def edit
  end

  def create
    @i_predio = IPredio.new(i_predio_params.merge(g_secretaria_id: current_user.g_secretaria_id))
    if @i_predio.save
      redirect_to i_predios_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_predio.update(i_predio_params.merge(g_secretaria_id: current_user.g_secretaria_id))
      redirect_to i_predios_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_predio.soft_delete
      redirect_to i_predios_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_predios_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  def relatorios
    params.permit![:format]
    @q = IPredio.filtro_por_usuario(current_user)
      .includes(:i_tipo_predio, :g_localidade, :i_predio_mantenedor_proprietario,
                :i_tipologia_escola, :i_predio_tipo_localizacao_diferenciada,
                :i_predio_situacao, g_cre: [g_municipio: :g_estado]).ransack(params[:q])
    @i_predios = @q.result.order(:nome_predio)
    @escola = params[:q][:i_tipo_predio_id_eq] == "3"

    if @i_predios.blank?
      redirect_to request.referer, alert: "Não existem registros com os dados informados."
    else
      respond_to do |format|
        format.html do
          render layout: "predios", template: "relatorios/predios"
        end

        format.xlsx do
          @i_predios = @q.result.order(:nome_predio)
          response.headers["Content-Disposition"] = 'attachment; filename="Predios.xlsx"'
          render "relatorios/predios"
        end
      end
    end
  end

  private

  def set_i_tipos_predios
    @i_tipos_predios = ITipoPredio.where(g_secretaria_id: current_user.g_secretaria_id)
  end

  def set_i_predio
    @i_predio = IPredio.find(params[:id])
    if @i_predio.g_secretaria_id != current_user.g_secretaria_id
      redirect_to i_predios_path, alert: "Seu perfil não possui o acesso necessário."
    end
  end

  def i_predio_params
    params.require(:i_predio).permit(IPredio.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end

  def verifica_tipo_usuario
    if current_user.present?
      if current_user.g_tipo_usuario_id == User::CRE || current_user.g_tipo_usuario_id == User::ESCOLA
        redirect_back(fallback_location: root_path, alert: "Usuário não possui permissão para criar ou excluir escolas!")
      end
    end
  end
end
