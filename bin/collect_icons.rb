#!/usr/bin/env ruby

require 'twitter_friendly'

client =
    TwitterFriendly::Client.new(
        consumer_key: 'CONSUMER_KEY',
        consumer_secret: 'CONSUMER_SECRET',
        access_token: 'ACCESS_TOKEN',
        access_token_secret: 'ACCESS_TOKEN_SECRET',
        expires_in: 86400 # 1day
    )

users = []

File.open("ids.txt", "r") do |file|
  file.each_slice(1000) do |chunk|
    users = client.users(chunk.map(&:chomp))
    break
  end
end

File.write(
    'icons.txt',
    users.map {|u| u[:id].to_s + ' ' + u[:profile_image_url_https]}.join("\n")
)
