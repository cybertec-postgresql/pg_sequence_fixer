EXTENSION = pg_sequence_fixer
DATA = pg_sequence_fixer--*.sql
DOCS = README.md

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
