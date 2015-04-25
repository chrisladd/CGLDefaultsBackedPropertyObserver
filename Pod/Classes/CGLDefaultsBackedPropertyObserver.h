//
//  CGLDefaultsBackedPropertyObserver.h
//
//  Created by Chris Ladd on 4/25/15.
//  Copyright (c) 2015 Christopher Ladd. All rights reserved.
//

@import Foundation;

/**
 *   CGLDefaultsBackedPropertyObserver synchronizes the properties of an object with your app's user defaults automatically with Key Value Observing.
 *
 *   Remember the days when you had to override setters and getters? Store defaults keys as constants? Those days are over.
 *
 *   As you might expect, these properties need to be property list objects: that means NSString, NSDictionary, NSArray, NSData, NSDate, or NSNumber. @note that any primitive types encapsulated by NSNumber are automatically supported: integers, floats, and booleans.
 */
@interface CGLDefaultsBackedPropertyObserver : NSObject

/**
 *  Returns a singleton version of the observer class. @note that you may also instantiate separate instances, if you desire.
 *
 *  @return a global observer object.
 */
+ (instancetype)sharedObserver;

/**
 *  Begins observing the property of a given object. Changes to that property will be automatically synchronized with the app's defaults.
 *
 *  This method will also initialize your property's value with the value currently in the defaults, if it exists. You may optionally specify a default value you'd like to use, if none has previously been set. @note that for primitive types, you'll need to wrap values in an NSNumber.
 *
 *  @param propertyName the property name to observe
 *  @param object       the object on which to observe that property
 *  @param defaultsKey  the defaults key where the value should be stored. You may pass nil here, in which case a unique key will be constructed from the class name of the object, and the property name.
 *  @param defaultValue the value that should be used if none has yet been set in the user defaults. If a previous value exists, that value will be used instead.
 */
- (void)observeProperty:(NSString *)propertyName object:(id)object key:(NSString *)defaultsKey defaultValue:(id)defaultValue;

/**
 *  Stops observing the property of a given object. @note that you may also stop observing all properties of an object with the stopObservingObject: method.
 *
 *  @param propertyName a property name
 *  @param object       an object.
 */
- (void)stopObservingProperty:(NSString *)propertyName object:(id)object;

/**
 *  Stops observing any properties of an object. @note that you can stop observing more granularly via the stopObservingProperty:object: method.
 *
 *  @param object an object.
 */
- (void)stopObservingObject:(id)object;

@end
