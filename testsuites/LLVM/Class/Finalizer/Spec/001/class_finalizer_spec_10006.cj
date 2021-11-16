// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan SomeType6SomeType0

class SomeType0 {
    ~init() {print("SomeType0")}
}

class SomeType6 {
    var field: SomeType0 = SomeType0()
    ~init() {print("SomeType6")}
}

func main(){
    SomeType6()
    NativeGC()
    return 0
}