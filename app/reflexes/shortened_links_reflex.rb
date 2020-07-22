# frozen_string_literal: true

class ShortenedLinksReflex < ApplicationReflex
  def new
    @form_action = :new
    @shortened_link = ShortenedLink.new
  end

  def edit(id)
    @form_action = :edit
    @shortened_link = ShortenedLink.find(id)
  end

  def destroy(id)
    ShortenedLink.find(id).destroy!
    @flash_notice = "Shortened Link destroyed successfully"
  end
end
