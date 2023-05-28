# frozen_string_literal: true

# ApplicationController is the base class for all controllers in the application. It provides shared functionality
# and is the ideal location to define methods that are shared across multiple controllers. All other controllers should
# inherit from this class.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    libraries_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
