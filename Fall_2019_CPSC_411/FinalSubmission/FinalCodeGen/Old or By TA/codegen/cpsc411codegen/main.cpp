#include <fstream>

#include "code_gen.h"
#include "driver.h"
#include "lexer.h"
#include "semantic_check.h"
#include "symtab.h"

int main(int argc, char** argv) {
    if (argc <= 1) {
        std::cerr << "Usage: " << argv[0] << " <file>\n";
        return 1;
    }
    if (argc >= 3) {
        std::cerr << "Usage: " << argv[0] << " <file>\n";
        return 1;
    }

    std::ifstream file{argv[1]};
    if (!file.is_open()) {
        std::cerr << "IO error when opening " << argv[1] << "\n";
        return 1;
    }

    driver d;
    int ret = d.parse(&file, &std::cout);
    if (ret == 0) {
        // std::cout << "Successfully parsed!\n";
        // print_ast(d.ast);
        auto semantic_state = semantic_check(d.ast);
        code_gen(semantic_state, d.ast, std::cout);

        /*
                // Success!
                std::cout << "Original tree\n";
                print_ast(d.ast);
                // Rename and symbol checking
                pre_post_traversal(d.ast, {&renamePre}, {&renamePost});
                std::cout << "\nRenamed tree\n";
                print_ast(d.ast);
        */
        return 0;
    } else {
        std::cout << "Failed parsing!";
        return 1;
    }

    return 0;
}
