//
//  Goles.h
//  hockey
//
//  Created by Compean on 09/04/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "JSONWebServiceModel.h"
#import "Equipo.h"
#import "Juego.h"
#import "Jugador.h"

@interface Goles : JSONWebServiceModel

@property NSString *idGol;
@property Jugador *jugador;
@property Equipo  *equipo;
@property Juego   *juego;
@property NSString *tiempo;

@end
