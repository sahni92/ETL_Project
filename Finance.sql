-- Create database Finance_db 
CREATE DATABASE finance_db;
USE finance_db;
-- Create Table to store the Moving Average for all the tickers in our Database
CREATE TABLE year_avg_data AS
    Select (CAST(AVG(adj_close) AS DECIMAL(10,2))) AS "Average_Price" , Year, ticker
	FROM yearly_stock_data
	GROUP BY Year, ticker
	ORDER BY ticker;

    Select * 
    FROM year_avg_data;
-- Create the Final Table with the Fundamental data for each ticker and the Average Price per year.

CREATE TABLE combined_data AS
	SELECT fundamental_stock_data.Ticker,fundamental_stock_data.Year,fundamental_stock_data.Revenue,fundamental_stock_data.Assets,fundamental_stock_data.Liabilities,fundamental_stock_data.Equity,year_avg_data.Average_Price
	FROM fundamental_stock_data
	INNER JOIN year_avg_data
	ON fundamental_stock_data.Ticker = year_avg_data.ticker AND fundamental_stock_data.Year = year_avg_data.Year;
   
    Select * 
    FROM combined_data;