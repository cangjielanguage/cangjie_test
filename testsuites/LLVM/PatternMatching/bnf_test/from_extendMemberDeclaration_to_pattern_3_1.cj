// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Int32 {
    operator func +(a: Int64): Int32 {
        match (a){
            case x:Int32 => 1
            case _ => 0
        }
        this + a
    }
}

func run(): Int64 {
    let x: Int32  = Int32(2) + 1
    if (x == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}