// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let x = [0]

class A<T>{
    var a = {i:T=>x}
}

func test<T>(i:T){
    let x = A<T>()
    let c1 : ?A<T> = Some(x)
    let r1 : ?(T)->List<Int64> = c1?.a
    let r2 : ?List<Int64> = r1?(i)
    let r3 : ?Int64 = r2?[0]
    return r3 ?? 1
}

func main(): Int64 {
    return test<Int64>(1)
}
