class ContactBooksController < ApplicationController
  before_action :authorize_request
  before_action :set_contact_book, only: %i[show update destroy]

  # GET /contact_books
  def index
    render json: authorized_scope(ContactBook).filtrate(filter_params)
  end

  # GET /contact_books/1
  def show
    render json: @contact_book
  end

  # POST /contact_books
  def create
    @contact_book = ContactBook.new(create_params)

    authorize @contact_book

    if @contact_book.save
      render json: @contact_book, status: :created, location: @contact_book
    else
      render json: { errors: @contact_book.errors.details }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contact_books/1
  def update
    if @contact_book.update(contact_book_params)
      render json: @contact_book
    else
      render json: { errors: @contact_book.errors.details }, status: :unprocessable_entity
    end
  end

  # DELETE /contact_books/1
  def destroy
    @contact_book.destroy
  end

  private

  def set_contact_book
    @contact_book = ContactBook.find(params[:id])

    authorize @contact_book
  end

  def contact_book_params
    params.permit(:name)
  end

  def create_params
    contact_book_params.merge(user_id: @current_user.id)
  end

  def filter_params
    params.fetch(:filter, {}).permit(:name)
  end
end
