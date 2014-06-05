//
//  UserConfiguration.h
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Torneo.h"

@interface UserConfiguration : NSObject

+ (NSArray *)torneosElegidos;
+ (void)setTorneosElegidos:(NSArray *)torneos;

@end
