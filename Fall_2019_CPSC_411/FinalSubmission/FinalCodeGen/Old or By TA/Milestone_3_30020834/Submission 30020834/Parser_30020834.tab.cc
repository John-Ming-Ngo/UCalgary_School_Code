// A Bison parser, made by GNU Bison 3.0.5.

// Skeleton implementation for Bison LALR(1) parsers in C++

// Copyright (C) 2002-2015, 2018 Free Software Foundation, Inc.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// As a special exception, you may create a larger work that contains
// part or all of the Bison parser skeleton and distribute that work
// under terms of your choice, so long as that work isn't itself a
// parser generator using the skeleton or a modified version thereof
// as a parser skeleton.  Alternatively, if you modify or redistribute
// the parser skeleton itself, you may (at your option) remove this
// special exception, which will cause the skeleton and the resulting
// Bison output files to be licensed under the GNU General Public
// License without this special exception.

// This special exception was added by the Free Software Foundation in
// version 2.2 of Bison.


// First part of user declarations.

#line 37 "Parser_30020834.tab.cc" // lalr1.cc:406

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

#include "Parser_30020834.tab.hh"

// User implementation prologue.
#line 19 "Parser_30020834.yy" // lalr1.cc:414

#include <iostream>
#include "Scanner_30020834.h"
#include "AST.h"
#include "Driver.h"

#undef yylex
#define yylex driver.m_lexer->lex

#line 60 "Parser_30020834.tab.cc" // lalr1.cc:414


#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> // FIXME: INFRINGES ON USER NAME SPACE.
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif



// Suppress unused-variable warnings by "using" E.
#define YYUSE(E) ((void) (E))

// Enable debugging if requested.
#if YYDEBUG

// A pseudo ostream that takes yydebug_ into account.
# define YYCDEBUG if (yydebug_) (*yycdebug_)

# define YY_SYMBOL_PRINT(Title, Symbol)         \
  do {                                          \
    if (yydebug_)                               \
    {                                           \
      *yycdebug_ << Title << ' ';               \
      yy_print_ (*yycdebug_, Symbol);           \
      *yycdebug_ << '\n';                       \
    }                                           \
  } while (false)

# define YY_REDUCE_PRINT(Rule)          \
  do {                                  \
    if (yydebug_)                       \
      yy_reduce_print_ (Rule);          \
  } while (false)

# define YY_STACK_PRINT()               \
  do {                                  \
    if (yydebug_)                       \
      yystack_print_ ();                \
  } while (false)

#else // !YYDEBUG

# define YYCDEBUG if (false) std::cerr
# define YY_SYMBOL_PRINT(Title, Symbol)  YYUSE (Symbol)
# define YY_REDUCE_PRINT(Rule)           static_cast<void> (0)
# define YY_STACK_PRINT()                static_cast<void> (0)

#endif // !YYDEBUG

#define yyerrok         (yyerrstatus_ = 0)
#define yyclearin       (yyla.clear ())

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYRECOVERING()  (!!yyerrstatus_)


namespace yy {
#line 127 "Parser_30020834.tab.cc" // lalr1.cc:481

  /* Return YYSTR after stripping away unnecessary quotes and
     backslashes, so that it's suitable for yyerror.  The heuristic is
     that double-quoting is unnecessary unless the string contains an
     apostrophe, a comma, or backslash (other than backslash-backslash).
     YYSTR is taken from yytname.  */
  std::string
  Parser::yytnamerr_ (const char *yystr)
  {
    if (*yystr == '"')
      {
        std::string yyr = "";
        char const *yyp = yystr;

        for (;;)
          switch (*++yyp)
            {
            case '\'':
            case ',':
              goto do_not_strip_quotes;

            case '\\':
              if (*++yyp != '\\')
                goto do_not_strip_quotes;
              // Fall through.
            default:
              yyr += *yyp;
              break;

            case '"':
              return yyr;
            }
      do_not_strip_quotes: ;
      }

    return yystr;
  }


  /// Build a parser object.
  Parser::Parser (struct Driver& driver_yyarg)
    :
#if YYDEBUG
      yydebug_ (false),
      yycdebug_ (&std::cerr),
#endif
      driver (driver_yyarg)
  {}

  Parser::~Parser ()
  {}


  /*---------------.
  | Symbol types.  |
  `---------------*/

  Parser::syntax_error::syntax_error (const std::string& m)
    : std::runtime_error (m)
  {}

  // basic_symbol.
  template <typename Base>
  Parser::basic_symbol<Base>::basic_symbol ()
    : value ()
  {}

  template <typename Base>
  Parser::basic_symbol<Base>::basic_symbol (const basic_symbol& other)
    : Base (other)
    , value ()
  {
    value = other.value;
  }

  template <typename Base>
  Parser::basic_symbol<Base>::basic_symbol (typename Base::kind_type t, const semantic_type& v)
    : Base (t)
    , value (v)
  {}


  /// Constructor for valueless symbols.
  template <typename Base>
  Parser::basic_symbol<Base>::basic_symbol (typename Base::kind_type t)
    : Base (t)
    , value ()
  {}

  template <typename Base>
  Parser::basic_symbol<Base>::~basic_symbol ()
  {
    clear ();
  }

  template <typename Base>
  void
  Parser::basic_symbol<Base>::clear ()
  {
    Base::clear ();
  }

