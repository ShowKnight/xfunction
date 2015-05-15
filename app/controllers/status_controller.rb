class StatusController < ApplicationController
  def get
    @status = Post.find(1)
    render json: {'D':@status.content}
  end
  
  def test
  end

  def ond1
    @post = Post.find(1)
    @post.content[0]='1'
    @post.update(content:@post.content)
    @posts = Post.all.last(10)
    redirect_to posts_url
  end 
  def offd1
    @post = Post.find(1)
    @post.content[0]='0'
    @post.update(content:@post.content)
    @posts = Post.all.last(10)
    redirect_to posts_url
  end
  def ond2
    @post = Post.find(1)
    @post.content[1]='1'
    @post.update(content:@post.content)
    @posts = Post.all.last(10)
    redirect_to posts_url
  end
  def offd2
    @post = Post.find(1)
    @post.content[1]='0'
    @post.update(content:@post.content)
    @posts = Post.all.last(10)
    redirect_to posts_url
  end

  def onall
    @post = Post.find(1)
    @post.update(content:"11")
    @posts = Post.all.last(10)
    redirect_to posts_url
  end
  def offall
    @post = Post.find(1)
    @post.update(content:"00")
    @posts = Post.all.last(10)
    redirect_to posts_url
  end



end

