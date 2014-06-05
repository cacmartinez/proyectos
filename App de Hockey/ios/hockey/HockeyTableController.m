//
//  HockeyTableController.m
//  deportes
//
//  Created by Compean on 22/08/13.
//  Copyright (c) 2013 Bithound. All rights reserved.
//

#import "HockeyTableController.h"
#import "HockeyTableCell.h"
#import "GameInformationController.h"


#define SERVERURL @"http://192.168.15.121:3333"

@interface HockeyTableController ()

@property NSArray *juegos;
@property NSDictionary *imagenes;
@property Juego *juego;

@end

@implementation HockeyTableController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

/**
 * Delegate method call from JuegoDelegado in Juego.h
 *
 * This method is called in response from the server of the method call to requestGamesWithTournamentIds:
 */
-(void)juegos:(NSArray *)juegos imagenes:(NSDictionary *)imagenes withError:(NSError *)error{
    if (!error) {
        self.juegos = juegos;
        self.imagenes = imagenes;
        [self.tablaJuegos reloadData];
    }
}

- (void)getGamesForSelectedTournament{
#warning TODO show only the games that correspond to the tournament the user selected in the pop up menu
}

- (void)torneoServerConnectionError:(NSError *)error{
#warning TODO handle connection errors with the server
}

// this method is no longer used, delete in future version of this app.
- (void)requestTableData{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/index.php",SERVERURL]]];
    [request setHTTPMethod:@"POST"];
    //loggedUser = [self urlEncodeValue:username.stringValue];
    NSString *postString = [NSString stringWithFormat:@"r=juegos/getGames"];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    //NSURLResponse *response = nil;
    //NSError *error = nil;
    /*NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     if (error) {
     NSLog(@"error llamando index.php getGames");
     NSLog(@"descripcion: %@", [error description]);
     NSLog(@"response: %@", [((NSHTTPURLResponse *)response) MIMEType]);
     } else {
     NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
     //NSLog(@"info recibida de getGames: %@", dataString);
     NSArray *rows = [dataString JSONValue];
     for (NSDictionary *rowData in rows) {
     NSLog(@"nombreEquipoVisitante: %@", [rowData objectForKey:@"nombreEquipoVisitante"]);
     }
     //isDownloadingFiles = YES;
     //[self deleteLocalCopiesOfFilesDeletedRemotely:data];
     //[self checkForChangesFromUser:data];
     //isDownloadingFiles = NO;
     //[self uploadFoldersNotInS3Request];
     //[self uploadFilesNotInS3];
     
     
     }*/
}

/*
 * make resquest to get games of selected tournaments
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self requestTableData];
    self.juego = [Juego new];
    self.juego.delegate = self;
#warning TODO change the input of the following call to the actual selected tournaments ids
    [self.juego requestGamesWithTournamentIds:@[]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * When the table is not in full screen, this method handles the touches of taps
 */
-(void)handleSingleTap:(id)sender {
 NSLog(@"detectoTouch");
 HockeyTableCell *cell = (HockeyTableCell *)[sender view];
 UITableView * hockeyTableView = [self.view.subviews objectAtIndex:1];
 //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
 NSLog(@"%@",hockeyTableView.indexPathForSelectedRow);
 /*if (self.selectedRow != nil) {
 NSIndexPath *indexPath = [[NSIndexPath alloc] in]
 [[hockeyTableView cellForRowAtIndexPath:self.selectedRow] setSelected:NO];
 }*/
 /*if (cell.isSelected) {
 [hockeyTableView deselectRowAtIndexPath:[hockeyTableView indexPathForCell:cell] animated:NO];
 //self.selectedRow = nil;
 }else{*/
 //[cell setSelected:YES];
 [hockeyTableView selectRowAtIndexPath:[hockeyTableView indexPathForCell:cell] animated:NO scrollPosition:UITableViewScrollPositionNone];
 GameInformationController *gameController = [[GameInformationController alloc] initWithNibName:@"GameInformationController" bundle:nil];
 [self.navigationController pushViewController:gameController animated:YES];
 [hockeyTableView deselectRowAtIndexPath:[hockeyTableView indexPathForCell:cell] animated:NO];
 //NSLog(@"%d",[hockeyTableView indexPathForCell:cell].row);
 //[self tableView:hockeyTableView didSelectRowAtIndexPath:];
 //self.selectedRow = [hockeyTableView indexPathForCell:cell].row;
 
 //}
 //cell.selectionStyle = UITableViewCellSelectionStyleNone;
 }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return 2;
    return self.juegos.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 107;
}

/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 //[tableView cellForRowAtIndexPath:indexPath].selectionStyle = UITableViewCellSelectionStyleBlue;
 //[[tableView cellForRowAtIndexPath:indexPath] setSelected:YES];
 UITableView * hockeyTableView = [self.hockeyTableViewController.view.subviews objectAtIndex:1];
 [[hockeyTableView cellForRowAtIndexPath:hockeyTableView.indexPathForSelectedRow] setSelected:NO];
 NSLog(@"seleccionada");
 }*/

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HockeyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HockeyTableCell"];
    
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HockeyTableCell" owner:self options:nil];
        cell = (HockeyTableCell *)[nib objectAtIndex:0];
    }
    
    /*
     *   Now that we have a cell we can configure it to display the data corresponding to
     *   this row/section
     */
    //cell.textoEquipoCasa.text = @"Borregos";
    Juego *juego = [self.juegos objectAtIndex:indexPath.row];
    NSDateFormatter *dateFormmater = [[NSDateFormatter alloc] init];
    dateFormmater.dateStyle = NSDateFormatterMediumStyle;
    cell.textoFecha.text = [dateFormmater stringFromDate:juego.fecha];
    cell.textoPeriodoJuego.text = @(juego.periodo).stringValue;
    cell.textoMarcadorCasa.text = juego.cantidadGolesCasa.stringValue;
    cell.textoMarcadorInvitado.text = juego.cantidadGolesVisitante.stringValue;
    cell.textoEquipoCasa.text = juego.equipoCasa.nombre;
    cell.textoEquipoInvitado.text = juego.equipoVisitante.nombre;
    //cell.imagenCasa.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[WebServiceConstants getURLCompletaImagenConPath:juego.equipoCasa.logoEquipoURL]]]];
    //cell.imagenInvitado.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[WebServiceConstants getURLCompletaImagenConPath:juego.equipoVisitante.logoEquipoURL]]]];
    cell.imagenCasa.image = [self.imagenes objectForKey:juego.equipoCasa.logoEquipoURL];
    cell.imagenInvitado.image = [self.imagenes objectForKey:juego.equipoVisitante.logoEquipoURL];
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    /* Now that the cell is configured we return it to the table view so that it can display it */
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    tapGesture.numberOfTapsRequired = 1;
    [cell addGestureRecognizer:tapGesture];
    
    return cell;
}

@end
