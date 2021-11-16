// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T1> {
    let a: T1
    init(x: T1){
        a = x
    }
}

func main(){
    let data:Data<Int32> = Data(3)
    return 0
}
