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
        self.contatoDao = [ContatoDao contatoDaoInstance];
    }
    
    return self;
}

-(void) adiciona {
    self.contato = [Contato new];
    [self atribuiInformacoes];
    [self.contatoDao adicionaContato: self.contato];
    //Volta para a tela de lista
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate contatoAdicionado: self.contato];
}

-(void) altera {
    [self atribuiInformacoes];
    //Volta para a tela de lista
    [self.navigationController popViewControllerAnimated:YES];
    [self.delegate contatoAtualizado:self.contato];
}

-(void) atribuiInformacoes {
    self.contato.nome = self.nome.text;
    self.contato.endereco = self.endereco.text;
    self.contato.email = self.email.text;
    self.contato.telefone = self.telefone.text;
    self.contato.site = self.site.text;
}

-(void) viewDidLoad{
    //Garante que a tela será criada corretamente
    [super viewDidLoad];
    
    UIBarButtonItem *botao = nil;
    
    if(self.contato){
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(altera)];
        self.navigationItem.rightBarButtonItem = botao;
        self.navigationItem.title = @"Editar Contato";
    } else {
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.rightBarButtonItem = botao;
        self.navigationItem.title = @"Novo Contato";
    }
    
    if(self.contato){
        self.nome.text = self.contato.nome;
        self.endereco.text = self.contato.endereco;
        self.email.text = self.contato.email;
        self.telefone.text = self.contato.telefone;
        self.site.text = self.contato.site;
    }
}

@end
