module NavigationHelpers
  
  def path_to(page_name)
    case page_name

    when /^the TasteAdvisor home page/
      '/'

    when /^the restaurant profile page/
      '/restaurants/6'

    when /^the reviewer profile page/
      '/reviewers/1'
    
    when /^the Pizza page/
      '/dishes/2'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
