
default: all

all: langde pdf png

PDFFILES=$(foreach lang, en de de-f, SL-vidas_paralelas-${lang}.pdf)

PNGFILES=$(addsuffix .png,$(basename ${PDFFILES}))

clean:
	rm *.pdf *.png SL-vidas_paralelas-de.svg

langde: # The next command really hurts me ;)
	sed 's/ſ/s/g' SL-vidas_paralelas-de-f.svg >SL-vidas_paralelas-de.svg

pdf: ${PDFFILES}

png: ${PNGFILES}

%.png: %.svg
	inkscape -w 600 --file=$< --export-png=$@

%.pdf: %.svg
	inkscape --without-gui --file=$< --export-pdf=$@

