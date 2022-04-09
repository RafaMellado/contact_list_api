class ContactsController < ApplicationController
  before_action :authorize_request
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts/1
  def show
    render json: @contact, include: ['contact_histories']
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    authorize @contact

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])

    authorize @contact
  end

  def contact_params
    params.permit(:givenname, :surname, :email, :phone, :contact_book_id)
  end
end
