class TagsController < ApplicationController

  def show
    filter = params[:tag]
    tag = Tag.random(filter)
    render :json => Question.find(tag.question_id)
  end

  def create
    tag = Tag.new
    tag.question_id = params[:question_id]
    tag.tag = params[:tag]
    tag.created_at = Date.current
    tag.updated_at = Date.current
    tag.save()
    question = tag.question
    render :json => question
  end

  def destroy
    tag = Tag.find(params[:id])
    question = tag.question
    tag.destroy
    render :json => question
  end

end