  template <typename Base>
  bool
  Parser::basic_symbol<Base>::empty () const
  {
    return Base::type_get () == empty_symbol;
  }

  template <typename Base>
  void
  Parser::basic_symbol<Base>::move (basic_symbol& s)
  {
    super_type::move (s);
    value = s.value;
  }

  // by_type.
  Parser::by_type::by_type ()
    : type (empty_symbol)
  {}

  Parser::by_type::by_type (const by_type& other)
    : type (other.type)
  {}

  Parser::by_type::by_type (token_type t)
    : type (yytranslate_ (t))
  {}

  void
  Parser::by_type::clear ()
  {
    type = empty_symbol;
  }

  void
  Parser::by_type::move (by_type& that)
  {
    type = that.type;
    that.clear ();
  }

  int
  Parser::by_type::type_get () const
  {
    return type;
  }


  // by_state.
  Parser::by_state::by_state ()
    : state (empty_state)
  {}

  Parser::by_state::by_state (const by_state& other)
    : state (other.state)
  {}

  void
  Parser::by_state::clear ()
  {
    state = empty_state;
  }

  void
  Parser::by_state::move (by_state& that)
  {
    state = that.state;
    that.clear ();
  }

  Parser::by_state::by_state (state_type s)
    : state (s)
  {}

  Parser::symbol_number_type
  Parser::by_state::type_get () const
  {
    if (state == empty_state)
      return empty_symbol;
    else
      return yystos_[state];
  }

  Parser::stack_symbol_type::stack_symbol_type ()
  {}

  Parser::stack_symbol_type::stack_symbol_type (const stack_symbol_type& that)
    : super_type (that.state)
  {
    value = that.value;
  }

  Parser::stack_symbol_type::stack_symbol_type (state_type s, symbol_type& that)
    : super_type (s)
  {
    value = that.value;
    // that is emptied.
    that.type = empty_symbol;
  }

  Parser::stack_symbol_type&
  Parser::stack_symbol_type::operator= (const stack_symbol_type& that)
  {
    state = that.state;
    value = that.value;
    return *this;
  }


  template <typename Base>
  void
  Parser::yy_destroy_ (const char* yymsg, basic_symbol<Base>& yysym) const
  {
    if (yymsg)
      YY_SYMBOL_PRINT (yymsg, yysym);

    // User destructor.
    YYUSE (yysym.type_get ());
  }

#if YYDEBUG
  template <typename Base>
  void
  Parser::yy_print_ (std::ostream& yyo,
                                     const basic_symbol<Base>& yysym) const
  {
    std::ostream& yyoutput = yyo;
    YYUSE (yyoutput);
    symbol_number_type yytype = yysym.type_get ();
    // Avoid a (spurious) G++ 4.8 warning about "array subscript is
    // below array bounds".
    if (yysym.empty ())
      std::abort ();
    yyo << (yytype < yyntokens_ ? "token" : "nterm")
        << ' ' << yytname_[yytype] << " (";
    YYUSE (yytype);
    yyo << ')';
  }
#endif

  void
  Parser::yypush_ (const char* m, state_type s, symbol_type& sym)
  {
    stack_symbol_type t (s, sym);
    yypush_ (m, t);
  }

  void
  Parser::yypush_ (const char* m, stack_symbol_type& s)
  {
    if (m)
      YY_SYMBOL_PRINT (m, s);
    yystack_.push (s);
  }

  void
  Parser::yypop_ (unsigned n)
  {
    yystack_.pop (n);
  }

#if YYDEBUG
  std::ostream&
  Parser::debug_stream () const
  {
    return *yycdebug_;
  }

  void
  Parser::set_debug_stream (std::ostream& o)
  {
    yycdebug_ = &o;
  }


  Parser::debug_level_type
  Parser::debug_level () const
  {
    return yydebug_;
  }

  void
  Parser::set_debug_level (debug_level_type l)
  {
    yydebug_ = l;
  }
#endif // YYDEBUG

  Parser::state_type
  Parser::yy_lr_goto_state_ (state_type yystate, int yysym)
  {
    int yyr = yypgoto_[yysym - yyntokens_] + yystate;
    if (0 <= yyr && yyr <= yylast_ && yycheck_[yyr] == yystate)
      return yytable_[yyr];
    else
      return yydefgoto_[yysym - yyntokens_];
  }

  bool
  Parser::yy_pact_value_is_default_ (int yyvalue)
  {
    return yyvalue == yypact_ninf_;
  }

  bool
  Parser::yy_table_value_is_error_ (int yyvalue)
  {
    return yyvalue == yytable_ninf_;
  }

