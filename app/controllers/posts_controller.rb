class PostsController < ApplicationController
  def index
    @posts = Post.all.order("id desc")#모든 게시글 가져와
  end
  
  #작성하기 위해 폼을 제공해 주는 부분
  def new
  end
   
  #게시글을 상세보기
  def show
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end
  
  #실제 DB에 저장되는 프로세스
  def create
    post = Post.new #하나의 개시글을 만들꺼야
    post.title = params[:post_title]
    post.content = params[:post_content]
    post.save #위의 내용을 저장할꺼야
    
    redirect_to '/'
  end
  
  #특정 게시글을 삭제 프로세스
  def destroy
    post = Post.find(params[:post_id])
    post.destroy!
    
    redirect_to '/'
  end
  
  #게시글 수정하기
  def edit
    @post = Post.find(params[:post_id])
  end
  
  #특정 게시글 수정 프로세스
  def update
    post = Post.find(params[:post_id])
    post.title = params[:post_title]
    post.content = params[:post_content]
    post.save
    
    redirect_to '/'
  end
end
