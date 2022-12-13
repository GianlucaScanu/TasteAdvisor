Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           '1013795198208-rnqaod9bb56rum2ol2413pvvsng9gfgh.apps.googleusercontent.com',
           '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'#,
           #scope: 'email',
           #info_fields: 'email',
           #auth_type: 'rerequest'

  configure do |config|
    config.path_prefix = '/reviewers/auth'
  end

  #config/initializers/oauth.rb
  on_failure do |env|
    #we need to setup env
    if env['omniauth.params'].present
      env["devise.mapping"] = Devise.mappings[:reviewer]
    end
    Devise::OmniauthCallbacksController.action(:failure).call(env)
  end

end



#https://kodius.com/blog/devise-omniauth-multiple-models/