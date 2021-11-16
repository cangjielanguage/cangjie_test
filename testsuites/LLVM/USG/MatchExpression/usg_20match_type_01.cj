// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father {
    var age = 40
}
class Son <: Father {
    init() {
        age = 20
    }
}

func main(): Int64 {
    var son = Son()
    var res = match (son) {
        case father: Father => father.age
        case _ => 1
    }
    if ( res.toString() != "20" ) {
        return 1
    }
    0
}