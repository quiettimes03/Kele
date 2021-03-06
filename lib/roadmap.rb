module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get(api_url("roadmaps/#{roadmap_id}"), user_auth_token)
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(api_url("checkpoints#{checkpoint_id}"), user_auth_token)
    @checkpoint = JSON.parse(response.body)
  end
  
end
