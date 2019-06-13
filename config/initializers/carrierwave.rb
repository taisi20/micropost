if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAXPWP6YKSR3YAV3MW'],
      aws_secret_access_key: ENV['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'],
      region: 'us-east-1' # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = 'microposts' # 作成したS3バケット名
  end
end