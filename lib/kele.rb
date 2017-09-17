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

  def get_messages(page_num)
    if page_num == nil
      response = self.class.get(api_url("message_threads"), user_auth_token)
      @list_of_messages = JSON.parse(response.body)
    else
      response = self.class.get(api_url("message_threads/#{page_num}"), user_auth_token)
      @list_of_messages = JSON.parse(response.body)
    end
  end

  def create_messages(sender, recipient_id, token, subject, text)
    response = self.class.post(api_url("messages"),
    body: {
      "sender": sender,
      "recipient_id": recipient_id,
      "token": token,
      "subject": subject,
      "text": text
    },
    headers:
      { authorization => @auth_token})
    puts response
  end

  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id)
    response = self.class.post(api_url("checkpoint_submissions"),
    body: {
      "checkpoint_id": checkpoint_id,
      "assignment_branch": assignment_branch,
      "assignment_commit_link": assignment_commit_link,
      "comment": comment,
      "enrollment_id": enrollment_id
      },  headers: { "authorization" => @auth_token })
    puts response
  end

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

  def user_auth_token
    {headers:
      { authorization: @auth_token}}
  end
end
