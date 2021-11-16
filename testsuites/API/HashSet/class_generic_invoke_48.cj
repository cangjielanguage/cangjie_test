// EXEC: %compiler %stdx_cmp_opt %n.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var SetWidth: HashSet<Int32> =  HashSet<Int32>([1,2,3,4,5,6,1])
    let data: Data<HashSet<Int32>> = Data<HashSet<Int32>>(SetWidth)
    var res = data.width
    if (res == SetWidth) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
