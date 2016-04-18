FROM continuumio/miniconda
ENV LC_ALL=C

RUN apt-get update --fix-missing \
  && apt-get install -y libfreetype6 libfontconfig \
  && apt-get clean

RUN conda install -yn root \
  conda-build==1.20.0 \
  conda==4.0.5

WORKDIR /opt/nb_anacondcloud

COPY . /opt/nb_anacondcloud/
RUN conda build conda.recipe \
  -c anaconda-nb-extensions/label/dev \
  -c javascript
