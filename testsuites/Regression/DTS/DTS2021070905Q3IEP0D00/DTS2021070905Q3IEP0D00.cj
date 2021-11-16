// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not IndexOutOfBoundsException
// DTS:DTS2021070905Q3IEP0D00

func main(){
    var a = "abc".utf8View
    for (i in a){
        print("${i}\n")
    }
    var temp = RefArray<UInt8>(a)
    return 0
}
