class GTiposCursosController < ApplicationController
  include Validates
  before_action :set_g_tipo_curso, only: %i[ edit update destroy ]

  def index
    @q = GTipoCurso.ransack(params[:q])
    @pagy, @g_tipos_cursos = pagy(@q.result(distinct: true).order(:descricao))
  end

  def new
    @g_tipo_curso = GTipoCurso.new
  end

  def edit
  end

  def create
    @g_tipo_curso = GTipoCurso.new(g_tipo_curso_params)

    if @g_tipo_curso.save
      redirect_to g_tipos_cursos_path, notice: "Registro cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @g_tipo_curso.update(g_tipo_curso_params)
      redirect_to g_tipos_cursos_path, notice: "Registro atualizado com sucesso!", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @g_tipo_curso.soft_delete
      redirect_to g_tipos_cursos_url, notice: "Registro foi marcado como excluído."
    else
      redirect_to g_tipos_cursos_url, alert: "Ainda existem dependentes desse registro."
    end
  end

  private

  def set_g_tipo_curso
    @g_tipo_curso = GTipoCurso.find(params[:id])
  end

  def g_tipo_curso_params
    params.require(:g_tipo_curso).permit(GTipoCurso.column_names.reject { |col| ["deleted_at", "created_by", "updated_by"].include?(col) }.map(&:to_sym))
  end
end
