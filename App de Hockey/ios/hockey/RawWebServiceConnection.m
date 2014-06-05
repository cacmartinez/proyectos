//
//
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "RawWebServiceConnection.h"
#import "AppDelegate.h"

#define TIMEOUT_INTERVAL 60.0f

@implementation RawWebServiceConnection

@synthesize connectionDelegate, connection, request, receivedData;


-(void) initializeConnection{
    [self cancelCurrentConnection];
    
    connection = [[NSURLConnection alloc] init]; 		//New connection instance
    
    if (receivedData == nil){							//if data is NULL
        receivedData = [[NSMutableData alloc] init]; 	//then make a new instance
    }
}

-(void)prepareGetConnectionWithUrl:(NSURL*) url{
    [self initializeConnection];
    
    //New request with the given url string, using cache
    //with 60 sec. to throw the timeout exception
    request = [NSMutableURLRequest requestWithURL:[url standardizedURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:TIMEOUT_INTERVAL];
}

-(void)prepareDeleteConnectionWithUrl:(NSURL*) url{
    [self initializeConnection];
    
    //New request with the given url string, using cache
    //whit 60 sec. to throw the timeout exception
    request = [NSMutableURLRequest requestWithURL:[url standardizedURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:TIMEOUT_INTERVAL];
    [request setHTTPMethod:@"DELETE"];
}

-(void) executeConnection{
    //Agrega la petición anterior a la conexión
    self.connection = [self.connection initWithRequest:self.request delegate:self];
    
    if ([self isInternetReachable])
    {
        //Inicia la conexión
        [self.connection start];
    }
    else
    {
        NSError* newError = [[NSError alloc] initWithDomain:@"NSURLErrorDomain" code:NSURLErrorNotConnectedToInternet userInfo:nil];
        [connectionDelegate connectionError: newError];
    }
}

-(void)preparePostConnectionWithUrl:(NSString*)url andData:(NSDictionary*)dataDict{
    [self initializeConnection];
    
    //New request with the given url string, using cache
    //whit 60 sec. to throw the timeout exception
    request = [NSMutableURLRequest requestWithURL:[[NSURL URLWithString:url] standardizedURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:TIMEOUT_INTERVAL];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    
    //set request content type we MUST set this value.
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    
    if(dataDict == nil) return;
    NSData* postData = [self serializeJSON:dataDict];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    //set request length
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    //set post data of request
    [request setHTTPBody:postData];
}

-(void)preparePutConnectionWithUrl:(NSString*)url andData:(NSDictionary*)dataDict{
    [self initializeConnection];
    
//New request with the given url string, using cache
//whit 60 sec. to rise the timeout exception
    request = [NSMutableURLRequest requestWithURL:[[NSURL URLWithString:url] standardizedURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:TIMEOUT_INTERVAL];
    
    NSData* putData = [self serializeJSON:dataDict];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[putData length]];
    
//set http method
    [request setHTTPMethod:@"PUT"];
    
//set request length
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
//set request content type we MUST set this value.
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    
//set post data of request
    [request setHTTPBody:putData];
}

-(NSData*) serializeJSON:(NSDictionary*)dict{
    NSError* error = nil;
    NSData* json = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    return json;
}

//Stops the connection
-(void)cancelCurrentConnection{
    [connection cancel];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"response code: %ld", (long)((NSHTTPURLResponse *)response).statusCode);
}

//Adds the received data to the ivar 'receivedData'
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if (receivedData == nil){							//if data is NULL
        receivedData = [[NSMutableData alloc] init]; 	//then make a new instance
    }
    [receivedData appendData:data];
}

//It's called when an exception is raised
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if(error){
        [connectionDelegate connectionError:error];
        return;
    }
    NSLog(@"%@" , error);
}

// Method that checks if Internet is reachable or not.
-(BOOL) isInternetReachable
{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    return [appDelegate reachable];
}

@end
