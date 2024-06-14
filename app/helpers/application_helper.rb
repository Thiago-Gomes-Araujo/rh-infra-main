module ApplicationHelper
  include Pagy::Frontend

  def btn_submit(form)
    text = form.object.new_record? ? "Incluir" : "Atualizar"
    icon_class = "ph-paper-plane-tilt ms-1"

    button_tag(type: "submit", class: "btn btn-primary") do
      safe_join([text, content_tag(:i, "", class: icon_class)])
    end
  end

  def formatar_boolean_xlsx(value)
    value ? "Sim" : "Não"
  end

  def formatar_data(data)
    data.strftime("%d/%m/%Y") if data
  end

  def formatar_percentual(value)
    value.present? ? number_to_percentage(value, precision: 2) : "0%"
  end

  def formatar_percentual_decimal(value)
    value.present? ? number_to_percentage(value, precision: 2) : "0,00%"
  end

  def formatar_real(value)
    value.present? ? number_to_currency(value, unit: "", separator: ",", delimiter: ".") : "0,00"
  end

  def formatar_precisao_area(value)
    value.present? ? number_to_currency(value, unit: "", separator: ",", delimiter: ".", precision: 4) : "0,0000"
  end
  

  def formatar_cpf(cpf)
    cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4') if cpf
  end

  def formatar_cep(cep)
    cep.gsub(/(\d{5})(\d{3})/, '\1-\2') if cep
  end

  def formatar_boolean(value)
    if value
      '<span class="badge bg-success bg-opacity-20 text-success ms-2">Sim</span>'.html_safe
    else
      '<span class="badge bg-danger bg-opacity-20 text-danger ms-2">Não</span>'.html_safe
    end
  end

  def usuario_seduc
    current_user.g_secretaria_id == 1
  end

  def formatar_processo_sei(processo_sei)
    processo_sei.gsub(/(\d{4})(\d{6})(\d{4})(\d{2})/, '\1.\2/\3-\4') if processo_sei
  end

  def link_edit_equipamento(i_predio, i_bloco, i_ambiente_predial, i_equipamento)
    case i_equipamento&.i_familia_equipamento&.descricao
    when "MÓVEL"
      link_to "<i class='ph-pen me-2'></i> Editar".html_safe,
              edit_i_predio_i_bloco_i_ambiente_predial_i_equipamento_movel_path(
                i_predio, i_bloco, i_ambiente_predial, i_equipamento
              ), class: "dropdown-item"
    when "VEÍCULO"
      link_to "<i class='ph-pen me-2'></i> Editar".html_safe,
              edit_i_predio_i_bloco_i_ambiente_predial_i_equipamento_veiculo_path(
                i_predio, i_bloco, i_ambiente_predial, i_equipamento
              ), class: "dropdown-item"
    when "SOFTWARE"
      link_to "<i class='ph-pen me-2'></i> Editar".html_safe,
              edit_i_predio_i_bloco_i_ambiente_predial_i_equipamento_software_path(
                i_predio, i_bloco, i_ambiente_predial, i_equipamento
              ), class: "dropdown-item"
    end
  end
end
