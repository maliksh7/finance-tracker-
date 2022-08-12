class StocksController < ApplicationController
    def search
        #chking if some thing is entered or not
        if params[:stock].present?
            @stock =  Stock.new_from_lookup(params[:stock])
            # chking if correct string is entered or not
            if @stock
                # render partial: 'users/results'
                respond_to do |format|
                    format.js { render partial: 'users/results' }
                end
            else
                flash[:warning] = "You have entered an incorrect search string"
                redirect_to my_portfolio_path
            end
        else 
            flash[:danger] = "You have entered an empty search string"
            redirect_to my_portfolio_path
        end
    end
end
