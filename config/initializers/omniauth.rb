Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']

    provider :github, Rails.application.credentials.github[:key], Rails.application.credentials.github[:secret]
    # provider :github, '91df554897f6eacadc68', '114b7e70fe167c4a89dbc67540676b5707f37de0'
end

