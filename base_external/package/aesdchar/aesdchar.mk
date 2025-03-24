
##############################################################
#
# AESDCHAR
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
AESDCHAR_VERSION = d2d7d90003148aad181b3ee161d4ebc61c4fa9c9
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-HardikMinochaESE.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver
AESDCHAR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESDCHAR_INSTALL_TARGET_CMDS
	
	# Added install commands for finder.sh, finder-test.sh and writer (executable)
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
	
endef

$(eval $(kernel-module))
$(eval $(generic-package))

