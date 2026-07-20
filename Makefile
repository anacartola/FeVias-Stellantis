# FeVias — run the Oracle schema, seed data and analytical queries.
#
#   make seed    -> start Oracle, load DDL_FeVias.sql then DML_FeVias.sql
#   make query   -> run every file in queries/ and print the results
#   make psql     -> open an interactive SQL*Plus session
#   make down    -> stop the container (keeps the volume)
#   make clean   -> stop the container and delete the volume
#
# The DML file is ISO-8859-1 (Latin-1), so NLS_LANG pins the client charset to
# match; the data files themselves are never edited.

NLS  := AMERICAN_AMERICA.WE8ISO8859P1
CONN := fevias/fevias@localhost:1521/FREEPDB1
EXEC := docker compose exec -T -e NLS_LANG=$(NLS) oracle

.PHONY: up seed query psql down clean

up:
	docker compose up -d
	@echo "Waiting for Oracle to report healthy (first boot can take a few minutes)..."
	@until [ "$$(docker inspect -f '{{.State.Health.Status}}' fevias-oracle 2>/dev/null)" = "healthy" ]; do \
		sleep 5; printf '.'; \
	done; echo " ready."

seed: up
	@echo "== Loading schema (DDL_FeVias.sql) =="
	@$(EXEC) bash -lc "sqlplus -S $(CONN) @/workspace/DDL_FeVias.sql <<< exit"
	@echo "== Loading base data (DML_FeVias.sql) =="
	@$(EXEC) bash -lc "sqlplus -S $(CONN) @/workspace/DML_FeVias.sql <<< exit"
	@echo "== Loading operational layer (DML_FeVias_operacao.sql) =="
	@$(EXEC) bash -lc "sqlplus -S $(CONN) @/workspace/DML_FeVias_operacao.sql <<< exit"
	@echo "== Seed complete =="

query:
	@for f in queries/*.sql; do \
		echo ""; echo "===================================================================="; \
		echo "== $$f"; \
		echo "===================================================================="; \
		$(EXEC) bash -lc "sqlplus -S $(CONN) @/workspace/$$f <<< exit"; \
	done

psql:
	@$(EXEC) sqlplus $(CONN)

down:
	docker compose down

clean:
	docker compose down -v
