class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :balance, :statement, :update, :destroy]

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

  def create
    @company = Company.new(company_params)

    if @company.save
      render :show, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
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


    def company_params
      params.require(:company).permit(:name, :bs, :logo, :org_type)
    end
end
