//
//
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "JSONWebServiceConnection.h"

//Necesita manejar POST de un diccionario y aceptar parámetros
//Hacer un diccionario de WebServices, donde se haga un método por WS

@implementation JSONWebServiceConnection{
    NSString* _key;
}

-(void)getJsonFromUrl:(NSString*)url withKey:(NSString*)key{
    _key = key;
    
    [self prepareGetConnectionWithUrl:[NSURL URLWithString:url]];
    
    //Starts the new connection
    [self executeConnection];
}

-(void)deleteJsonFromUrl:(NSString*)url withKey:(NSString*)key{
    _key = key;
    
    [self prepareDeleteConnectionWithUrl:[NSURL URLWithString:url]];
    
    //Starts the new connection
    [self executeConnection];
}

-(void)postJsonToUrl:(NSString*)url withData:(NSDictionary*)data andKey:(NSString*)key{
    _key = key;
    
    [self preparePostConnectionWithUrl:url andData:data];
    
    //Starts the new connection
    [self executeConnection];
}


-(void)putJsonToUrl:(NSString*)url withData:(NSDictionary*)data andKey:(NSString*)key{
    _key = key;
    
    [self preparePutConnectionWithUrl:url andData:data];
    
//Starts the new connection
    [self executeConnection];
}

    
    //Se manda llamar al terminar la conexión satisfactoriamente
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSError *error = nil;
    
    // Parse the data
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:super.receivedData
                                                                options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers
                                                                  error:&error];
    
    //DebugLog(@"objectosDelJson de Base_Connection = %@", jsonObjects);
    
    [super.connectionDelegate infoFromConnection:jsonObjects withKey:_key];
    
    super.receivedData = nil;
}
    
@end
