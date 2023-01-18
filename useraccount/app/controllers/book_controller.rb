require 'bcrypt'
class BookController < ApplicationController
skip_before_action :verify_authenticity_token

    def index      
        allBooks = Book.all
        if allBooks
            render json: {message:"Fetching all books", allBooks:}
        else
            render json: allBooks.errors        
        end
    # end
    end
#details of individual book based on id
    # GET Request
    def show        
            bookDetail = Book.find(params[:id])
            render json: bookDetail
        end
#adding new book
    #POST Request

    def create     
        if(params) 
            Book.create!(book_params)           
            newBook = Book.last  
            render json: {message:"Book Addtion successful!" , newBook:}        
        else
            render json: "Book addition failed"
        end
        
    end
#updating book details
    def update
       
        bookVal = Book.find(params[:id].to_i)       
        if(bookVal.update!(book_params))        
            
            render json: "Book Details Updated Successfully"
        else
            render json: "Book details cannot be updated"
        end
    end
#delete the  book
    def destroy
        bookVal = Book.find(params[:id])
        
        if bookVal.destroy!
            render json: "Book Deleted Successfully"
        else
            render json: "Book does not exist in database"
        end
    end

#delete the new book
 
def book_params
    params.require(:book).permit(:bookName, :bookAuthor, :bookQuantity)
  end


def authorize
    if session[:current_user_id]==nil 
        render html: "User not authenticated"
    end
end
end
