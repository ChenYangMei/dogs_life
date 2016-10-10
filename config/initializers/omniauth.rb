OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == "development"
    provider :facebook, '251063671962699', 'a12d29c4c851fbc9802bedbdc2758e1a'
  else
    provider :facebook, '251055175296882', '1ea037720172cc7488fabf8310ee7f8c'
  end
end
