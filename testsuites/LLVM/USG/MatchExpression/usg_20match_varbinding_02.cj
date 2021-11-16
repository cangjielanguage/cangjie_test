// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father {
    var age = 40
}
class Uncle {}

func main(): Int64 {
    var uncle = Uncle()
    var res = match (uncle) {
        case father: Father => father.age
        case _ => 1
    }
    print("res = " + res.toString())
    if ( res.toString() != "1" ) {
        return 1
    }
    return 0
}
