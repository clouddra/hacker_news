require 'rails_helper'

RSpec.describe 'Submit a link' do
  scenario 'user can submit link and see submitted link' do
    title = 'Google'
    url = 'https://google.com'

    visit root_path
    click_on 'Submit'
    fill_in 'Title', with: title
    fill_in 'Url', with: url
    click_on 'Submit'

    expect(page).to have_link title, href: url
  end
end
