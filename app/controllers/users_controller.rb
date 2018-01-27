class UsersController < ApplicationController
  before_action :set_user, only: [:show, :balance, :statement, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def balance
    puts '---'
    puts 'balance'
  end

  def statement
    puts '---'
    puts 'statement'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
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


    def user_params
      params.require(:user).permit(:id, :uid, :name, :nickname, :image, :email)
    end
end
