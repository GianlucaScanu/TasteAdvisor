class OmniUsers::OmniauthCallbacksController < ApplicationController

  def google_oauth2
    
    #distinguo cosa fare in base al chiamante
    @calling_path = session[:calling_path]

    if @calling_path == "/reviewers/sign_in" || @calling_path == "/reviewers/sign_up"
        reviewer = Reviewer.from_google(auth)
        if reviewer.present?
            sign_out_all_scopes #NB: flusha cose come le variabili di sessione (vengono perse)
            flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
            #flash[:notice] = @calling_path
            sign_in_and_redirect reviewer, event: :authentication
        else
            flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
            redirect_to new_reviewer_session_path
        end
    elsif @calling_path == "/restaurants/sign_in" || @calling_path == "/restaurants/sign_up"
        restaurant = Restaurant.from_google(auth)
        if restaurant.present?
            sign_out_all_scopes
            flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
            sign_in_and_redirect restaurant, event: :authentication
        else
            flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
            redirect_to new_restaurant_session_path
        end
    end
  end

  def auth
    #risposta auth google, contiene dei campi utili
    #https://github.com/zquestz/omniauth-google-oauth2
    @auth ||= request.env['omniauth.auth']
  end

  private
    # Only allow a list of trusted parameters through.
    def omni_user_params
      params.require(:omni_user).permit(:calling_path)
    end

 end
 
