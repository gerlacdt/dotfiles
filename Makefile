.PHONY: stow unstow

stow:
	stow --verbose --target=${HOME} --restow */

unstow:
	stow --verbose --target=${HOME} --delete */
