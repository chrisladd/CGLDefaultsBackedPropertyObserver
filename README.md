# CGLDefaultsBackedPropertyObserver

[![CI Status](http://img.shields.io/travis/Chris Ladd/CGLDefaultsBackedPropertyObserver.svg?style=flat)](https://travis-ci.org/Chris Ladd/CGLDefaultsBackedPropertyObserver)
[![Version](https://img.shields.io/cocoapods/v/CGLDefaultsBackedPropertyObserver.svg?style=flat)](http://cocoapods.org/pods/CGLDefaultsBackedPropertyObserver)
[![License](https://img.shields.io/cocoapods/l/CGLDefaultsBackedPropertyObserver.svg?style=flat)](http://cocoapods.org/pods/CGLDefaultsBackedPropertyObserver)
[![Platform](https://img.shields.io/cocoapods/p/CGLDefaultsBackedPropertyObserver.svg?style=flat)](http://cocoapods.org/pods/CGLDefaultsBackedPropertyObserver)

Remember the days when you had to override setters and getters? Store defaults keys as constants? Those days are over.

CGLDefaultsBackedPropertyObserver synchronizes the properties of an object with your app's NSUserDefaults, all automatically with Key Value Observing.

Only two fields are required.

Suppose you have a boolean value that you'd like to persist the value of between sessions. Let's call that boolean `biz`:

```
@property (nonatomic) BOOL biz;
```

All you need to do is tell the shared synchronizer the name of the property, and the object it belongs to, and you're good to go:

```
[[CGLDefaultsBackedPropertyObserver sharedObserver] observeProperty:@"biz" object:self key:nil defaultValue:nil];
```

The value of `biz` will **automatically** now be initialized with the value stored in defaults, every time. And, any changes to `biz` will be persisted to the user's defaults, and ready for you whenever you need it.

#### What kinds of objects will this work with?

You can observe properties of **any** object, but the values stored by those properties have to fit in the defaults themselves: NSString, NSDictionary, NSArray, NSData, NSDate, or NSNumber.

Note that you can use any of the primitive types wrapped by NSNumber: booleans, floats, and ints. All fine.

#### More configuration

In addition to the more magical default configurations, you can also specify which key in your defaults you'd like to use for the value:

```
[[CGLDefaultsBackedPropertyObserver sharedObserver] observeProperty:@"bang" object:self key:@"MyCustomDefaultsKey" defaultValue:nil];
```

Or specify a default value if none has previously been set:

```
[[CGLDefaultsBackedPropertyObserver sharedObserver] observeProperty:@"bang" object:self key:nil defaultValue:nil];
```

## Example Project

An example project is included, and should get you started -- flip the switches, shut down your app, and reboot. You should find the values all stick right where you left them:

<img src="https://raw.githubusercontent.com/chrisladd/CGLDefaultsBackedPropertyObserver/master/CGLDefaultsBackedPropertyObserver.png" style="width:200px;" />

## Requirements

I haven't tested this on anything below 7.0, but there's no reason it _shouldn't_ work there.

## Installation

CGLDefaultsBackedPropertyObserver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CGLDefaultsBackedPropertyObserver"
```

## Author

Chris Ladd, c.g.ladd@gmail.com

## License

CGLDefaultsBackedPropertyObserver is available under the MIT license. See the LICENSE file for more info.
