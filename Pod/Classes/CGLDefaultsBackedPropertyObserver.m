//
//  CGLDefaultsBackedPropertyObserver.m
//
//  Created by Chris Ladd on 4/25/15.
//  Copyright (c) 2015 Christopher Ladd. All rights reserved.
//

#import "CGLDefaultsBackedPropertyObserver.h"

@interface CGLDefaultsBackedPropertyObserver ()
@property (nonatomic) NSMutableSet *defaultsKeys;
@end

@implementation CGLDefaultsBackedPropertyObserver

+ (instancetype)sharedObserver {
    static CGLDefaultsBackedPropertyObserver *observer;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        observer = [[[self class] alloc] init];
    });
    
    return observer;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _defaultsKeys = [NSMutableSet set];
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    id obj = (__bridge id)context;
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *defaultsKey = obj;
        [[NSUserDefaults standardUserDefaults] setObject:[object valueForKeyPath:keyPath] forKey:defaultsKey];
    }
}

- (void)observeProperty:(NSString *)propertyName object:(id)object key:(NSString *)defaultsKey defaultValue:(id)defaultValue {
    if (propertyName && object && [object respondsToSelector:NSSelectorFromString(propertyName)]) {
        if (!defaultsKey) {
            defaultsKey = [NSString stringWithFormat:@"CGLDefaultsBackedPropertyObserver__%@__%@", NSStringFromClass([object class]), propertyName];
        }
        
        id existingValue = [[NSUserDefaults standardUserDefaults] objectForKey:defaultsKey];
        if (defaultValue && !existingValue) {
            existingValue = defaultValue;
        }
        
        if (existingValue) {
            [object setValue:existingValue forKeyPath:propertyName];
        }

        [self.defaultsKeys addObject:defaultsKey];
        void * context = (void *)CFBridgingRetain(defaultsKey);
        [object addObserver:self forKeyPath:propertyName options:NSKeyValueObservingOptionNew context:context];
    }
}

- (void)stopObservingObject:(id)object {
    [object removeObserver:self];
}

- (void)stopObservingProperty:(NSString *)propertyName object:(id)object {
    [object removeObserver:self forKeyPath:propertyName];
}

@end
