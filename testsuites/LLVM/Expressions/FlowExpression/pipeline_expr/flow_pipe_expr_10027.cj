// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    static func f(input:Int64):Int64{0}
    static let a = 1
}


func main(): Int64 {
    return A.a |> A.f
}
