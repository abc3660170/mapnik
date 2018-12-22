FROM abc3660170/boost:latest
RUN yum install freetype-devel libtool-ltdl-devel libpng-devel libtiff-devel libjpeg-devel python-devel harfbuzz-devel postgresql-devel proj-devel proj-epsg sqlite-devel libwebp-devel gdal-devel cairo-devel -y
RUN yum install git -y
WORKDIR /usr/local/src
RUN git clone -b v3.0.12 git://github.com/mapnik/mapnik.git
WORKDIR /usr/local/src/mapnik
RUN git submodule update --init
RUN python scons/scons.py configure | more
RUN python scons/scons.py JOBS=4
RUN python scons/scons.py install
RUN mapnik-config -v
RUN ldconfig

