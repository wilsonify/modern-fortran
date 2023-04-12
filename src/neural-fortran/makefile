cdver_file = echo "1.0.0" > $(1) && date +%Y-%m-%d >> $(1)
all: clean build/neural-fortran.txt

clean:
	rm -rf build
	rm -rf dist	

build/VERSION.txt:
	mkdir -p build && $(call ver_file, $@)

dist/VERSION.txt:
	mkdir -p dist && $(call ver_file, $@)

build/neural-fortran-base.txt: build/VERSION.txt
	docker build --progress=plain -f Dockerfile-base -t neural-fortran-base:latest . && $(call ver_file, $@)

build/neural-fortran-builder.txt:  build/neural-fortran-base.txt
	docker build --progress=plain -f Dockerfile-builder -t neural-fortran-builder:latest . && $(call ver_file, $@)

build/neural-fortran.txt: build/neural-fortran-builder.txt
	docker build --progress=plain -f Dockerfile -t neural-fortran:latest . && $(call ver_file, $@)

docker-run: build/neural-fortran.txt
	docker run --rm --name nf -i -t neural-fortran-builder:latest /bin/bash

download:
	curl -LO https://github.com/neural-fortran/keras-snippets/files/9667603/keras_reshape.tar.gz
	curl -LO https://github.com/neural-fortran/keras-snippets/files/8788739/keras_dense_mnist.tar.gz
	curl -LO https://github.com/neural-fortran/keras-snippets/files/8788739/keras_dense_mnist.tar.gz
	curl -LO https://github.com/neural-fortran/keras-snippets/files/8788739/keras_dense_mnist.tar.gz
	curl -LO https://github.com/neural-fortran/keras-snippets/files/8892585/keras_cnn_mnist.tar.gz