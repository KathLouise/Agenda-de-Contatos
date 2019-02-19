//
//  ContatoDao.m
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

-(id) init {
    self = [super init];
    
    if(self){
        self.contatos = [NSMutableArray new];
    }
    
    return self;
}

@end
