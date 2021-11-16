// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var character: Char = 'a'
    var u32Number: UInt32 = 0
    u32Number = ord(character)
    u32Number -= 32
    character = chr(u32Number)
    if ( character != 'A' ) {
        return 1
    }
    if ( u32Number != 65 ) {
        return 1
    }
    0
}
