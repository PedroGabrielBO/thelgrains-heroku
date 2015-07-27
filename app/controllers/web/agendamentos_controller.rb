module Web
  class AgendamentosController < EventsController
    include Webable
    skip_before_action :require_login
  end
end
