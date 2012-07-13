//
//  Reporte.h
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Globales.h"

@interface Reporte : NSObject

@property int identificador;

@property (nonatomic) NSString* trip;

@property (nonatomic) NSString* guia;

@property (nonatomic) NSString* fecha;

@property (nonatomic) NSString* observaciones;

- (void)alta;

@end
