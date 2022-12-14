class OmniUsers::OmniauthCallbacksController < ApplicationController

  def google_oauth2
    #temporaneo
    check = 1
    if check == 0 || params[:calling_path] == "/reviewers/sign_in"
        reviewer = Reviewer.from_google(auth)
        if reviewer.present?
            sign_out_all_scopes
            flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
            #flash[:notice] = params[:calling_path]
            #flash[:notice] = @calling_path
            sign_in_and_redirect reviewer, event: :authentication
        else
            flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
            redirect_to new_reviewer_session_path
        end
    elsif check == 1 || params[:calling_path] == "/restaurants/sign_in"
        restaurant = Restaurant.from_google(auth)
        if restaurant.present?
            sign_out_all_scopes
            flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
            #flash[:notice] = params[:calling_path]
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
 
