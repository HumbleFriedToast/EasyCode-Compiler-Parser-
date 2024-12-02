/*--C Part--*/


%{
#include "Sym.tab.h"

extern int nb_ligne;


%}

/*--RegEx--*/

lettre [a-zA-Z]
chiffre [0-9]
IDF {esp}*{lettre}({lettre}|{chiffre})* 
cst {chiffre}+
esp " "


Dec_int (("-"|"+")*)({chiffre}*)
Dec_str """({lettre}*)"""
Dec_float {Dec_int}"."({chiffre}*)

%%
/*---Mot Clee---*/
{esp}*FIXE  {return constant;}
{esp}*NUM   {return type_int;}
{esp}*TEXT  {return type_str;}
{esp}*FLOAT {return type_float;}
{esp}*SI    {return si;}
{esp}*ALORS {return alors;}
{esp}*SINON {return sinon;}
{esp}*TANTQUE {return tantque;}
{esp}*FAIRE {return faire;}



{esp}*DEBUT     {return DEBUT;}
{esp}*EXECUTION {return EXEC;}
{esp}*FIN       {return FIN;}

/* Operators et Seprators */
{esp}*AND {return and;}
{esp}*OR  {return or;}
{esp}*NOT {return not;}

{esp}*"+"  {return add;}
{esp}*"-"  {return min;}
{esp}*"*"  {return mul;}
{esp}*"/"  {return divide;}
{esp}*"<=" {return aff;}
{esp}*";"  {return pvg;}
{esp}*"{"  {return acd;}
{esp}*"}"  {return acf;}
{esp}*"["  {return brd;}
{esp}*"]"  {return brf;}
{esp}*"("  {return pd;}
{esp}*")"  {return pf;}
{esp}*":"  {return points;}
{esp}*"<"  {return inf;}
{esp}*">"  {return gr;}


/* identifiers et values */

{IDF} {return IDF;}
{esp}*{Dec_int} {return Dec_int;}
{esp}*{Dec_str} {return Dec_str;}
{esp}*{Dec_float} {return Dec_float;}







[ \t] {}
\n {nb_ligne++;}

%%



