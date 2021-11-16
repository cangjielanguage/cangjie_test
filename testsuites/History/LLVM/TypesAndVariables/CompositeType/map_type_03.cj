// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var map01 = #{'1':2}
    var map03 :Map<Char,Int64> = Map<Char,Int64>(map01)
    var value1 = map03.getOrDefault('1', 10)
    if ( value1 == 2 ){
        return 0
    }
    return 1
}