//
//  Juego.h
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "JSONWebServiceModel.h"
#import "Torneo.h"
#import "Equipo.h"

typedef enum _tiempo{
    PeriodoNoInfo,
    PeriodoJuegoUNO,
    PeriodoJuegoDOS,
    PeriodoJuegoTRES
} PeriodoJuego;

@protocol JuegoDelegado <NSObject>

@optional
- (void)juegos:(NSArray *)juegos imagenes:(NSDictionary *)imagenes withError:(NSError *)error;

@end

@interface Juego : JSONWebServiceModel

@property (weak) id<JuegoDelegado> delegate;

@property NSString *idJuego;
@property NSString *mbp;
@property NSString *imagenJuegoURL;
@property PeriodoJuego periodo;
@property NSDate *fecha;
@property Torneo *torneo;
@property Equipo *equipoVisitante;
@property Equipo *equipoCasa;

@property NSNumber *cantidadGolesVisitante;
@property NSNumber *cantidadGolesCasa;

- (void)requestGamesWithTournamentIds:(NSArray *)tournamentIds;

@end
