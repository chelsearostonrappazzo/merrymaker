class UserMailer < ApplicationMailer
  default from: "notifications@merrymaker.com"

  def welcome_email 
    @user = params[:user]
    @url = 'merrymaker.netlify.app/login'
    mail(to: @user.email, subject: "Welcome to Merrymaker")
  end
end
