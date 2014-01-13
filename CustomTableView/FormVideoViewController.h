//
//  FormVideoViewController.h
//  CustomTableView



#import <UIKit/UIKit.h>
#import <DailymotionSDK/DailymotionSDK.h>

@interface FormVideoViewController : UIViewController <DMPlayerDelegate>

@property (nonatomic, copy) NSString *videoID;

@end
