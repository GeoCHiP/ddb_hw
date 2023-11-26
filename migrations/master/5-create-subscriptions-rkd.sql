CREATE SUBSCRIPTION sub_rkd_slave_1
CONNECTION 'host=postgres-slave-1 dbname=hotels user=repuser password=12345'
PUBLICATION pub_rkd_slave_1;

CREATE SUBSCRIPTION sub_rkd_slave_2
CONNECTION 'host=postgres-slave-2 dbname=hotels user=repuser password=12345'
PUBLICATION pub_rkd_slave_2;
