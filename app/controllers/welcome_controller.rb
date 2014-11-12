class WelcomeController < ApplicationController
  before_action :require_user
end