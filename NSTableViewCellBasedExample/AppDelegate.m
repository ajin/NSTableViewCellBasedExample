//
//  AppDelegate.m
//  NSTableViewCellBasedExample
//
//  Created by Ajin Man Tuladhar on 12/09/2016.
//  Copyright © 2016 Ajin Man Tuladhar. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // Insert code here to initialize your application
    self.dataArray = [[NSMutableArray alloc] init];
    [self.dataArray addObject:@"Awesome Words"];
    [self.dataArray addObject:@"Amazing Text"];
    [self.tableView reloadData];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


#pragma mark - NSTableViewDataSource

/**
 * Returns the number of records managed for aTableView by the data source object.
 */
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    NSInteger count = [self.dataArray count];
    NSLog(@"numberOfRowsInTableView: %ld", (long)count);
    return count;
}


/**
 * Called by the table view to return the data object associated
 * with the specified row and column.
 * @see https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Protocols/NSTableDataSource_Protocol/#//apple_ref/occ/intfm/NSTableViewDataSource/numberOfRowsInTableView:
 */
- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex {
    
    id returnValue=nil;
    
    // The column identifier string
    NSString *columnIdentifer = [aTableColumn identifier];
    
    // Get the name at the specified row
    NSString *rowValue = [self.dataArray objectAtIndex:rowIndex];
    
    NSLog(@"columnIdentifer: %@", columnIdentifer);
    NSLog(@"rowValue: %@", rowValue);
    
    // Compare column identifier and set the appropriate return value
    if ([columnIdentifer isEqualToString:@"SampleColumn"]) {
        returnValue = rowValue;
    }
    
    return returnValue;
}


@end
