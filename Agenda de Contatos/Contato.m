//
//  Contato.m
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import "Contato.h"

@implementation Contato

- (NSString *)description {
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Endereco: %@ Email: %@ Telefone: %@ Site: %@", self.nome, self.endereco, self.email, self.telefone, self.site];
    
    return dados;
}

@end
