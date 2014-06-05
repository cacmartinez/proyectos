//
//
//  Copyright (c) 2014 Bithound. All rights reserved.
//
//

#import "JSONWebServiceModel.h"

@implementation JSONWebServiceModel

//Factory method to create a new Webservice connection with the given parameters
-(void)startWSConnectionWithUrl:(NSString*)url andKey:(NSString*)key type:(NSInteger)type andDataDict:(NSDictionary*)data{
    JSONWebServiceConnection* jsonConnection = [[JSONWebServiceConnection alloc] init];
    [jsonConnection setConnectionDelegate:self];
    switch (type) {
        case GET:
            [jsonConnection getJsonFromUrl:url withKey:key];
            break;
            
        case POST:
            [jsonConnection postJsonToUrl:url
                                 withData:data
                                   andKey:key];
            break;
        case PUT:
            [jsonConnection putJsonToUrl:url
                                 withData:data
                                   andKey:key];
            break;
        case DELETE:
            [jsonConnection deleteJsonFromUrl:url withKey:key];
        default:
            break;
    }
    
}

-(NSString*)convertirEnteroAFormatoCadena:(NSInteger)entero{
    return [NSString stringWithFormat:@"%li", (long)entero];
}

#pragma mark - ENCAPSULACION DE LLAVES DE PROCESOS
- (NSString*) processKeyToString:(ProcessKeys)processKey{
    NSArray *imageTypeArray = [[NSArray alloc] initWithObjects:arregloProcesos];
    return [imageTypeArray objectAtIndex:processKey];
}

-(ProcessKeys) indexFromKey:(NSString*)strVal{
    NSArray *imageTypeArray = [[NSArray alloc] initWithObjects:arregloProcesos];
    NSUInteger n = [imageTypeArray indexOfObject:strVal];
    if(n < 1) n = (ProcessKeys)[imageTypeArray objectAtIndex:0];
    return (ProcessKeys) n;
}


//Callback from connection to handle the connection errors
-(void)connectionError:(NSError*)error{
    [self throwConnectionError:error];
}

//Abstract of method to throw an exception from connection
-(void)throwConnectionError:(NSError *)error{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end
