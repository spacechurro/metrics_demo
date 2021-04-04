class AuthenticateUser
  attr_reader :email, :password

  def initialize(email, password)
    @email = email.downcase
    @password = password.downcase
  end

  def call
    if email == 'john@example.com'
      if password == 'asdf1234'
        success = true
        status = 'success'
      else
        success = false
        status = 'password_mismatch'
      end
    else
      success = false
      status = 'unknown_email'
    end

    ActiveSupport::Notifications.instrument('AuthenticateUser', status: status)
    return success
  end
end
