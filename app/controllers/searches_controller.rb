class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    search_term = search_params[:search_term]
    if search_term.present?
      Search.create(search_term: search_term, user_ip: request.remote_ip)
    end
    head :ok
  end

  private
  def search_params
    params.permit(:search_term)
  end
end