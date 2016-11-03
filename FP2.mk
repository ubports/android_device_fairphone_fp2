ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# media_profiles and media_codecs xmls for 8974
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/fairphone/FP2/media/media_profiles_8974.xml:system/etc/media_profiles.xml \
                      device/fairphone/FP2/media/media_codecs_8974.xml:system/etc/media_codecs.xml
endif  #TARGET_ENABLE_QC_AV_ENHANCEMENTS

ifeq ($(PROPRIETARY_BLOBS_EXIST),true)
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/apns-conf.xml:system/etc/apns-conf.xml
endif

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/audio_policy.conf:system/etc/audio_policy.conf \
    device/fairphone/FP2/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/fairphone/FP2/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/fairphone/FP2/mixer_paths_auxpcm.xml:system/etc/mixer_paths_auxpcm.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ubuntu.widi.supported=1

PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix

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

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    liboverlay

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

#wlan driver
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    device/fairphone/FP2/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

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

# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libdashplayer \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libstagefrighthw \
    qcmediaplayer

# Misc dependency packages
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libnl_2 \
    libbson \
    libcnefeatureconfig \
    libtinyxml \
    libxml2

PRODUCT_PACKAGES += \
    conn_init

# Ramdisk
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/rootdir/root/init.qcom.modem_links.sh:root/init.qcom.modem_links.sh \
    device/fairphone/FP2/rootdir/root/init_wlan.sh:root/init_wlan.sh \
    device/fairphone/FP2/rootdir/root/init_bt.sh:root/init_bt.sh \
    device/fairphone/FP2/rootdir/root/init.wcnss.wifi.sh:root/init.wcnss.wifi.sh \
    device/fairphone/FP2/rootdir/root/fstab.qcom:root/fstab.qcom \
    device/fairphone/FP2/rootdir/root/recovery.fstab:root/recovery.fstab \
    device/fairphone/FP2/rootdir/root/twrp.fstab:root/twrp.fstab \
    device/fairphone/FP2/rootdir/root/init.qcom.rc:root/init.qcom.rc \
    device/fairphone/FP2/rootdir/root/init.qcom.power.rc:root/init.qcom.power.rc \
    device/fairphone/FP2/rootdir/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/fairphone/FP2/rootdir/root/ueventd.qcom.rc:root/ueventd.qcom.rc
    

# Configs
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/rootdir/system/etc/usf_post_boot.sh:system/etc/usf_post_boot.sh \
    device/fairphone/FP2/rootdir/system/etc/usf_settings.sh:system/etc/usf_settings.sh
    

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false \
    persist.sys.usb.config=mtp

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

PRODUCT_COPY_FILES += \
    device/fairphone/FP2/whitelist_appops.xml:system/etc/whitelist_appops.xml

PRODUCT_BOOT_JARS += \
    qcmediaplayer \
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

# include an expanded selection of fonts for the SDK.
EXTENDED_FONT_FOOTPRINT := true

$(call inherit-product, device/fairphone/FP2/mdt.mk)
$(call inherit-product, hardware/qcom/display-caf/msm8974/Android.mk)
