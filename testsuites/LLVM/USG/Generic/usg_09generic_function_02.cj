// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res: ArrayList<Int64> =  ArrayList([1,2,3,4])
    var a: Int64*Int64 = ToPair.fromArray<Int64>(res)
    if ( a != (1,2) ){
        return 1
    }
    return 0
}

class ToPair {
    static func fromArray<T>(l: ArrayList<T>): T * T {
        return (l[0], l[1])
    }
}