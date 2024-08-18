RailsAdmin.config do |config|
  # Main application name
  config.main_app_name = [ "Pong API", "Admin" ]

  # Authentication with HTTP Basic Authentication using User records
  config.authenticate_with do
    authenticate_or_request_with_http_basic("Admin Area") do |email, password|
      user = User.find_by(email: email)

      if user&.admin? && user.valid_password?(password)
        sign_in(:user, user)
      else
        # If authentication fails, return false
        false
      end
    end
  end

  # Define the current user method to be used in the admin interface
  config.current_user_method(&:current_user)

  # Configure available actions
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
