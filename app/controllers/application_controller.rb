class ApplicationController < ActionController::Base
  include DeviseWhitelist
  protect_from_forgery prepend: true
end
