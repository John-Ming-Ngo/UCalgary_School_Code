#include "lexer.h"

#include <fstream>

#include "parser.h"

namespace yy {

struct driver {
    lexer* lex;
    parser* par;
    node* ast;

    int parse(std::istream* in, std::ostream* out) {
        lex = new lexer{in, out};
        par = new parser(this);
        return par->parse();
    }
};

}  // namespace yy

using driver = yy::driver;
