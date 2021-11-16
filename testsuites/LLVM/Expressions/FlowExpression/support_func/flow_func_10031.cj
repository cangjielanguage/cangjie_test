// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X>{
    static operator func ()<T>(input:Int64):Int32{Int32(input)}
    static operator func ()<T>(input:Int32):Int64{Int64(input)}
    static operator func ()<T>(input:(Int64)->Int64):Int64{input(1)}
}



func main(): Int64 {
    1 |> A // EXPECTED: regex expected member name or constructor call after 'A' type name
    return 1
}
