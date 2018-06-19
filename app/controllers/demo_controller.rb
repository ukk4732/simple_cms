class DemoController < ApplicationController
  
  layout false

  def index
    # render('hello')
  end

  def hello
    # render('index')
    @my_array = [1,2,3,4,5,6]
    @id = params[:id].to_i
    @name = params['name']
    @page = params[:page].to_i
  end

  def other_hello
    redirect_to(controller: 'demo', action: 'index')    
  end

end
