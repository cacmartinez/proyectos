//
//  WebServiceContstants.h
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TORNEOS_ACTUALES,
    JUEGOS_DE_TORNEO
} ProcessKeys;

#define arregloProcesos @"TORNEOS_ACTUALES", @"JUEGOS_DE_TORNEO", nil


//URLS

#define URL_BASE                            @"http://hockeyapp.bithound.mx/index.php?r={COMPLEMENTO}"
#define URL_BASE_IMAGEN                     @"http://hockeyapp.bithound.mx/images{IMAGEN_PATH}"
#define URL_TORNEOS_ACTUALES                @"torneos/actuales"
#define URL_JUEGOS_CON_TORNEOS              @"juegos/conTorneos"

//Variable

#define VARIABLE_COMPLEMENTO                @"{COMPLEMENTO}"
#define VARIABLE_PATH_IMAGEN                @"{IMAGEN_PATH}"

//JSON General Key Constants
#define JSON_ID_KEY                         @"id"
#define JSON_URL_LOGO                       @"urlLogo"
#define JSON_NOMBRE_KEY                     @"nombre"
#define JSON_GOLES_KEY                      @"goles"

//JSON Specific Web Service Constants
#define JSON_TORNEOS_KEY                    @"torneos"
#define JSON_TORNEO_ID_KEY                  JSON_ID_KEY
#define JSON_TORNEO_COMPLEJO_KEY            @"complejo"
#define JSON_TORNEO_NOMBRE_KEY              JSON_NOMBRE_KEY
#define JSON_JUEGO_ID_KEY                   JSON_ID_KEY
#define JSON_JUEGO_EQUIPO_CASA_KEY          @"equipoCasa"
#define JSON_JUEGO_EQUIPO_CASA_ID_KEY       @"idEquipoCasa"
#define JSON_JUEGO_EQUIPO_CASA_GOLES_KEY    JSON_GOLES_KEY
#define JSON_JUEGO_EQUIPO_VISITANTE_KEY     @"equipoVisitante"
#define JSON_JUEGO_EQUIPO_VISITANTE_ID_KEY  @"idEquipoVisitante"
#define JSON_JUEGO_EQUIPO_VISITANTE_GOLES_KEY JSON_GOLES_KEY
#define JSON_JUEGO_MBP_KEY                  @"mbp"
#define JSON_JUEGO_IMAGEN_URL_KEY           @"urlImagen"
#define JSON_JUEGO_PERIODO_KEY              @"periodo"
#define JSON_JUEGO_FECHA_KEY                @"fecha"
#define JSON_JUEGO_TORNEO_ID_KEY            @"idTorneo"
#define JSON_JUEGO_TORNEO_KEY               @"torneo"
#define JSON_EQUIPO_ID_KEY                  JSON_ID_KEY
#define JSON_EQUIPO_NOMBRE_KEY              JSON_NOMBRE_KEY
#define JSON_EQUIPO_URL_LOGO_KEY            JSON_URL_LOGO
#define JSON_EQUIPO_CATEGORIA_KEY           @"categoria"
#define JSON_EQUIPO_LIGA_KEY                @"liga"

@interface WebServiceConstants : NSObject

//Funciones

+ (NSString *)getTorneosActualesURL;
+ (NSString *)getJuegosConTorneosURL;

+ (NSString *)getURLCompletaImagenConPath:(NSString *)imagenPath;

@end
