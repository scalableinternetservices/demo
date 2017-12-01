# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[show destroy]

  def create
    @community = Community.new(community_params)

    if @community.save
      redirect_to @community, notice: 'Community was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @community.destroy
    redirect_to root_path, notice: 'Community was successfully destroyed.'
  end

  def new
    @community = Community.new
  end

  def show; end

  private

  def community_params
    params.require(:community).permit(:name)
  end

  def set_community
    @community = Community.find(params[:id])
  end
end
