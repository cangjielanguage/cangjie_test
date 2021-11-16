// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

extend Int32 {
    operator func +(a!: Int64=match (1){ case _ => 1}): Int32 { // EXPECTED: regex error.*optional parameter can not be used in operator overload function
        match (a){
            case x:Int32 => 1
            case _ => 0
        }
        this + a
    }
}

func run(): Int64 {
    let x: Int32  = Int32(2) +
    if (x == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
