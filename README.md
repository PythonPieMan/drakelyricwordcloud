# Drake Lyric Wordcloud
A wordcloud of most commonly used words in Drake's lyrics (shaped like Drake)

Love him or hate him, Drake will no doubt be remembered as one of the most influential hip-hop artists of the late aughts, 2010s, and 2020s. Here, I have explored a data set from Kaggle containing lyrics from his early mixtapes like 'Room for Improvement' and 'Comeback Season' to work as recent as 'Certified Lover Boy'.

![roomforimprovement](https://user-images.githubusercontent.com/45649741/218007587-1aa8952d-bff2-4035-bcf6-1e8b51cdf5fd.jpg)
![certifiedloverboy](https://user-images.githubusercontent.com/45649741/218007890-b57c60b5-fe49-45cc-99a2-15d166906581.jpg)

-------------------------------
# Document-Term Matrix

My analysis was performed in R, using libraries such as 'rtweet', 'tm', 'NLP', and 'ggplot2' among others. First, I began by cleaning the tweets. This entailed removal of stopwords, urls, blank spaces, and anything other than english letters. I then created a Document-Term matrix which I used to assess the frequencies of words used. In this case, the top five most frequent terms were 'know' (1423), 'yeah' (possibly from his excess use of this as an adlib, 1184), 'n-word' (811), 'drake' (752), 'love' (634), and 'sh--' (poop synonym word, 610).

<img width="502" alt="drakedocumenttermmatrix" src="https://user-images.githubusercontent.com/45649741/218010521-141b7aa9-b626-49e3-bd29-60c33faafa92.PNG">

-------------------------------
# Rendering the Wordcloud

Finally, I made use of the 'wordcloud2' package to render the cloud. Wordcloud2 was ideal for this mini-project because I wanted to get very meta with it and populate the cloud in the shape of Drake's 'Nothing Was The Same' head-in-the-clouds side profile. Using the 'figPath' argument in the library allowed for this perfectly. 

Here is the result. Hope you enjoy.

https://user-images.githubusercontent.com/45649741/218012142-efc360e4-3f90-4491-96e9-824d5601c55a.mp4

![Screenshot_20230209-210320_Gallery](https://user-images.githubusercontent.com/45649741/218012221-6bce84f9-36f2-4318-a901-81b564ac05f2.jpg)
