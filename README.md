# *\*Incomplete\** Analyzing-the-Effect-of-Retail-Foot-Traffic-on-Business-Success

Please see the presentation above for a full breakdown of the analysis and supplemental graphs - plus key takeaways.

---

**Data Sourcing:**
- Yelp Database: In the files above - *to replicate upload into Snowflake*
- Retail Foot Traffic Database: [United States Retail Foot Traffic Data - Constellation Network](https://app.snowflake.com/marketplace/listing/GZT1ZVTYF7/constellation-network-united-states-retail-foot-traffic-data?search=US%20state%20econ&pricing=free)

---

This project combines the Yelp database with the retail foot traffic database in Snowflake and uses SQL queries and analysis to derive 3 main takeaways on the relationship between retail foot traffic and business success. Each query output was downloaded and used in either Python or Tableau to create the supporting graphs for the presentation above.

By far the most difficult part of this project was utilizing the retail foot traffic database, which is in json format. This means that every bit of SQL code needed to be adapted to work with the json structure. For example, the query needed to reference the json_data type before calling any column names. Furthermore, views were not allowed in Snowflake with this database, so what typically would be done in 2-3 SQL queries instead needed to be combined into one. This took careful planning and strategy.

The data table output of each query was downloaded and used in either Python or Tableau in order to create the graphs to answer the hypotheses. Each query output was designed to answer a particular business question - which is showcased in the presentation above.

---

**Key Takeaways:**
