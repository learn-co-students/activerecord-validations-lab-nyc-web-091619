class AuthorsController < ApplicationController

    def index
        @authors = Author.all
    end

    def new
        @author = Author.new
    end

    def create
        @author = Author.new(author_params)
        
        if @author.save
            redirect_to author_path(@author)
        else
            redirect_to new_author_path
        end

    end


    private

    def author_params
        params.require(:author).permit(:name, :phone_number, :post_id)
    end



end
