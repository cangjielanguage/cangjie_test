// DEPENDENCE: define_20003.cj main_20003.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> use.conf
// EXEC: echo define_20003=./define_20003.cjo >> use.conf
// EXEC: echo define_20003=./define_20003.cjo >> main.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> main.conf
// EXEC: echo use=./use.cjo >> main.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> main.conf
// EXEC: echo define_20003=./define_20003.cjo >> main.conf
// EXEC: %compiler -i ast.conf define_20003.cj -c -backend-options="-fPIC"
// EXEC: %compiler -i use.conf %f -c ./define_20003.o -backend-options="-fPIC %libdir/../lib/libcangjie-common.so"
// EXEC: %compiler -i main.conf  ./define_20003.o ./%n.o -backend-options=%libdir/../lib/libcangjie-common.so main_20003.cj -o %output
// EXEC: %run %run_opt %output

package use

import ast.*
import define_20003.*

external trait op{
    operator func -(input:This):This
}

append Tokens with op{
    operator func -(input:Tokens){input}
}


external macro Y(attr:Tokens, input:Tokens):Tokens{
    -@X[123](123)
}