//
//  ListaContatosViewController.h
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//Users/katheryne/Documents/Cursos/Alura/Objective-C/Agenda de Contatos/Agenda de Contatos/Base.lproj/Main.storyboard//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface ListaContatosViewController : UITableViewController

@property ContatoDao *contatoDao;
@property Contato *contatoSelecionado;

@end
