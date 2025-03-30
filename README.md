# bayt_finder

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

### Command

```
/opt/homebrew/opt/ruby/bin/pod install
```

### Report

* What did you do?

* What did you expect to happen?

* What happened instead?


### Stack

```
   CocoaPods : 1.16.2
        Ruby : ruby 3.3.4 (2024-07-09 revision be1089c8ec) [arm64-darwin23]
    RubyGems : 3.5.16
        Host : macOS 14.6.1 (23G93)
       Xcode : 16.2 (16C5032a)
         Git : git version 2.39.5 (Apple Git-154)
Ruby lib dir : /opt/homebrew/Cellar/ruby/3.3.4/lib
Repositories : cocoapods - git - https://github.com/CocoaPods/Specs.git @ aa42a862ec9563774ad7b7148c5972cc20900bd0

               trunk - CDN - https://cdn.cocoapods.org/
```

### Plugins

```
cocoapods-deintegrate : 1.0.5
cocoapods-plugins     : 1.0.0
cocoapods-search      : 1.0.1
cocoapods-trunk       : 1.6.0
cocoapods-try         : 1.2.0
```

### Podfile

```ruby
# Uncomment this line to define a global platform for your project
platform :ios, '14.0'

# CocoaPods analytics sends network stats synchronously affecting flutter build latency.
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

project 'Runner', {
  'Debug' => :debug,
  'Profile' => :release,
  'Release' => :release,
}

def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
  unless File.exist?(generated_xcode_build_settings_path)
    raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter pub get is executed first"
  end

  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT\=(.*)/)
    return matches[1].strip if matches
  end
  raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try deleting Generated.xcconfig, then run flutter pub get"
end

require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper'), flutter_root)

flutter_ios_podfile_setup

target 'Runner' do
  use_frameworks!
  use_modular_headers!
  pod 'PhoneNumberKit', '~> 3.7'
  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
  target 'RunnerTests' do
    inherit! :search_paths
  end
end
target 'OneSignalNotificationServiceExtension' do
  use_frameworks!
  pod 'OneSignalXCFramework', '>= 5.0.0', '< 6.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
  end
end
```

### Error

```
ArgumentError - [Xcodeproj] Unable to find compatibility version string for object version `70`.
/opt/homebrew/lib/ruby/gems/3.3.0/gems/xcodeproj-1.27.0/lib/xcodeproj/project.rb:85:in `initialize'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/project.rb:48:in `initialize'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer/xcode/pods_project_generator/project_generator.rb:82:in `new'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer/xcode/pods_project_generator/project_generator.rb:82:in `create_project'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer/xcode/pods_project_generator/project_generator.rb:73:in `generate!'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer/xcode/single_pods_project_generator.rb:16:in `generate!'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer.rb:320:in `block in create_and_save_projects'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/user_interface.rb:64:in `section'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer.rb:315:in `create_and_save_projects'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer.rb:307:in `generate_pods_project'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer.rb:183:in `integrate'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/installer.rb:170:in `install!'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/command/install.rb:52:in `run'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/claide-1.1.0/lib/claide/command.rb:334:in `run'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/lib/cocoapods/command.rb:52:in `run'
/opt/homebrew/lib/ruby/gems/3.3.0/gems/cocoapods-1.16.2/bin/pod:55:in `<top (required)>'
/opt/homebrew/opt/ruby/bin/pod:25:in `load'
/opt/homebrew/opt/ruby/bin/pod:25:in `<main>'
```

――― TEMPLATE END ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

[!] Oh no, an error occurred.

Search for existing GitHub issues similar to yours:
https://github.com/CocoaPods/CocoaPods/search?q=%5BXcodeproj%5D+Unable+to+find+compatibility+version+string+for+object+version+%6070%60.&type=Issues

If none exists, create a ticket, with the template displayed above, on:
https://github.com/CocoaPods/CocoaPods/issues/new

