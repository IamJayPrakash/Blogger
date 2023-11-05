# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['288059130676350'], ENV['c7b906c148139930003be4acfdebd169'],
           scope: 'email', display: 'popup'
end
