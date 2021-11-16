// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a: Int32 = 1
let b:Int32 = 1
func foo1(x!:Int32=a+b){return x}

func foo2(){var x = a+b;return x}

var m = {
    foo1() +foo2()
}
func main():Int64 {
    if (m() != 4){
        return 1
    }
    return 0
}
