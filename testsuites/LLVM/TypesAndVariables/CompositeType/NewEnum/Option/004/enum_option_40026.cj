// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let x = [0]

class A{
    var a = {=>x}
}


func main(): Int64 {
    let x = A()
    let c1 : ?A = x
    let r1 : ?()->List<Int64> = c1?.a
    let r2 : ?List<Int64> = r1?()
    let r3 : ?Int64 = r2?[0]
    return r3 ?? 1
}
