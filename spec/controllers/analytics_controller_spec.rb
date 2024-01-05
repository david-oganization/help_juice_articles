# spec/controllers/analytics_controller_spec.rb
require 'rails_helper'

RSpec.describe AnalyticsController, type: :controller do
  describe "GET #show" do
    it "renders the show partial for HTML format" do
      get :show
      expect(response).to render_template(partial: 'analytics/_show')
      expect(response).to render_template(partial: '_show')
    end
  end
end
