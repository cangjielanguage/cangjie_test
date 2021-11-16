// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

interface Ioo {
    let a: Int32 = 2
}

enum Time<T> where T <: Ioo {
    Day(T)
}


func run(): Int64 {
    var time: Time<Ioo> 
    var res: Int32 = match (time) { // EXPECTED: regex variable 'time' is used before initialization
        case Day(x) => {
            var a:Int32 = match (x) { // x is Ioo
                case y:Ioo => 2
                case _ => 1
            }
            a
        } 
    }
    if ( res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
