URL=http://lab.hakim.se/reveal-js
REPO=https://github.com/hakimel/reveal.js/archive/master.zip
THEME=nci
FLAGS=-s \
	  -f rst -t revealjs \
	  --slide-level=2 \
	  -V revealjs-url=./reveal.js \
	  -V theme=${THEME} \
	  -V slideNumber=true \
	  --template=default.revealjs \
	  --no-highlight

all: course.html reveal.js

reveal.js:
	wget -N ${REPO}
	unzip master.zip
	mv reveal.js-master reveal.js
	cp nci.css reveal.js/css/theme/

course.html: course.txt
	pandoc ${FLAGS} $^ -o $@

clean:
	rm -f course.html 
