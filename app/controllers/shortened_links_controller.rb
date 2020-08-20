class ShortenedLinksController < ApplicationController
  before_action :set_flash_from_reflex

  def index
    @shortened_links ||= ShortenedLink.all
    @shortened_link ||= ShortenedLink.new
    @form_action ||= :none
  end

  private

  def set_flash_from_reflex
    flash[:notice] = @flash_notice if defined?(@flash_notice)
  end
end
