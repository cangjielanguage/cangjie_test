// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( Coo.m != 2 ) {
        return 1
    }
    if ( Coo.n != 4 ) {
        return 2
    }
    Coo.m = 1
    if ( Coo.m != 3 ) {
        return 3
    }
    if ( Coo.n != 6 ) {
        return 4
    }
    return 0
}

record Coo{
    static var c: Int32 = 1
    static let d: Int32 = 1
    static prop var m:Int32 {
        get(){
             return ( c + d )
        }
        set(input){
             c = input + 1
        }
    }

    static prop let n:Int32 {
        get(){
             return (( c + d)*2 )
        }
    }
}


