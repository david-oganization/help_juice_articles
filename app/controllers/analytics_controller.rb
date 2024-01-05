class AnalyticsController < ApplicationController
  def show
    @top_searches = Search.group(:search_term).order('count_id DESC').limit(10).count(:id)

    respond_to do |format|
      format.html { render partial: 'show' }
      # format.js
    end
  end
end