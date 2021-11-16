// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
        var ar_3 = Array<UInt16>()
        var utf_3 = Utf16View(ar_3)
        return 0
}

