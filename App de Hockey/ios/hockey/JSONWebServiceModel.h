//
//
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceConstants.h"
#import "JSONWebServiceConnection.h"

//Connection types
#define GET  0
#define POST 1
#define PUT  2
#define DELETE 3

@interface JSONWebServiceModel : NSObject <ConnectionDelegate>{
    NSInteger NUM_TOTAL_OPERACIONES;
    NSInteger NUM_OPERACIONES_JSON;
    NSInteger NUM_OPERACIONES_IMAGES;
}

//Factory method to create a new connection with the given parameters
-(void)startWSConnectionWithUrl:(NSString*)url andKey:(NSString*)key type:(NSInteger)type andDataDict:(NSDictionary*)data;

//Abstract of method to throw an exception from connection
-(void)throwConnectionError:(NSError*)error;

//Method to get the String representation of a NSInteger number
-(NSString*)convertirEnteroAFormatoCadena:(NSInteger)entero;

//Methods to get the key or the index of a ProcessKey
-(NSString*)   processKeyToString:(ProcessKeys)processKey;
-(ProcessKeys) indexFromKey:(NSString*)strVal;

@end
