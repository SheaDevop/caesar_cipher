def stock_picker(stock_prices)
    raise 'Only arrays allowed' unless stock_prices.instance_of?(Array)
    biggest_profit = 0
    most_profitable_days = [nil, nil]
    stock_prices.each_with_index do |starting_price, buy_day|
        stock_prices.each_with_index do |final_price, sell_day|
            next if sell_day <= buy_day
            if final_price - starting_price >= biggest_profit
                biggest_profit = final_price - starting_price
                most_profitable_days[0] = buy_day
                most_profitable_days[-1] = sell_day
            end
        end
    end
    most_profitable_days
end