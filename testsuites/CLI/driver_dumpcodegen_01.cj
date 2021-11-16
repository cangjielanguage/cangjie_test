// EXEC: %compiler -frontend %cmp_opt  -dump-ir %f
// EXEC: %ls %n.bc 2>&1 |compare %f
// ASSERT: scan driver_dumpcodegen_01

func main(): Int64 {
    var a: Int32 = 1
    var b: Int32 = 2
    if(a < b){
        print("hello,world\n")
        return 0
    }
    return 1
}
