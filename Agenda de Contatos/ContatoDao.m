//
//  ContatoDao.m
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

static ContatoDao *defaultDao = nil;

-(id) init {
    self = [super init];
    
    if(self){
        self.contatos = [NSMutableArray new];
    }
    
    return self;
}

//Se não existir lista, cria e devolve, senão só devolve a existente
//Padrão Singleton
// + -> static
+ (ContatoDao *) contatoDaoInstance{
    if(!defaultDao){
        defaultDao = [ContatoDao new];
    }
    
    return defaultDao;
}

- (void) adicionaContato:(Contato *)contato{
    [self.contatos addObject:contato];
}

- (NSInteger) totalElementos{
    return self.contatos.count;
}

- (Contato *) contatoIndice:(NSInteger)posicao {
    return self.contatos[posicao];
}

- (void) removeContato:(Contato *)contato {
    [self.contatos removeObject:contato];
}

- (NSInteger)indiceDoContato:(id)contato{
    return [self.contatos indexOfObject:contato];
}


@end
