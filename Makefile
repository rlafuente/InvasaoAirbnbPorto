download_insideairbnb_data:
	rm -rf insideairbnb
	mkdir insideairbnb
	curl http://data.insideairbnb.com/portugal/norte/porto/2019-01-23/data/listings.csv.gz -o insideairbnb/porto_01-2019_listings.csv.gz
	curl http://data.insideairbnb.com/portugal/norte/porto/2018-01-23/data/reviews.csv.gz -o insideairbnb/porto_01-2019_reviews.csv.gz
	curl http://data.insideairbnb.com/portugal/lisbon/lisbon/2018-01-23/data/listings.csv.gz -o insideairbnb/lisbon_01-2019_listings.csv.gz
	curl http://data.insideairbnb.com/portugal/lisbon/lisbon/2018-01-23/data/reviews.csv.gz -o insideairbnb/lisbon_01-2019_reviews.csv.gz
	gzip -d insideairbnb/*gz
	rm -rf insideairbnb/*gz

