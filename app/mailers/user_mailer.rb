class UserMailer < ApplicationMailer
  default from: "notifications@merrymaker.com"

  def welcome_email 
    @user = params[:user]
    @url = 'localhost:8080/login/'
    mail(to: @user.email, subject: "Welcome to Merrymaker")
  end
end
