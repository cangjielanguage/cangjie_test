// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C{}

enum A{
    a(Int64)
    operator func +(y:C):Int64{0} // EXPECTED: regex xxx
}


func main(): Int64 {
    return A.a(3)+C()
}
