# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_common_locales
  before_action :set_new_and_create_locales, only: %i[new create]
  before_action :set_edit_and_update_locales, only: %i[edit update]
  before_action :set_destroy_locales, only: :destroy

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: set_success_message_locale }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: set_success_message_locale }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: set_success_message_locale }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end

  def set_common_locales
    @head_locales = t 'book.heading'
    @attr_locales = t 'book.attr'
    @link_locales = t 'book.action'
    @confirm_message_locale = t('book.message.confirm')
  end

  def set_new_and_create_locales
    @submit_locales = t('book.submit.base', value: t('book.submit.new'))
    @success_message_locale = t('book.message.success', deep_interpolation: true, action: t('book.message.success.create'))
  end

  def set_edit_and_update_locales
    @submit_locales = t('book.submit.base', value: t('book.submit.edit'))
    @success_message_locale = t('book.message.success', deep_interpolation: true, action: t('book.message.success.update'))
  end

  def set_destroy_locales
    @success_message_locale = t('book.message.success', deep_interpolation: true, action: t('book.message.success.destroy'))
  end

  def set_success_message_locale
    @success_message_locale[:base]
  end
end
