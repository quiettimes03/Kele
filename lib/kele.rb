require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    request = self.class.post(api_url("sessions"), body: { "email": email, "password": password })

    raise InvalidStudentCode.new() if request.code == 401
    @auth_token = request["auth_token"]
  end

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

  def user_auth_token
    {headers:
      { authorization: @auth_token}}
  end
end
