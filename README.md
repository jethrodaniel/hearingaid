# hearingaid

> He that hath ears to hear, let him hear.
>
> Matthew 11:14-16, KJV

Open source mobile app to control hearing aids.

## what it do

Most hearing aids today are controlled via a smartphone app which communicates
with the device using the Bluetooth Low Energy (BLE) protocol.

At the moment, every app on the market is proprietary and only supports its
specific brand. This makes for an inconsistent user experience, and makes it
difficult to do additional things with your device, such as setting and saving
custom equalizer settings.

This app tries to provide a device-agnostic solution.

Supported Devices:

- [ha-802](devices/ha-802.md)

## install

```
flutter run   # dev
flutter build # prod
```

## dev

- [material ui icon list](https://material.io/resources/icons/?icon=bluetooth&style=baseline)
- https://dart.dev/tools/dartfmt

