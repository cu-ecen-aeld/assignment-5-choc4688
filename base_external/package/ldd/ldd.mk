

LDD_VERSION = 5db9d1b4a0f0a7a9947ac11368a7a6d88f356204
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-choc4688.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES 
 

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull


#Reference: Copilot AI - Need to run depmod when building the image rather than at runtime on the image for modprobe to work
#The 3 lines below are from Copilot AI:
define LDD_INSTALL_TARGET_CMDS
    $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
endef


$(eval $(kernel-module))
$(eval $(generic-package))
