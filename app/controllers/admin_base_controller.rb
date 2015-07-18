class AdminBaseController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :html
  before_action :authenticate_admin_user!

end
