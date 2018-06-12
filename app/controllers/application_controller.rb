class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :sanitize_devise_params, if: :devise_controller?

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email, :avatar)
    end
  end

  cache = ActiveSupport::Cache::MemoryStore.new

  cache.write("city", Faker::Hacker.say_something_smart + " " + Faker::RickAndMorty.quote)
  cache.write("city1", Faker::Hacker.say_something_smart)
  cache.write("city2", Faker::Hacker.say_something_smart)
  puts cache.read("city")
  puts cache.read("city1")
  puts cache.read("city2")

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
