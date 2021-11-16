// DEPENDENCE: record_invoke_03_a.cj
// EXEC: %compiler %cmp_opt %n.cj record_invoke_03_a.cj -o %output
// EXEC: %run %run_opt %output %run_args

package record_invoke_03

let data: Data = Data(2, 3)

func run(): Int64 {
    var width: Int32 = data.width
    var length: Int32 = data.length
    if ( width == 2 && length == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
