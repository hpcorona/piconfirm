//
//  HttpAsincrono.h
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON/SBJson.h"

@interface HttpAsincrono : NSObject {

  NSMutableData *responseData;
  NSURLRequest *request;
  NSURLConnection *connection;
  int statusCode;

  id objetoCallback;
  SEL okSelector;
  SEL errSelector;
  
  UIActivityIndicatorView *indicador;
  
}

- (id)init;
- (id)initWithView:(UIView*)view withCenter:(UIView*)viewCenter;
- (id)initWithIndicator:(UIActivityIndicatorView*)view;
- (void)peticion:(NSString*)url notificar:(id)obj siTodoBien:(SEL)ok error:(SEL)err;
- (void)cancelar;

@end

@interface NSData (NSData_ToUTF8String)

- (NSString*)UTF8String;

- (NSString*)ASCIIString;

- (id)JSONValue;

@end

@interface NSString (NSString_URLEncode)

- (NSString*)URLEncoded;

@end
