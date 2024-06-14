class CustomDeviseMailer < Devise::Mailer
  # dá acesso aos helpers de aplicação que você possa querer usar
  helper :application 

  # garante que as URL helpers do Devise estejam disponíveis
  include Devise::Controllers::UrlHelpers 

  # para que o Devise use seus próprios templates
  default template_path: 'devise/mailer' 

  # Sobrescrever métodos de e-mail conforme necessário
  # Você pode adicionar opções adicionais ao opts conforme necessário, por exemplo:
  # opts[:subject] = "Assunto personalizado para e-mail de recuperação de senha"
  # opts[:reply_to] = "endereço@de.email" endereço utilizado pela resposta do usuário.

  # Exemplo: Método para e-mails de recuperação de senha
  def reset_password_instructions(record, token, opts={})
    opts[:Subject] = "Recuperação de senha SGIS"
    # Customizações vão aqui, se necessário
    super
  end

  # Exemplo: Método para e-mails de confirmação de conta
  def confirmation_instructions(record, token, opts={})
    super
  end

  # Exemplo: Método para e-mails de desbloqueio de conta
  def unlock_instructions(record, token, opts={})
    super
  end
end
