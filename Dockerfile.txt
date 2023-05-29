FROM efsouza/webgis:base_ufpr-latest
ENV PROJECT=GIS_Project
ENV VIRTUAL_ENV_PATH=/opt/venv/$PROJECT

COPY . /code

WORKDIR /code
RUN apt install libgdal-dev -y 
RUN . $VIRTUAL_ENV_PATH/bin/activate && \
    pip install --upgrade pip && \
    pip install wheel numpy fiona && \
    #pip install GDAL=="$(gdal-config --version).*" && \
    pip install -r requirements.txt
    
#Expoe a porta 8000 para acesso externo
EXPOSE 8050

CMD [ "python3" ]