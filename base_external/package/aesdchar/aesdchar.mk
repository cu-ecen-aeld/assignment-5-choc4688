


AESDCHAR_VERSION = 6c99ccb9ab7bbcf8cc5f83157bdbfb20a8b0df74
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-choc4688.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES 
 

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver


#Reference: Copilot AI - Need to run depmod when building the image rather than at runtime on the image for modprobe to work
#The 3 lines below are from Copilot AI:
define AESDCHAR_INSTALL_TARGET_CMDS
    $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
endef


$(eval $(kernel-module))
$(eval $(generic-package))
