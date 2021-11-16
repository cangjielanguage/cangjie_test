// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a = 5
    var b = 10
    a += b
    a -= b
    a *= b
    b /= a
    b %= a
    a **= b
    print("a += b, a = ${a}\n")
    print("a -= b, a = ${a}\n")
    print("a *= b, a = ${a}\n")
    print("b /= a, b = ${b}\n")
    print("b %= a, b = ${b}\n")
    print("a **= b, a = ${a}\n")
    0
}