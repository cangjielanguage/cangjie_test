// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Child{
    func test(a:Int16):Int64{return 1}
    func result():Int64{
        func test(a:Int64):Int64{return 2}
        return test(1)
    }
}

func main(){
    if (Child().result() == 2) {
        return 0
    }
    return 1
}