all : 
	$(MAKE) -C ./c
	$(MAKE) -C ./julia


.PHONY : clean


clean : 
	$(MAKE) clean -C ./c
	$(MAKE) clean -C ./julia
