class UsersController < ApplicationController
  before_action :find_user, only: %i(show)
  # before_action :authenticate_user!

  attr_reader :user

  def show
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    render_not_found unless user
  end
end
