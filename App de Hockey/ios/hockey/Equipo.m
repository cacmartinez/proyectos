//
//  Equipo.m
//  hockey
//
//  Created by Compean on 08/04/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "Equipo.h"

@implementation Equipo

+(Equipo *)teamWithDictionary:(NSDictionary *)equipoDict{
    Equipo *team = [Equipo new];
    team.idEquipo = equipoDict[JSON_EQUIPO_ID_KEY];
    team.nombre = equipoDict[JSON_EQUIPO_NOMBRE_KEY];
    team.logoEquipoURL = equipoDict[JSON_EQUIPO_URL_LOGO_KEY];
    team.categoria = (equipoDict[JSON_EQUIPO_CATEGORIA_KEY])?[(NSString *)equipoDict[JSON_EQUIPO_CATEGORIA_KEY] characterAtIndex:0]:CategoriaNinguna;
    team.liga = equipoDict[JSON_EQUIPO_LIGA_KEY];
    return team;
}

-(void)throwConnectionError:(NSError *)error{
    
}

@end
