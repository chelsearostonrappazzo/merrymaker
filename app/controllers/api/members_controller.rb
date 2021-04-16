class Api::MembersController < ApplicationController
  def create
    @member = Member.new(
      user_id: params[:id],
      cabal_id: params[:id],
    )
    @member.save
  end
end
