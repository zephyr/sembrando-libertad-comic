
default: all

all: makepdf makepng

PDFFILES=$(foreach lang, en de-f, SL-vidas_paralelas-${lang}.pdf)

PNGFILES=$(addsuffix .png,$(basename ${PDFFILES}))

clean:
	rm *.pdf *.png

makepdf: ${PDFFILES}

makepng: ${PNGFILES}


%.png: %.svg
	inkscape -w 600 --file=$< --export-png=$@

%.pdf: %.svg
	inkscape --without-gui --file=$< --export-pdf=$@


