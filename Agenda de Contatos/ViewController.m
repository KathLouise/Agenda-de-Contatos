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

-(IBAction) adiciona {
    Contato *contato = [Contato new];
    contato.nome = self.nome.text;
    contato.endereco = self.endereco.text;
    contato.email = self.email.text;
    contato.telefone = self.telefone.text;
    contato.site = self.site.text;
    
    NSLog(@"Dados do contato %@ %@ %@ %@ %@", contato.nome, contato.endereco, contato.email, contato.telefone, contato.site);
}

@end
