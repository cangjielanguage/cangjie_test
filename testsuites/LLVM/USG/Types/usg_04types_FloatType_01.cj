// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a:Float16 = 3.14
    let b:Float32 = 2.4e-1
    let c:Float64 = .123e2
    let d:Float16 = 0x1.1p0
    let e:Float32 = 0x1p2
    let f:Float64 = 0x.2p4
    if ( a != 3.14 ) {
        return 1
    }
    if ( b != 2.4e-1) {
        return 1
    }
    if ( c != .123e2 ) {
        return 1
    }
    if ( d != 0x1.1p0 ) {
        return 1
    }
    if ( e != 0x1p2 ) {
        return 1
    }
    if ( f != 0x.2p4 ) {
        return 1
    }
    0
}
