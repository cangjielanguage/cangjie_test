// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func cast(x: Int32): Float32 {
    Float32(x)
}

class B {
    operator func ()(x: Float32): Float32 {
        x * x
    }
}
func main() : Int64 {
    let a: Int32 = 2
    let objB = B()
    let csquare = cast ~> objB
    let res = csquare(a)
    if ( res != 4.0 ) {
        return 1
    }
    0
}