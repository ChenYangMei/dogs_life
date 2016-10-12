class User < ActiveRecord::Base
  has_secure_password
  has_many :areas
  has_many :reviews

  ratyrate_rater


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid).permit!).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name

      # generate random password to pass Validation
      user.password = SecureRandom.urlsafe_base64

      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
