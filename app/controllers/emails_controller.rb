class EmailsController < ApplicationController
  before_action :set_email, only: %i[show edit update destroy]

  def index
    @emails = Email.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)

    if @email.save
      respond_to do |format|
        format.html { redirect_to emails_path, notice: "Rendered in HTML." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    puts '$' * 60
  end

  def update
    if @email.update(email_params)
      respond_to do |format|
        format.html { redirect_to emails_path, notice: "Rendered in HTML." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @email.destroy
    
    respond_to do |format|
      format.html { redirect_to emails_path, notice: "Rendered in HTML." }
      format.turbo_stream
    end
  end

  private

  def set_email
    @email = Email.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:body, :object)
  end
end
