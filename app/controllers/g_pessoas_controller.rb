class GPessoasController < ApplicationController
  include Validates
  before_action :set_g_pessoa, only: %i[ edit update destroy ]
  before_action :get_g_estados, only: %i[ new create edit update ]

  def index
    @q = GPessoa.ransack(params[:q])
    @pagy, @g_pessoas = pagy(@q.result)
  end

  def new
    @g_pessoa = GPessoa.new
  end

  def edit
  end

  def create
    @g_pessoa = GPessoa.new(g_pessoa_params)

    if @g_pessoa.save
      redirect_to g_pessoas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_pessoa.update(g_pessoa_params)
      redirect_to g_pessoas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_pessoa.soft_delete
      redirect_to g_pessoas_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_pessoas_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_pessoa
    @g_pessoa = GPessoa.find(params[:id])
  end

  def g_pessoa_params
    params.require(:g_pessoa).permit(GPessoa.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end

  def get_g_estados
    @g_estados = GEstado.all
  end
end
