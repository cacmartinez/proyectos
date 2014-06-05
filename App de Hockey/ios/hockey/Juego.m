//
//  Juego.m
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "Juego.h"
#import "WebServiceConstants.h"

@implementation Juego

-(void)requestGamesWithTournamentIds:(NSArray *)tournamentIds{
    NSDictionary *dict;
    if (tournamentIds.count > 0) {
        dict = @{JSON_TORNEOS_KEY:tournamentIds};
    }
    [self startWSConnectionWithUrl:[WebServiceConstants getJuegosConTorneosURL] andKey:@"juegosConTorneos" type:POST andDataDict:dict];
}

-(void)infoFromConnection:(id)info withKey:(NSString *)key{
    if ([key isEqualToString:@"juegosConTorneos"]) {
        NSArray *juegosDicts = info;
        NSMutableArray *juegos = [NSMutableArray array];
        NSMutableDictionary *images = [NSMutableDictionary dictionary];
        for (NSDictionary *juegoDict in juegosDicts) {
            Juego *juego = [Juego getJuegoFromJuegoDict:juegoDict];
            [juegos addObject:juego];
            if (![images objectForKey:juego.equipoCasa.logoEquipoURL] && ![juego.equipoCasa.logoEquipoURL isEqual:[NSNull null]]) {
                [images setObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[WebServiceConstants getURLCompletaImagenConPath:juego.equipoCasa.logoEquipoURL]]]] forKey:juego.equipoCasa.logoEquipoURL];
            }
            if (![images objectForKey:juego.equipoVisitante.logoEquipoURL] && ![juego.equipoVisitante.logoEquipoURL isEqual:[NSNull null]]) {
                [images setObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[WebServiceConstants getURLCompletaImagenConPath:juego.equipoVisitante.logoEquipoURL]]]] forKey:juego.equipoVisitante.logoEquipoURL];
            }
        }
        [self.delegate juegos:juegos imagenes:images withError:nil];
    }
}

+ (Juego *)getJuegoFromJuegoDict:(NSDictionary *)juegoDict{
    Juego *juego = [Juego new];
    juego.idJuego = juegoDict[JSON_JUEGO_ID_KEY];
    juego.mbp = juegoDict[JSON_JUEGO_MBP_KEY];
    juego.imagenJuegoURL = juegoDict[JSON_JUEGO_IMAGEN_URL_KEY];
    juego.periodo = (juegoDict[JSON_JUEGO_PERIODO_KEY] && ![juegoDict[JSON_JUEGO_PERIODO_KEY] isEqual:[NSNull null]])?[(NSNumber *)juegoDict[JSON_JUEGO_PERIODO_KEY] intValue]:PeriodoNoInfo;
    juego.fecha = juegoDict[JSON_JUEGO_FECHA_KEY];
    if (juegoDict[JSON_JUEGO_EQUIPO_VISITANTE_KEY]) {
        juego.equipoVisitante = [Equipo teamWithDictionary:juegoDict[JSON_JUEGO_EQUIPO_VISITANTE_KEY]];
        juego.cantidadGolesVisitante = @([(NSString *)juegoDict[JSON_JUEGO_EQUIPO_VISITANTE_KEY][JSON_JUEGO_EQUIPO_VISITANTE_GOLES_KEY] intValue]);
    } else if (juegoDict[JSON_JUEGO_EQUIPO_VISITANTE_ID_KEY]){
        juego.equipoVisitante = [Equipo new];
        juego.equipoVisitante.idEquipo = juegoDict[JSON_JUEGO_EQUIPO_VISITANTE_ID_KEY];
    }
    if (juegoDict[JSON_JUEGO_EQUIPO_CASA_KEY]) {
        juego.equipoCasa = [Equipo teamWithDictionary:juegoDict[JSON_JUEGO_EQUIPO_CASA_KEY]];
        juego.cantidadGolesCasa = @([(NSString *)juegoDict[JSON_JUEGO_EQUIPO_CASA_KEY][JSON_JUEGO_EQUIPO_CASA_GOLES_KEY] intValue]);
    } else if (juegoDict[JSON_JUEGO_EQUIPO_CASA_ID_KEY]){
        juego.equipoCasa = [Equipo new];
        juego.equipoCasa.idEquipo = juegoDict[JSON_JUEGO_EQUIPO_CASA_ID_KEY];
    } if (juegoDict[JSON_JUEGO_TORNEO_KEY]) {
        juego.torneo = [Torneo tournamentWithDictionary:juegoDict[JSON_JUEGO_TORNEO_KEY]];
    } else if (juegoDict[JSON_JUEGO_TORNEO_ID_KEY]){
        juego.torneo = [Torneo new];
        juego.torneo.idTorneo = juegoDict[JSON_JUEGO_TORNEO_ID_KEY];
    }
    return juego;
}

-(void)throwConnectionError:(NSError *)error{
    NSLog(@"%@",error.description);
}

@end
