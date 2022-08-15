class StocksController < ApplicationController
    def search
        #chking if some thing is entered or not
        if params[:stock].blank?
            flash.now[:danger] = "You have entered an empty search string"
        else
            @stock =  Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
        end
        respond_to do |format|
            format.js { render partial: 'users/results' }
        end
    end


end
