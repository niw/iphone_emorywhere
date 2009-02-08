#import "EnableEmojiViewController.h"

static NSString *preferencesPath = @"/private/var/mobile/Library/Preferences/com.apple.Preferences.plist";

@implementation EnableEmojiViewController
- (void)dealloc {
	[super dealloc];
}

- (BOOL)isEmojiEverywhere {
	NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:preferencesPath];
	NSNumber *state = [dic objectForKey:@"KeyboardEmojiEverywhere"];
	return state ? [state boolValue] : NO;
}

- (BOOL)emojiEverywhere:(BOOL)state {
	NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:preferencesPath];
	[dic setObject:[NSNumber numberWithBool:state] forKey:@"KeyboardEmojiEverywhere"];
	return [dic writeToFile:preferencesPath atomically:NO];
}

#pragma mark -
#pragma mark IBAction

- (IBAction)swichChanged:(id)sender {
	[self emojiEverywhere:switchEmoji.on];
}

- (IBAction)enableEmoji:(id)sender {
	[self emojiEverywhere:YES];
}

- (IBAction)disableEmoji:(id)sender {
	[self emojiEverywhere:NO];
}

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[switchEmoji setOn:[self isEmojiEverywhere] animated:NO];
}
@end