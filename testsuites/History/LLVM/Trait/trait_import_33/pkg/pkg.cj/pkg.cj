// DEPENDENCE: ../pkga ../pkgb ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt -c pkgb/pkgb.cj -o pkgb/pkgb.o
// EXEC: %compiler %cmp_opt %n.cj pkga/pkga.o pkgb/pkgb.o -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.Num
import pkgb.*

class Data{
     var x:Int32
     init(input:Int32){x=input}
}
class Color{
     var x:Float64
     init(input:Float64){x=input}
}

append Data with pkga.Num {
    func plus(a: Data, b: Data) {Data(a.x + b.x + 1)}
}

append Color with pkgb.Num {
    func plus(a: Color, b: Color) {Color(a.x + b.x + 2.0)}
}

func run(): Int64 {
    var resa: Int32 = plus(Data(1),Data(2)).x
    var resb: Float64 = plus(Color(3.0),Color(4.0)).x
    if (  resa ==  4 && resb == 9.0) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
