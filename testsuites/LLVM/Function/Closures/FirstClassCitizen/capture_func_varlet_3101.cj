// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    let a: Int32 = 1

    func test() : ()->Int32 { match {case _ => {return a}} }

    if ( test()() != 1){
        return 1
    }

    return 0
}