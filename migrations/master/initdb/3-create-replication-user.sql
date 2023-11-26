CREATE USER repuser REPLICATION PASSWORD '12345';

GRANT SELECT on filials to repuser;
GRANT SELECT on employees to repuser;
GRANT SELECT on work to repuser;
GRANT SELECT on jobs to repuser;
GRANT SELECT on room_types_names to repuser;
GRANT SELECT on room_types to repuser;
GRANT SELECT on statuses to repuser;
