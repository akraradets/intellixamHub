# ../controllers/concerns/accessible.rb
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      redirect_to(admin_authenticated_root_url) && return
    elsif current_organization
      flash.clear
      redirect_to(organization_authenticated_root_url) && return
    elsif current_candidate
      flash.clear
      redirect_to(candidate_authenticated_root_url) && return
    end
  end
end