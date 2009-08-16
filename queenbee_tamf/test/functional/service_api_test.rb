require File.dirname(__FILE__) + '/../test_helper'
require 'service_controller'

class ServiceController; def rescue_action(e) raise e end; end

class ServiceControllerApiTest < Test::Unit::TestCase
  def setup
    @controller = ServiceController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
end
