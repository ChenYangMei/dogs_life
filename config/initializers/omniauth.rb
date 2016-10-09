OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '251063671962699', 'a12d29c4c851fbc9802bedbdc2758e1a'
end
