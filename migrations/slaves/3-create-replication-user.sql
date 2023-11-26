CREATE USER repuser REPLICATION PASSWORD '12345';

GRANT SELECT on rooms to repuser;
GRANT SELECT on bookings to repuser;
GRANT SELECT on livings to repuser;
