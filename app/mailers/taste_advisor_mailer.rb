class TasteAdvisorMailer < ApplicationMailer
    
    default from: 'lassi.pepascamu@gmail.com'

    def welcome_email
        @user = params[:user]
        mail(
            to: @user.email,
            subject: 'Benvenuto su TasteAdvisor'
        )
    end
end
