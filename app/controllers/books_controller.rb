class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  # GET /books or /books.json
  def index
    @q = Book.includes([:author]).order(created_at: :desc).ransack(params[:q])
    @pagy, @books = pagy(@q.result(distinct: false))
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        update_author_name(book_params["author_id"].to_i)
        format.turbo_stream{render turbo_stream: turbo_stream.append("book_list", partial: "books/book", locals: {book: @book})}
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.turbo_stream{render turbo_stream: turbo_stream.replace("remote_modal", partial: "books/form_modal", locals: {book: @book})}
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        update_author_name(book_params["author_id"].to_i)
        format.turbo_stream{render turbo_stream: turbo_stream.replace("book_row_#{@book.id}", partial: "books/book", locals: {book: @book})}
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.turbo_stream{render turbo_stream: turbo_stream.replace("remote_modal", partial: "books/form_modal", locals: {book: @book})}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.remove("book_row_#{@book.id}")}
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def update_author_name(author_id)
      @book.update(author_name: Author.find(author_id).name)
    end

    def sanitize_params
      debugger
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.fetch(:book, {}).permit(:title,:year,:pages,:author_name,:similar_books,:author_id)
    end
end
