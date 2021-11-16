// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(){return}

func main(): Int64 {
    //var a : Array<Unit> = [test()].toArray()
    var a : Array<Unit> = @{test()}
    var b : ArrayList<Unit> = ArrayList<Unit>(a)
    return b.size() - 1
}