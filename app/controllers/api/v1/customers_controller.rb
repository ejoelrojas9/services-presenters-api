class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show update destroy]

  def index
    response = Api::V1::Customers::Search.call(params)
    render json: {success: response[:success], data: response[:data]}, status: response[:status]
  end

  def show
    response = Api::V1::Customers::Show.call(params[:id])
    render json: {success: response[:success], data: response[:data]}, status: response[:status]
  end

  def create
    response = Api::V1::Customers::Create.call(customer_params)
    render json: {success: response[:success], data: response[:data]}, status: response[:status]
  end

  def update
    response = Api::V1::Customers::Update.call(params[:id], customer_params)
    render json: {success: response[:success], data: response[:data]}, status: response[:status]
  end

  def destroy
    
  end

  private

  def set_customer
    customer = Customer.find params[:id]
  end
    
  def customer_params
    params.require(:customer).permit!
  end

end
