class SearchesController < ApplicationController
  def new
  end

  def create
    search_term = params[:search_term]
    last_search = Search.where(user_ip: params[:user_ip]).last
    if last_search && search_term.start_with?(last_search)
      last_search.update(search_term: search_term)
    else
      Search.create(search_term: search_term, user_ip: params[:user_ip])
    end
    head :ok
  end
end