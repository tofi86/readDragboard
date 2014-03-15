//
//  main.m
//  readDragboard
//
//  Read all file-URIs from the Mac OS X Drag Clipboard and print them to stdout
//
//
//  Version:    0.1
//  Date:       2014-03-15
//  Copyright:  2014 Tobias Fischer
//  License:    The MIT License (MIT)
//  Website:    https://github.com/tofi86/readDragboard
//
//
//  Helpful URLs:
//  * https://developer.apple.com/library/mac/samplecode/ClipboardViewer/Introduction/Intro.html
//  * https://developer.apple.com/library/mac/documentation/cocoa/conceptual/DragandDrop/Tasks/DraggingFiles.html
//

#import <Foundation/Foundation.h>
#import <AppKit/NSPasteboard.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        // get Drag Clipboard
        NSPasteboard *dragPasteboard = [NSPasteboard pasteboardWithName:NSDragPboard];
        
        // if array NSFilenamesPboardType exists
        if ( [[dragPasteboard types] containsObject:NSFilenamesPboardType] ) {
            
            // read array
            NSArray *files = [dragPasteboard propertyListForType:NSFilenamesPboardType];
            
            // iterate array and print drag filenames to stdout
            for (NSString *fileURL in files) {
                printf("%s\n", [fileURL UTF8String]);
            }
        }
        
        return EXIT_SUCCESS;
    }
}