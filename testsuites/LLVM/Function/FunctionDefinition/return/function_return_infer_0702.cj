// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if (case01() != 2 || match (case01()) { case a: Int64 => 1;case a: Int32 => 0 ;case _ => 2} != 0) {
        return 1
    }
    if (case03<Int32>()() != 2 || match (case03<Int32>()) { case a: Int64 => 1;case a: ()->Int32 => 0 ;case _ => 2} != 0) {
        return 3
    }
    return 0
}

func case01(){
    var a: Int32 = 2
    a
}

func case02(){
    Int32(2)
}

func case03<T>(){
    case02
}

func case04(){
    case03<Int32>
}
