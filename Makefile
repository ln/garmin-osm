FID=900
TYP=mtb.TYP

all:
	haye

haye.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=5.975,48.61,6.1442,48.729[@meta]' -O haye-raw.osm
	./name-ways-with-type < haye-raw.osm > haye.osm
	rm -f haye-raw.osm

# 73910003.img is the only contour file needed for alsace/lorraine
haye: haye.osm
	NAME=haye-osm
#	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile haye.osm haye-fixme.osm 73910003.img
#	$(TYP)

clean:
	rm -f gmapsupp.img haye.osm 6*img osmmap*

.PHONY: haye

