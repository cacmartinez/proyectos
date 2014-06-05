//
//  HockeyTableCell.h
//  hockey
//
//  Created by Compean on 24/08/13.
//  Copyright (c) 2013 Bithound. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HockeyTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *textoFecha;
@property (weak, nonatomic) IBOutlet UILabel *textoPeriodoJuego;
@property (weak, nonatomic) IBOutlet UILabel *textoMarcadorCasa;
@property (weak, nonatomic) IBOutlet UILabel *textoMarcadorInvitado;
@property (weak, nonatomic) IBOutlet UILabel *textoEquipoCasa;
@property (weak, nonatomic) IBOutlet UIImageView *imagenCasa;
@property (weak, nonatomic) IBOutlet UILabel *textoEquipoInvitado;
@property (weak, nonatomic) IBOutlet UIImageView *imagenInvitado;


@end
