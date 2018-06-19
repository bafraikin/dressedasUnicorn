class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :sanitize_devise_params, if: :devise_controller?

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  
  #on garde les lignes suivantes par nostalgie, ça nous a accompagné pendant tout le projet.
  #ça a pour fonction d'afficher des faux messages d'erreurs quand on lance 
  #une commande rails
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
     root_path
  end
end
