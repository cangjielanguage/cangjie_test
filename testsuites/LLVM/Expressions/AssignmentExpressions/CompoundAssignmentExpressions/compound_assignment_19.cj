// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface I {
    func bar(x: Int64): Int64 {
        var a = 2
        a **= 3
        a
    }
}

class A <: I {}

func main(): Int64 {
    if (A().bar(2) == 8){
        return 0
    }
    return 1
}