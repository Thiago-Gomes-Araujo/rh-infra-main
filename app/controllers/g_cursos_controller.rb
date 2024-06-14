class GCursosController < ApplicationController
  include Validates
  before_action :set_g_curso, only: %i[ edit update destroy ]

  def index
    @q = GCurso.ransack(params[:q])
    @pagy, @g_cursos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_curso = GCurso.new
  end

  def edit
  end

  def create
    @g_curso = GCurso.new(g_curso_params)

    if @g_curso.save
      redirect_to g_cursos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_curso.update(g_curso_params)
      redirect_to g_cursos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_curso.soft_delete
      redirect_to g_cursos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_cursos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_curso
    @g_curso = GCurso.find(params[:id])
  end

  def g_curso_params
    params.require(:g_curso).permit(GCurso.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
