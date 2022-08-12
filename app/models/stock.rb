class Stock < ApplicationRecord
    # To globally initialize StockQuote with a valid API_KEY
    StockQuote::Stock.new(api_key: 'pk_d0041e85c289498a915a9a31354fd25c')

    def self.new_from_lookup(ticker_symbol)
        begin
            look_up_stock = StockQuote::Stock.quote(ticker_symbol)
            price = look_up_stock.latest_price
            new(name: look_up_stock.company_name, ticker: look_up_stock.symbol, last_price: price)
        rescue Exception => e
            return nil 
        end
    end

    # def self.strip_commas(number)
    #     number.gsub(",","")
    # end
end
