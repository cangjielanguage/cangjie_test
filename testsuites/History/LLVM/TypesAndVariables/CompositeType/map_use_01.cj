// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args



func foo(map:Map<Int64,Int64>){
    var map01 = map.put(1,5)
    return map01
}
func main(): Int64 {
    var value = foo(#{1:2}).getOrDefault(1, 10)
    if ( value == 5){
        return 0
    }
    return 1
}