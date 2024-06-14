module IOrcamentosHelper
  def edit_url(id)
    return edit_i_acordo_i_medicao_i_orcamento_path(@i_acordo, @i_medicao, id) if @i_medicao
    return edit_i_acordo_i_orcamento_path(@i_acordo, id) if @i_acordo
  end

  def destroy_url(id)
    return i_acordo_i_medicao_i_orcamento_path(@i_acordo, @i_medicao, id) if @i_medicao
    return i_acordo_i_orcamento_path(@i_acordo, id) if @i_acordo
  end

  def update_url(id)
    return i_acordo_i_medicao_i_orcamento_path(@i_acordo, @i_medicao, id) if @i_medicao
    return i_acordo_i_orcamento_path(@i_acordo, id) if @i_acordo
  end
end
