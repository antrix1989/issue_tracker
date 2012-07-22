class SearchController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    # Quick jump to a ticket.
    if params[:search].match(/^UKR-(\d+)$/)
      redirect_to :controller => "tickets", :action => "show", :id => $1
      return
    end
    
    @tickets = Ticket.search(params[:search])
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
