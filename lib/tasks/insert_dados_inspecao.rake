namespace :db do
  desc "Insere registros na tabela de i_tipos_itens_inspecoes"
  task inserir_registros_tipo_item_inspecao: :environment do
    ITipoItemInspecao.create(descricao: "REDE ELÉTRICA", id: 1)
    ITipoItemInspecao.create(descricao: "REDE DE ÁGUA FRIA", id: 2)
    ITipoItemInspecao.create(descricao: "REDE DE ESGOTO", id: 3)
    ITipoItemInspecao.create(descricao: "REDE DE DRENAGEM", id: 4)
    ITipoItemInspecao.create(descricao: "ESQUADRIAS", id: 5)
    ITipoItemInspecao.create(descricao: "COBERTURA", id: 6)
    ITipoItemInspecao.create(descricao: "COMBATE A INCÊNDIO E PÂNICO", id: 7)
    ITipoItemInspecao.create(descricao: "CLIMATIZAÇÃO", id: 8)
    ITipoItemInspecao.create(descricao: "PISOS E REVESTIMENTOS", id: 9)
    ITipoItemInspecao.create(descricao: "ÁREAS NÃO PAVIMENTADAS", id: 10)
    ITipoItemInspecao.create(descricao: "PINTURA", id: 11)
    puts "Registros inseridos com sucesso!"
  end
end

namespace :db do
  desc "Insere registros na tabela de i_atividades_inspecoes"
  task inserir_registros_atividade_inspecao: :environment do
    IAtividadeInspecao.create(descricao: "REALIZAR LIMPEZA", id: 1)
    IAtividadeInspecao.create(descricao: "VERIFICAR INTEGRIDADE", id: 2)
    IAtividadeInspecao.create(descricao: "VERIFICAR FUNCIONAMENTO", id: 3)
    IAtividadeInspecao.create(descricao: "VERIFICAR POSSÍVEIS ENTUPIMENTOS", id: 4)
    IAtividadeInspecao.create(descricao: "VERIFICAR A NECESSIDADE DE CORTE DE VEGETAÇÃO", id: 5)
    IAtividadeInspecao.create(descricao: "VERIFICAR LACRE E PRESSÃO", id: 6)
    IAtividadeInspecao.create(descricao: "LIMPEZA DO FILTRO DO AR", id: 7)
    puts "Registros inseridos com sucesso!"
  end
end

namespace :db do
  desc "Insere registros na tabela de i_itens_inspecoes"
  task inserir_registros_item_inspecao: :environment do
    IItemInspecao.create(descricao: "INTERRUPTORES", id: 1)
    IItemInspecao.create(descricao: "TOMADAS", id: 2)
    IItemInspecao.create(descricao: "QUADROS", id: 3)
    IItemInspecao.create(descricao: "LUMINÁRIAS E REFLETORES", id: 4)
    IItemInspecao.create(descricao: "ENTRADA DE ÁGUA", id: 5)
    IItemInspecao.create(descricao: "RESERVATÓRIO DE ÁGUA", id: 6)
    IItemInspecao.create(descricao: "TUBULAÇÕES", id: 7)
    IItemInspecao.create(descricao: "TORNEIRAS", id: 8)
    IItemInspecao.create(descricao: "CHUVEIROS", id: 9)
    IItemInspecao.create(descricao: "RALOS", id: 10)
    IItemInspecao.create(descricao: "PIAS E LAVATÓRIOS", id: 11)
    IItemInspecao.create(descricao: "VASOS SANITÁRIOS", id: 12)
    IItemInspecao.create(descricao: "CAIXAS DE INSPEÇÕES", id: 13)
    IItemInspecao.create(descricao: "CAIXAS DE GORDURA", id: 14)
    IItemInspecao.create(descricao: "TANQUE SÉPTICO", id: 15)
    IItemInspecao.create(descricao: "SUMIDOUROS", id: 16)
    IItemInspecao.create(descricao: "GRELHAS", id: 17)
    IItemInspecao.create(descricao: "PORTAS", id: 18)
    IItemInspecao.create(descricao: "JANELAS", id: 19)
    IItemInspecao.create(descricao: "PORTÕES", id: 20)
    IItemInspecao.create(descricao: "GRADIS", id: 21)
    IItemInspecao.create(descricao: "TELHAS", id: 22)
    IItemInspecao.create(descricao: "LAJES", id: 23)
    IItemInspecao.create(descricao: "CALHAS E RUFO", id: 24)
    IItemInspecao.create(descricao: "FORROS", id: 25)
    IItemInspecao.create(descricao: "EXTINTORES", id: 26)
    IItemInspecao.create(descricao: "LUMINÁRIAS DE EMERGÊNCIA", id: 27)
    IItemInspecao.create(descricao: "SINALIZAÇÕES DE EMERGÊNCIA", id: 28)
    IItemInspecao.create(descricao: "ALARMES", id: 29)
    IItemInspecao.create(descricao: "HIDRANTES", id: 30)
    IItemInspecao.create(descricao: "AR-CONDICIONADORES", id: 31)
    IItemInspecao.create(descricao: "DRENOS", id: 32)
    IItemInspecao.create(descricao: "EXAUSTORES", id: 33)
    IItemInspecao.create(descricao: "PISOS", id: 34)
    IItemInspecao.create(descricao: "CALÇADAS", id: 35)
    IItemInspecao.create(descricao: "REVESTIMENTOS", id: 36)
    IItemInspecao.create(descricao: "GRAMADO", id: 37)
    IItemInspecao.create(descricao: "PAREDES", id: 38)
    IItemInspecao.create(descricao: "FACHADAS", id: 39)
    puts "Registros inseridos com sucesso!"
  end
