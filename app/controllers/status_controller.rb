class StatusController < ApplicationController
 
  def get
    @status = Post.find(1)
    render json: {'D':@status.content}
  end
 
  def apilogin
    @user = User.find(1);
    render json:{"username":@user.username,"password":@user.password};
  end
  def apiparams
    @post = Post.last(1)[0]
    render json:{"content":@post.content,"time":@post.created_at.localtime.strftime(";%Y-%m-%d %H:%M:%S;")}
  end
 
  def apitest
     @post = Post.find(1)
     render json:{"test":@post.content}
  end  
  def apiond1
    @post = Post.find(1)
    @post.content[0]='1'
    @post.update(content:@post.content)
    render json: {"status":@post.content}
  end 
  def apioffd1
    @post = Post.find(1)
    @post.content[0]='0'
    @post.update(content:@post.content)
    
    render json: {"status":@post.content}
  end
  def apiond2
    @post = Post.find(1)
    @post.content[1]='1'
    @post.update(content:@post.content)
    
    render json: {"status":@post.content}
  end
  def apioffd2
    @post = Post.find(1)
    @post.content[1]='0'
    @post.update(content:@post.content)
    render json: {"status":@post.content}

  end

  def apionall
    @post = Post.find(1)
    @post.update(content:"11")
    render json: {"status":@post.content}
  end

  def apioffall
    @post = Post.find(1)
    @post.update(content:"00")
    render json: {"status":@post.content}
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
  
  def test
    @lastid = Post.last(1)[0].id
     @firstid = @lastid -9
     @temp1 = Array.new
     @temp2 = Array.new
     @time = Array.new
     for i in @firstid..@lastid; @temp1.push(Post.find(i).content.split(":")[1].to_i); end
     for i in @firstid..@lastid; @temp2.push(Post.find(i).content.split(":")[6].to_i); end
     for i in @firstid..@lastid; @time.push(Post.find(i).created_at.localtime.strftime("%Y-%m-%d %H:%M:%S")); end

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
  f.title(:text => "Temperature monitor")

  f.xAxis(:categories => [@time[0],@time[1],@time[2],@time[3],@time[4],@time[5],@time[6],@time[7],@time[8],@time[9]])

  f.series(:name => "Temp1", :yAxis => 0, :data => [@temp1[0],@temp1[1],@temp1[2],@temp1[3],@temp1[4],@temp1[5],@temp1[6],@temp1[7],@temp1[8],@temp1[9]])
  f.series(:name => "Temp2", :yAxis => 0, :data => [@temp2[0],@temp2[1],@temp2[2],@temp2[3],@temp2[4],@temp2[5],@temp2[6],@temp2[7],@temp2[8],@temp2[9]])

  #f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81,12, 65])

  f.yAxis [
    {:title => {:text => "Temperature(℃)", :margin => 70} },
   # {:title => {:text => "Population in Millions"}, :opposite => true},
  ]

  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
  end
  end
end


