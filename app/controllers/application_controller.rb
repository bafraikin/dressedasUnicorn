class ApplicationController < ActionController::Base
protect_from_forgery unless: -> { request.format.json? }


cache = ActiveSupport::Cache::MemoryStore.new

cache.read('city')   # => nil
cache.write('city', 'nique ta mere')
puts cache.read('city')   # => "Duckburgh"



end
