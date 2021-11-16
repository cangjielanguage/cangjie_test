// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(){
    var result : Int64 = 0
    var a : Int64 = 0
    var b = a << 64    // EXPECTED: regex shift count overflow
    var c = a >> 64    // EXPECTED: regex shift count overflow
    if (b != 0) {
      print("1 Int64(0) << 64:"+b.toString()+"\n")
      result |= 0x01
    }
    if (c != 0) {
      print("2 Int64(0) >> 64:"+c.toString()+"\n")
      result |= 0x10
    }
    return result
}