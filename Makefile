.PHONY: all start clean

all: start

clean:
	docker compose down -v
	sudo rm -rf ./volumes

start:
	docker compose up -d

	sleep 4

	psql -f migrations/master/5-create-subscriptions-rkd.sql "postgres://hotels:123@localhost:8000/hotels"
	psql -f migrations/slaves/slave-1/5-create-subscription-rok-slave-1.sql "postgres://hotels:123@localhost:8001/hotels"
	psql -f migrations/slaves/slave-2/5-create-subscription-rok-slave-2.sql "postgres://hotels:123@localhost:8002/hotels"
