FROM docker.elastic.co/elasticsearch/elasticsearch:7.5.0
COPY ./elasticsearch/config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
ENV discovery.type=single-node
ENV ES_JAVA_OPTS="-Xmx512m -Xms512m"