TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/fairphone/FP2/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/fairphone/FP2/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/fairphone/FP2/audio/mixer_paths_auxpcm.xml:system/etc/mixer_paths_auxpcm.xml

PRODUCT_COPY_FILES += \
    device/fairphone/FP2/media/media_profiles_8974.xml:system/etc/media_profiles.xml \
    device/fairphone/FP2/media/media_codecs_8974.xml:system/etc/media_codecs.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ubuntu.widi.supported=1 \
    sys.usb.config=mtp,adb

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
    tinymix \
    ip libiprouteutil \
    iptables libiptc libext

# Feature definition files for 8974
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    liboverlay

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

# Power
PRODUCT_PACKAGES += \
    power.msm8974

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

#wlan driver
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    device/fairphone/FP2/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#PRODUCT_PACKAGES += wcnss_service

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

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Ramdisk
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/rootdir/root/init.qcom.modem_links.sh:root/init.qcom.modem_links.sh \
    device/fairphone/FP2/rootdir/root/init_bt.sh:root/init_bt.sh \
    device/fairphone/FP2/rootdir/root/init.wcnss.wifi.sh:root/init.wcnss.wifi.sh \
    device/fairphone/FP2/rootdir/root/fstab.qcom:root/fstab.qcom \
    device/fairphone/FP2/rootdir/root/recovery.fstab:recovery/root/etc/recovery.fstab \
    device/fairphone/FP2/rootdir/root/recovery.fstab:recovery/root/etc/fstab \
    device/fairphone/FP2/rootdir/root/twrp.fstab:root/twrp.fstab \
    device/fairphone/FP2/rootdir/root/init.qcom.rc:root/init.qcom.rc \
    device/fairphone/FP2/rootdir/root/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    device/fairphone/FP2/rootdir/root/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    device/fairphone/FP2/rootdir/root/init.qcom.modem_links.sh:root/init.qcom.modem_links.sh \
    device/fairphone/FP2/rootdir/root/init.qcom.factory.sh:root/init.qcom.factory.sh \
    device/fairphone/FP2/rootdir/root/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/fairphone/FP2/rootdir/root/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/fairphone/FP2/rootdir/root/init.mdm.sh:root/init.mdm.sh \
    device/fairphone/FP2/rootdir/root/init.class_main.sh:root/init.class_main.sh \
    device/fairphone/FP2/rootdir/root/init.target.rc:root/init.target.rc \
    device/fairphone/FP2/rootdir/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/fairphone/FP2/rootdir/root/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/fairphone/FP2/rootdir/root/ueventd.qcom.rc:root/ueventd.qcom.rc

# Configs
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/rootdir/system/etc/usf_post_boot.sh:system/etc/usf_post_boot.sh \
    device/fairphone/FP2/rootdir/system/etc/init_wlan_bt.sh:system/etc/init_wlan_bt.sh \
    device/fairphone/FP2/rootdir/system/etc/usf_settings.sh:system/etc/usf_settings.sh

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false \
    persist.sys.usb.config=mtp,adb

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

PRODUCT_BOOT_JARS += \
    qcmediaplayer \
    org.codeaurora.Performance \
    vcard \
    tcmiface

# Ubuntu Overlay Files
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/ubuntu/adbd.conf:system/ubuntu/etc/init/adbd.conf \
    device/fairphone/FP2/ubuntu/bluetooth-touch-FP2.conf:system/ubuntu/etc/init/bluetooth-touch-FP2.conf \
    device/fairphone/FP2/ubuntu/FP2.conf:system/ubuntu/etc/ubuntu-touch-session.d/FP2.conf \
    device/fairphone/FP2/ubuntu/set-brightness-fp2.conf:system/ubuntu/etc/set-brightness-fp2.conf \
    device/fairphone/FP2/ubuntu/ubuntu-location-service.conf:system/ubuntu/etc/ubuntu-location-service.conf \
    device/fairphone/FP2/ubuntu/70-FP2.rules:system/ubuntu/usr/lib/lxc-android-config/70-FP2.rules \
    device/fairphone/FP2/ubuntu/config.xml:system/ubuntu/usr/share/repowerd/device-configs/config-FP2.xml \
    device/fairphone/FP2/ubuntu/ofono.override:system/ubuntu/etc/init/ofono.override

#This keeps time correct across reboots
PRODUCT_PACKAGES += timekeep

# include an expanded selection of fonts for the SDK.
EXTENDED_FONT_FOOTPRINT := true

$(call inherit-product, device/fairphone/FP2/mdt.mk)
$(call inherit-product, hardware/qcom/display-caf/msm8974/Android.mk)
