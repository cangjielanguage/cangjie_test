// DEPENDENCE: ../pkga ../cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt %n.cj pkga/pkga.o -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.Num

class Data{
     var x:Int32
     init(input:Int32){x=input}
}

append Data with pkga.Num {
    func plus(a: Data, b: Data) {Data(a.x + b.x)}
}

func run(): Int64 {
    var res: Int32 = plus(Data(1),Data(2)).x
    if ( res ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
