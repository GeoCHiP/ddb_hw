CREATE SUBSCRIPTION sub_rok_slave_1
CONNECTION 'host=postgres-master dbname=hotels user=repuser password=12345'
PUBLICATION pub_rok;
