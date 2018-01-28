class CompaniesController < ApplicationController
  before_action :set_company,             only: [ :show, :balance, :statement, :client_cart, :open_tabs,
                                                  :debit_user, :update, :destroy]
  before_action :set_user_and_cart_items, only: [:client_cart, :debit_user]

  def index
    @companies = Company.all
  end

  def show
  end

  def balance
    @balance = FiinlabTool.account_balance(@company.account_number)
  end

  def statement
    @statement = FiinlabTool.account_statement(@company.account_number)
  end

  def client_cart
  end

  def open_tabs
    @users = User.where(id: CartItem.where(company: @company).pluck(:company_id))
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      render :show, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def debit_user
    FiinlabTool.transfer(@user.account_number, @company.account_number, @balance, @company.name)
    @cart_items.destroy_all
  end

  def update
    if @company.update(company_params)
      render :show, status: :ok, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def set_user_and_cart_items
      @user = User.find(params[:user_id])
      @cart_items = CartItem.where(user: @user, company: @company)
      @balance = 0
      @cart_items.each {|cart_item| @balance += cart_item.item.price * cart_item.quantity }
    end

    def company_params
      params.require(:company).permit(:name, :bs, :logo, :org_type)
    end
end
