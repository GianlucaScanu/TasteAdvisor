class ApplicationController < ActionController::Base

    #IMPORTANTE SERVONO QUESTE COSE ALTRIMENTI DEI CAMPI NON VENGONO SALVATI PER MOTIVI DI SICUREZZA
    #credits. https://gist.github.com/withoutwax/46a05861aa4750384df971b641170407
    
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :telephone_number, :username, :surname)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
        end

end
