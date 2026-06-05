# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from X6836 device
$(call inherit-product, device/infinix/X6836/device.mk)

PRODUCT_DEVICE := X6836
PRODUCT_NAME := twrp_X6836
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6836
PRODUCT_MANUFACTURER := INFINIX
