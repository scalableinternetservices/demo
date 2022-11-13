# frozen_string_literal: true

module Api
  class SubmissionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_submission, only: %i[destroy show]

    def get_submissions
      @submissions = Submission.all.reverse_order
      render json: @submissions
    end

    def create
      @submission = Submission.new(submission_params)

      if @submission.save
        render json: @submission
      else
        render :json => { :errors => @submission.errors.full_messages }, :status => 422
      end
    end

    def destroy
      id = params[:id]
      Submission.find(id).destroy
      head :no_content
    end

    def index
      @submissions = Submission.all.reverse_order
      render json: @submissions, include: [:community, :comments]
    end

    def new
      @submission = Submission.new(community_id: params['community_id'])
    end

    def show
      id = params[:id]
      render json: Submission.find(id), include: [comments: {}, community: {}]
    end

    private

    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:title, :url, :community_id)
    end
  end
end
