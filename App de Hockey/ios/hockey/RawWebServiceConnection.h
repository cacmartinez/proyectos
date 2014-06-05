//
//
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ConnectionDelegate
@required
-(void)connectionError:(NSError*)error;
@optional
-(void)infoFromConnection:(id)info withKey:(NSString*)key;
-(void)resultedImageFromConnection:(UIImage*)img withKey:(NSString*)key;
@end

@interface RawWebServiceConnection : NSObject <NSURLConnectionDelegate>

@property (nonatomic, strong) id <ConnectionDelegate> connectionDelegate;
@property (nonatomic) NSURLConnection* connection;
@property (nonatomic) NSMutableURLRequest* request;
@property (nonatomic) __block NSMutableData* receivedData;


-(void) executeConnection;
-(void)cancelCurrentConnection;
-(void)prepareGetConnectionWithUrl:(NSURL*) url;
-(void)preparePostConnectionWithUrl:(NSString*)url andData:(NSDictionary*)dataDict;
-(void)preparePutConnectionWithUrl:(NSString*)url andData:(NSDictionary*)dataDict;
-(void)prepareDeleteConnectionWithUrl:(NSURL*) url;

// Method that checks if Internet is reachable or not.
-(BOOL) isInternetReachable;

@end
