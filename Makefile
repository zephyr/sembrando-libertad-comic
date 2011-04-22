
default: makepdf

PDFFILES=$(foreach lang, en de-f, SL-vidas_paralelas-${lang}.pdf)


makepdf: ${PDFFILES}

%.pdf: %.svg
	inkscape --without-gui --file=$< --export-pdf=$@
