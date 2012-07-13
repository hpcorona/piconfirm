//
//  ReporteProvider.h
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaginadorConsulta.h"
#import "Reporte.h"
#import "Globales.h"

@interface ReporteProvider : PaginadorConsulta

- (id)init;

- (id)makeRow:(sqlite3_stmt *)statement;

@end
