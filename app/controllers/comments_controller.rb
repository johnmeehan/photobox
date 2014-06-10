class CommentsController < ApplicationController


  def search
    #take the ajax request and get the comments form ES
    # @comments_found = Comment.search(query: { match:{ picture_id: "#{params[:picture_id]}"}}).records
    @comments_found = Comment.picture_comments(params[:picture_id]).to_json
    respond_to do |format|
      format.js
    end
  end

  def create
  	@picture = Picture.get(params[:comment][:picture_id])
  	@picture.comments << Comment.new(params[:comment])
  
    # repository.save(Comment.new(params[:comment]))

  	if @picture.comments.save
  		respond_to do |format|
  			format.html {redirect_to @picture}
  			format.js
  		end
  	else
  		redirect_to @picture
  	end
  end

  # def destroy
  # 	#@comment = current_picture.comments.
  # 	@comment.destroy
  # 	redirect_to root_path
  # end
end
