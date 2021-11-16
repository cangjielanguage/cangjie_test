// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args 

// check mut function in record
interface I {
    mut func f1(): Int64
}

record A <: I {
    mut func f1(): Int64 {return 0}
}

func main(){
    var a = A()
    let x = a.f1()
    return x
}