
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
LDD_AESD_ASSIGNMENTS_VERSION = 20d4ef43527a35bd65be91a7148d42911b35cd7e
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignment-7-HardikMinochaESE.git
LDD_AESD_ASSIGNMENTS_SITE_METHOD = git
LDD_AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define LDD_AESD_ASSIGNMENTS_BUILD_CMDS
	# Build commands for misc-modules and scull components from the assignment-7 repositories.
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull all
endef


# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	
	# Added install commands for finder.sh, finder-test.sh and writer (executable)
	$(INSTALL) -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull.o $(TARGET_DIR)/usr/bin

endef

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

ifeq ($(BR2_PACKAGE_LDD),y)
LDD_DEPENDENCIES += libbar
LDD_CONF_OPTS += --enable-bar
LDD_MODULE_SUBDIRS += misc-modules
else
LDD_CONF_OPTS += --disable-bar
endif


$(eval $(kernel-module))
$(eval $(generic-package))

