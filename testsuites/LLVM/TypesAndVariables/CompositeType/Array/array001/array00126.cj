// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : String = "a"
    let myArray : Array<String> = @{a,"b"}
    var  b  = myArray.size
    var  c  = @{a,"b"}.size
    print(b.toString())
    print(c.toString())
    return 0
}
