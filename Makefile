URL=http://lab.hakim.se/reveal-js
REPO=https://github.com/hakimel/reveal.js/archive/master.zip
THEME=nci
#FLAGS=-f rst -t revealjs -V revealjs-url=./reveal.js
#FLAGS=-s --highlight-style=zenburn -f rst -t revealjs -V revealjs-url=./reveal.js
FLAGS=-s \
	  -f rst -t revealjs \
	  --slide-level=2 \
	  -V revealjs-url=./reveal.js \
	  -V theme=${THEME} \
	  --template=default.revealjs

all: course.html reveal.js

reveal.js:
	wget -N ${REPO}
	unzip master.zip
	mv reveal.js-master reveal.js

course.html: course.txt
	pandoc ${FLAGS} $^ -o $@

clean:
	rm -f course.html 
