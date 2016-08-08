class UserMailer < ApplicationMailer
  default from: "iza.abao@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
        :to => 'iza.abao@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @user = user
    mail(:from => 'iza.abao@gmail.com',
        :to => @user.email,
        :subject => "Welcome to IzaBike!")
  end

 def order_placed(user, product)
  @user = user
  @product = product
    mail( :to => @user.email,
          :subject => "Your Order from IzaBike.")
  end
end
