// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit5 {
    | Year(Int32)
    | Month(Int32, Float32)
    | Day(Int32, Float32, Float32)
    | Hour(Int32, Float32, Float32, Float32)
    | Twounit(TimeUnit5, TimeUnit5)
}
enum E1 {
    A | B(E2)
}
enum E2 {
    C(E1) | D(E1)
}

func main(){
  
    return 0
}

