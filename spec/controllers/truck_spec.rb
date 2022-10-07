require 'rails_helper'
RSpec.describe TrucksController, type: :controller do
  render_views
  context 'show' do
    it 'should show profit and stock' do
      truck = FactoryBot.create(:truck, :with_truck_products)
      get :show, params: { id: truck.id }, format: :json
      p json = JSON.parse(response.body)
      expect(json['truck']['profit']).to eq(0)
      expect(json['truck']['icecreams'][0]['in_stock']).to be_a_kind_of(Integer)
    end
  end
end
