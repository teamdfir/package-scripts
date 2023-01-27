prebuild-%:
	docker build -t sift-builder-liblightgrep-$* -f Dockerfile.$* .

package-%:
	docker run -it --rm sift-builder-liblightgrep-$* bash build-package.sh

upload-%:
	docker run -it --rm -e DISTRIBUTION=$* sift-builder-liblightgrep-$* bash upload-source.sh

shell-%:
	docker run -it --rm sift-builder-liblightgrep-$* /bin/bash
