# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'marsanraphael@gmail.com'
  layout 'mailer'
end