end


namespace :db do
  desc "Insere registros na tabela de i_tipos_inspecoes"
  task inserir_registros_tipo_inspecao: :environment do
    ITipoInspecao.create(descricao: "INSPEÇÃO SEMANAL", id: ITipoInspecao::SEMANAL)
    ITipoInspecao.create(descricao: "INSPEÇÃO MENSAL" , id: ITipoInspecao::MENSAL )
    ITipoInspecao.create(descricao: "INSPEÇÃO COINFRA", id: ITipoInspecao::COINFRA)
    puts "Registros inseridos com sucesso!"
  end
end

namespace :db do
  desc "Insere registros na tabela de i_status_inspecoes"
  task inserir_registros_status_inspecao: :environment do
    IStatusInspecao.create(descricao: "IRREGULAR", id: IStatusInspecao::IRREGULAR)
    IStatusInspecao.create(descricao: "OK", id: IStatusInspecao::OK)
    IStatusInspecao.create(descricao: "PÉSSIMO", id: 3)
    IStatusInspecao.create(descricao: "RUIM", id: 4)
    IStatusInspecao.create(descricao: "REGULAR", id: 5)
    IStatusInspecao.create(descricao: "BOM", id: 6)
    IStatusInspecao.create(descricao: "ÓTIMO", id: 7)
    puts "Registros inseridos com sucesso!"
  end
end

namespace :db do
  desc "Insere registros na tabela de i_relacoes_inspecoes"
  task inserir_registros_relacao_inspecao: :environment do
    IRelacaoInspecao.create(i_item_inspecao_id: 1, i_tipo_item_inspecao_id: 1, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 2, i_tipo_item_inspecao_id: 1, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 3, i_tipo_item_inspecao_id: 1, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 4, i_tipo_item_inspecao_id: 1, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 5, i_tipo_item_inspecao_id: 2, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 6, i_tipo_item_inspecao_id: 2, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 7, i_tipo_item_inspecao_id: 2, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 8, i_tipo_item_inspecao_id: 2, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 9, i_tipo_item_inspecao_id: 2, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 7, i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 10,i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 11,i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 12,i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 13,i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 14,i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 15,i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 16,i_tipo_item_inspecao_id: 3, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 7, i_tipo_item_inspecao_id: 4, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 10,i_tipo_item_inspecao_id: 4, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 13,i_tipo_item_inspecao_id: 4, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 17,i_tipo_item_inspecao_id: 4, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 18,i_tipo_item_inspecao_id: 5, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 19,i_tipo_item_inspecao_id: 5, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 20,i_tipo_item_inspecao_id: 5, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 21,i_tipo_item_inspecao_id: 5, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 22,i_tipo_item_inspecao_id: 6, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 23,i_tipo_item_inspecao_id: 6, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 24,i_tipo_item_inspecao_id: 6, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 25,i_tipo_item_inspecao_id: 6, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 26,i_tipo_item_inspecao_id: 7, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 27,i_tipo_item_inspecao_id: 7, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 28,i_tipo_item_inspecao_id: 7, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 29,i_tipo_item_inspecao_id: 7, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 30,i_tipo_item_inspecao_id: 7, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 31,i_tipo_item_inspecao_id: 8, i_tipo_inspecao_id: ITipoInspecao::SEMANAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 32,i_tipo_item_inspecao_id: 8, i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 33,i_tipo_item_inspecao_id: 8, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 34,i_tipo_item_inspecao_id: 9, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 35,i_tipo_item_inspecao_id: 9, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 36,i_tipo_item_inspecao_id: 9, i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 37,i_tipo_item_inspecao_id: 10,i_tipo_inspecao_id: ITipoInspecao::MENSAL)
    IRelacaoInspecao.create(i_item_inspecao_id: 34,i_tipo_item_inspecao_id: 11,i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 25,i_tipo_item_inspecao_id: 11,i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 38,i_tipo_item_inspecao_id: 11,i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    IRelacaoInspecao.create(i_item_inspecao_id: 39,i_tipo_item_inspecao_id: 11,i_tipo_inspecao_id: ITipoInspecao::COINFRA)
    puts "Registros inseridos com sucesso!"
  end
end
