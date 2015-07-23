module Web
  class EventController < ApplicationController
    include Webable, Events
    skip_before_action :require_login
  end
end
