// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Ioo {
    
}

class Coo <: Ioo{
    var b: Int32 = 3
}

enum Time<T>{
    Day(T)
}


func run(): Int64 {
    var coo: Coo= Coo()
    var time: Time<Ioo> = Time<Ioo>.Day(coo)
    var res: Int32 = match (time) {
        case Day(x) => 
            var a = match (x) {
                case y:Coo => y.b
                case _ => 1
            }
            var b = match (x) {
                case y:Ioo => Int32(2)
                case _ => 1
            }
            a + b
    }
    if ( res == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
