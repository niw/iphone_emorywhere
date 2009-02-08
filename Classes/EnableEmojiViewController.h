#import <UIKit/UIKit.h>

@interface EnableEmojiViewController : UIViewController {
	IBOutlet UISwitch *switchEmoji;
}

- (IBAction)swichChanged:(id)sender;
- (IBAction)enableEmoji:(id)sender;
- (IBAction)disableEmoji:(id)sender;
@end