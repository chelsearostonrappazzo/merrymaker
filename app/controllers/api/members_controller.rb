class Api::MembersController < ApplicationController
  def create
    @member = Member.new(
      user_id: params[:user_id],
      cabal_id: params[:cabal_id],
      celebration_id: params[:celebration_id],
    )
    @member.save
  end
end
