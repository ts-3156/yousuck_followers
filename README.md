# 2020年 総額10億円 お年玉キャンペーン

[総額10億円のお年玉キャンペーン](https://twitter.com/yousuck2020/status/1212025675055452160)の参加者一覧を見るために、[Yusaku Maezawa (MZ) 前澤友作](https://twitter.com/yousuck2020)さんのフォロワーを全員分取得してみた。

フォロワーの一覧を見るには[こちら](https://github.com/ts-3156/yousuck_followers/blob/master/campaign2020/README.md)。

----

ここからは去年の情報です。

# 2019年 総額1億円 お年玉キャンペーン

[総額1億円のお年玉キャンペーン](https://twitter.com/yousuck2020/status/1081544630754103296)の参加者一覧を見るために、[Yusaku Maezawa (MZ) 前澤友作](https://twitter.com/yousuck2020)さんのフォロワーを全員分取得してみた。

詳しい解説は[前澤さんの総額1億円キャンペーン参加者500万人を取得してみた](https://qiita.com/ts-3156/items/a4dead496520a7dc8933)に書いています。

![icons](https://ts-3156.github.io/yousuck_followers/icons.gif)

## フォロワーの一覧を見る

新しい方から1000人を見るにはこちら。

[ids1000.txt](https://github.com/ts-3156/yousuck_followers/blob/master/campaign2019/ids1000.txt)

全員（5,744,582人）を見るにはこちら。（ダウンロードにとても時間がかかります）

[ids.txt](https://github.com/ts-3156/yousuck_followers/blob/master/campaign2019/ids.txt)

**注意事項**

ユーザーのプロフィールをダウンロード可能にするとツイッターの利用規約に違反する可能性があるため、User IDの一覧のみを置いています。

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

質問は@[ts_3156](https://twitter.com/ts_3156)までご連絡ください。
