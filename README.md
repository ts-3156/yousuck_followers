[Yusaku Maezawa (MZ) 前澤友作](https://twitter.com/yousuck2020)さんのフォロワーを全員分取得してみた。

## フォロワーの一覧を見る

新しい方から1000人を見るにはこちら。

[ids1000.txt](https://github.com/ts-3156/yousuck_followers/blob/master/ids1000.txt)

全員（5,744,582人）を見るにはこちら。（ダウンロードにとても時間がかかります）

[ids.txt](https://github.com/ts-3156/yousuck_followers/blob/master/ids.txt)

## 自分でやってみる場合

[twitter_friendly gem](https://github.com/ts-3156/twitter_friendly)をインストールする。

```
$ gem install twitter_friendly
```

このRubyコードを実行する。

```ruby
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
```

質問は@[ts_3156](https://twitter.com/ts_3156)にご連絡ください。
