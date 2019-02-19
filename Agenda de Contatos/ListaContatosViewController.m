//
//  ListaContatosViewController.m
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ViewController.h"

@implementation ListaContatosViewController 

- (id) init {
    //Para que a nossa classe não ignore coisas que a
    //UITableViewController já faz, deve-se chamar o seu inicializador.
    self = [super init];
    
    //init: qual o tipo de botão que deve ser criado
    //Target: quem você quer que chame
    //Action: Qual ação que se quer executar
    UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
    
    //Cria o botão que fica do lado direito
    self.navigationItem.rightBarButtonItem = botaoForm;
    self.navigationItem.title = @"Contatos";
    
    return self;
}

//Monta a transição entre a tela de lista para a tela de formulário
-(void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    [self.navigationController pushViewController:form animated:YES];
}

@end
