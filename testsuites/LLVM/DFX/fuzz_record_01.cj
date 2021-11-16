// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external record Record15{
    //var var331 : Int64 = 112;
    var var300 : Unit = ();
    var var332 : Int64 = 112;
}

func main(): Int64 {
    let var24 : Record15 = Record15(); // B022 error: Invalid function argument type (Producer: 'LLVM8.0.0' Reader: 'LLVM 8.0.0')
    if (var24.var332 != 112) {return 1}
    return 0;
}
