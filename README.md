#Age of Empires 2 DE - Data Analysis

Analysing data from the game Age of Empires 2 DE - online ranked matches

Data Source Up to 2021: https://www.kaggle.com/datasets/jerkeeler/age-of-empires-ii-de-match-data

PowerBI Dashboard 1: https://app.powerbi.com/links/xtnoZbiAlF?ctid=73f552bd-ac3f-4bba-adb9-042ab903f40a&pbi_source=linkShare

![PowerBI Dashboard1](https://github.com/silvafilipeuk/aoe2DE-dataanalysis/blob/main/images/dashboard1.png?raw=true)

Excel file with the cleaned data after merging both tables with PowerBI, with data cleaning, pivot tables and a few charts:
https://docs.google.com/spreadsheets/d/122G9esr5TVGOBSrxRQDLYhRs8bRE9LOC/edit?usp=share_link&ouid=108627900205455748572&rtpof=true&sd=true

About Dataset
Context
This data is Age of Empires II DE match data, one of the OG RTS video games. Data is anonymized match level data pulled from aoe2.net with some post-processing to determine match winners and to ensure data integrity. This is the backend data that powers aoestats.io.

Content
Note that due to data integrity issues this is not a comprehensive list of all matches played on the AoE II DE

The data is broken up into two files…

matches.csv

Each row in this file contains a match played between 2 or more players. Matches are categorized by map, rating, and ladder (1v1 or team).

match_players.csv

Each row contains a given player in a match. Meaning each row has a many to one relationship with those in matches.csv. You can figure out which players go with with matches based on the match column (match_players.csv) and token column (matches.csv).
