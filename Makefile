-include packages.mk

install:
	@echo "Stowing Packages:"
	@echo $(PACKAGES)
	@stow $(PACKAGES)
	@echo "Bootstrapping plug.vim"
	@curl -fLso 'nvim/.nvim/autoload/plug.vim' --create-dirs\
		'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	@echo "Installing vim-plug Packages"
	@nvim -c "PlugUpdate" -c "qa" > /dev/null
	@rm packages.mk

clean:
	@echo "Unstowing Packages:"
	@echo $(PACKAGES)
	@stow -D $(PACKAGES)
	@rm packages.mk

packages.mk:
	@awk '{print "PACKAGES+=" $$0;}' packages > packages.mk
