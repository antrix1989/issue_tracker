class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.name = user_signed_in? ? "#{current_user.first_name} #{current_user.last_name}" : @comment.ticket.customer_name

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.ticket, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @comment.ticket, notice: "Error creating comment: #{@comment.errors}" }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.ticket }
    end
  end
end
