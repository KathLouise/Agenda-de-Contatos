//
//  ListaContatosViewController.m
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController 

- (id) init {
    //Para que a nossa classe não ignore coisas que a
    //UITableViewController já faz, deve-se chamar o seu inicializador.
    self = [super init];
    if(self){
        //init: qual o tipo de botão que deve ser criado
        //Target: quem você quer que chame
        //Action: Qual ação que se quer executar
        UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
        
        //Cria o botão que fica do lado direito
        self.navigationItem.rightBarButtonItem = botaoForm;
        self.navigationItem.title = @"Contatos";
        self.contatoDao = [ContatoDao new];
    }
    
    return self;
}

//Monta a transição entre a tela de lista para a tela de formulário
-(void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    form.contatoDao.contatos = self.contatoDao.contatos;
    [self.navigationController pushViewController:form animated:YES];
}

/*retorna para a tela o numero de elementos que tem no array,
  Para criar exatamente a quantidade de linhas correta na View */
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contatoDao.contatos.count;
}

// retorna um celula[uma linha da tabela] que deve ser renderizada para um determinado indice
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identificador = @"Celula";
    
    //Se uma célula ja existe, reutilize ela a que tiver este identificador
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    //Se ela não existir, crie uma nova, com este identificador;
    if (!cell){
        //cria a célula com o estilo padrão
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: identificador];
    }
    
    Contato *contato = self.contatoDao.contatos[indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

//Recarrega a tabela
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

@end
