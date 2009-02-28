#import "EnableEmojiAppDelegate.h"

@implementation EnableEmojiAppDelegate
@synthesize window;
@synthesize viewController;

static NSString *preferencesBasePath = @"/private/var/mobile/Library/Preferences/";

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	[window addSubview:viewController.view];
	[window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	NSString *file;
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:preferencesBasePath];
	while(file = [dirEnum nextObject]) {
		if([file hasPrefix:@"com.apple.Preferences.plist."]) {
			NSString *path = [preferencesBasePath stringByAppendingPathComponent:file];
			NSDictionary *attributes = [[NSFileManager defaultManager] fileAttributesAtPath:path traverseLink:YES];
			if([attributes fileSize] == 0) {
				NSError *error;
				[[NSFileManager defaultManager] removeItemAtPath:path error:&error];
			}
		}
	}
}

- (void)dealloc {
	[viewController release];
	[window release];
	[super dealloc];
}
@end
