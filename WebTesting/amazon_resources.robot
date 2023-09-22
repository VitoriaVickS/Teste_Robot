*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${Url}                             http://www.amazon.com.br
${Menu_Eletronicos}                //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')] 
${Header_Eletronicos}              //h1[contains(.,'Eletrônicos e Tecnologia')]
${Texto_Header_Eletronicos}        Eletrônicos e Tecnologia

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Acessar a home page do site Amazon.com.br
    Go To    url=${Url} 
    Wait Until Element Is Visible    locator=${Menu_Eletronicos}
    Sleep    5

Entrar no menu "Eletrônicos"
    Click Element    locator=${Menu_Eletronicos}   
    Sleep    5

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains         text=${Texto_Header_Eletronicos}
    Sleep    5
Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
    Sleep    5
Verificar se aparece a categoria "${Nome_Categoria}"
    Element Should Be Visible    locator=//a[@aria-label='${Nome_Categoria}']
    Sleep    5
    
Digitar o nome de produto "Xbox Series S" no campo de pesquisa
     Input Text    locator=twotabsearchtextbox  text=Xbox Series S
     Sleep      5
Clicar no botão de pesquisa
     Click Element    locator=nav-search-submit-button
     Sleep    5

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Wait Until Element Is Visible    locator=(//span[contains(.,'Console Xbox Series S')])[2]
Entrar no menu "Login"
    Click Element    locator=//a[contains(@data-nav-ref,'nav_ya_signin')]
    Sleep    5
Digitar o e-mail no campo de login
     Input Text        locator=//input[@type='email'][contains(@id,'email')]    text=vi.marketingdigital23@gmail.com
     Sleep   5
Clicar no botão continuar
   Click Element    locator=//input[contains(@tabindex,'5')]
Digitar a senha no campo de login  
    Input Password    locator=//input[@name='password']  password=123456
    Sleep    5
Clicar no botão fazer login
    Click Element    locator=//input[contains(@tabindex,'3')]
    Sleep    5
Digitar no Campo de pesquisa "Controle Sem Fio Xbox + Cabo USB"
    Input Text    locator=//input[contains(@type,'text')]    text=Controle Sem Fio Xbox + Cabo USB
Clicar no botão pesquisa
    Click Element    locator=//input[@value='Ir']
    Sleep    5
Clicar na imagem do produto "Controle Sem Fio Xbox + Cabo USB"
    Click Image    locator=//img[contains(@alt,'Controle Sem Fio Xbox + Cabo USB')]
    Sleep    5
Adicionar o produto "Controle Sem Fio Xbox + Cabo USB" no carrinho
     Click Element    locator=//input[contains(@value,'Adicionar ao carrinho')]
     Sleep    5
O produto "Controle Sem Fio Xbox + Cabo USB" deve ser mostrado no carrinho
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]
    Sleep    5

Clicar em remover o produto "Controle Sem Fio Xbox + Cabo USB" do carrinho
    Click Button    locator=//input[contains(@value,'Excluir')]
    Sleep    5
O carrinho deve ficar vazio
    Click Element    locator=//span[@class='a-size-medium sc-number-of-items'][contains(.,'Subtotal (0 produtos):')]

#GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
E a categoria "Computadores e Informática" deve ser exibida na página  
    Verificar se aparece a categoria "Computadores e Informática"
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Clicar no botão de pesquisa
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

