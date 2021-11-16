// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let x = [0]

class A{
    var a = {=>x}
}


func main(): Int64 {
    let x = A()
    let c1 : ?A = x
    let r3 : ?Int64 = c1?.a?()?[0]
    return r3 ?? 1
}