  int
  Parser::parse ()
  {
    // State.
    int yyn;
    /// Length of the RHS of the rule being reduced.
    int yylen = 0;

    // Error handling.
    int yynerrs_ = 0;
    int yyerrstatus_ = 0;

    /// The lookahead symbol.
    symbol_type yyla;

    /// The return value of parse ().
    int yyresult;

    // FIXME: This shoud be completely indented.  It is not yet to
    // avoid gratuitous conflicts when merging into the master branch.
    try
      {
    YYCDEBUG << "Starting parse\n";


    /* Initialize the stack.  The initial state will be set in
       yynewstate, since the latter expects the semantical and the
       location values to have been already stored, initialize these
       stacks with a primary value.  */
    yystack_.clear ();
    yypush_ (YY_NULLPTR, 0, yyla);

    // A new symbol was pushed on the stack.
  yynewstate:
    YYCDEBUG << "Entering state " << yystack_[0].state << '\n';

    // Accept?
    if (yystack_[0].state == yyfinal_)
      goto yyacceptlab;

    goto yybackup;

    // Backup.
  yybackup:

    // Try to take a decision without lookahead.
    yyn = yypact_[yystack_[0].state];
    if (yy_pact_value_is_default_ (yyn))
      goto yydefault;

    // Read a lookahead token.
    if (yyla.empty ())
      {
        YYCDEBUG << "Reading a token: ";
        try
          {
            yyla.type = yytranslate_ (yylex (&yyla.value));
          }
        catch (const syntax_error& yyexc)
          {
            error (yyexc);
            goto yyerrlab1;
          }
      }
    YY_SYMBOL_PRINT ("Next token is", yyla);

    /* If the proper action on seeing token YYLA.TYPE is to reduce or
       to detect an error, take that action.  */
    yyn += yyla.type_get ();
    if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yyla.type_get ())
      goto yydefault;

    // Reduce or error.
    yyn = yytable_[yyn];
    if (yyn <= 0)
      {
        if (yy_table_value_is_error_ (yyn))
          goto yyerrlab;
        yyn = -yyn;
        goto yyreduce;
      }

    // Count tokens shifted since error; after three, turn off error status.
    if (yyerrstatus_)
      --yyerrstatus_;

    // Shift the lookahead token.
    yypush_ ("Shifting", yyn, yyla);
    goto yynewstate;

  /*-----------------------------------------------------------.
  | yydefault -- do the default action for the current state.  |
  `-----------------------------------------------------------*/
  yydefault:
    yyn = yydefact_[yystack_[0].state];
    if (yyn == 0)
      goto yyerrlab;
    goto yyreduce;

  /*-----------------------------.
  | yyreduce -- Do a reduction.  |
  `-----------------------------*/
  yyreduce:
    yylen = yyr2_[yyn];
    {
      stack_symbol_type yylhs;
      yylhs.state = yy_lr_goto_state_ (yystack_[yylen].state, yyr1_[yyn]);
      /* If YYLEN is nonzero, implement the default value of the
         action: '$$ = $1'.  Otherwise, use the top of the stack.

         Otherwise, the following line sets YYLHS.VALUE to garbage.
         This behavior is undocumented and Bison users should not rely
         upon it.  */
      if (yylen)
        yylhs.value = yystack_[yylen - 1].value;
      else
        yylhs.value = yystack_[0].value;


      // Perform the reduction.
      YY_REDUCE_PRINT (yyn);
      try
        {
          switch (yyn)
            {
  case 3:
#line 117 "Parser_30020834.yy" // lalr1.cc:856
    {driver.m_ast = (yystack_[0].value.nodeVal);}
#line 568 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 4:
#line 120 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"NUMBER", driver.m_lexer->getToken().tokenString, driver.m_lexer->getToken().lineno, {}};}
#line 574 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 5:
#line 121 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"STRING", driver.m_lexer->getToken().tokenString, driver.m_lexer->getToken().lineno, {}};}
#line 580 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 6:
#line 122 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"TRUE", driver.m_lexer->getToken().tokenString, driver.m_lexer->getToken().lineno, {}};}
#line 586 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 7:
#line 123 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FALSE", driver.m_lexer->getToken().tokenString, driver.m_lexer->getToken().lineno, {}};}
#line 592 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 8:
#line 126 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"TYPE_BOOLEAN", "", driver.m_lexer->getToken().lineno, {}};}
#line 598 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 9:
#line 127 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"TYPE_INT", "", driver.m_lexer->getToken().lineno, {}};}
#line 604 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 10:
#line 130 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"GLOB_DECLARE", "", driver.m_lexer->getToken().lineno, {(yystack_[0].value.nodeVal)}};}
#line 610 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 11:
#line 131 "Parser_30020834.yy" // lalr1.cc:856
    {auto* returnNode = new ASTNode{"GLOB_DECLARE", "", driver.m_lexer->getToken().lineno, {}}; for(auto* c : (yystack_[1].value.nodeVal)->children) {returnNode->children.push_back(c);} returnNode->children.push_back((yystack_[0].value.nodeVal)); (yylhs.value.nodeVal) = returnNode;}
#line 616 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 12:
#line 134 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 622 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 13:
#line 135 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 628 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 14:
#line 136 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 634 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 15:
#line 139 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"VAR_DECLARE", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[1].value.nodeVal)}};}
#line 640 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 16:
#line 142 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"ID", driver.m_lexer->getToken().tokenString, driver.m_lexer->getToken().lineno, {}};}
#line 646 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 17:
#line 145 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FUNC_DECLARE", "", driver.m_lexer->getToken().lineno, {(yystack_[1].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 652 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 18:
#line 148 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FUNC_HEAD", "", driver.m_lexer->getToken().lineno, {(yystack_[1].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 658 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 19:
#line 149 "Parser_30020834.yy" // lalr1.cc:856
    {auto* valNode = new ASTNode{"TYPE_VOID", "", driver.m_lexer->getToken().lineno, {}}; (yylhs.value.nodeVal) = new ASTNode{"FUNC_HEAD", "", driver.m_lexer->getToken().lineno, {valNode}}; (yylhs.value.nodeVal)->children.push_back((yystack_[0].value.nodeVal));}
#line 664 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 20:
#line 152 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FUNC_DEC", "", driver.m_lexer->getToken().lineno, {(yystack_[3].value.nodeVal), (yystack_[1].value.nodeVal)}};}
#line 670 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 21:
#line 153 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FUNC_DEC", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal)}};}
#line 676 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 22:
#line 156 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FORM_PARAM_LST", "", driver.m_lexer->getToken().lineno, {(yystack_[0].value.nodeVal)}};}
#line 682 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 23:
#line 157 "Parser_30020834.yy" // lalr1.cc:856
    {auto* returnNode = new ASTNode{"FORM_PARAM_LST", "", driver.m_lexer->getToken().lineno, {}}; for(auto* c : (yystack_[2].value.nodeVal)->children) {returnNode->children.push_back(c);} returnNode->children.push_back((yystack_[0].value.nodeVal)); (yylhs.value.nodeVal) = returnNode;}
#line 688 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 24:
#line 160 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FORM_PARAM", "", driver.m_lexer->getToken().lineno, {(yystack_[1].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 694 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 25:
#line 163 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"MAIN_FUNC_DECLARE", "", driver.m_lexer->getToken().lineno, {(yystack_[1].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 700 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 26:
#line 166 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"MAIN_FUNC", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal)}};}
#line 706 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 27:
#line 169 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"BLOCK", "", driver.m_lexer->getToken().lineno, {(yystack_[1].value.nodeVal)}};}
#line 712 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 28:
#line 170 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"BLOCK", "", driver.m_lexer->getToken().lineno, {}};}
#line 718 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 29:
#line 173 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"BLK_STATEMENTS", "", driver.m_lexer->getToken().lineno, {(yystack_[0].value.nodeVal)}};}
#line 724 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 30:
#line 174 "Parser_30020834.yy" // lalr1.cc:856
    {auto* returnNode = new ASTNode{"BLK_STATEMENTS", "", driver.m_lexer->getToken().lineno, {}}; for(auto* c : (yystack_[1].value.nodeVal)->children) {returnNode->children.push_back(c);} returnNode->children.push_back((yystack_[0].value.nodeVal)); (yylhs.value.nodeVal) = returnNode;}
#line 730 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 31:
#line 177 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 736 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 32:
#line 178 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 742 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 33:
#line 181 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 748 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 34:
#line 182 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"EMPTY_STATEMENT", "", driver.m_lexer->getToken().lineno, {}};}
#line 754 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 35:
#line 183 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[1].value.nodeVal);}
#line 760 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 36:
#line 184 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"BREAK", "", driver.m_lexer->getToken().lineno, {}};}
#line 766 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 37:
#line 185 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"RETURN", "", driver.m_lexer->getToken().lineno, {(yystack_[1].value.nodeVal)}};}
#line 772 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 38:
#line 186 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"RETURN", "", driver.m_lexer->getToken().lineno, {}};}
#line 778 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 39:
#line 187 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"IF", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 784 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 40:
#line 188 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"IF_ELSE", "", driver.m_lexer->getToken().lineno, {(yystack_[4].value.nodeVal), (yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 790 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 41:
#line 189 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"WHILE", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 796 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 42:
#line 192 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 802 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 43:
#line 193 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 808 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 44:
#line 196 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 814 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 45:
#line 197 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[1].value.nodeVal);}
#line 820 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 46:
#line 198 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 826 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 47:
#line 201 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"ARG_LST", "", driver.m_lexer->getToken().lineno, {(yystack_[0].value.nodeVal)}};}
#line 832 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 48:
#line 202 "Parser_30020834.yy" // lalr1.cc:856
    {auto* returnNode = new ASTNode{"ARG_LST", "", driver.m_lexer->getToken().lineno, {}}; for(auto* c : (yystack_[2].value.nodeVal)->children) {returnNode->children.push_back(c);} returnNode->children.push_back((yystack_[0].value.nodeVal)); (yylhs.value.nodeVal) = returnNode;}
#line 838 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 49:
#line 205 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FUNC_INVOK", "", driver.m_lexer->getToken().lineno, {(yystack_[3].value.nodeVal), (yystack_[1].value.nodeVal)}};}
#line 844 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 50:
#line 206 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"FUNC_INVOK", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal)}};}
#line 850 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 51:
#line 209 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 856 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 52:
#line 210 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 862 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 53:
#line 213 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"NEGATE", "", driver.m_lexer->getToken().lineno, {(yystack_[0].value.nodeVal)}};}
#line 868 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 54:
#line 214 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"!", "", driver.m_lexer->getToken().lineno, {(yystack_[0].value.nodeVal)}};}
#line 874 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 55:
#line 215 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 880 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 56:
#line 218 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 886 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 57:
#line 219 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"*", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 892 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 58:
#line 220 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"/", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 898 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 59:
#line 221 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"%", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 904 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 60:
#line 224 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 910 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 61:
#line 225 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"+", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 916 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 62:
#line 226 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"-", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 922 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 63:
#line 229 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 928 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 64:
#line 230 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"<", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 934 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 65:
#line 231 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{">", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 940 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 66:
#line 232 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"LE", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 946 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 67:
#line 233 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"GE", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 952 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 68:
#line 236 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 958 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 69:
#line 237 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"EQ", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 964 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 70:
#line 238 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"NE", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 970 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 71:
#line 241 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 976 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 72:
#line 242 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"AND", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 982 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 73:
#line 245 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 988 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 74:
#line 246 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"OR", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 994 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 75:
#line 249 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 1000 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 76:
#line 250 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 1006 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 77:
#line 253 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = new ASTNode{"ASSIGNMENT", "", driver.m_lexer->getToken().lineno, {(yystack_[2].value.nodeVal), (yystack_[0].value.nodeVal)}};}
#line 1012 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;

  case 78:
#line 256 "Parser_30020834.yy" // lalr1.cc:856
    {(yylhs.value.nodeVal) = (yystack_[0].value.nodeVal);}
#line 1018 "Parser_30020834.tab.cc" // lalr1.cc:856
    break;


#line 1022 "Parser_30020834.tab.cc" // lalr1.cc:856
            default:
              break;
            }
        }
      catch (const syntax_error& yyexc)
        {
          error (yyexc);
          YYERROR;
        }
      YY_SYMBOL_PRINT ("-> $$ =", yylhs);
      yypop_ (yylen);
      yylen = 0;
      YY_STACK_PRINT ();

      // Shift the result of the reduction.
      yypush_ (YY_NULLPTR, yylhs);
    }
    goto yynewstate;

  /*--------------------------------------.
  | yyerrlab -- here on detecting error.  |
  `--------------------------------------*/
  yyerrlab:
    // If not already recovering from an error, report this error.
    if (!yyerrstatus_)
      {
        ++yynerrs_;
        error (yysyntax_error_ (yystack_[0].state, yyla));
      }


    if (yyerrstatus_ == 3)
      {
        /* If just tried and failed to reuse lookahead token after an
           error, discard it.  */

        // Return failure if at end of input.
        if (yyla.type_get () == yyeof_)
          YYABORT;
        else if (!yyla.empty ())
          {
            yy_destroy_ ("Error: discarding", yyla);
            yyla.clear ();
          }
      }

    // Else will try to reuse lookahead token after shifting the error token.
    goto yyerrlab1;


  /*---------------------------------------------------.
  | yyerrorlab -- error raised explicitly by YYERROR.  |
  `---------------------------------------------------*/
  yyerrorlab:

    /* Pacify compilers like GCC when the user code never invokes
       YYERROR and the label yyerrorlab therefore never appears in user
       code.  */
    if (false)
      goto yyerrorlab;
    /* Do not reclaim the symbols of the rule whose action triggered
       this YYERROR.  */
    yypop_ (yylen);
    yylen = 0;
    goto yyerrlab1;

  /*-------------------------------------------------------------.
  | yyerrlab1 -- common code for both syntax error and YYERROR.  |
  `-------------------------------------------------------------*/
  yyerrlab1:
    yyerrstatus_ = 3;   // Each real token shifted decrements this.
    {
      stack_symbol_type error_token;
      for (;;)
        {
          yyn = yypact_[yystack_[0].state];
          if (!yy_pact_value_is_default_ (yyn))
            {
              yyn += yyterror_;
              if (0 <= yyn && yyn <= yylast_ && yycheck_[yyn] == yyterror_)
                {
                  yyn = yytable_[yyn];
                  if (0 < yyn)
                    break;
                }
            }

          // Pop the current state because it cannot handle the error token.
          if (yystack_.size () == 1)
            YYABORT;

          yy_destroy_ ("Error: popping", yystack_[0]);
          yypop_ ();
          YY_STACK_PRINT ();
        }


      // Shift the error token.
      error_token.state = yyn;
      yypush_ ("Shifting", error_token);
    }
    goto yynewstate;

    // Accept.
  yyacceptlab:
    yyresult = 0;
    goto yyreturn;

    // Abort.
  yyabortlab:
    yyresult = 1;
    goto yyreturn;

  yyreturn:
    if (!yyla.empty ())
      yy_destroy_ ("Cleanup: discarding lookahead", yyla);

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYABORT or YYACCEPT.  */
    yypop_ (yylen);
    while (1 < yystack_.size ())
      {
        yy_destroy_ ("Cleanup: popping", yystack_[0]);
        yypop_ ();
      }

    return yyresult;
  }
    catch (...)
      {
        YYCDEBUG << "Exception caught: cleaning lookahead and stack\n";
        // Do not try to display the values of the reclaimed symbols,
        // as their printer might throw an exception.
        if (!yyla.empty ())
          yy_destroy_ (YY_NULLPTR, yyla);

        while (1 < yystack_.size ())
          {
            yy_destroy_ (YY_NULLPTR, yystack_[0]);
            yypop_ ();
          }
        throw;
      }
  }

  void
  Parser::error (const syntax_error& yyexc)
  {
    error (yyexc.what ());
  }

  // Generate an error message.
  std::string
  Parser::yysyntax_error_ (state_type yystate, const symbol_type& yyla) const
  {
    // Number of reported tokens (one for the "unexpected", one per
    // "expected").
    size_t yycount = 0;
    // Its maximum.
    enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
    // Arguments of yyformat.
    char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];

    /* There are many possibilities here to consider:
       - If this state is a consistent state with a default action, then
         the only way this function was invoked is if the default action
         is an error action.  In that case, don't check for expected
         tokens because there are none.
       - The only way there can be no lookahead present (in yyla) is
         if this state is a consistent state with a default action.
         Thus, detecting the absence of a lookahead is sufficient to
         determine that there is no unexpected or expected token to
         report.  In that case, just report a simple "syntax error".
       - Don't assume there isn't a lookahead just because this state is
         a consistent state with a default action.  There might have
         been a previous inconsistent state, consistent state with a
         non-default action, or user semantic action that manipulated
         yyla.  (However, yyla is currently not documented for users.)
       - Of course, the expected token list depends on states to have
         correct lookahead information, and it depends on the parser not
         to perform extra reductions after fetching a lookahead from the
         scanner and before detecting a syntax error.  Thus, state
         merging (from LALR or IELR) and default reductions corrupt the
         expected token list.  However, the list is correct for
         canonical LR with one exception: it will still contain any
         token that will not be accepted due to an error action in a
         later state.
    */
    if (!yyla.empty ())
      {
        int yytoken = yyla.type_get ();
        yyarg[yycount++] = yytname_[yytoken];
        int yyn = yypact_[yystate];
        if (!yy_pact_value_is_default_ (yyn))
          {
            /* Start YYX at -YYN if negative to avoid negative indexes in
               YYCHECK.  In other words, skip the first -YYN actions for
               this state because they are default actions.  */
            int yyxbegin = yyn < 0 ? -yyn : 0;
            // Stay within bounds of both yycheck and yytname.
            int yychecklim = yylast_ - yyn + 1;
            int yyxend = yychecklim < yyntokens_ ? yychecklim : yyntokens_;
            for (int yyx = yyxbegin; yyx < yyxend; ++yyx)
              if (yycheck_[yyx + yyn] == yyx && yyx != yyterror_
                  && !yy_table_value_is_error_ (yytable_[yyx + yyn]))
                {
                  if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                    {
                      yycount = 1;
                      break;
                    }
                  else
                    yyarg[yycount++] = yytname_[yyx];
                }
          }
      }

    char const* yyformat = YY_NULLPTR;
    switch (yycount)
      {
#define YYCASE_(N, S)                         \
        case N:                               \
          yyformat = S;                       \
        break
      default: // Avoid compiler warnings.
        YYCASE_ (0, YY_("syntax error"));
        YYCASE_ (1, YY_("syntax error, unexpected %s"));
        YYCASE_ (2, YY_("syntax error, unexpected %s, expecting %s"));
        YYCASE_ (3, YY_("syntax error, unexpected %s, expecting %s or %s"));
        YYCASE_ (4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
        YYCASE_ (5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
#undef YYCASE_
      }

    std::string yyres;
    // Argument number.
    size_t yyi = 0;
    for (char const* yyp = yyformat; *yyp; ++yyp)
      if (yyp[0] == '%' && yyp[1] == 's' && yyi < yycount)
        {
          yyres += yytnamerr_ (yyarg[yyi++]);
          ++yyp;
        }
      else
        yyres += *yyp;
    return yyres;
  }


  const signed char Parser::yypact_ninf_ = -95;

  const signed char Parser::yytable_ninf_ = -1;

  const short int
  Parser::yypact_[] =
  {
      34,   -95,   -95,   -95,    15,    33,    15,    34,   -95,   -95,
      -1,   -95,    29,   -95,    29,    46,   -95,   -95,    -8,   -95,
     -95,    69,    50,   -95,   -95,     4,   -95,   -95,    76,    80,
      78,    99,   -95,   -95,    15,   -95,    -5,   -95,    85,   -95,
     -95,    79,   -95,   -95,   -95,    15,    -4,   -95,   144,   144,
     -95,   -95,   -95,   -95,   -95,   144,   144,   144,   -95,   -95,
      -5,   -95,   -95,   -95,   -95,    21,    30,    48,    28,    86,
      87,   -95,   -95,    88,    89,   144,   138,   -95,   -95,   -95,
     -95,   -95,    58,    90,    94,   100,   -95,   -95,   101,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   144,   144,
     144,   144,   -95,   -95,   -95,    24,   -95,   -95,   125,   125,
     -95,   -95,   -95,   -95,    21,    21,    30,    30,    30,    30,
      48,    48,    28,    86,   -95,   144,   109,   -95,   -95,   125,
     -95
  };

  const unsigned char
  Parser::yydefact_[] =
  {
       2,    16,     8,     9,     0,     0,     0,     3,    10,    12,
       0,    13,     0,    14,     0,     0,    19,     1,     0,    18,
      11,     0,     0,    17,    25,     0,    15,    26,     0,     0,
       0,     0,    28,    34,     0,    31,     0,    33,     0,    29,
      32,     0,    43,    42,    21,     0,     0,    22,     0,     0,
      36,     5,     4,     6,     7,     0,     0,     0,    38,    44,
      52,    51,    46,    55,    56,    60,    63,    68,    71,    73,
      75,    78,    76,     0,     0,     0,     0,    27,    30,    35,
      24,    20,     0,     0,     0,    52,    53,    54,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    37,    77,    50,     0,    47,    23,     0,     0,
      45,    57,    58,    59,    61,    62,    64,    65,    66,    67,
      69,    70,    72,    74,    49,     0,    39,    41,    48,     0,
      40
  };

  const short int
  Parser::yypgoto_[] =
  {
     -95,   -95,   -95,   -14,   -95,   128,   -13,     0,   -95,   -95,
     126,   -95,    55,   -95,   -95,    83,   -95,   108,   -94,   -95,
     -95,   -95,   -19,   -95,   -39,    -6,   -15,   -25,    52,    53,
     -95,    81,   -17,   -47
  };

  const signed char
  Parser::yydefgoto_[] =
  {
      -1,     5,    59,     6,     7,     8,     9,    85,    11,    12,
      16,    46,    47,    13,    14,    37,    38,    39,    40,    41,
      61,   105,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73
  };

  const unsigned char
  Parser::yytable_[] =
  {
      10,    83,    84,    42,    15,    43,    18,    10,    34,    35,
      88,    45,     2,     3,   126,   127,    86,    87,     1,    42,
      75,    43,    36,    25,    34,    35,    76,    26,    81,   106,
      21,    60,    82,    17,    74,   130,    44,     1,    36,    89,
      90,    91,     2,     3,     4,    80,    92,    93,    60,    60,
     111,   112,   113,     1,    98,    99,   124,    60,     2,     3,
     125,    28,    22,    29,    30,    31,     2,     3,    45,    94,
      95,    96,    97,   120,   121,    60,    60,    25,   128,   116,
     117,   118,   119,    22,    32,    33,   114,   115,     1,    42,
      42,    43,    43,     2,     3,    23,    28,    24,    29,    30,
      31,    27,     1,    51,    52,    53,    54,    48,    36,    36,
      42,    49,    43,    50,    79,   100,    55,   101,    22,    77,
      33,   129,   108,   102,    26,    60,   109,    56,     1,    36,
      57,    76,    19,   110,    58,    20,    28,   107,    29,    30,
      31,     1,    51,    52,    53,    54,    78,     1,    51,    52,
      53,    54,   122,     0,   123,    55,   103,     0,    22,     0,
      33,    55,     0,     0,     0,     0,    56,     0,     0,    57,
     104,     0,    56,     0,     0,    57
  };

  const short int
  Parser::yycheck_[] =
  {
       0,    48,    49,    22,     4,    22,     6,     7,    22,    22,
      57,    25,     8,     9,   108,   109,    55,    56,     3,    38,
      25,    38,    22,    31,    38,    38,    31,    35,    32,    76,
      31,    31,    36,     0,    34,   129,    32,     3,    38,    18,
      19,    20,     8,     9,    10,    45,    16,    17,    48,    49,
      89,    90,    91,     3,    26,    27,    32,    57,     8,     9,
      36,    11,    33,    13,    14,    15,     8,     9,    82,    21,
      22,    23,    24,    98,    99,    75,    76,    31,   125,    94,
      95,    96,    97,    33,    34,    35,    92,    93,     3,   108,
     109,   108,   109,     8,     9,    12,    11,    14,    13,    14,
      15,    32,     3,     4,     5,     6,     7,    31,   108,   109,
     129,    31,   129,    35,    35,    29,    17,    30,    33,    34,
      35,    12,    32,    35,    35,   125,    32,    28,     3,   129,
      31,    31,     6,    32,    35,     7,    11,    82,    13,    14,
      15,     3,     4,     5,     6,     7,    38,     3,     4,     5,
       6,     7,   100,    -1,   101,    17,    75,    -1,    33,    -1,
      35,    17,    -1,    -1,    -1,    -1,    28,    -1,    -1,    31,
      32,    -1,    28,    -1,    -1,    31
  };

  const unsigned char
  Parser::yystos_[] =
  {
       0,     3,     8,     9,    10,    39,    41,    42,    43,    44,
      45,    46,    47,    51,    52,    45,    48,     0,    45,    48,
      43,    31,    33,    53,    53,    31,    35,    32,    11,    13,
      14,    15,    34,    35,    41,    44,    45,    53,    54,    55,
      56,    57,    60,    70,    32,    41,    49,    50,    31,    31,
      35,     4,     5,     6,     7,    17,    28,    31,    35,    40,
      45,    58,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,    45,    25,    31,    34,    55,    35,
      45,    32,    36,    71,    71,    45,    62,    62,    71,    18,
      19,    20,    16,    17,    21,    22,    23,    24,    26,    27,
      29,    30,    35,    69,    32,    59,    71,    50,    32,    32,
      32,    62,    62,    62,    63,    63,    64,    64,    64,    64,
      65,    65,    66,    67,    32,    36,    56,    56,    71,    12,
      56
  };

  const unsigned char
  Parser::yyr1_[] =
  {
       0,    38,    39,    39,    40,    40,    40,    40,    41,    41,
      42,    42,    43,    43,    43,    44,    45,    46,    47,    47,
      48,    48,    49,    49,    50,    51,    52,    53,    53,    54,
      54,    55,    55,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    57,    57,    58,    58,    58,    59,    59,    60,
      60,    61,    61,    62,    62,    62,    63,    63,    63,    63,
      64,    64,    64,    65,    65,    65,    65,    65,    66,    66,
      66,    67,    67,    68,    68,    69,    69,    70,    71
  };

  const unsigned char
  Parser::yyr2_[] =
  {
       0,     2,     0,     1,     1,     1,     1,     1,     1,     1,
       1,     2,     1,     1,     1,     3,     1,     2,     2,     2,
       4,     3,     1,     3,     2,     2,     3,     3,     2,     1,
       2,     1,     1,     1,     1,     2,     2,     3,     2,     5,
       7,     5,     1,     1,     1,     3,     1,     1,     3,     4,
       3,     1,     1,     2,     2,     1,     1,     3,     3,     3,
       1,     3,     3,     1,     3,     3,     3,     3,     1,     3,
       3,     1,     3,     1,     3,     1,     1,     3,     1
  };



  // YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
  // First, the terminals, then, starting at \a yyntokens_, nonterminals.
  const char*
  const Parser::yytname_[] =
  {
  "$end", "error", "$undefined", "\"ID\"", "\"STRING\"", "\"NUMBER\"",
  "\"TRUE\"", "\"FALSE\"", "\"BOOLEAN\"", "\"INT\"", "\"VOID\"", "\"IF\"",
  "\"ELSE\"", "\"WHILE\"", "\"BREAK\"", "\"RETURN\"", "\"+\"", "\"-\"",
  "\"*\"", "\"/\"", "\"%\"", "\"<\"", "\">\"", "\"LE\"", "\"GE\"", "\"=\"",
  "\"EQ\"", "\"NE\"", "\"!\"", "\"AND\"", "\"OR\"", "\"(\"", "\")\"",
  "\"{\"", "\"}\"", "\";\"", "\",\"", "TOK_ERROR", "$accept", "START",
  "literal", "type", "globaldeclarations", "globaldeclaration",
  "variabledeclaration", "identifier", "functiondeclaration",
  "functionheader", "functiondeclarator", "formalparameterlist",
  "formalparameter", "mainfunctiondeclaration", "mainfunctiondeclarator",
  "block", "blockstatements", "blockstatement", "statement",
  "statementexpression", "primary", "argumentlist", "functioninvocation",
  "postfixexpression", "unaryexpression", "multiplicativeexpression",
  "additiveexpression", "relationalexpression", "equalityexpression",
  "conditionalandexpression", "conditionalorexpression",
  "assignmentexpression", "assignment", "expression", YY_NULLPTR
  };

#if YYDEBUG
  const unsigned short int
  Parser::yyrline_[] =
  {
       0,   116,   116,   117,   120,   121,   122,   123,   126,   127,
     130,   131,   134,   135,   136,   139,   142,   145,   148,   149,
     152,   153,   156,   157,   160,   163,   166,   169,   170,   173,
     174,   177,   178,   181,   182,   183,   184,   185,   186,   187,
     188,   189,   192,   193,   196,   197,   198,   201,   202,   205,
     206,   209,   210,   213,   214,   215,   218,   219,   220,   221,
     224,   225,   226,   229,   230,   231,   232,   233,   236,   237,
     238,   241,   242,   245,   246,   249,   250,   253,   256
  };

  // Print the state stack on the debug stream.
  void
  Parser::yystack_print_ ()
  {
    *yycdebug_ << "Stack now";
    for (stack_type::const_iterator
           i = yystack_.begin (),
           i_end = yystack_.end ();
         i != i_end; ++i)
      *yycdebug_ << ' ' << i->state;
    *yycdebug_ << '\n';
  }

  // Report on the debug stream that the rule \a yyrule is going to be reduced.
  void
  Parser::yy_reduce_print_ (int yyrule)
  {
    unsigned yylno = yyrline_[yyrule];
    int yynrhs = yyr2_[yyrule];
    // Print the symbols being reduced, and their result.
    *yycdebug_ << "Reducing stack by rule " << yyrule - 1
               << " (line " << yylno << "):\n";
    // The symbols being reduced.
    for (int yyi = 0; yyi < yynrhs; yyi++)
      YY_SYMBOL_PRINT ("   $" << yyi + 1 << " =",
                       yystack_[(yynrhs) - (yyi + 1)]);
  }
#endif // YYDEBUG

  // Symbol number corresponding to token number t.
  Parser::token_number_type
  Parser::yytranslate_ (int t)
  {
    static
    const token_number_type
    translate_table[] =
    {
     0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37
    };
    const unsigned user_token_number_max_ = 292;
    const token_number_type undef_token_ = 2;

    if (static_cast<int> (t) <= yyeof_)
      return yyeof_;
    else if (static_cast<unsigned> (t) <= user_token_number_max_)
      return translate_table[t];
    else
      return undef_token_;
  }


} // yy
#line 1543 "Parser_30020834.tab.cc" // lalr1.cc:1163
#line 259 "Parser_30020834.yy" // lalr1.cc:1164

/* C/C++ code */

// Error handling code!
//This code is invoked whenever the parser stumbles into an error. I print out what the parser thinks
//Then, I consult my lexer to find the current token this parser was dealing with.
//This token contains text AND linecount data, making debug easy.
void yy::Parser::error(std::string const& str) {
	std::cerr << "------------------------------------------------ \n";
	std::cerr << "Error: " << str << "\n";
	std::cerr << "Occurred at line: " << driver.m_lexer->getToken().lineno << "\n";
	std::cerr << "Occurred with : " << driver.m_lexer->getToken().tokenString << "\n";
	std::cerr << "------------------------------------------------ \n";
	exit(1);
}
