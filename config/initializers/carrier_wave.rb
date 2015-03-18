CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     ENV['ACCESS_KEY_ID'],
      google_storage_secret_access_key: ENV['ACCESS_KEY_SECRET']
  }
  config.fog_directory = 'nom-images'
end
