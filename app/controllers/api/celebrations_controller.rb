class Api::CelebrationsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except: [:index, :show]
end
