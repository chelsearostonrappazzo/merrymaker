class Api::CabalsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except: [:index, :show]
end
