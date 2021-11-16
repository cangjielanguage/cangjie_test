// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check mut function defition in interface
interface I {
    mut func f(): Unit
}

func main(){
    return 0
}