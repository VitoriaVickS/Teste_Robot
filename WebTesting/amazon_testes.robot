*** Settings ***
Documentation     Essa suite testa o site da amazon.com.br
Resource          amazon_resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]        Esse teste verifica o menu eletrônicos do site da Amazon.com.br 
    ...                    e verifica a categoria Computadores e Informática
    [Tags]                 menus    categorias
      Acessar a home page do site Amazon.com.br
      Entrar no menu "Eletrônicos"
      Verificar se aparece a frase "Eletrônicos e Tecnologia"
      Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
      Verificar se aparece a categoria "Computadores e Informática"
 Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]        Esse teste verifica a busca de um produto
    [Tags]                 busca_produtos    lista_busca    
     Acessar a home page do site Amazon.com.br
     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Clicar no botão de pesquisa
     Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    
Caso de Teste 03 - Adicionar e Remover o Produto do Carrinho
    [Documentation]    Esse teste verifica a adição e remoção de um produto no carrinho de compras
    [Tags]             adicionar_carrinho     remover_carrinho
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Login"
    Digitar o e-mail no campo de login
    Clicar no botão continuar
    Digitar a senha no campo de login
    Clicar no botão fazer login
    Digitar no Campo de pesquisa "Controle Sem Fio Xbox + Cabo USB"
    Clicar no botão pesquisa
    Clicar na imagem do produto "Controle Sem Fio Xbox + Cabo USB"
    adicionar o produto "Controle Sem Fio Xbox + Cabo USB" no carrinho
    O produto "Controle Sem Fio Xbox + Cabo USB" deve ser mostrado no carrinho
    Clicar em remover o produto "Controle Sem Fio Xbox + Cabo USB" do carrinho
    O carrinho deve ficar vazio