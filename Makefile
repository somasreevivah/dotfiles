
INIT_DIR = init
init: 
		@for script in $(INIT_DIR); do \
			bash $$script; \
		done


