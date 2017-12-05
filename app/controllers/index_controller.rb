class IndexController < ApplicationController
  def index
    if user_signed_in?
      redirect_to :controller => 'tasks', :action => 'index'
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def complete
  end

  def destroy
  end
end
