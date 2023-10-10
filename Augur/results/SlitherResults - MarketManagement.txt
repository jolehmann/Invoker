Contract MarketManagement
+---------------+-------------+
|    Variable   | Influencers |
+---------------+-------------+
| marketCounter |      []     |
|    markets    |      []     |
+---------------+-------------+
+-------------------+---------------------------+
|      Function     | Internal & External Calls |
+-------------------+---------------------------+
| createNewMarket() |             []            |
+-------------------+---------------------------+
Function createNewMarket()
+--------------------------------+----------------+
|            Variable            |  Influencers   |
+--------------------------------+----------------+
| MarketManagement.marketCounter |       []       |
|    MarketManagement.markets    | ['msg.sender'] |
+--------------------------------+----------------+
