class Reviewer::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    reviewer = Reviewer.from_google(auth)

    if reviewer.present?
      sign_out_all_scopes
      flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect reviewer, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_reviewer_session_path
    end
  end

  def auth
    #risposta auth google, contiene dei campi utili
    #https://github.com/zquestz/omniauth-google-oauth2
    @auth ||= request.env['omniauth.auth']
  end

 end
 