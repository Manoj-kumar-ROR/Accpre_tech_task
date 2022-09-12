class UserMailer < ApplicationMailer
  def send_csv(email, csv)
    attachments[filename] = { mime_type: 'text/csv', content: csv }
    mail(to: email, subject: 'User List', body: 'Please find the attach document.')
  end

  def filename
    random_string
  end

  protected

  def random_string
    @string ||= "#{SecureRandom.urlsafe_base64}.csv"
  end
end
