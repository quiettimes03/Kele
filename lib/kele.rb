require 'HTTParty'
require 'json'
require './lib/roadmap.rb'

class Kele
 include HTTParty
 include Roadmap

  base_uri 'https://www.bloc.io/api/v1/'

  def initialize(email, password)
    @email, @password = email, password
    response = self.class.post(api_url("sessions"), body: { "email": email, "password": password })

    raise InvalidStudentCode.new() if response.code == 401
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_url("users/me"), user_auth_token)
    @user_data = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentor/#{mentor_id}/student_availability"), user_auth_token)
    @mentor_availability = JSON.parse(response.body)
  end

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

  def user_auth_token
    {headers:
      { authorization: @auth_token}}
  end
end
