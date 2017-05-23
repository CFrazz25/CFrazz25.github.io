require 'mail'
class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # mail = Mail.new do
      #   from    'chris.onep@gmail.com'
      #   to      'cfrazzin@indiana.edu'
      #   subject 'This is a test email'
      #   body    'sup'
      # end
      #mail.deliver!

#       Mail.defaults do
#   delivery_method :smtp, address: "localhost", port: 1025
# end
      UserMailer.welcome_email(@contact).deliver_now
      redirect_to root_path
    else
      @errors = @contact.errors.full_messages
      render :index
    end
  end

  

  private
  def contact_params
    params.require(:contact).permit(:name, :number, :email)
  end
end