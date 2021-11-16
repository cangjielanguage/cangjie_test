// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt ./src/*.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = goo<Int32>(1)
    if ( a != 1 ){
        return 1
    }
    return 0
}