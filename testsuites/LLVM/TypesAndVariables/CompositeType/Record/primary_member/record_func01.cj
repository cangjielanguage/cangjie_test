// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Test{
    var width: Int32 = 2
    var length: Int32 = 5
    func area(): Int32 {
        return width * length
    }
}

let test = Test().area()

func run(): Int64 {
    if(test == 10){
          return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

