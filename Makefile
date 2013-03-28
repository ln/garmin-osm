FID=900
TYP=M00000.typ

holandsbourg.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=7.12,47.93,7.31,48.08[@meta]' -O $@

bxl.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=4.248,50.769,4.491,50.923[@meta]' -O $@

gre.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=5.69,45.16,5.78,45.21[@meta]' -O $@

all: haye

bdx.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=-0.62,44.8,-0.54,44.86[@meta]' -O $@

nantes.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=-1.63,47.18,-1.45,47.31[@meta]' -O $@


%.img: %.osm
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile $< 
	mv gmapsupp.img $@


haye.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=5.96,48.6,6.18,48.73[@meta]' -O haye-raw.osm
	./name-ways-with-type < haye-raw.osm > haye.osm
	rm -f haye-raw.osm

munster.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=7.04,48.02,7.13,48.056[@meta]' -O munster-raw.osm
	./name-ways-with-type < munster-raw.osm > munster.osm
#	rm -f munster-raw.osm


veyrier.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=6.15,45.86,6.22,45.93[@meta]' -O veyrier-raw.osm
	./name-ways-with-type < veyrier-raw.osm > veyrier.osm

munster: munster.osm
	NAME=munster-osm
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile munster.osm 73910003.img	$(TYP)


# 73910003.img is the only contour file needed for alsace/lorraine, stolen from openmtbmap.org.
haye: haye.osm
	NAME=haye-osm
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile haye.osm haye-fixme.osm 73910003.img	$(TYP)

luxembourg: luxembourg.osm
	NAME=luxembourg
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile luxembourg.osm

veyrier: veyrier.osm
	NAME=veyrier
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile veyrier.osm $(TYP)


clean:
	rm -f gmapsupp.img haye.osm 6*img osmmap* munster.osm

.PHONY: haye munster

