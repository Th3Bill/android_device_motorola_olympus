DEVICE=olympus
VENDOR=motorola

mkdir -p ../../../vendor/motorola/$DEVICE

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__VENDOR__/$VENDOR/g > ../../../vendor/motorola/$DEVICE/$DEVICE-vendor.mk

# Live wallpaper packages
PRODUCT_PACKAGES := \\
    LiveWallpapers \\
    LiveWallpapersPicker \\
    MagicSmokeWallpapers \\
    VisualizationWallpapers \\
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES := \\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := vendor/motorola/__DEVICE__/overlay

\$(call inherit-product, vendor/motorola/__DEVICE__/__DEVICE__-vendor-blobs.mk)
EOF

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/motorola/olympus/BoardConfigVendor.mk


USE_CAMERA_STUB := false
EOF

mkdir -p ../../../vendor/motorola/olympus/overlay/packages/apps/Launcher2/res/layout
(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/motorola/olympus/overlay/packages/apps/Launcher2/res/layout/all_apps.xml

EOF

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g | sed s/__VENDOR__/$VENDOR/g > ../../../vendor/motorola/$DEVICE/$DEVICE-vendor-blobs.mk

PRODUCT_COPY_FILES += \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libaudio.so:obj/lib/libaudio.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libaudio.so:system/lib/libaudio.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so

# HAL
PRODUCT_COPY_FILES += \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/hw/overlay.tegra.so:system/lib/hw/overlay.tegra.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/hw/sensors.olympus.so:system/lib/hw/sensors.olympus.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/hw/gps.olympus.so:system/lib/hw/gps.olympus.so

# EGL
PRODUCT_COPY_FILES += \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so

# OMX
PRODUCT_COPY_FILES += \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libhwmediaplugin.so:system/lib/libhwmediaplugin.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libhwmediaplugin.so:obj/lib/libhwmediaplugin.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libhwmediarecorder.so:system/lib/libhwmediarecorder.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libhwmediarecorder.so:obj/lib/libhwmediarecorder.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \\

# Bin
PRODUCT_COPY_FILES += \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvrm_daemon:system/bin/nvrm_daemon \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvrm_avp.axf:system/bin/nvrm_avp.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvddk_audiofx_core.axf:system/bin/nvddk_audiofx_core.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvrm_avp.axf:system/bin/nvrm_avp.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_wmadec.axf:system/bin/nvmm_wmadec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_wavdec.axf:system/bin/nvmm_wavdec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_vc1dec.axf:system/bin/nvmm_vc1dec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_sw_mp3dec.axf:system/bin/nvmm_sw_mp3dec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_sorensondec.axf:system/bin/nvmm_sorensondec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_service.axf:system/bin/nvmm_service.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_reference.axf:system/bin/nvmm_reference.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_mpeg4dec.axf:system/bin/nvmm_mpeg4dec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_mp3dec.axf:system/bin/nvmm_mp3dec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_mp2dec.axf:system/bin/nvmm_mp2dec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_manager.axf:system/bin/nvmm_manager.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_jpegenc.axf:system/bin/nvmm_jpegenc.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_jpegdec.axf:system/bin/nvmm_jpegdec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_h264dec.axf:system/bin/nvmm_h264dec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_audiomixer.axf:system/bin/nvmm_audiomixer.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_adtsdec.axf:system/bin/nvmm_adtsdec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvmm_aacdec.axf:system/bin/nvmm_aacdec.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvddk_audiofx_transport.axf:system/bin/nvddk_audiofx_transport.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/bin/nvddk_audiofx_core.axf:system/bin/nvddk_audiofx_core.axf \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvrm.so:system/lib/libnvrm.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_camera.so:system/lib/libnvmm_camera.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvodm_imager.so:system/lib/libnvodm_imager.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvddk_2d.so:system/lib/libnvddk_2d.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_utils.so:system/lib/libnvmm_utils.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm.so:system/lib/libnvmm.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvdispmgr_d.so:system/lib/libnvdispmgr_d.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvdispmgr_d.so:obj/lib/libnvdispmgr_d.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvddk_audiofx.so:system/lib/libnvddk_audiofx.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvodm_dtvtuner.so:system/lib/libnvodm_dtvtuner.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvdispatch_helper.so:system/lib/libnvdispatch_helper.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvomxilclient.so:system/lib/libnvomxilclient.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libcgdrv.so:system/lib/libcgdrv.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_audio.so:system/lib/libnvmm_audio.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_contentpipe.so:system/lib/libnvmm_contentpipe.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_image.so:system/lib/libnvmm_image.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_misc.so:system/lib/libnvmm_misc.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_parser.so:system/lib/libnvmm_parser.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_tracklist.so:system/lib/libnvmm_tracklist.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_video.so:system/lib/libnvmm_video.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_videorenderer.so:system/lib/libnvmm_videorenderer.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_vp6_video.so:system/lib/libnvmm_vp6_video.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_writer.so:system/lib/libnvmm_writer.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvmm_service.so:system/lib/libnvmm_service.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvomx.so:system/lib/libnvomx.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libsystem_server.so:system/lib/libsystem_server.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libaudioflinger.so:system/lib/libaudioflinger.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvos.so:system/lib/libnvos.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvodm_query.so:system/lib/libnvodm_query.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvodm_misc.so:system/lib/libnvodm_misc.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libril_rds.so:system/lib/libril_rds.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/librds_util.so:system/lib/librds_util.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \\
    vendor/__VENDOR__/__DEVICE__/proprietary/lib/libnvrm_channel.so:system/lib/libnvrm_channel.so \\


EOF