# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  require 'hpricot'
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  
  ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
          :day => "%d",
          :month => "%m",
          :year => "%y",
          :time => "%H:%M",
          :little => "%d.%m.%Y %H:%M",
          :mini => "%d.%m %H:%M",
          :poster_api_date=>"%Y-%m-%d"
        )
        ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
                :day => "%d",
                :month => "%m",
                :year => "%y",
                :time => "%H:%M",
                :little => "%d.%m.%Y %H:%M",
                :mini => "%d.%m %H:%M",
                :poster_api_date=>"%Y-%m-%d"
              )
              
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '730a8d9046c8b19731cbd696c284d253'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
