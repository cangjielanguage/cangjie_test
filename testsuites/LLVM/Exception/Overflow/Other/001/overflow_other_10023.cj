// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

var test = @overflowThrowing{ @overflowSaturating func x(){var a : Int8 = 100; a+a};x() }


func main(){
    var res = Int64(test() - 127)
    print("success")
    return res
}
