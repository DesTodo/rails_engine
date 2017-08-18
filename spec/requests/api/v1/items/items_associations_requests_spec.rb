require 'rails_helper'

describe "Item Relationship Endpoints" do

  context "GET /api/v1/items/:id/invoice_items" do
    it 'sends all invoice_items associated with the requested item' do
      item = create(:item)
      create_list(:invoice_item, 3, item_id: item.id)

      get "/api/v1/items/#{item.id}/invoice_items"
      expect(response).to be_success
      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(3)

      expect(invoice_items.first).to have_key("item_id")
      expect(invoice_items.first["item_id"]).to eq(item.id)
      expect(invoice_items.first).to have_key("invoice_id")
      expect(invoice_items.first).to have_key("quantity")
      expect(invoice_items.first).to have_key("unit_price")
    end
  end

  context "GET /api/v1/items/:id/merchant" do
    it 'sends the merchant associated with the requested item' do
      item = create(:item)

      get "/api/v1/items/#{item.id}/merchant"
      expect(response).to be_success
      merchant = JSON.parse(response.body)

      expect(merchant).to have_key("name")
    end
  end
end
