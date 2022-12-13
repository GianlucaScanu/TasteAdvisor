# frozen_string_literal: true

class Restaurant::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def google_oauth2
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

  def auth
    #risposta auth google, contiene dei campi utili
    #https://github.com/zquestz/omniauth-google-oauth2
    @auth ||= request.env['omniauth.auth']
  end
end
