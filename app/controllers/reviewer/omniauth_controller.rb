class OmniauthController < Devise::OmniauthCallbacksController

  def google_oauth2
        @reviewer = Reviewer.create_from_provider_data(request.env['omniauth.auth'])
        if @reviewer.persisted?
             sign_in_and_redirect @reviewer
             set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
        else
             flash[:error]='There was a problem signing you in through Google. Please register or try signing in later.'
             redirect_to new_reviewer_registration_url
        end
     end
 
     def failure
         flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
         redirect_to new_reviewer_registration_url
     end
 end