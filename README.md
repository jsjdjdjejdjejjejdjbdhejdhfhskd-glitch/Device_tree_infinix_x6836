# TWRP Device Tree — Infinix X6836
## Характеристики
| Параметр | Значение |
|---|---|
| Модель | Infinix X6836 |
| Чипсет | MediaTek MT6768 |
| Android | 13 (SDK 33) |
| Экран | 1080x2460 |
| Тип разделов | A/B, GKI |
| Recovery | В vendor_boot |
| Page size | 4096 |
| Kernel addr | 0x40080000 |
| Ramdisk addr | 0x47c80000 |
| Tags addr | 0x4bc80000 |

## Что уже есть в device tree
- ✅ BoardConfig.mk (все параметры из реального vendor_boot)
- ✅ recovery.fstab (erofs/f2fs из реальных данных)
- ✅ dtb.img в prebuilt/ (извлечён из vendor_boot)
- ❌ kernel — нужно извлечь вручную
- ❌ dtbo.img — нужно извлечь из boot.img

## Извлечение kernel из vendor_boot

На телефоне в Termux:
```bash
su -c "dd if=/dev/block/by-name/vendor_boot_a of=/sdcard/vendor_boot.img"
```

На ПК распаковать через magiskboot:
```bash
magiskboot unpack vendor_boot.img
# Появится файл kernel
```

Положить в prebuilt/kernel

## Извлечение dtbo из boot.img
```bash
su -c "dd if=/dev/block/by-name/boot_a of=/sdcard/boot.img"
magiskboot unpack boot.img
# Появится dtbo
```
Положить в prebuilt/dtbo.img

## Сборка через GitHub Actions

1. Создай репозиторий на GitHub с этим device tree
2. Форкни: https://github.com/CaptainThrowback/Action-Recovery-Builder
3. Заполни в workflow:
```
MANIFEST_URL: https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp
MANIFEST_BRANCH: twrp-12.1
DEVICE_TREE_URL: https://github.com/ТВОЙ_НИК/device_infinix_X6836
DEVICE_TREE_BRANCH: main
DEVICE_PATH: device/infinix/X6836
DEVICE_NAME: X6836
MAKEFILE_NAME: twrp_X6836
BUILD_TARGET: vendorboot
```

## Флашить так
```bash
fastboot flash vendor_boot_a vendor_boot.img
fastboot reboot recovery
```
