// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var map01 = #{'a':5,'c':3,'b':2,'a':3}
    var map02 = #{'a':1,'b':3,'c':3,'b':10}
    if (map01 == map02){
        return 1
    }
    return 0
}