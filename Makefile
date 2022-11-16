# =============================================================================
#  Author:	Mikimoto / mikimoto (at) deepthought.com.tw
#  Blog:	https://mikimoto.github.io
#  Filename:	Makefile
#  Modified:	2022-11-13 22:52
#  Description: Install vim config with Make.
#  Reference: 
# =============================================================================

.PHONY: all main backup install update clean clean-backup-file check	\
	yaml_check travis_check

TIMESTAMP=`date "+%Y-%m-%d-%H:%M:%S"`
FILE_VIMRC=${HOME}/.vimrc
DIR_VIM=${HOME}/.vim
DIR_VIM_BAK=${HOME}/.vim.bak-${TIMESTAMP}
DEIN_TARGET=~/.vim/bundle/repos/github.com/Shougo/dein.vim

main: update

all: backup install

backup:
	@echo "============================================================"
	@echo " Backup original vimrc ..."
	mkdir	${DIR_VIM_BAK}
	mv		${FILE_VIMRC}	${DIR_VIM_BAK}/
	mv    	${DIR_VIM}      ${DIR_VIM_BAK}/
	@echo " Backup setting success."
	@echo "============================================================"

install:
	@echo "============================================================"
	@echo " Copy vimrc ..."
	cat vimrc > ${FILE_VIMRC}
	mkdir -p      ${DIR_VIM}/
	cp -r _vim/*  ${DIR_VIM}/

	@echo " Install dein.vim ..."
ifneq ("$(wildcard ${DEIN_TARGET})","")
	# Target of "${DEIN_TARGET}" is exist, ignore ...
else
	mkdir -p ${DEIN_TARGET}
	git clone https://github.com/Shougo/dein.vim ${DEIN_TARGET}
endif

	@echo " Install plugins ..."
	vim -c "try | call dein#install() | finally | qall! | endtry" -Ne

	@echo "Done."
	@echo "============================================================"

update:
	@echo "============================================================"
	@echo " Update plugins ..."
	vim -c "try | call dein#update() | finally | qall! | endtry" -Ne

	@echo "Done."
	@echo "============================================================"

clean:
	@echo "============================================================"
	@echo " Starting cleaning vim file ..."
	rm -f ${FILE_VIMRC}
	rm -rf ${DIR_VIM}

	@echo ' Done.'
	@echo "============================================================"

clean-backup-file:
	@echo "============================================================"
	@echo " Starting cleaning vim's backup file ..."
	rm -rf ${HOME}/.vim_bak*

	@echo " Done."
	@echo "============================================================"
