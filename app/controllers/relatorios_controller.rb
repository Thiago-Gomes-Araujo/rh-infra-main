class RelatoriosController < ApplicationController
  include Validates
  skip_before_action :authenticate_user!, only: [:relatorio_icms]

  def correcoes_monetarias
    @g_secretaria = GSecretaria.find(current_user.g_secretaria_id)

    @q = IPredio.tc16(@g_secretaria).ransack(params[:q])

    @relatorio = @q.result

    @total_terrenos = @relatorio.sum("i_correcoes_monetarias.valor_terreno")
    @total_edificacao = @relatorio.sum("i_correcoes_monetarias.valor_edificacao")
    @total_total = @relatorio.sum("i_correcoes_monetarias.valor_contabil")
    @total_depreciacao_acumulada = @relatorio.sum("i_correcoes_monetarias.depreciacao_acumulada")
    @total_valor_liquido = @relatorio.sum("i_correcoes_monetarias.valor_contabil - i_correcoes_monetarias.depreciacao_acumulada")
    @total_benfeitoria = @relatorio.sum("i_correcoes_monetarias.benfeitoria")
    @total_obras_em_andamento = @relatorio.sum("i_correcoes_monetarias.obras_em_andamento")
    @total_instalações = @relatorio.sum("i_correcoes_monetarias.instalacoes")

    @localidades_para_selecao = GLocalidade.all.pluck(:descricao, :id)
    @cartorios_para_selecao = GCartorio.all.pluck(:descricao, :id)

    @pagy, @relatorio = pagy(@q.result, items: 7)
  end

  def tc16
    @g_secretaria = GSecretaria.find(current_user.g_secretaria_id)
    @relatorio = IPredio.tc16(@g_secretaria)

    @total_terrenos = @relatorio.sum("i_correcoes_monetarias.valor_terreno")
    @total_edificacao = @relatorio.sum("i_correcoes_monetarias.valor_edificacao")
    @total_total = @relatorio.sum("i_correcoes_monetarias.valor_contabil")
    @total_depreciacao_acumulada = @relatorio.sum("i_correcoes_monetarias.depreciacao_acumulada")
    @total_valor_liquido = @relatorio.sum("i_correcoes_monetarias.valor_contabil - i_correcoes_monetarias.depreciacao_acumulada")
    @total_benfeitoria = @relatorio.sum("i_correcoes_monetarias.benfeitoria")
    @total_obras_em_andamento = @relatorio.sum("i_correcoes_monetarias.obras_em_andamento")
    @total_instalações = @relatorio.sum("i_correcoes_monetarias.instalacoes")

    @localidades_para_selecao = GLocalidade.all.pluck(:descricao, :id)
    @cartorios_para_selecao = GCartorio.all.pluck(:descricao, :id)
    render layout: "relatorios"
  end

  def correcao_mensal
    @data_competencia = Date.strptime(params[:data_competencia], "%m-%Y").end_of_month
    @g_secretaria = GSecretaria.find(current_user.g_secretaria_id)
    @relatorio = IPredio.correcao_monetaria(@g_secretaria)

    @depreciacoes = ICorrecaoMonetaria.calcula_depreciacao_mensal(@g_secretaria, @data_competencia)

    depreciacao = @depreciacoes.inject(0) { |sum, hash| sum + hash[:correcao_monetaria] }.to_f

    @total_terrenos = @relatorio.sum("i_correcoes_monetarias.valor_terreno")
    @total_edificacao = @relatorio.sum("i_correcoes_monetarias.valor_edificacao")
    @total_total = @relatorio.sum("i_correcoes_monetarias.valor_contabil")
    @total_depreciacao_acumulada = depreciacao
    @total_valor_liquido = @relatorio.sum("i_correcoes_monetarias.valor_contabil") - depreciacao
    @total_benfeitoria = @relatorio.sum("i_correcoes_monetarias.benfeitoria")
    @total_obras_em_andamento = @relatorio.sum("i_correcoes_monetarias.obras_em_andamento")
    @total_instalações = @relatorio.sum("i_correcoes_monetarias.instalacoes")
    @total_mês = @relatorio.sum("i_correcoes_monetarias.depreciacao_mes")

    @localidades_para_selecao = GLocalidade.all.pluck(:descricao, :id)
    @cartorios_para_selecao = GCartorio.all.pluck(:descricao, :id)

    render layout: "relatorios_mensal"
  end

  def tc16_analitico
    @g_secretarias = GSecretaria.all
    @relatorio = IPredio.tc16_analitico.all

    @total_terrenos = @relatorio.sum("i_correcoes_monetarias.valor_terreno")
    @total_edificacao = @relatorio.sum("i_correcoes_monetarias.valor_edificacao")
    @total_total = @relatorio.sum("i_correcoes_monetarias.valor_contabil")
    @total_depreciacao_acumulada = @relatorio.sum("i_correcoes_monetarias.depreciacao_acumulada")
    @total_valor_liquido = @relatorio.sum("i_correcoes_monetarias.valor_contabil - i_correcoes_monetarias.depreciacao_acumulada")
    @total_benfeitoria = @relatorio.sum("i_correcoes_monetarias.benfeitoria")
    @total_obras_em_andamento = @relatorio.sum("i_correcoes_monetarias.obras_em_andamento")
    @total_instalações = @relatorio.sum("i_correcoes_monetarias.instalacoes")
    render layout: "relatorio_analitico"
  end

  def tc16_sintetico
    @relatorio_secretarias = IPredio.tc16_sintetico.group("g_secretarias.descricao", "g_secretarias.sigla")
    @relatorio = IPredio.tc16_sintetico

    @total_terrenos = @relatorio.sum("i_correcoes_monetarias.valor_terreno")
    @total_edificacao = @relatorio.sum("i_correcoes_monetarias.valor_edificacao")
    @total_total = @relatorio.sum("i_correcoes_monetarias.valor_contabil")
    @total_depreciacao_acumulada = @relatorio.sum("i_correcoes_monetarias.depreciacao_acumulada")
    @total_valor_liquido = @relatorio.sum("i_correcoes_monetarias.valor_contabil - i_correcoes_monetarias.depreciacao_acumulada")
    @total_benfeitoria = @relatorio.sum("i_correcoes_monetarias.benfeitoria")
    @total_obras_em_andamento = @relatorio.sum("i_correcoes_monetarias.obras_em_andamento")
    @total_instalações = @relatorio.sum("i_correcoes_monetarias.instalacoes")

    render layout: "relatorios_sintetico"
  end
  
  def relatorio_icms
    @relatorio = GMunicipio.relatorio_idero
    render layout: "relatorio_icms"
  end
end
