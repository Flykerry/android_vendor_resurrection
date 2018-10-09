# Inherit full common Lineage stuff
$(call inherit-product, vendor/rr/config/common_full.mk)

ifeq ($(SUDA_CPU_ABI),arm64-v8a)
PRODUCT_PACKAGES += \
    GooglePinYin

PRODUCT_COPY_FILES += $(shell test -d vendor/rr/prebuilt/common/app/GooglePinYin && \
    find vendor/rr/prebuilt/common/app/GooglePinYin -name '*.so' \
    -printf '%p:system/app/GooglePinYin/lib/arm64/%f ')
else
# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/rr/overlay/dictionaries

$(call inherit-product, vendor/rr/config/telephony.mk)
