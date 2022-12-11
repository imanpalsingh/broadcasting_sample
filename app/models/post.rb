class Post < ApplicationRecord
  belongs_to :user

  after_create_commit :show_notification

  def show_notification
    channel = :notifications

    if user.group
      channel = "groups/#{user.group.id}"
    end

    ## Uncomment one of these to try different ways of broadcasting

    inline_html(channel)
    # turbo_stream_file(channel)
    # background_job(channel)

  end

  private

  def inline_html(channel)
    broadcast_replace_to(
      channel,
      target: "notification-icon",
      html: <<~HTML
        <span id="notification-icon" class='material-icons navbar-item'>
          mark_email_unread
        </span>
    HTML
    )
  end

  def turbo_stream_file(channel)
    broadcast_render_to(
      channel,
      partial: "posts/notifications/new"
    )
  end

  def background_job(channel)
    broadcast_render_later_to(
      channel,
      partial: "posts/notifications/new"
    )
  end
end
