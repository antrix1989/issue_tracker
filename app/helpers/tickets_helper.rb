module TicketsHelper
  def comment_name
    user_signed_in? ? current_user.full_name : @comment.ticket.customer_name
  end
end
