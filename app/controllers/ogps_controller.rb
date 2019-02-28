class OgpsController < ApplicationController
  def create
    opg = Ogp.create!(user_id: current_user.id, path: params[:ogp][:path])

    if opg.persisted?
      render json: opg.as_json
    else
      render json: nil, status: :bad_request
    end
  end

  def show
    @ogp = Ogp.find_by(id: params[:id])

    if @ogp
      render json: @ogp.as_json
    else
      render json: nil, status: :bad_request
    end
  end
end