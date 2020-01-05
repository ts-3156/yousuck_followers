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

ids = []

begin
  ids = client.follower_ids('yousuck2020')
rescue Twitter::Error::TooManyRequests => e
  sleep client.rate_limit.follower_ids[:reset_in]
  retry
end

puts "ids #{ids.size}"
File.write('ids.txt', ids.join("\n"))
