// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a:Int16):Int64{return 1}

class Father{
    open func test(a:Int64):Int64{return 2}
}

class Child <: Father{
    func result():Int64{
        return test(1)
    }
}

func main(){
    if (Child().result() == 2) {
        return 0
    }
    return 1
}