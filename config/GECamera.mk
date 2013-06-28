# Google Edition Camera
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/apk/Googleeditioncamera.apk:system/app/Gallery2.apk

# Scene Mode Fix
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/lib/liblightcycle.so:system/lib/liblightcycle.so \
    vendor/pa/prebuilt/common/lib/libjni_mosaic.so:system/lib/libjni_mosaic.so \
    vendor/pa/prebuilt/common/lib/libjni_filtershow_filters.so:system/lib/libjni_filtershow_filters.so
