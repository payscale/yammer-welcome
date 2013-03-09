class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :token, :secret
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["token"]
    end
  end
end
