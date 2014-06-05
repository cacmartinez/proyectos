//
//
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "RawWebServiceConnection.h"

@interface JSONWebServiceConnection : RawWebServiceConnection

//Starts a new connection to GET a JSON to an URL
-(void)getJsonFromUrl:(NSString*)url withKey:(NSString*)key;

//Starts a new connection to POST a JSON to an URL
-(void)postJsonToUrl:(NSString*)url withData:(NSDictionary*)data andKey:(NSString*)key;

//Starts a new connection to PUT a JSON to an URL
-(void)putJsonToUrl:(NSString*)url withData:(NSDictionary*)data andKey:(NSString*)key;

    //Starts a new connection to DELETE a JSON to an URL
-(void)deleteJsonFromUrl:(NSString*)url withKey:(NSString*)key;

@end
