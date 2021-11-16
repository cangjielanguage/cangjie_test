// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let x = [0]

class A{
    var a = {i:Int64=>x}
}

func test(i:Int64){
    let x = A()
    let c1 : ?A = Some(x)
    let r1 : ?(Int64)->List<Int64> = c1?.a
    let r2 : ?List<Int64> = r1?(i)
    let r3 : ?Int64 = r2?[0]
    return r3 ?? 1
}

func main(): Int64 {
    return test(1)
}
