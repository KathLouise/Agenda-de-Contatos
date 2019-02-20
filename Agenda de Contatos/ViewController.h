//
//  ViewController.h
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 18/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@protocol ViewControllerDelegate <NSObject>

-(void) contatoAdicionado: (Contato *) contato;
-(void) contatoAtualizado: (Contato *) contato;

@end

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *endereco;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *site;

@property ContatoDao *contatoDao;
@property Contato *contato;

@property id<ViewControllerDelegate> delegate;

@end

