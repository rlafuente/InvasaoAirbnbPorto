download_insideairbnb_data:
	rm -rf insideairbnb
	mkdir insideairbnb
	curl http://data.insideairbnb.com/portugal/norte/porto/2018-11-19/data/listings.csv.gz -o insideairbnb/porto_11-2018_listings.csv.gz
	curl http://data.insideairbnb.com/portugal/norte/porto/2018-11-19/data/reviews.csv.gz -o insideairbnb/porto_11-2018_reviews.csv.gz
	curl http://data.insideairbnb.com/portugal/lisbon/lisbon/2018-11-19/data/listings.csv.gz -o insideairbnb/lisbon_11-2018_listings.csv.gz
	curl http://data.insideairbnb.com/portugal/lisbon/lisbon/2018-11-19/data/reviews.csv.gz -o insideairbnb/lisbon_11-2018_reviews.csv.gz
	gzip -d insideairbnb/*gz
	rm -rf insideairbnb/*gz