//
//  UserConfiguration.m
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "UserConfiguration.h"

@implementation UserConfiguration

+ (void)saveTournamentsToUserDefaults:(NSArray *)tournaments{
    NSMutableArray *tournamentsDicts = [NSMutableArray array];
    for (Torneo *tournament in tournaments) {
        [tournamentsDicts addObject:[tournament dictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:tournamentsDicts forKey:@"torneos"];
}

+ (NSArray *)tournamentsFromUserDefaults{
    NSDictionary *tournamentsDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"torneos"];
    NSMutableArray *tournaments = [NSMutableArray array];
    for (NSDictionary *tounamentDict in tournamentsDict) {
        [tournaments addObject:[Torneo tournamentWithDictionary:tounamentDict]];
    }
    return tournaments;
}

+(NSArray *)torneosElegidos{
    return [self tournamentsFromUserDefaults];
}

+(void)setTorneosElegidos:(NSArray *)torneos{
    [self saveTournamentsToUserDefaults:torneos];
}

@end
