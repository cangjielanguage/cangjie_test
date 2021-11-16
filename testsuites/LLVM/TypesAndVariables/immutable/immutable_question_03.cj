// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a1: ?List<Aoo> = [Aoo(1),Aoo(1)]
    a1?[0].a = 3
    var a2 = a1?[0].a
    if (  (a2 ?? 2) != 3){
        return 1
    }
    let a3: ?List<Aoo> = [Aoo(1),Aoo(1)]
    a3?[0].a = 3
    if (  ((a3?[0].a) ?? 2) != 3){
        return 1
    }
    return 0
}

class Aoo {
    var a: Int32 = 1
    let b: Int32 = 1
    init (x: Int32 ){ a = x }
}
