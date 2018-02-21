EXTENSION = pgeyes        
DATA = pgeyes--0.0.2.sql \
       sql/tables.sql

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
