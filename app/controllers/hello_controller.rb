class HelloController < ApplicationController
  def get
    render :json => { :message => "Hello World" }
  end
end
