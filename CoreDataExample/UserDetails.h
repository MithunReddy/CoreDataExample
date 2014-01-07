//
//  UserDetails.h
//  CoreDataExample
//
//  Created by nunc03 on 12/24/13.
//  Copyright (c) 2013 Mithun Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserDetails : NSManagedObject

@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userPassword;

@end
