# lib/tasks/update_correcoes_monetarias.rake
namespace :correcoes_monetarias do
  desc "Atualiza os cálculos para todas as correções monetárias existentes"
  task recalcular: :environment do
    ICorrecaoMonetaria.find_each do |correcao|
      correcao.correcao_monetaria_calculos # Executa os cálculos
      correcao.save(validate: false) # Salva o registro sem passar pelas validações
    end

    puts "Todas as correções monetárias foram atualizadas."
  end
end
