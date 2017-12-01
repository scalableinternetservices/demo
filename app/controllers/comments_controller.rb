# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy show]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment.submission, notice: 'Comment was successfully created.'
    elsif @comment.errors.include?(:parent) || @comment.errors.include?(:submission)
      redirect_to root_path, flash: { error: 'Could not save the comment.' }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to submission_path(@comment.submission), notice: 'Comment was successfully destroyed.'
  end

  def new
    @comment = Comment.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :submission_id, :parent_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
