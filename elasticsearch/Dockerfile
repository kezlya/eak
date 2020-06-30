FROM docker.elastic.co/elasticsearch/elasticsearch:7.8.0
COPY ./config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
ENV discovery.type=single-node
ENV ES_JAVA_OPTS="-Xmx1g -Xms1g"