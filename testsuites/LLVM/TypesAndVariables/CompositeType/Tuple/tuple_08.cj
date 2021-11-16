// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Int8 = 1
    var b : Int16 = 1
    var c : Int32 = 1
    var d : Int64 = 1
    var e : UInt8 = 1
    var f : UInt16 = 1
    var g : UInt32 = 1
    var h : UInt64 = 1
    var i : Float32 = 1.0
    var j : Float64 = 1.0
    let (aa,bb,cc,dd,ee,ff,gg,hh,ii,jj) = (a,b,c,d,e,f,g,h,i,j)
    if (aa != a) {
      return 1
    }
    if (bb != b) {
      return 2
    }
    if (cc != c) {
      return 3
    }
    if (dd != d) {
      return 4
    }
    if (ee != e) {
      return 5
    }
    if (ff != f) {
      return 6
    }
    if (gg != g) {
      return 7
    }
    if (hh != h) {
      return 8
    }
    if (ii != i) {
      return 9
    }
    if (jj != j) {
      return 10
    }
    return 0
}
