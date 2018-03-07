![SuperPuperDuperLayout](https://github.com/SugarAndCandy/SuperPuperDuperLayout/blob/master/logo.png)

Lightweight, elegant and safe wrapper over auto layout. 

Inspired by Layout Anchors ( https://developer.apple.com/documentation/uikit/nslayoutanchor ) and SnapKit ( https://github.com/SnapKit/SnapKit ). 

Without overheads such as «extension UIView», «extension UILayoutGuide», «objc_setAssociatedObjectAssociatedObject», «objc_getAssociatedObject» etc.

![CocoaPods](https://img.shields.io/cocoapods/p/SuperPuperDuperLayout.svg)
![CocoaPods](https://img.shields.io/cocoapods/v/SuperPuperDuperLayout.svg)
![CocoaPods](https://img.shields.io/cocoapods/l/SuperPuperDuperLayout.svg)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```
> CocoaPods 1.4.0+ is required to build SuperPuperDuperLayout 1.0.0.

To integrate SuperPuperDuperLayout into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'TargetName' do
    pod 'SuperPuperDuperLayout'
end
```

Then, run the following command:

```bash
$ pod install
```

## Requirements

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+
