# Analyzing-the-Effect-of-Retail-Foot-Traffic-on-Business-Success

Please see the presentation above for a full breakdown of the analysis and supplemental graphs - plus key takeaways.

*Note: Due to GitHub file size limitations the Yelp database file and the Tableau packaged workbooks can be accessed through the provided Google Drive links below.*

---

**Data Sourcing:**
- Yelp Database: [yelp.sql](https://drive.google.com/file/d/1_XKWzgsuMtcyuvf2OSon0wErmOe-V0uI/view?usp=sharing)
- Retail Foot Traffic Database: [United States Retail Foot Traffic Data - Constellation Network](https://app.snowflake.com/marketplace/listing/GZT1ZVTYF7/constellation-network-united-states-retail-foot-traffic-data?search=US%20state%20econ&pricing=free)

---

This project combines the Yelp database with the retail foot traffic database in Snowflake and uses SQL queries and analysis to derive 3 main takeaways on the relationship between retail foot traffic and business success. Each query output was downloaded and used in either Python or Tableau to create the supporting graphs for the presentation above.

By far the most difficult part of this project was utilizing the retail foot traffic database, which is in json format. This means that every bit of SQL code needed to be adapted to work with the json structure. For example, the query needed to reference the json_data type before calling any column names. Furthermore, views were not allowed in Snowflake with this database, so what typically would be done in 2-3 SQL queries instead needed to be combined into one. This took careful planning and strategy.

The data table output of each query was downloaded and used in either Python or Tableau in order to create the graphs to answer the hypotheses. Each query output was designed to answer a particular business question - which is showcased in the presentation above.

The Python code is uploaded above with the corresponding slide number in the title.

Due to GitHub max file sizes, the Tableau Graphs - with the corresponding slide number in the title - can be found here:
- [rft vs dow (slide 8)](https://drive.google.com/file/d/10YEJB1uIMLLUOyCaObKlR-6KDiq8gpDg/view?usp=sharing)
- [reviewCount vs dow (slide 9)](https://drive.google.com/file/d/1Fxsu2NQEjdyI5v-TuLcKb5-K0h-opuM8/view?usp=sharing)
- [rft vs category (slide 17 - 2 graphs)](https://drive.google.com/file/d/1PxRc3OeDXbYOGAYAPzSppL0PGOWK91L-/view?usp=sharing)

---

**Key Takeaways:**
- Businesses grow in popularity on Yelp - meaning they receive more reviews - as a delayed result - roughly a day - of increased local retail foot traffic.
- Businesses tend to close more often during the winter than other seasons, seemingly not as a result of retail foot traffic - likely instead correlated with the end of the fiscal year.
- A business category with high average retail foot traffic does not result in more reviews and longer business longevity. There are likely other business factors that impact these averages.

