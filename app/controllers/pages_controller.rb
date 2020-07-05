class PagesController < ApplicationController
  def index
    @message ||= 'Click the button'
  end
end
