class PrepsController < ApplicationController
  skip_before_action :require_user, only: [:show]
  def show
    @giver = Giver.find_by(id: params["id"])
  end
end
