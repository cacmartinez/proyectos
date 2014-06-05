//
//  WebServiceContstants.m
//  hockey
//
//  Created by Compean on 30/03/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "WebServiceConstants.h"

@implementation WebServiceConstants


+ (NSString *)getTorneosActualesURL{
    return [URL_BASE stringByReplacingOccurrencesOfString:VARIABLE_COMPLEMENTO withString:URL_TORNEOS_ACTUALES];
}

+ (NSString *)getJuegosConTorneosURL{
    return [URL_BASE stringByReplacingOccurrencesOfString:VARIABLE_COMPLEMENTO withString:URL_JUEGOS_CON_TORNEOS];
}

+ (NSString *)getURLCompletaImagenConPath:(NSString *)imagenPath{
    if (imagenPath && ![imagenPath isEqual:[NSNull null]]) {
        return [URL_BASE_IMAGEN stringByReplacingOccurrencesOfString:VARIABLE_PATH_IMAGEN withString:imagenPath];
    }
    return nil;
}

@end
