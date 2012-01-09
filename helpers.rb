require 'sinatra/base'

module Sinatra
  module HTMLEscapeHelper
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end
  helpers HTMLEscapeHelper

  module InputBouncer
    def verify_as_ip_or_hostname(param)
      return unless param # possible this could be called on a nil parameter
      redirect "/exception" if !(param =~ /^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])(\.([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]{0,61}[a-zA-Z0-9]))*$/)
    end
  end
  register InputBouncer
end
