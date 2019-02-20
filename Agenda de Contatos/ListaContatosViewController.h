//
//  ListaContatosViewController.h
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//Users/katheryne/Documents/Cursos/Alura/Objective-C/Agenda de Contatos/Agenda de Contatos/Base.lproj/Main.storyboard//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"
#import "ViewController.h"

@interface ListaContatosViewController : UITableViewController <ViewControllerDelegate>

@property ContatoDao *contatoDao;
@property Contato *contatoSelecionado;
@property NSInteger linhaSelecionada;

@end
