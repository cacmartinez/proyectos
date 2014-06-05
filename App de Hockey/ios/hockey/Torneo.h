//
//  Torneo.h
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "JSONWebServiceModel.h"

@class Torneo;

@protocol TorneoDelegate <NSObject>

-(void)torneoServerConnectionError:(NSError *)error;

@optional

-(void)torneosActuales:(NSArray *)torneos respuestaServidorConError:(NSError *)error;

@end

@interface Torneo : JSONWebServiceModel

@property (weak) id<TorneoDelegate> delegate;

@property NSString *idTorneo;
@property NSString *complejo;
@property NSString *nombre;

- (void)requestCurrentTournamentsFromServer;
- (NSDictionary *)dictionary;
+ (Torneo *)tournamentWithDictionary:(NSDictionary *)dictionary;

@end
