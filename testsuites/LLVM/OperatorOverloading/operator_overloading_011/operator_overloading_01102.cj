// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

//interface Inc<T1> {
//    operator func ++(): T1
//}
interface Add<T1, T2> {
    operator func +( right: T1): T2
}

extend Char <: Add<Char,UInt32>{
    operator func +( right: Char): UInt32 {ord(this)+ord(right)}
}
//extend Char <: Inc<Char>{
//    operator func ++(): Char { chr(ord(this) + 1)}
//}

func main(): Int64 {
    var c1 = 'a'
    //let c2:Char = c1++ 
    //let c2 = c1++ 
    let c3:UInt32 = c1 + 'b'
    if (c3 != 195 ) {
        return 1
    }
    return 0
}

