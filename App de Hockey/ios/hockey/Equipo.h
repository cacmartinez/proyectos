//
//  Equipo.h
//  hockey
//
//  Created by Compean on 08/04/14.
//  Copyright (c) 2014 Bithound. All rights reserved.
//

#import "JSONWebServiceModel.h"

typedef enum _categoria{
    CategoriaNinguna,
    CategoriaB = 'B',
    CategoriaA = 'A'
} Categoria;

@interface Equipo : JSONWebServiceModel

@property NSString *idEquipo;
@property NSString *nombre;
@property NSString *logoEquipoURL;
@property Categoria categoria;
@property NSNumber *liga;

+(Equipo *)teamWithDictionary:(NSDictionary *)equipoDict;

@end
