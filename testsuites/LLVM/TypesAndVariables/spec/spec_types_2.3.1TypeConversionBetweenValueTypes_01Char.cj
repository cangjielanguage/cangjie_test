// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func main(){
    var character: Char = 'a'
    var u32Number: UInt32 = 0
    u32Number = ord(character)  // uint32Number = 97
    u32Number -= 32
    character = chr(u32Number)  // character = `A`
    return 0
}

