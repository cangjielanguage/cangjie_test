// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let x = [0]

enum A{
    a
    operator func ()(){0}
}


func main(): Int64 {
    let x1 : ?A = A.a
    var x2 : ?Int64 = x1?()
    return x2 ?? 1
}
