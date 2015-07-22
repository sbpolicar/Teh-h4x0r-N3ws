class PostsController < ApplicationController

  before_action :check_auth, except: [:index]

  def index
  end

  def new
  end
end
