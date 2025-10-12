

LDD_VERSION = 5db9d1b4a0f0a7a9947ac11368a7a6d88f356204
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-choc4688.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES 


LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull

#Just going to use the default make targets since there is no 'all' in either Makefile
#*********************************************************
define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS)
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS)
endef


# @D = Build Directory (in this case, the assignment 7 repo)
# Reference:According to Copilot AI, kernel modules should be installed to /lib/modules/$(LINUX_VERSION)/extra/

# 	$(INSTALL) -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra
# 	$(INSTALL) -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/
#*****************************

define LDD_INSTALL_TARGET_CMDS

	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra



	cp $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/ || true
    cp $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/ || true


endef


$(eval $(generic-package))
