#
#  Be sure to run `pod spec lint HWAdsSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "HWAdsSDK"
  spec.version      = "0.0.4"
  spec.summary      = "这是HWAdsSDK"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = "用于请求HW广告,下载sdk一键集成"

  spec.homepage     = "https://github.com/helingyang/HWAdsSDK"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = { :type => "MIT", :file => "LICENSE" }  #开源协议
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "HLY" => "hly091516@163.com" }
  # Or just: spec.author    = "HLY"
  # spec.authors            = { "HLY" => "hly091516@163.com" }
  # spec.social_media_url   = "https://twitter.com/HLY"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
   spec.platform     = :ios, "9.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/helingyang/HWAdsSDK.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #
    
    #spec.source_files = 'SDK/**/*.{h,m}' 该路径下所有
    
    spec.source_files = 'SDK/*.{h,m}','Adapter/Adjust/**/*.{h,m}'
    
  #spec.source_files  = "HWAdsSDK", "SDK/**/*.{h,m}"
  #spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.vendored_frameworks  = "SDK/FBAudienceNetwork/Static/FBAudienceNetwork" #'SDK/FBSDKCoreKit.framework'
    spec.vendored_frameworks  = 'SDK/HwFrameworkUpTest1.framework','SDK/FBSDKCoreKit.framework'
    spec.frameworks = "AdSupport","AVFoundation","CoreGraphics","CoreLocation","CoreMedia","CoreTelephony","Foundation","MediaPlayer","MessageUI","QuartzCore","SafariServices","StoreKit","SystemConfiguration","UIKit","WebKit"
    #spec.framework  = "SDK/FBSDKCoreKit"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

   #spec.ios.vendored_frameworks   = "FBSDKCoreKit"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

   spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
   #spec.dependency "JSONKit", "~> 1.4"
  spec.dependency "AppLovinSDK", "6.12.6"
  spec.dependency "IronSourceSDK", "6.16.1.0"
  spec.dependency "UnityAds", "3.4.2"
  spec.dependency "VungleSDK-iOS", "6.5.3"
  spec.dependency "Bytedance-UnionAD", "~> 1.9.8.2"
  spec.dependency "GDTMobSDK", "~> 4.11.8"
  spec.dependency "SigmobAd-iOS", "2.18.2"
  spec.dependency "MintegralAdSDK/BannerAd", "6.2.0.0"
  spec.dependency "MintegralAdSDK/BidBannerAd", "6.2.0.0"
  spec.dependency "MintegralAdSDK/BidInterstitialVideoAd", "6.2.0.0"
  spec.dependency "MintegralAdSDK/BidNativeAd", "6.2.0.0"
  spec.dependency "MintegralAdSDK/BidRewardVideoAd", "6.2.0.0"
  spec.dependency "MintegralAdSDK/InterstitialVideoAd", "6.2.0.0"
  spec.dependency "MintegralAdSDK/NativeAd", "6.2.0.0"
  spec.dependency "MintegralAdSDK/RewardVideoAd", "6.2.0.0"
    
end