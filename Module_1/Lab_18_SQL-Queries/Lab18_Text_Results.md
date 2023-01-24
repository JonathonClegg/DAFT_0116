Lab | My first queries
Please, download the file applestore.csv. Install MySQL/Postgresql on your computer. Create a database Upload the file as a new table of your database

Use the data table to query the data about Apple Store Apps and answer the following questions:

1. What are the different genres?
SELECT DISTINCT prime_genre from ironhack_example.applestore;
'Games'
'Productivity'
'Weather'
'Shopping'
'Reference'
'Finance'
'Music'
'Utilities'
'Travel'
'Social Networking'
'Sports'
'Business'
'Photo & Video'
'Navigation'
'Entertainment'
'Education'
'Lifestyle'
'Food & Drink'
'News'
'Health & Fitness'
'Medical'
'Book'

2. Which is the genre with the most apps rated?
'Games','8717381'

3. Which is the genre with most apps?
'Games','169'

4. Which is the one with least?
'Medical','1'

5. Find the top 10 apps most rated.
'Facebook','2974676'
'Pandora - Music & Radio','1126879'
'Pinterest','1061624'
'Bible','985920'
'Angry Birds','824451'
'Fruit Ninja Classic','698516'
'Solitaire','679055'
'PAC-MAN','508808'
'Calorie Counter & Diet Tracker by MyFitnessPal','507706'
'The Weather Channel: Forecast, Radar & Alerts','495626'

** 6. Find the top 10 apps best rated by users. 

':) Sudoku +','Games','5'
'Daily Audio Bible App','Lifestyle','5'
'Domino\'s Pizza USA','Food & Drink','5'
'Dragon Island Blue','Games','5'
'Fieldrunners 2','Games','5'
'Fragment\'s Note','Games','5'
'Headspace','Health & Fitness','5'
'Infect Them All : Vampires','Games','5'
'J&J Official 7 Minute Workout','Health & Fitness','5'
'Kurumaki Calendar -month scroll calendar-','Productivity','5'



7. Take a look at the data you retrieved in question 5. Give some insights.
- Facebook accounts for 10,9% of all reveiws left.
- The top 10 reviewed apps account for this 36% of total reviews.
- Of those top 10, facebook accounts for 30,2% of all reviews.
- 2 x Social Networking, 4 x Games, 1 x Reference, 1 x Health & Fitness, 1 x Weather, 1 Music
- No Productivity even though it is the 2nd most common genre.


8. Take a look at the data you retrieved in question 6. Give some insights.
- - 5 x Games, 2 x Health & Fitness, 1 x Lifestyle, 1 Food&Drink, 1 x Productivity
-

9. Now compare the data from questions 5 and 6. What do you see?
- Lots of Games are rated and rated well
-


10. How could you take the top 3 regarding both user ratings and number of votes?
Order by number of votes and then order by user rating. You take the You take the 3 apps with the rating 5 and the most votes.
'Plants vs. Zombies','5','426463'
'Domino\'s Pizza USA','5','258624'
'Plants vs. Zombies HD','5','163598'



11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

For each distinct price I will get an average user rating. There does not appear to be any correlation between price and rating. The top rated apps have prices ranging from $8.99 to $19.99. Price then declines with avergae rating and then loses all discernable pattern.

'19.99','4.5'
'8.99','4.5'
'5.99','4.4'
'2.99','4.237704918032787'
'4.99','4.114583333333333'
'6.99','4.0625'
'0.99','4.02906976744186'
'1.99','4.015873015873016'
'249.99','4'
'24.99','4'
'0','3.83710407239819'
'9.99','3.8333333333333335'
'3.99','3.787878787878788'
'7.99','3.5625'
'13.99','3.5'
'14.99','3.5'

If anyting cheaper apps have a worse rating based on the average price per rating.

'0','3.848571428571429'
'4','3.7943181818181873'
'5','2.492000000000001'
'4.5','2.271004784688999'
'3.5','1.5527848101265815'
'2.5','1.4966666666666668'
'3','1.240888888888889'
'1','0.99'
'2','0.596'
'1.5','0'


