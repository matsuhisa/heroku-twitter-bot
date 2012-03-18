# -*- encoding: utf-8 -*-
require 'rubygems'
require 'twitter'

class Tweet

  def initialize
    @text = <<-EOF.split("\n")
EOF

    Twitter.configure do |config|
	  config.consumer_key       = ''
  	  config.consumer_secret    = ''
  	  config.oauth_token        = ''
  	  config.oauth_token_secret = ''
    end
  end

  def random_tweet
    #tweet = 'test tweet'
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  def daily_tweet
    tweet = @text[Time.now.day - 1]
    update(tweet)
  end

  private
  def update(tweet)
	return nil unless tweet

    begin
      Twitter.update(tweet.chomp)
    rescue => ex
      nil # todo
    end
  end

end
