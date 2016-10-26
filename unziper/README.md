# Untar Container

This is a small container to get a tar.gz file from an url then uncompress it. 

## Usage

- Build the container `docker build -t untar_container .`
- Run the process `docker run --rm -it -v $(pwd)/uncompressed -e URL_TO_GET=URL_TO_TAR_FILE untar_container`