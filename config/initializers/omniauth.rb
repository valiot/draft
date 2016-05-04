Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '239426226415375', '45da84a3381370f03fa7d748327c1767',
           scope: [:email, :public_profile], secure_image_url: true, image_size: :large
end
