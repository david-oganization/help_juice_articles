class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    search_term = params[:search_term]
    if search_term.present?
      Search.create(search_term: search_term, user_ip: request.remote_ip)
    end
    head :ok
  end

  # whitelist params in all controllers
end