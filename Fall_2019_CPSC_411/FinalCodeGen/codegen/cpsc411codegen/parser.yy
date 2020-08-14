%skeleton "lalr1.cc"

%define parser_class_name {parser}

%{
#include <iostream>
#include <string>

#include <cassert>

#include "driver.h"
#include "ast.h"

#undef yylex
#define yylex driver->lex->lex

using namespace yy;
%}

%error-verbose
%locations

%union {
    bool bVal;
    int iVal;
	std::string* strVal;
	node* nodeVal;
}


%token <strVal> ID        "id"

%token 		    INT       "int"
%token 		    BOOL      "bool"
%token          VOID      "void"

%token <iVal>   ICONST    "ICONST"
%token <bVal>   BCONST    "BCONST"

%token          FUN       "fun"
%token          ARROW     "->"

%token          LPAREN    "("
%token          RPAREN    ")"

%token          IF        "if"

%token          LE        "<=" // int -> int -> bool
%token          EQ         "=="  // a -> a -> bool

%token 		    ASSIGN    "=" 
%token 		    ADD       "+" // int -> int -> int
%token 		    SEMI      ";"

%token          COMMA     ","

%token 		    LSQUIG    "{"
%token		    RSQUIG    "}"

%token          RETURN    "return"

%token  	    ERROR_TOK "error"

%left EQ
%left LE 
%left ADD

%start prog

%parse-param { struct driver* driver }
 
%type <nodeVal> prog decl_list decl fun_decl arg_list var_decl scope local_list body_list stmt if_expr return_expr expr expr_list arg_decl func_scope
%type <iVal> type

%%
prog: decl_list { driver->ast = $1; }
    ;

decl_list: decl_list decl { $1->children.push_back($2); $$ = $1;  }
         | decl           { $$ = new node{make_data(ast_decl_list{}), {$1}, @$}; }
         ;

decl: fun_decl      { $$ = $1; }
    | var_decl SEMI { $$ = $1; }
    ;

fun_decl: FUN ID LPAREN arg_list RPAREN ARROW type func_scope {
                $$ = new node{make_data(ast_fun_decl{ *$2, $7 }), { $4, $8 }, @$};
            }
        | FUN ID LPAREN RPAREN ARROW type func_scope {
                $$ = new node{make_data(ast_fun_decl{ *$2, $6 }), {
                        new node{make_data(ast_fun_args{}), {}, @$},
                        $7
                    }, @$};
            }
        ;

arg_decl: type ID  { $$ = new node{make_data(ast_arg_decl{$1, *$2}), {}, @$}; }

arg_list: arg_decl { $$ = new node{make_data(ast_fun_args{}), {$1}, @$}; }
        | arg_list COMMA arg_decl { $$ = $1; $$->children.push_back($3); }
        ;

type: INT  { $$ = INT; }
    | BOOL { $$ = BOOL; }
    | VOID { $$ = VOID; }
    ;

var_decl: type ID  { $$ = new node{make_data(ast_decl{$1, *$2}), {}, @$}; }
        ;

func_scope: LSQUIG local_list body_list RSQUIG {
            $$ = new node{make_data(ast_func_body{}), 
                $2->children[0]->children,
                @$};
            $$->children.insert(
                    $$->children.end(),
                    $2->children[1]->children.begin(),
                    $2->children[1]->children.end()
                );
            $$->children.insert($$->children.end(), $3->children.begin(), $3->children.end());
        }
     ;


scope: LSQUIG local_list body_list RSQUIG {
            $$ = new node{make_data(ast_scope{}), 
                $2->children[0]->children,
                @$};
            $$->children.insert(
                    $$->children.end(),
                    $2->children[1]->children.begin(),
                    $2->children[1]->children.end()
                );
            $$->children.insert($$->children.end(), $3->children.begin(), $3->children.end());
        }
     ;

local_list: local_list var_decl SEMI {
            $$ = $1;
            $$->children[0]->children.push_back($2); 
          }
          | local_list var_decl ASSIGN expr SEMI {
                $$ = $1; 
                $$->children[0]->children.push_back($2); 
                auto* decl = data_is<ast_decl>($2->data);
                assert(decl);
                std::string name = decl->name;
                node_data a = make_data(ast_assign{name});
                $$->children[1]->children.push_back(new node{a, {$4}, @$}); 
            }
          | { $$ = new node{make_data(ast_scope{}), {
                    new node{make_data(ast_scope{}), {}, @$},
                    new node{make_data(ast_scope{}), {}, @$}
                }, @$}; 
            }
          ;

body_list: body_list stmt { $$->children.push_back($2); $$->loc = @$; }
         | stmt           { 
                if ($1) { 
                    $$ = new node{make_data(ast_scope{}), {$1}, @$}; 
                } else {
                    $$ = new node{make_data(ast_scope{}), {}, @$}; 
                }
            }
         ;

stmt: scope               { $$ = $1; }
    | ID ASSIGN expr SEMI { $$ = new node{make_data(ast_assign{*$1}), {$3}, @$}; }
    | if_expr             { $$ = $1; }
    | return_expr SEMI    { $$ = $1; }
    | expr SEMI           { $$ = $1; }
    | SEMI                { $$ = nullptr; }
    ;

if_expr: IF LPAREN expr RPAREN scope { $$ = new node{make_data(ast_if{}), {$3, $5}, @$}; }
       ;

return_expr: RETURN expr  { $$ = new node{make_data(ast_return{}), {$2}, @$}; }
           ;

expr: ID LPAREN expr_list RPAREN { $$ = new node{make_data(ast_call{*$1}), $3->children, @$ }; }
    | ID LPAREN RPAREN   { $$ = new node{make_data(ast_call{*$1}), {}, @$ }; }
    | expr ADD expr      { $$ = new node{make_data(ast_add{}), {$1, $3}, @$ }; }
    | expr EQ expr       { $$ = new node{make_data(ast_eq{}), {$1, $3}, @$ }; }
    | expr LE expr      { $$ = new node{make_data(ast_le{}), {$1, $3}, @$ }; }
    | LPAREN expr RPAREN { $$ = $2; }
    | ID     { $$ = new node{make_data(ast_id{*$1}), {}, @$};    }
    | ICONST { $$ = new node{make_data(ast_iconst{$1}), {}, @$}; }
    | BCONST { $$ = new node{make_data(ast_bconst{$1}), {}, @$}; }
    ;

expr_list: expr                 { $$ = new node{make_data(ast_expr_list{}), { $1 }, @$}; }
         | expr_list COMMA expr { $$ = $1; $$->children.push_back($3); $$->loc = @$; }
         ;

%%
void yy::parser::error(location_type const& loc, std::string const& str) {
	std::cerr << str << " at line " << loc.end.line << "\n";
	exit(1);
}


