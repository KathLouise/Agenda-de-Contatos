//
//  ContatoDao.h
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContatoDao : NSObject

@property NSMutableArray *contatos;

+ (ContatoDao *) contatoDaoInstance;
-(void) adicionaContato: (Contato *) contato;
-(NSInteger) totalElementos;
-(Contato *) contatoIndice: (NSInteger) posicao;
-(void) removeContato: (Contato *) contato;

@end

NS_ASSUME_NONNULL_END
