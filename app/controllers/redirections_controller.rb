class RedirectionsController < ApplicationController
  include CableReady::Broadcaster

  def index
    link = ShortenedLink.find_by!(shortened_path: params[:path])
    link.increment!(:views_count)

    cable_ready["link_views"].text_content(
      selector: "#link-#{link.id}-views-count",
      text: link.views_count
    )
    cable_ready.broadcast

    redirect_to link.original_url
  end
end
