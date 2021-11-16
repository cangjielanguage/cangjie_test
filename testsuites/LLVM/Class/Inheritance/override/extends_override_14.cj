// EXEC: %compiler %cmp_opt -c %f -o %output 
// EXEC：%output 

abstract class Base {
func foo(): Int32
}

class Data <: Base {
func foo(): Int32 {
return 4
}
}


func run(): Int64 {
    let x: Data  = Data()
    if (x.foo() == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
