FID=900
TYP=M00000.typ

altmatt.osm:
	curl --compressed -o altmatt-raw.osm 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=6.80,48.00,7.34,48.09'
#	wget 'http://www.overpass-api.de/api/xapi?map?bbox=6.99,48.01,7.13,48.06[@meta]' -O altmatt-raw.osm
	./name-ways-with-type < altmatt-raw.osm > altmatt.osm
#	rm -f altmatt-raw.osm

altmatt: altmatt.osm
	NAME=altmatt-osm
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile altmatt.osm altmatt-fixme.osm 73910003.img	$(TYP)
	
dc14.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=-122.70,45.50,-122.66,45.54'

neuch.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=6.89,46.97,6.97,47.01'

bono.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=-2.97,47.62,-2.92,47.64'

ramon.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=6.70,47.86,6.77,47.91'

edimbourg.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=-3.25,55.92,-3.20,55.93'

montpellier.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=3.87,43.60,3.9,43.62'

grenoble.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=5.67,45.14,5.85,45.23'

denver.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=-105.01,39.73,-104.96,39.75'

paris.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=2.25,48.81,2.42,48.91'

nice.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=7.18,43.64,7.33,43.77'

bruxelles.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=4.24,50.78,4.53,50.92'

gesse.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=6.77,47.92,7.01,48.09'

chan.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=6.33,47.90,6.70,48.04'

guangzhou.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=113.10,23.02,113.45,23.24'

gesse: gesse.osm
	NAME=gesse-osm
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile gesse.osm gesse-fixme.osm 73910003.img	$(TYP)
	cp gmapsupp.img gesse.img

chan: chan.osm
	NAME=chan-osm
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile chan.osm 73910003.img	$(TYP)
	cp gmapsupp.img chan.img


s2507.osm:
	curl --compressed -o $@ 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=7.02,48.03,7.21,48.12'


holandsbourg.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=7.12,47.93,7.31,48.08[@meta]' -O $@

bxl.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=4.248,50.769,4.491,50.923[@meta]' -O $@

gre.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=5.69,45.16,5.78,45.21[@meta]' -O $@

all: haye

bdx.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=-0.62,44.8,-0.54,44.86[@meta]' -O $@

lille.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=-3.035,50.597,3.174,50.634[@meta]' -O $@

parisest.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=2.348156,48.8727318,2.401371,48.9026998[@meta]' -O $@


nantes.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=-1.63,47.18,-1.45,47.31[@meta]' -O $@

rennes.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=-1.70,48.10,-1.64,48.13[@meta]' -O $@

lugano.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=8.9,45.98,9.01,46.04[@meta]' -O $@

%.img: %.osm
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile $< 
	mv gmapsupp.img $@


haye.osm:
	curl --compressed -o haye-raw.osm 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=5.96,48.6,6.18,48.73'
	./name-ways-with-type < haye-raw.osm > haye.osm
	rm -f haye-raw.osm

vaumarcus.osm:
	curl --compressed -o vaumarcus-raw.osm 'http://api.openstreetmap.fr/xapi-without-meta?map?bbox=6.6,46.8,6.95,47.02'
	./name-ways-with-type < vaumarcus-raw.osm > vaumarcus.osm
	rm -f vaumarcus-raw.osm


veyrier.osm:
	wget 'http://www.overpass-api.de/api/xapi?map?bbox=6.15,45.86,6.22,45.93[@meta]' -O veyrier-raw.osm
	./name-ways-with-type < veyrier-raw.osm > veyrier.osm

munster: munster.osm
	NAME=munster-osm
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile munster.osm 73910003.img	$(TYP)

# 73910003.img is the only contour file needed for alsace/lorraine, stolen from openmtbmap.org.
vaumarcus: vaumarcus.osm
	NAME=haye-osm
	./gmt -wy $(FID) $(TYP)
	java -jar -Xmx2048M mkgmap.jar --latin1 --family-id=$(FID) --show-profiles=1 --route --add-pois-to-areas --index --product-id=1 --description=$(MYMAP) --series-name=$(MYMAP) --family-name=$(MYMAP) --gmapsupp --tdbfile vaumarcus.osm 73270006.img $(TYP)

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

