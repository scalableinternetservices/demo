# frozen_string_literal: true

module Api
  class CommunitiesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_community, only: %i[show destroy]

    def create
      @community = Community.new(community_params)

      if @community.save
        render json: @community
      else
        render :json => { :errors => @community.errors.full_messages }, :status => 422
      end
    end

    def destroy
      id = params[:id]
      Community.find(id).destroy
      head :no_content
    end

    def new
      @community = Community.new
    end

    def show
      id = params[:id]
      render json: Community.find(id), include: [submissions: { include: [:community, :comments] }]
    end

    def index
      render json: Community.all
    end

    private

    def community_params
      params.require(:community).permit(:name)
    end

    def set_community
      @community = Community.find(params[:id])
    end
  end
end
