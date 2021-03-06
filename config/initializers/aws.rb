CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     '비밀',                        # 변경해라
    aws_secret_access_key: '비밀',                      # 변경해라
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'https:/s3-ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'timple'                          # 벤치 이름
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
  # aws_access_key_id:     ENV["AWS_ID"],                        # 변경해라
 # aws_secret_access_key: ENV["AWS_KEY"],
