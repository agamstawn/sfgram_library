class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

  # GET /authors or /authors.json
  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(distinct: true)
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.turbo_stream{render turbo_stream: turbo_stream.append("author_list", partial: "authors/author", locals: {author: @author})}
        format.html { redirect_to author_url(@author), notice: "Author was successfully created." }
        format.json { render :show, status: :created, location: @author }
      else
        format.turbo_stream{render turbo_stream: turbo_stream.replace("remote_modal", partial: "authors/form_modal", locals: {author: @author})}
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.turbo_stream{render turbo_stream: turbo_stream.replace("author_row_#{@author.id}", partial: "authors/author", locals: {author: @author})}
        format.html { redirect_to author_url(@author), notice: "Author was successfully updated." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.turbo_stream{render turbo_stream: turbo_stream.replace("remote_modal", partial: "authors/form_modal", locals: {author: @author})}
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    @author.destroy

    respond_to do |format|
      format.turbo_stream {render turbo_stream: turbo_stream.remove("author_row_#{@author.id}")}
      format.html { redirect_to authors_url, notice: "Author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.fetch(:author, {}).permit(:name,:gender,:summary,:books,:born,:died,:n_books)
    end
end
