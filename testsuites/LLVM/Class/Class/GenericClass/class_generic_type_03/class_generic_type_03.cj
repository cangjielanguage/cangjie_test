// DEPENDENCE: class_generic_type_03_a.cj
// EXEC: %compiler %cmp_opt %n.cj class_generic_type_03_a.cj -o %output
// EXEC: %run %run_opt %output %run_args

package class_generic_type_03

var i: Int32 = 4
let data: Data<Int32> = Data<Int32>(i)
var res: Int32 = data.count

func run(): Int64 {
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
