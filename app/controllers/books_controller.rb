class BooksController < ApplicationController
	#index get
	def index
		@books = Book.all
	end

	#show get
	def show
		@book = Book.find(params[:id])
	end

	#new get
	def new
		@book = Book.new
	end

	#create post
	def create
		#render plain: params.inspect
		@book = Book.new(resource_params)
		if @book.save
		render plain:'berhasil menyimpan buku baru'
	else
		render 'new'
	end
	end

	#edit get
	def edit
		@book = Book.find(params[:id])
	end

	#update patch / put
	def update
		@book = Book.find(params[:id])
		@book.update(resource_params)
		render plain:'berhasil edit buku'
	end

	#destroy delete
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		render plain:'berhasil meghapus buku'
	end

	def active
		@books = Book.where(status: 1)
		render 'index'
	end

	def toggle
		@book = Book.find(params[:id])
		@book.status = 0
		@book.save
		render plain: 'buku berhasil di nonaktifkan'
	end

	private 
	def resource_params
		params.require(:book).permit(:title, :page, :description)
	end

	

	

	

end