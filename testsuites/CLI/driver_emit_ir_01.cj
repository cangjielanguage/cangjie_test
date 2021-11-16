// EXEC: %compiler -frontend %cmp_opt %f
// EXEC: %ls %n.bc 2>&1 |compare %f
// ASSERT: regex driver_emit_ir_01.bc

func main(): Int64 {
    var a: Int32 = 1
    var b: Int32 = 2
    if(a < b){
        print("hello,world\n")
        return 0
    }
    return 1
}
