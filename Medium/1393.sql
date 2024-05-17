SELECT stock_name, SUM(CASE operation WHEN 'Buy' THEN price*(-1) ELSE price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name
