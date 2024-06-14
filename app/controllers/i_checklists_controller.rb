class IChecklistsController < ApplicationController
  include Validates
  before_action :set_i_checklist, only: %i[ show edit update destroy delete_attachment ]

  def index
    @q = IChecklist.includes(i_predio: :g_cre).ransack(params[:q])
    @pagy, @i_checklists = pagy(@q.result.order("i_predios.nome_predio"))
  end

  def new
    @i_checklist = IChecklist.new
  end

  def edit
  end

  def create
    @i_checklist = IChecklist.new(i_checklist_params)

    if @i_checklist.save
      redirect_to i_checklists_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @i_checklist.update(i_checklist_params)
      redirect_to i_checklists_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @i_checklist.soft_delete
      redirect_to i_checklists_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_checklists_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  def destroy_file
    attachment = ActiveStorage::Attachment.find_by(blob_id: params[:file_id])
    if attachment.present?
      begin
        attachment.purge
        render json: { message: 'Registro deletado com sucesso!', status: 200 }
      rescue => e
        render json: { message: 'Erro ao deletar o registro.', details: e.message, status: 405 }
      end
    else
      render json: { message: 'Arquivo não encontrado.', status: 404 }
    end
  end

  def relatorios
    params.permit![:format]
    @q = IChecklist.includes(i_predio: :g_cre).ransack(params[:q])
    @i_checklists = @q.result.order("i_predios.nome_predio")

    if @i_checklists.blank?
      redirect_to request.referer, alert: "Não existem registros com os dados informados."
    else
      respond_to do |format|
        format.html do
          render layout: "acordos", template: "relatorios/checklists"
        end

        format.xlsx do
          @i_checklists = @q.result.order("i_predios.nome_predio")
          response.headers["Content-Disposition"] = 'attachment; filename="Checklist.xlsx"'
          render "relatorios/checklists"
        end
      end
    end
  end

  private

  def set_i_checklist
    @i_checklist = IChecklist.find(params[:id])
  end

  def i_checklist_params
    params.require(:i_checklist).permit(
      :bic_ficha_cadastral_file, 
      :croqui_file, 
      :memorial_descritivo_file, 
      :certidao_narrativa_informativa_file, 
      :certidao_valor_venal_file,
      :mapa_localizacao_file,
      :licenca_operacao_provisoria_file,
      :termo_doacao_file,
      :lei_decreto_doacao_file,
      :termo_cessao_uso_anuencia_file,
      :certidao_inteiro_teor_file,
      :projeto_arquitetonico_file,
      :alvara_funcionamento_file,
      :alvara_sanitario_file,
      :projeto_combate_incendio_file,
      :spda_file,
      :projeto_acessibilidade_file,
      :laudo_tecnico_avaliacao_imoveis_file,
      :relatorio_fotografico_ambiental_file,
      :acordo_cooperacao_tecnica_file,
      :termo_destinacao_responsabilidade_file,
      IChecklist.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
