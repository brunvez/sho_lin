class LinkViewsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "link_views"
  end
end
