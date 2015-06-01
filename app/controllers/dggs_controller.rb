class DggsController < ApplicationController
skip_before_filter :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update,:stat,:destroy]

  def graph
        @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
       f.series:name=>'Updated',:data=>[5,1,2,3,4,5] 
  end
  end

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
