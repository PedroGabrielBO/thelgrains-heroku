class AdminBaseController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :html, :json
  before_action :authenticate_admin_user!




  private

end
