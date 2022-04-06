class ContactBooksController < ApplicationController
  before_action :authorize_request
  before_action :set_contact_book, only: %i[show update destroy]

  # GET /contact_books
  def index
    @contact_books = ContactBook.all

    render json: @contact_books
  end

  # GET /contact_books/1
  def show
    render json: @contact_book, include: ['contacts']
  end

  # POST /contact_books
  def create
    @contact_book = ContactBook.new(create_params)

    if @contact_book.save
      render json: @contact_book, status: :created, location: @contact_book
    else
      render json: @contact_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contact_books/1
  def update
    if @contact_book.update(contact_book_params)
      render json: @contact_book
    else
      render json: @contact_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contact_books/1
  def destroy
    @contact_book.destroy
  end

  private

  def set_contact_book
    @contact_book = ContactBook.find(params[:id])
  end

  def contact_book_params
    params.require(:data).permit(:name)
  end

  def create_params
    params.require(:data).permit(:name).merge(user_id: @current_user.id)
  end
end
