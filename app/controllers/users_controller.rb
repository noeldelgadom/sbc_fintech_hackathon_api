class UsersController < ApplicationController
  before_action :set_user,                    only: [ :show, :balance, :statement, :cart, :open_tabs,
                                                      :credit_company, :update, :destroy]
  before_action :set_company_and_cart_items,  only: [:cart, :credit_company]

  def index
    @users = User.all
  end

  def show
  end

  def balance
    @balance = FiinlabTool.account_balance(@user.account_number)
  end

  def statement
    @statement = FiinlabTool.account_statement(@user.account_number)
  end

  def cart
  end

  def open_tabs
    @companies = Company.where(id: CartItem.where(user: @user).pluck(:company_id))
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def credit_company
    FiinlabTool.transfer(@user.account_number, @company.account_number, @balance, @company.name)
    @cart_items.destroy_all
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_company_and_cart_items
      @company = Company.find(params[:company_id])
      @cart_items = CartItem.where(user: @user, company: @company)
      @balance = 0
      @cart_items.each {|cart_item| @balance += cart_item.item.price * cart_item.quantity }
    end

    def user_params
      params.require(:user).permit(:id, :uid, :name, :nickname, :image, :email)
    end
end
