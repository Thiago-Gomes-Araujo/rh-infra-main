class GCursosIdiomasController < ApplicationController
  include Validates
  before_action :set_g_curso_idioma, only: %i[ show edit update destroy ]
  before_action :set_g_pessoa

  def index
    @q = GCursoIdioma.ransack(params[:q])
    @pagy, @g_cursos_idiomas = pagy(@q.result)
  end

  def new
    @g_curso_idioma = GCursoIdioma.new
  end

  def edit
  end

  def create
    @g_curso_idioma = GCursoIdioma.new(g_curso_idioma_params.merge(g_pessoa_id: @g_pessoa.id))
    if @g_curso_idioma.save
      redirect_to g_pessoa_g_cursos_idiomas_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_curso_idioma.update(g_curso_idioma_params)
      redirect_to g_pessoa_g_cursos_idiomas_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_curso_idioma.soft_delete
      redirect_to g_pessoa_g_cursos_idiomas_path, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_pessoa_g_cursos_idiomas_path, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_curso_idioma
    @g_curso_idioma = GCursoIdioma.find(params[:id])
  end

  def set_g_pessoa
    @g_pessoa = GPessoa.find(params[:g_pessoa_id])
  end

  def g_curso_idioma_params
    params.require(:g_curso_idioma).permit(GCursoIdioma.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
