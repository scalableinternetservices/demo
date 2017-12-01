# frozen_string_literal: true

class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[destroy show]

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to @submission, notice: 'Submission was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @submission.destroy
    redirect_to root_path, notice: 'Submission was successfully destroyed.'
  end

  def index
    @submissions = Submission.all.reverse_order
  end

  def new
    @submission = Submission.new(community_id: params['community_id'])
  end

  def show; end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:title, :url, :community_id)
  end
end
