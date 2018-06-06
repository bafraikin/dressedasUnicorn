class ApplicationController < ActionController::Base
protect_from_forgery unless: -> { request.format.json? }
before_action :sanitize_devise_params, if: :devise_controller?
	

def sanitize_devise_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
	end



cache = ActiveSupport::Cache::MemoryStore.new

cache.read('city')   # => nil
cache.write('city', 'nique ta mere')
puts cache.read('city')   # => "Duckburgh"

def after_sign_in_path_for(resource)
    root_path
end

def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

end
