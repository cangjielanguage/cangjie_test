// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Ioo {
    let a: Int32 = 2
}

class Coo <: Ioo{
    var b: Int32 = 3
    init(x:Int32){b=x}
}

enum Time<T> where T <: Ioo {
    Day(T)
}


func run(): Int64 {
    var coo: Coo= Coo(1)
    var time: Time<Ioo> = Time<Ioo>.Day(coo) // coo is Coo,coo :< Ioo
    var res: Int32 = match time {
        case Day(x) => { 
            var a = match x {// x is Coo 
                case y:Ioo => 2  
                case y:Coo => y.b +2
                case _ => 1
            }
            var b = match x { // x is Coo
                case y:Coo => y.b +2 // 1+2
                case y:Ioo => 2
                case _ => 1
            }
            a + b
        }
    }
    if ( res == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
