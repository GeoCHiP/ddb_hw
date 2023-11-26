## Docker compose

### Start with make

```bash
make
```

### Start manually

```bash
docker compose up -d
psql -f migrations/master/5-create-subscriptions-rkd.sql "postgres://hotels:123@localhost:8000/hotels"
psql -f migrations/slaves/slave-1/5-create-subscription-rok-slave-1.sql "postgres://hotels:123@localhost:8001/hotels"
psql -f migrations/slaves/slave-2/5-create-subscription-rok-slave-2.sql "postgres://hotels:123@localhost:8002/hotels"
```

### Connect to the db

postgres-master:
```bash
docker compose exec postgres-master psql --user hotels
```

postgres-slave-1:
```bash
docker compose exec postgres-slave-1 psql --user hotels
```

postgres-slave-2:
```bash
docker compose exec postgres-slave-2 psql --user hotels
```
