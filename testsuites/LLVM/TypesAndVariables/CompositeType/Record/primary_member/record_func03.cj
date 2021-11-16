// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Test{
    let widtha: Int32
    let lengtha: Int32
    Test(width: Int32, length: Int32) {
        widtha = width
        lengtha = length
    }
    func area(): Int32 {
        return widtha * lengtha
    }
}

let test = Test(4,5).area()

func run(): Int64 {
    if(test == 20){
          return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

