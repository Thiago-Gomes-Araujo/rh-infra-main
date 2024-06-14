class Api::V1::RelatorioIcmsInformesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # Params do token
    token = params[:token]
    
    # Se estiver vazio retorna mensagem de erro.
    if token.blank?
      render json: {data: "Token invalido", status: 400 }
    else
      if token == ENV['TOKEN_SEFIN']
        @relatorio = GMunicipio.relatorio_idero
        render json: @relatorio
      else
        render json: {data: "Você não tem permissão", status: 401}
      end
    end
  end  
end
