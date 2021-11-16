// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a:UInt8 = 0b0001_1000
    let b:UInt64 = 0o30
    let c:UInt16 = 24
    let d:UInt32 = 0x18
    if ( a!= 24 ) {
        return 1
    }
    if ( b!= 24 ) {
        return 1
    }
    if ( c!= 24 ) {
        return 1
    }
    if ( d!= 24 ) {
        return 1
    }
    return 0
}
