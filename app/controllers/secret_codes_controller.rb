class SecretCodesController < ApplicationController
  load_and_authorize_resource
  def index
    @secret_codes = SecretCode.all
  end

  def new
    @secret_code = SecretCode.new
  end

  def create
    params[:num_of_code].to_i.times do |secret_code|
      @secret_code = SecretCode.new
      @secret_code.save
    end
    redirect_to secret_codes_path
  end
end
