class MainMailer < ApplicationMailer
  def custom_email(email, subject, recipient, body)
    @body = body
    mail(to: recipient, subject: subject) do |format|
      format.html { render html: body.html_safe }
    end
  end

  def send_custom_email(subject, recipient, body)
    @body = body
    mail(to: recipient, subject: subject)
  end

  def send_new_password(layout, subject, recipient, user_values)
    @body = user_values
    mail(to: recipient, subject: subject, layout: layout)
  end
end
