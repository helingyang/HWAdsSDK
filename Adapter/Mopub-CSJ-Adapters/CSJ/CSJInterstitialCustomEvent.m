//
//  CSJInterstitialCustomEvent.m
//  Unity-iPhone
//
//  Created by game team on 2019/12/23.
//

#import <BUAdSDK/BUFullscreenVideoAd.h>
#import "CSJInterstitialCustomEvent.h"
#import "CSJAdapterConfiguration.h"

#import <BUAdSDK/BUAdSDK.h>

#if __has_include("MoPub.h")
#import "MoPub.h"
#import "MPLogging.h"
#import "MPRealTimeTimer.h"
#endif

@interface CSJInterstitialCustomEvent () <BUFullscreenVideoAdDelegate>

@property (nonatomic, strong) BUFullscreenVideoAd *fullScreenVideo;
@property (nonatomic, copy) NSString *placementId;

@end

@implementation CSJInterstitialCustomEvent

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info
{
    [self requestInterstitialWithCustomEventInfo:info adMarkup:nil];
}

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info adMarkup:(NSString *)adMarkup
{
    if(![info objectForKey:@"placementId"]){
        NSLog(@"csj interstitial fullscreen video invalid app id");
        NSError *error =
        [NSError errorWithDomain:MoPubRewardedVideoAdsSDKDomain
                            code:MPRewardedVideoAdErrorInvalidAdUnitID
                        userInfo:@{NSLocalizedDescriptionKey : @"appId Unit ID cannot be nil."}];
        MPLogAdEvent([MPLogEvent adLoadFailedForAdapter:NSStringFromClass(self.class) error:error],nil);
        
        [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
        return;
    }

    NSString * appId = info[@"appId"];
    [BUAdSDKManager setAppID:appId];
    
    self.placementId = [info objectForKey:@"placementId"];
    NSLog(@"placementId %@",self.placementId);
    
    BUFullscreenVideoAd *fullScreenVideo = [[BUFullscreenVideoAd alloc] initWithSlotID:self.placementId];
    fullScreenVideo.delegate = self;
    _fullScreenVideo = fullScreenVideo;
    
//    self.fullScreenVideo = [[BUFullscreenVideoAd alloc] initWithSlotID:self.placementId];
////    self.delegate = self;
//    fullScreenVideo.delegate = self;
    [self.fullScreenVideo loadAdData];
}

- (void)showInterstitialFromRootViewController:(UIViewController *)controller {
    if (!self.fullScreenVideo || !self.fullScreenVideo.isAdValid) {
        NSError *error = [self createErrorWith:@"Error in loading csj Interstitial"
                                     andReason:@""
                                 andSuggestion:@""];
        
        MPLogAdEvent([MPLogEvent adShowFailedForAdapter:NSStringFromClass(self.class) error:error], self.placementId);
        [self.delegate interstitialCustomEventDidExpire:self];
    } else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"CSJ" forKey:@"hwintertype"];
        [defaults synchronize];
        
        MPLogAdEvent([MPLogEvent adShowAttemptForAdapter:NSStringFromClass(self.class)], self.placementId);
        
        MPLogAdEvent([MPLogEvent adWillAppearForAdapter:NSStringFromClass(self.class)], self.placementId);
        [self.delegate interstitialCustomEventWillAppear:self];
        
        [self.fullScreenVideo showAdFromRootViewController:controller];
        
        MPLogAdEvent([MPLogEvent adDidAppearForAdapter:NSStringFromClass(self.class)], self.placementId);
        [self.delegate interstitialCustomEventDidAppear:self];
    }
}

- (NSError *)createErrorWith:(NSString *)description andReason:(NSString *)reaason andSuggestion:(NSString *)suggestion {
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: NSLocalizedString(description, nil),
                               NSLocalizedFailureReasonErrorKey: NSLocalizedString(reaason, nil),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(suggestion, nil)
                               };
    
    return [NSError errorWithDomain:NSStringFromClass([self class]) code:0 userInfo:userInfo];
}

- (void)dealloc
{

}

#pragma mark CSJInterstitialAdDelegate methods
/**
 This method is called when video ad material loaded successfully.
 */
- (void)fullscreenVideoMaterialMetaAdDidLoad:(BUFullscreenVideoAd *)fullscreenVideoAd{
     NSLog(@"hlyLog:CSJ Interstitial加载成功");
    [self.delegate interstitialCustomEvent:self didLoadAd:fullscreenVideoAd];
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)fullscreenVideoAd:(BUFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"hlyLog:CSJ Interstitial加载失败");
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
}

/**
 This method is called when video cached successfully.
 */
- (void)fullscreenVideoAdVideoDataDidLoad:(BUFullscreenVideoAd *)fullscreenVideoAd{
    //no need call back
}

/**
 This method is called when video ad slot will be showing.
 */
- (void)fullscreenVideoAdWillVisible:(BUFullscreenVideoAd *)fullscreenVideoAd{
    //[self.delegate interstitialCustomEventWillAppear:self];
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)fullscreenVideoAdDidVisible:(BUFullscreenVideoAd *)fullscreenVideoAd{
    //[self.delegate interstitialCustomEventDidAppear:self];
}

/**
 This method is called when video ad is clicked.
 */
- (void)fullscreenVideoAdDidClick:(BUFullscreenVideoAd *)fullscreenVideoAd{
    [self.delegate interstitialCustomEventDidReceiveTapEvent:self];
}

/**
 This method is called when video ad is about to close.
 */
- (void)fullscreenVideoAdWillClose:(BUFullscreenVideoAd *)fullscreenVideoAd{
    
}

/**
 This method is called when video ad is closed.
 */
- (void)fullscreenVideoAdDidClose:(BUFullscreenVideoAd *)fullscreenVideoAd{
    NSLog(@"hlyLog:CSJ Interstitial关闭");
    [self.delegate interstitialCustomEventDidDisappear:self];
}


/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)fullscreenVideoAdDidPlayFinish:(BUFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    
}

/**
 This method is called when the user clicked skip button.
 */
- (void)fullscreenVideoAdDidClickSkip:(BUFullscreenVideoAd *)fullscreenVideoAd{
    
}
@end
