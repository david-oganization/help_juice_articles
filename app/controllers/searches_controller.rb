class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    search_term = params[:search_term]
    last_search = Search.where(user_ip: request.remote_ip).last
    if last_search && search_term.present? && search_term.start_with?(last_search&.search_term)
      last_search.update(search_term: search_term)
    elsif search_term.present?
      Search.create(search_term: search_term, user_ip: request.remote_ip)
    end
    head :ok
  end
end