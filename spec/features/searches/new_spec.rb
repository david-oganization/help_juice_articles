require 'rails_helper'

RSpec.describe 'search_new_path', type: :view do
  it 'displays the search input field and empty trending searches list' do
    render template: 'searches/new'

    expect(rendered).to have_selector('div input#search_term[type="text"][placeholder="Type your search here"]')
    expect(rendered).to have_selector('ol#trending_searches', text: '')
  end
end
