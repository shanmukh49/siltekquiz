class ResultController < ApplicationController
  def show
    
@result = Result.find(:all, :order => "score")

  end
end
