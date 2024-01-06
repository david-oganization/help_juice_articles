class AnalyticsController < ApplicationController

  def show
    @top_searches = Search.fetch_top_searches 
    respond_to do |format|
      format.html { render partial: 'show' }
    end
  end
end
