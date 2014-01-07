//
//  TFAppDelegate.h
//  CoreDataExample
//
//  Created by nunc03 on 12/24/13.
//  Copyright (c) 2013 Mithun Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
