require 'rails_helper'

RSpec.describe 'trending searches view', type: :view do
  it 'displays trending searches correctly' do
    top_searches = [
      { 'search_term' => 'Ruby', 'count' => 10 },
      { 'search_term' => 'Rails', 'count' => 7 }
    ]

    assign(:top_searches, top_searches)
    render template: 'analytics/_show.html.erb'

    expect(rendered).to have_selector('div') do
      expect(rendered).to have_selector('h3', text: 'Trending Searches')

      top_searches.each do |search|
        expect(rendered).to have_selector('p', text: "#{search['search_term']} - #{search['count']}")
      end
    end
  end
end
