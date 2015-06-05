class DggsController < ApplicationController
skip_before_filter :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update,:stat,:destroy]

  def new
    @dgg = Dgg.new
  end
  def show 
    @dgg = Dgg.find(params[:id]) 
  end
 
  def index
     @dggs = Dgg.all.order("id DESC")
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
