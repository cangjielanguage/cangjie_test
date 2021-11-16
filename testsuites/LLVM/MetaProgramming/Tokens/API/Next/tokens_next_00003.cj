// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 = Tokens(@{
                    Token(1),
                    Token(2),
                    Token(3),
                    Token(4),
                    Token(5)
                    })
    var it = T1.iterator()
    while (true) {
        match (it.next()) {
            case Some(obj) if (obj.kind == TokenKind.END) => break
            case _ => continue
        }
    }
    return 0
}
