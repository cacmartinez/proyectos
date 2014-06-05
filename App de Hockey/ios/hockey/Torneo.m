//
//  Torneo.m
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "Torneo.h"
#import "WebServiceConstants.h"

@implementation Torneo


-(void)requestCurrentTournamentsFromServer{
    [self startWSConnectionWithUrl:[WebServiceConstants getTorneosActualesURL] andKey:[self processKeyToString:TORNEOS_ACTUALES] type:GET andDataDict:nil];
}

-(void)infoFromConnection:(id)info withKey:(NSString *)key{
    if ([key isEqualToString:[self processKeyToString:TORNEOS_ACTUALES]]) {
        NSArray *torneosDics = info[JSON_TORNEOS_KEY];
        NSMutableArray *torneos = [NSMutableArray new];
        for (NSDictionary *torneoDict in torneosDics) {
            Torneo *torneo = [Torneo tournamentWithDictionary:torneoDict];
            [torneos addObject:torneo];
        }
        [self.delegate torneosActuales:torneos respuestaServidorConError:nil];
    }
}

+ (Torneo *)tournamentWithDictionary:(NSDictionary *)dictionary{
    Torneo *torneo = [Torneo new];
    torneo.idTorneo = dictionary[JSON_TORNEO_ID_KEY];
    torneo.complejo = dictionary[JSON_TORNEO_COMPLEJO_KEY];
    torneo.nombre = dictionary[JSON_TORNEO_NOMBRE_KEY];
    return torneo;
}

- (NSDictionary *)dictionary{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    dictionary[JSON_TORNEO_ID_KEY]=(self.idTorneo)?self.idTorneo:[NSNull null];
    dictionary[JSON_TORNEO_NOMBRE_KEY]=(self.nombre)?self.nombre:[NSNull null];
    dictionary[JSON_TORNEO_COMPLEJO_KEY]=(self.complejo)?self.complejo:[NSNull null];
    return dictionary;
}

- (BOOL)isEqual:(id)object{
    if ([object isKindOfClass:[Torneo class]]) {
        Torneo *torneo = object;
        if ([self.idTorneo isEqualToString:torneo.idTorneo]) {
            return YES;
        }
    }
    return NO;
}

-(void)throwConnectionError:(NSError *)error{
    [self.delegate torneoServerConnectionError:error];
}

@end
