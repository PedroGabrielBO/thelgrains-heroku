# super classe do scope admin
class AdminBaseController < ApplicationController
  include Devise::Controllers::Helpers
  respond_to :html
  before_action :authenticate_admin_user!
  before_filter :verify_admin

  private

  def verify_admin
    redirect_to root_url unless current_user.try :admin?
  end
end
