LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Compile (L)ittle (K)ernel bootloader and the nandwrite utility
#----------------------------------------------------------------------
#ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)

#TARGET_BOOTLOADER_PLATFORM_OVERRIDE := $(TARGET_PRODUCT)

# Compile
#include bootable/bootloader/lk/AndroidBoot.mk

#$(INSTALLED_BOOTLOADER_MODULE): $(TARGET_EMMC_BOOTLOADER) | $(ACP)
#	$(transform-prebuilt-to-target)
#$(BUILT_TARGET_FILES_PACKAGE): $(INSTALLED_BOOTLOADER_MODULE)

#droidcore: $(INSTALLED_BOOTLOADER_MODULE)
#endif

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
#ifeq ($(KERNEL_DEFCONFIG),)
#    KERNEL_DEFCONFIG := fairphone_defconfig
#endif

#include kernel/fairphone/AndroidKernel.mk

#$(INSTALLED_KERNEL_TARGET): $(TARGET_PREBUILT_KERNEL) | $(ACP)
#	$(transform-prebuilt-to-target)

ifeq ($(strip $(BOARD_HAS_ATH_WLAN_AR6004)),true)
include $(CLEAR_VARS)
LOCAL_MODULE       := wpa_supplicant_ath6kl.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := wifi/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)
endif

ifeq ($(strip $(BOARD_HAS_QCOM_WLAN)),true)
include $(CLEAR_VARS)
LOCAL_MODULE       := wpa_supplicant_overlay.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := wifi/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := p2p_supplicant_overlay.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := wifi/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)

#Create symbolic links
#$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
#	ln -sf /persist/WCNSS_qcom_wlan_nv.bin \
#	$(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
#	ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
#	$(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini)

endif
#----------------------------------------------------------------------
# Radio image
#----------------------------------------------------------------------
ifeq ($(ADD_RADIO_FILES), true)
radio_dir := $(LOCAL_PATH)/radio
RADIO_FILES := $(shell cd $(radio_dir) ; ls)
$(foreach f, $(RADIO_FILES), \
    $(call add-radio-file,radio/$(f)))
endif

#----------------------------------------------------------------------
# extra images
#----------------------------------------------------------------------
#ifeq (, $(wildcard vendor/qcom/build/tasks/generate_extra_images.mk))
include build/core/generate_extra_images.mk
#endif
