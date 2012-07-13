//
//  Globales.h
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Globales : NSObject

@property (readonly) NSDictionary* params;
@property (readonly) sqlite3* db;
@property (readonly) NSObject* empty;

+ (Globales*)singleton;
- (id)init;




@end
