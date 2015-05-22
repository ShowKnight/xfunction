class DggsController < ApplicationController
  def new
    @dgg = Dgg.new
  end
  def show 
    @dgg = Dgg.find(params[:id]) 
  end
 
  def index
     @dggs = Dgg.all
  end
 def create
     @dgg = Dgg.new(dgg_params)
     if(@dgg.title[0]=='A') 
       @dgg.save
       render json: {P:"OK"}
     else 
        render json: {F:"fail"}
     end
 end
  
private 
  def dgg_params
    params.require(:dgg).permit(:title)
  end
      
end
