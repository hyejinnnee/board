class CommentsController < ApplicationController
    #댓글을 생성해주는 프로세스
    def create
            
            comment = Comment.new #새댓글 만들게
            comment.comment = params[:comment_content]
            comment.post_id = params[:post_id]
            comment.save
            
        redirect_to :back
    end
    
    
end
