require 'rails_helper'

RSpec.describe LinksController do
  describe '#create' do

    context 'success' do
      let (:params) { {title: 'Google', url: 'https://google.com'} }

      def do_request
        post :create, link: params
      end

      before { do_request }

      it 'creates a link' do
        expect {
          do_request
        }.to change(Link, :count).by(1)

        link = Link.last
        expect(link.title).to eq params[:title]
        expect(link.url).to eq params[:url]
      end

      it 'redirects' do
        expect(response).to redirect_to Link.last
      end
    end

    context 'failure' do
      let (:params) { {title: '', url: 'https://google.com'} }

      def do_request
        post :create, link: params
      end

      before { do_request }

      it 'does not create a link' do
        expect {
          do_request
        }.not_to change(Link, :count)
      end

      it 'renders :new' do
        expect(response).to render_template :new
      end
    end
  end
end
