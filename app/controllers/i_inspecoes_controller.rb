class IInspecoesController < ApplicationController
  include Validates
  before_action :set_i_inspecao, only: %i[ show edit update destroy ]

  def index
    params.permit![:format]
    @q = IInspecao.includes(:i_predio).ransack(params[:q])
    respond_to do |format|
      format.html { @pagy, @i_inspecoes = pagy(@q.result(distinct: true).order(:descricao)) }
      format.xlsx do
        @i_inspecoes = @q.result.order("i_inspecoes.descricao")
        headers["Content-Disposition"] = 'attachment; filename="Inspeções"'
      end
    end
  end

  def new
    @i_inspecao = IInspecao.new
    @i_inspecao.i_topicos_inspecoes.build
  end

  #são os 3 forms de inspeções (mensal, semanal e coinfra)

  def new_coinfra
    @i_inspecao = IInspecao.new
    @i_inspecao.i_topicos_inspecoes.build
    @i_relacao_inspecao = IRelacaoInspecao.all
    @i_status_inspecao = IStatusInspecao.where.not(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
    render :new_coinfra
  end

  def new_semanal
    @i_inspecao = IInspecao.new
    @i_inspecao.i_topicos_inspecoes.build
    @i_relacao_inspecao = IRelacaoInspecao.where(i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    @i_status_inspecao = IStatusInspecao.where(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
    render :new_semanal
  end
  
  def new_mensal
    @i_inspecao = IInspecao.new
    @i_inspecao.i_topicos_inspecoes.build
    @i_relacao_inspecao = IRelacaoInspecao.where(i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    @i_status_inspecao = IStatusInspecao.where(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
    render :new_mensal
  end

  #Para renderizar o valor do select selecionado no collection em edit.  

  def edit
    if @i_inspecao.i_tipo_inspecao_id == ITipoInspecao::SEMANAL || @i_inspecao.i_tipo_inspecao_id == ITipoInspecao::MENSAL
      # Filtra as opções disponíveis para o tipo de inspeção específico
      @i_relacao_inspecao = IRelacaoInspecao.where(i_tipo_inspecao_id: @i_inspecao.i_tipo_inspecao_id)
      # Mantém as opções destacadas que estão associadas ao i_inspecao atual
      @selected_relacoes = @i_inspecao.i_topicos_inspecoes.pluck(:i_relacao_inspecao_id)
      @i_status_inspecao = IStatusInspecao.where(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
      @layout = @i_inspecao.i_tipo_inspecao_id == ITipoInspecao::SEMANAL ? "new_semanal" : "new_mensal"
    else
      @i_relacao_inspecao = IRelacaoInspecao.all
      @selected_relacoes = @i_inspecao.i_topicos_inspecoes.pluck(:i_relacao_inspecao_id)
      @i_status_inspecao = IStatusInspecao.where.not(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
      @layout = "new_coinfra"
    end
  end
  
  

  def create
    @i_inspecao = IInspecao.new(i_inspecao_params)

    if @i_inspecao.save
      redirect_to i_inspecoes_path, notice: "Registro cadastrado com sucesso!"
    else

      if is_build?
      @i_inspecao.i_topicos_inspecoes.build 
      end

      # Pega o valor do método
      object = render_form(@i_inspecao.i_tipo_inspecao_id)

      # recebe a consulta
      @i_relacao_inspecao = object[:relacao_record]

      # consulta para status dinâmico
      @i_status_inspecao = object[:status_record]

      # renderiza o layout
      render object[:layout]
    end
  end

  def update
    if @i_inspecao.update(i_inspecao_params)
      redirect_to i_inspecoes_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
       # Pega o valor do método
       object = render_form(@i_inspecao.i_tipo_inspecao_id)

       # recebe a consulta
       @i_relacao_inspecao = object[:relacao_record]
       
       # consulta para status dinâmico
       @i_status_inspecao = object[:status_record]
 
       # renderiza o layout
       @layout = object[:layout].to_s

      render :edit, status: :unprocessable_entity
    end
  end

  #O destroy pode excluir o elemento pai e os filhos que estão vinculados a ele

  def destroy
    @i_topicos_inspecoes = ITopicoInspecao.where(i_inspecao_id: @i_inspecao)
    @i_topicos_inspecoes.each { |topico| topico.soft_delete }
    if @i_inspecao.soft_delete
      redirect_to i_inspecoes_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to i_inspecoes_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  def relatorio_inspecoes
    if params[:tipo_relatorio] == 'unico'
      if params[:q][:i_tipo_inspecao_id_eq].blank? || params[:q][:i_predio_id_eq].blank? || params[:q][:data_inspecao_eq].blank?
        redirect_to request.referer, alert: "Todos os campos são obrigatórios"
      else
        @q = IInspecao.includes(:i_predio, :i_tipo_inspecao).ransack(params[:q])
        @i_relatorio_inspecao = @q.result.order(:data_inspecao)
        @data_inspecao = params[:q]["data_inspecao"]
        if @i_relatorio_inspecao.none?
          redirect_to request.referer, alert: "Não existem registros com os dados informados."
        else
          render layout: "inspecoes", template: "relatorios/inspecoes"
        end
      end
    elsif params[:tipo_relatorio] == 'geral'
      relatorio_inspecoes_geral
    else
      redirect_to request.referer, alert: "Tipo de relatório inválido"
    end
  end

  def relatorio_inspecoes_geral
    if params[:q][:i_tipo_inspecao_id_eq].blank?
      redirect_to request.referer, alert: "Tipo de inspeção é obrigatório"
    else
      @q = IInspecao.includes(:i_tipo_inspecao).ransack(params[:q])
      @i_relatorio_inspecao_geral = @q.result
      if @i_relatorio_inspecao_geral.none?
        redirect_to request.referer, alert: "Não existem registros com os dados informados."
      else
        render layout: "inspecoes", template: "relatorios/inspecoes_geral"
      end
    end
  end
  

  private

  def set_i_inspecao
    @i_inspecao = IInspecao.find(params[:id])
  end

  def i_inspecao_params
    params.require(:i_inspecao).permit(IInspecao.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym), i_topicos_inspecoes_attributes: [:id, :i_status_inspecao_id, :i_atividade_inspecao_id, :i_relacao_inspecao_id, :_destroy])
  end

  def render_form(type)
    case type
    when ITipoInspecao::SEMANAL
      {
        layout: :new_semanal,
        relacao_record: IRelacaoInspecao.where(i_tipo_inspecao_id: ITipoInspecao::SEMANAL),
        status_record: IStatusInspecao.where(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
      }
    when ITipoInspecao::MENSAL
      {
        layout: :new_mensal,
        relacao_record: IRelacaoInspecao.where(i_tipo_inspecao_id: ITipoInspecao::MENSAL),
        status_record: IStatusInspecao.where(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
      }
    else
      {
        layout: :new_coinfra,
        relacao_record: IRelacaoInspecao.all,
        status_record: IStatusInspecao.where.not(id: [IStatusInspecao::IRREGULAR, IStatusInspecao::OK])
      }
    end
  end

  def is_build?
    # Retorna false caso seja do tipo COINFRA
    return true if params["i_inspecao"]["i_tipo_inspecao_id"].to_i == ITipoInspecao::COINFRA && 
                    i_inspecao_params[:i_topicos_inspecoes_attributes]["0"]["i_status_inspecao_id"].blank? &&
                    i_inspecao_params[:i_topicos_inspecoes_attributes]["0"]["i_relacao_inspecao_id"].blank?

    return true if i_inspecao_params[:i_topicos_inspecoes_attributes]["0"]["i_atividade_inspecao_id"].blank? &&
                  i_inspecao_params[:i_topicos_inspecoes_attributes]["0"]["i_status_inspecao_id"].blank? &&
                  i_inspecao_params[:i_topicos_inspecoes_attributes]["0"]["i_relacao_inspecao_id"].blank?
  end
end
