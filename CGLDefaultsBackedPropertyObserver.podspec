Pod::Spec.new do |s|
  s.name             = "CGLDefaultsBackedPropertyObserver"
  s.version          = "0.1.0"
  s.summary          = "CGLDefaultsBackedPropertyObserver synchronizes the properties of an object with your app's NSUserDefaults automatically with Key Value Observing."
  s.description      = <<-DESC
                       Remember the days when you had to override setters and getters? Store defaults keys as constants? Those days are over.
                      
                      As you might expect, these properties need to be property list objects: that means NSString, NSDictionary, NSArray, NSData, NSDate, or NSNumber. @note that any primitive types encapsulated by NSNumber are automatically supported: integers, floats, and booleans.
                       DESC
  s.homepage         = "https://github.com/chrisladd/CGLDefaultsBackedPropertyObserver"
  s.screenshots     = "https://raw.githubusercontent.com/chrisladd/CGLDefaultsBackedPropertyObserver/master/CGLDefaultsBackedPropertyObserver.png"
  s.license          = 'MIT'
  s.author           = { "Chris Ladd" => "c.g.ladd@gmail.com" }
  s.source           = { :git => "https://github.com/chrisladd/CGLDefaultsBackedPropertyObserver.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/chrisladd'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  
end
