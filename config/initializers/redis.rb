$redis = Redis::Namespace.new("text_translator", :redis => Redis.new)