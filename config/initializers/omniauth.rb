#OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :facebook, '460346470642504','43808742c209382deed63df4e26d5b1a',   :scope => 'email,user_photos,friends_photos,read_friendlists,manage_friendlists,publish_stream'
end
