require 'spec_helper'

describe 'Grape on RACK', js: true, type: :feature do
  context 'homepage' do
    it 'displays index.html page' do
      visit '/'
      expect(title).to eq('Rack Powers Web APIs')
    end
  end
  context "page that doesn't exist" do
    before :each do
      visit '/invalid'
    end
    it 'displays 404 page' do
      expect(title).to eq('Page Not Found')
    end
  end
  context 'exception' do
    before :each do
      visit '/api/raise'
    end
    it 'displays 500 page' do
      expect(title).to eq('Unexpected Error')
    end
  end
end
