Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['91df554897f6eacadc68'], ENV['114b7e70fe167c4a89dbc67540676b5707f37de0']
end