class MailService
  def send_new_password layout, subject, recipient, temp_password
    MainMailer.send_password_email(layout, subject, recipient, temp_password).deliver_now
  end
end
