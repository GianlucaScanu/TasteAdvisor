class Reviewer::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      #https://stackoverflow.com/questions/66960490/argumenterror-wrong-number-of-arguments-in-google-oauth-callback
      #reviewer = Reviewer.from_google(**from_google_params)
      reviewer = Reviewer.from_google2(auth)

      if reviewer.present?
        sign_out_all_scopes
        flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect reviewer, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_reviewer_session_path
      end
    end

  def from_google_params
    #prende i campi utili da auth e fa il parsing 
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      #full_name: auth.info.name,
      #avatar_url: auth.info.image
    }
  end

  def auth
    #risposta auth google, contiene dei campi utili
    #https://github.com/zquestz/omniauth-google-oauth2
    @auth ||= request.env['omniauth.auth']
  end

 end
 