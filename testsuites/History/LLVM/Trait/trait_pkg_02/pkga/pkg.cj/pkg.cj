// DEPENDENCE: pkga.cj
// EXEC: %compiler %cmp_opt  %n.cj pkga.cj -o %output
// EXEC: %run %run_opt %output %run_args 

package pkga

trait Num1 {
    func plus1(a: This, b: This): This
}

append Int32 with Num2 {
    func plus2(a: Int32, b: Int32) {a + b}
}

append Float64 with Num1 {
    func plus1(a: Float64, b: Float64) {a + b}
}

func run(): Int64 {
   var res: Int32 = plus2(1,2)
    if ( res ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
