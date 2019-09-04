class SecretCodesController < ApplicationController
  before_action :authenticate_user!
  def index
    @secret_codes = SecretCode.all
  end

  def new
    @secret_code = SecretCode.new
  end

  def create
    params[:num_of_code].to_i.times do |secret_code|
      @secret_code = SecretCode.new
      @secret_code.save!
    end
      # flash[:success] = "Secret code has been saved."
    redirect_to secret_codes_path
    # else
    #   flash[:alert] = @secret_code.errors.full_messages.to_sentence
    #   render 'new'
    # end
  end
end
