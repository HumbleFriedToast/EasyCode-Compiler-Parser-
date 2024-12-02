%{
#include <stdio.h>
int nb_ligne=1;
int col=1;
int yyerror(char *msg);

%}


%start S
%token  IDF  aff pvg  

%token  type_int type_str type_float add min mul divide

%token and or  gr inf

%token  Dec_int Dec_str Dec_float constant

%token DEBUT EXEC FIN tantque  faire si sinon alors pf pd acd acf brd brf points 







%%

S: DEBUT  DEC EXE  {printf("\nCOMPILED SUCESSFULLY\n");YYACCEPT;}
    ;

       
DEC: CONST TYPE points IDF pvg DEC | CONST TYPE points IDF  brd VALUES brf pvg DEC | ;
CONST: constant|;



VALUES:Dec_int|Dec_float|Dec_str;
TYPE: type_int|type_float|type_str;




EXE:EXEC acd INSTRUCTION acf FIN|;


INSTRUCTION:AFFECTATION |OPERATION |CONDITION|LOOP|;

AFFECTATION:IDENTIFIER aff OPERATION;
IDENTIFIER:IDF|IDF brd Dec_int brf;

OPERATION: VALUES OPERATOR OPERATION | IDENTIFIER OPERATOR OPERATION | IDENTIFIER pvg INSTRUCTION| VALUES pvg INSTRUCTION  |'('OPERATION')' OPERATOR OPERATION;
OPERATOR:add| min| mul |divide ; 

COMPARITOR:gr|inf;
LOGIC:and |or;
L_C:COMPARITOR|LOGIC;

OPERATOR_L: VALUES L_C OPERATOR_L | IDENTIFIER L_C OPERATOR_L | IDENTIFIER| VALUES  |pd OPERATOR_L pf LOGIC OPERATOR_L ;




CONDITION: si pd  OPERATOR_L pf alors acd INSTRUCTION acf ELSE ;
ELSE: sinon acd INSTRUCTION acf  INSTRUCTION |INSTRUCTION;



LOOP:tantque pd OPERATOR_L pf faire acd INSTRUCTION acf INSTRUCTION;




%%






main ()
{
yyparse();
}
yywrap()
{}
int yyerror(char *msg)
{  printf("\nErreur syntaxique  %s,   a la ligne %d \n",msg,nb_ligne);;
    return 1;
}

