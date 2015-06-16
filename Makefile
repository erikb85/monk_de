all:
	@python3 monk_de.py >result.sh
	@chmod 755 result.sh
	@./result.sh
