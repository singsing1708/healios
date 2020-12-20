class UrlMappingsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_url_mapping, only: :show

  def create
    outcome = CreateUrlMapping.run(create_params.merge({user_id: current_user.id}))
    if outcome.valid?
      redirect_to root_path, notice: 'new URL successfully created!'
    else
      @url_mapping = outcome.result
      redirect_to root_path, alert: outcome.errors.full_messages.to_sentence
    end
  end

  def show
    if @url_mapping
      redirect_to @url_mapping.original_url
    else
      redirect_to root_path, alert: "Sorry. Path not found"
    end
  end

  private

  def create_params
    params.require(:url_mapping).permit(:original_url)
  end

  def set_url_mapping
    @url_mapping = UrlMapping.find_by(hashed_path: request.path[1..-1])
  end

end
