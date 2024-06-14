class EEscolasController < ApplicationController
  include Validates
  def index
    @q = EEscola.ransack(params[:q])
    @pagy, @e_escolas = pagy(@q.result)
  end  
end
