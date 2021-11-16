// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a5 = Array<UInt8>([97,08,98,99])
    var r5 = String.fromUtf8(a5,start:0,length:4).iterator()
    var r6 = String.fromUtf8(Array<UInt8>([32,09,10,11,12,13]),start:0,length:6).iterator()
    print("|Test:")
    for ( i in r5 ){
        print("${i}")
    }
    print("|Test:")
    for ( i in r6 ){
        print("${i}")
    }
    print("\n")
    return 0
}