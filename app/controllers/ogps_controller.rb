class OgpsController < ApplicationController
  def create
    if Ogp.create!(user_id: current_user.id, path: params[:ogp][:path])
      render json: {}
    else
      render json: {}, status: :bad_request
    end
  end

  def show
    @ogp = Ogp.find_by(id: params[:id])

    if @ogp
      render json: @ogp.as_json
    else
      render json: {}, status: :bad_request
    end
  end
end