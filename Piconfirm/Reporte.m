//
//  Reporte.m
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Reporte.h"

@implementation Reporte

@synthesize trip,guia,fecha,observaciones,identificador;

- (void)alta {
  char* alta_sql = sqlite3_mprintf("insert into reporte (guia, trip, fecha, observaciones) values (%Q, %Q, %Q, %Q)", [guia UTF8String], [trip UTF8String], [fecha UTF8String], [observaciones UTF8String]);
  if (sqlite3_exec([Globales singleton].db, alta_sql, NULL, NULL, NULL) != SQLITE_OK) {
    NSLog(@"Error al ejecutar la alta");
  } else {
    identificador = sqlite3_last_insert_rowid([Globales singleton].db);
  }
  sqlite3_free(alta_sql);
}

@end
