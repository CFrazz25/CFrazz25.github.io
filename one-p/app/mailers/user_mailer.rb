class UserMailer < ApplicationMailer
  default from: 'chris.onep@gmail.com'
 
  def welcome_email(contact)
    @contact = contact
    @url  = 'shoponepapparel.com'
    mail(to: @contact.email, subject: 'Welcome to My Awesome Site')
  end
end
