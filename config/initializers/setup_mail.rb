ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => 'vishalattcs',
  :password             => 'mypasstcs',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}