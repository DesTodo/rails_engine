class Api::V1::Merchants::RevenueController < ApplicationController




  def show
    if params[:date]
      render json: Merchant.revenue_for_one_merchant_by_date(params[:merchant_id], params[:date]), serializer: RevenueForOneMerchantSerializer
    else
      render json: Merchant.revenue_for_one_merchant(params[:merchant_id]), serializer: RevenueForOneMerchantSerializer
    end
  end
end