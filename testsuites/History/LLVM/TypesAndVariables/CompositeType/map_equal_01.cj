// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {

    var map01 = #{'a':1,'c':3,'b':2}
    var map02 = #{'a':1,'b':2,'c':3}
    print("123456\n")
    if (map01 == map01){
        return 0
    }
    return 1
}