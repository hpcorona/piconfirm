//
//  Globales.m
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Globales.h"

@implementation Globales

@synthesize db = _db, params = _params, empty = _empty;

static Globales *_singleton = nil;

// Singleton
+ (Globales*)singleton {
  @synchronized([Globales class]) {
    if (_singleton == nil) {
      _singleton = [[Globales alloc] init];
    }
  }
  
  return _singleton;
}

// Constructor
- (id)init {
  self = [super init];
  if (self) {
    [self cargaParams];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDir = [paths objectAtIndex:0];
    NSString* databasePath = [documentsDir stringByAppendingPathComponent:@"data.db"];
    
    if (sqlite3_open([databasePath UTF8String], &_db) != SQLITE_OK) {
      NSLog(@"No se pudo abrir la base de datos");
      _db = nil;
    } else {
      [self crearTablas];
    }
    
    _empty = [[NSObject alloc] init];
  }
  return self;
}

// Crear Base de Datos
- (void)crearTablas {
  if (_db == nil) return;
  
  if (sqlite3_exec(_db, "create table reporte (id integer primary key autoincrement, guia text, trip text, fecha text, observaciones text, firma blob);", NULL, NULL, NULL) != SQLITE_OK) {
    NSLog(@"Error al crear la tabla Reporte");
  }
  
  if (sqlite3_exec(_db, "create table foto (id integer primary key autoincrement, tipo text, foto blob, observaciones text);", NULL, NULL, NULL) != SQLITE_OK) {
    NSLog(@"No se pudo crear la tabla Foto");
  }
}

// Carga archivo de Parámetros
- (void)cargaParams {
  NSString* nmplist = @"Params.plist";
  
  NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:nmplist];
  _params = [[NSDictionary alloc] initWithContentsOfFile:filePath];
}


@end
