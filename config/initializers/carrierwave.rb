if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'us-east-1' # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = 'microposts' # 作成したS3バケット名
  end
end