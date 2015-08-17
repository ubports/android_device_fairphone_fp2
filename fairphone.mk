TARGET_USES_QCOM_BSP := true
TARGET_USES_QCA_NFC := other

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

#TARGET_DISABLE_DASH := true
#TARGET_DISABLE_OMX_SECURE_TEST_APP := true

# media_profiles and media_codecs xmls for 8974
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/fairphone_devices/fairphone/media/media_profiles_8974.xml:system/etc/media_profiles.xml \
                      device/fairphone_devices/fairphone/media/media_codecs_8974.xml:system/etc/media_codecs.xml
endif  #TARGET_ENABLE_QC_AV_ENHANCEMENTS

$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := fairphone
PRODUCT_DEVICE := fairphone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-fairphone

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/fairphone_devices/fairphone/audio_policy.conf:system/etc/audio_policy.conf \
    device/fairphone_devices/fairphone/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/fairphone_devices/fairphone/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/fairphone_devices/fairphone/mixer_paths_auxpcm.xml:system/etc/mixer_paths_auxpcm.xml

PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Feature definition files for 8974
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

#battery_monitor
PRODUCT_PACKAGES += \
    battery_monitor \
    battery_shutdown

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

#wlan driver
PRODUCT_COPY_FILES += \
    device/fairphone_devices/fairphone/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/fairphone_devices/fairphone/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += wcnss_service

#ANT stack
PRODUCT_PACKAGES += \
        AntHalService \
        libantradio \
        ANTRadioService \
        antradio_app

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

PRODUCT_COPY_FILES += \
    device/fairphone_devices/fairphone/whitelist_appops.xml:system/etc/whitelist_appops.xml


# NFC packages
ifeq ($(TARGET_USES_QCA_NFC),true)
NFC_D := true

ifeq ($(NFC_D), true)
    PRODUCT_PACKAGES += \
        libnfcD-nci \
        libnfcD_nci_jni \
        nfc_nci.msm8974 \
        NfcDNci \
        Tag \
        com.android.nfc_extras \
        com.android.nfc.helper
else
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    nfc_nci.msm8974 \
    NfcNci \
    Tag \
    com.android.nfc_extras
endif

# file that declares the MIFARE NFC constant
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
        frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
        frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml
# Enable NFC Forum testing by temporarily changing the PRODUCT_BOOT_JARS
# line has to be in sync with build/target/product/core_base.mk
endif

PRODUCT_BOOT_JARS += qcmediaplayer \
                     org.codeaurora.Performance \
                     vcard \
                     tcmiface
ifneq ($(strip $(QCPATH)),)
PRODUCT_BOOT_JARS += WfdCommon
PRODUCT_BOOT_JARS += qcom.fmradio
PRODUCT_BOOT_JARS += security-bridge
PRODUCT_BOOT_JARS += qsb-port
PRODUCT_BOOT_JARS += oem-services
endif

PRODUCT_PACKAGES += \
                    FairphoneUpdater \
                    FairphoneLauncher3 \
                    AppOps \
                    MyContactsWidget \
                    ClockWidget

# Add boot animation
PRODUCT_COPY_FILES += device/fairphone_devices/fairphone/bootanimation.zip:system/media/bootanimation.zip

# Set default ringtone to Fairphone's
PRODUCT_COPY_FILES += device/fairphone_devices/fairphone/Sunbeam.mp3:system/media/audio/ringtones/Sunbeam.mp3

PRODUCT_PROPERTY_OVERRIDES += \
                              fairphone.ota.device=$(PRODUCT_DEVICE) \
                              fairphone.ota.time=`date` \
                              fairphone.ota.android_version=$(PLATFORM_VERSION) \
                              fairphone.ota.build_number=1.0 \
                              fairphone.ota.version.number=1 \
                              fairphone.ota.version.name=Onion \
                              fairphone.ota.beta=0 \
                              fairphone.ota.image_type=FAIRPHONE

PRODUCT_MODEL := FP2

# include an expanded selection of fonts for the SDK.
EXTENDED_FONT_FOOTPRINT := true

# Preferred Applications for Fairphone
PRODUCT_COPY_FILES += \
    device/fairphone_devices/fairphone/preferred.xml:system/etc/preferred-apps/fp.xml

# remove /dev/diag in user version for CTS
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += device/qcom/common/rootdir/etc/init.qcom.diag.rc.user:root/init.qcom.diag.rc
endif

DEVICE_PACKAGE_OVERLAYS += device/fairphone_devices/fairphone/overlay