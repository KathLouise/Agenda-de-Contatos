//
//  ViewController.m
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 18/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@implementation ViewController

- (id) initWithCoder: (NSCoder *) aDecoder{
    self = [super initWithCoder: aDecoder];
    if(self){
        UIBarButtonItem *botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.rightBarButtonItem = botao;
        self.navigationItem.title = @"Novo Contato";
        self.contatoDao = [ContatoDao contatoDaoInstance];
    }
    
    return self;
}

-(void) adiciona {
    Contato *contato = [Contato new];
    contato.nome = self.nome.text;
    contato.endereco = self.endereco.text;
    contato.email = self.email.text;
    contato.telefone = self.telefone.text;
    contato.site = self.site.text;
    
    [self.contatoDao adicionaContato: contato];
    NSLog(@"%@", self.contatoDao.contatos);
    
    //Volta para a tela de lista
    [self.navigationController popViewControllerAnimated:YES];
}

@end
