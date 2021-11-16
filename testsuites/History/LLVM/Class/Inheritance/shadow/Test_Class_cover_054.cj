// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface I1 {
    let a: Int32 = 1
}

class C2 <: I1 {

    static func x():Int64 {
        return 2
    }
}

func main(): Int64 {

    let r = C2.x()

    if r != 2 || I1.a != 1 {
        return 1
    }

    return 0
}
