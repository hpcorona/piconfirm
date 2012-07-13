//
//  ReporteProvider.m
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReporteProvider.h"

@implementation ReporteProvider

- (id)init {
  self = [super initWithPageSize:25 andDatabase:[[Globales singleton] db]];
  if (self) {
    self.querySql = @"select id, guia, trip, fecha, observaciones from reporte";
    self.countSql = @"select count(*) from reporte";
    
    [self reload];
  }
  return self;
}

- (id)makeRow:(sqlite3_stmt *)statement {
  Reporte *rep = [[Reporte alloc] init];
  
  rep.identificador = sqlite3_column_int(statement, 0);
  rep.guia = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 1)];
  rep.trip = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 2)];
  rep.fecha = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 3)];
  rep.observaciones = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement, 4)];
  
  return rep;
}

@end
