//
//  ListaContatosViewController.m
//  Agenda de Contatos
//
//  Created by Katheryne Graf on 19/02/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

#import "ListaContatosViewController.h"
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
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.navigationItem.title = @"Contatos";
        self.contatoDao = [ContatoDao contatoDaoInstance];
        self.linhaSelecionada = -1;
    }
    
    return self;
}

//Monta a transição entre a tela de lista para a tela de formulário
-(void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    //Faz essa atribuição para poder pegar a lista que esta sendo usada
    form.delegate = self;
    //Verifica se existe um contato selecionado, se houver passa ele para o form para edição
    if(self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
    }
    
    //Contato passado, limpa este contato.
    self.contatoSelecionado = nil;
    [self.navigationController pushViewController:form animated:YES];
}

/*retorna para a tela o numero de elementos que tem no array,
  Para criar exatamente a quantidade de linhas correta na View */
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contatoDao totalElementos];
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
    
    Contato *contato = [self.contatoDao contatoIndice: indexPath.row];
    cell.textLabel.text = contato.nome;
    
    return cell;
}

//Recarrega a tabela
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

//SObrescreve o método padrão para que ele delete os contatos do array do Dao
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if(editingStyle == UITableViewCellEditingStyleDelete){
        Contato *contato = [self.contatoDao contatoIndice:indexPath.row];
        NSLog(@"%ld", (long)indexPath.row);
        NSLog(@"%@", contato);
        
        /*Deve se remover primeiro da lista e depois remove-se da tabela
         nessa ordem, senão ocorre um erro no numero de linhas, o programa se
         perde*/
        [self.contatoDao removeContato:contato];
        //recebe um array de indexPath e uma animação
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.contatoDao contatoIndice:indexPath.row];
    [self exibeFormulario];
}

-(void)contatoAdicionado:(Contato *)contato{
    self.linhaSelecionada = [self.contatoDao indiceDoContato:contato];
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ adicionado com sucesso", contato.nome];
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato Adicionado" message:mensagem preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alerta addAction:ok];
    [self presentViewController:alerta animated:YES completion:nil];
}

-(void)contatoAtualizado:(Contato *)contato{
    self.linhaSelecionada = [self.contatoDao indiceDoContato:contato];
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ alterado com sucesso", contato.nome];
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato Alterado" message:mensagem preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    [alerta addAction:ok];
    [self presentViewController:alerta animated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    self.linhaSelecionada = -1;
    
}

@end
