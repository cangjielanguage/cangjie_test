// DEPENDENCE: ../pkga ../pkgb ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj -o pkgb/pkgb.o
// EXEC: %compiler %cmp_opt %n.cj pkga/pkga.o pkgb/pkgb.o -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.*
import pkgb.*

class Data{
     var x:Int32
     init(input:Int32){x=input}
}

append Data with pkga.Num {
    func plus(a: Data, b: Data) {Data(a.x + b.x)}
}

func run(): Int64 {
    var a: Int32 = 1
    var b: Int32 = 2
    var resa: Int32 = plus(Data(1),Data(2)).x
    var resb: Int32 = pkgb.Num.plus
    if (  resa + resb ==  5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
