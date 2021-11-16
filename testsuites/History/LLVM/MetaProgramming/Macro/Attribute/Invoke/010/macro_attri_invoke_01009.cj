// DEPENDENCE: define.cj
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo > ast.conf
// EXEC: echo define=./define.cjo >> main.conf
// EXEC: echo ast=%libdir/ast/cangjieAST.cjo >> main.conf
// EXEC: %compiler -i ast.conf define.cj -c
// EXEC: %compiler -i main.conf  ./define.o -backend-options=%libdir/../lib/libcangjie-common.so %f -o %output
// EXEC: %run %run_opt %output
import define.*


interface A<T>{
@M[func test(a:T,b!:Int64=1){0}]
func test(a:T,b!:Int64=1){0}

@M[let i : Int64 = 1]
let i : Int64 = 1
}

func main(){
    return 0
}

