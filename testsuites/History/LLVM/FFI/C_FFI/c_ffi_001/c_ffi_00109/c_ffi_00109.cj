// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

@c
record MyRecord {
MyRecord(var i1 : Int64,
    var i2 : Int64,
    var i3 : Int64,
    var i4 : Int64,
    var i5 : Int64,
    var i6 : Int64,
    var i7 : Int64,
    var i8 : Int64,
    var i9 : Int64,
    var i10 : Int64,
    var i11 : Int64,
    var i12 : Int64,
    var i13 : Int64,
    var i14 : Int64,
    var i15 : Int64,
    var i16 : Int64,
    var i17 : Int64,
    var i18 : Int64,
    var i19 : Int64,
    var i20 : Int64,
    var i21 : Int64,
    var i22 : Int64,
    var i23 : Int64,
    var i24 : Int64,
    var i25 : Int64,
    var i26 : Int64,
    var i27 : Int64,
    var i28 : Int64,
    var i29 : Int64,
    var i30 : Int64,
    var i31 : Int64,
    var i32 : Int64,
    var i33 : Int64,
    var i34 : Int64,
    var i35 : Int64,
    var i36 : Int64,
    var i37 : Int64,
    var i38 : Int64,
    var i39 : Int64,
    var i40 : Int64,
    var i41 : Int64,
    var i42 : Int64,
    var i43 : Int64,
    var i44 : Int64,
    var i45 : Int64,
    var i46 : Int64,
    var i47 : Int64,
    var i48 : Int64,
    var i49 : Int64,
    var i50 : Int64) {}
}

foreign func PassToCBigger(input:MyRecord): MyRecord

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = MyRecord(1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1,
                            1,1,1,1,1)
  var biggerReturn = unsafe { PassToCBigger(biggerPass) }
  if (biggerReturn.i1 != 2) {
    return 1
  }
  if (biggerReturn.i2 != 2) {
    return 1
  }
  if (biggerReturn.i3 != 2) {
    return 1
  }
  if (biggerReturn.i4 != 2) {
    return 1
  }
  if (biggerReturn.i5 != 2) {
    return 1
  }
  if (biggerReturn.i6 != 2) {
    return 1
  }
  if (biggerReturn.i7 != 2) {
    return 1
  }
  if (biggerReturn.i8 != 2) {
    return 1
  }
  if (biggerReturn.i9 != 2) {
    return 1
  }
  if (biggerReturn.i10 != 2) {
    return 1
  }
  if (biggerReturn.i11 != 2) {
    return 1
  }
  if (biggerReturn.i12 != 2) {
    return 1
  }
  if (biggerReturn.i13 != 2) {
    return 1
  }
  if (biggerReturn.i14 != 2) {
    return 1
  }
  if (biggerReturn.i15 != 2) {
    return 1
  }
  if (biggerReturn.i16 != 2) {
    return 1
  }
  if (biggerReturn.i17 != 2) {
    return 1
  }
  if (biggerReturn.i18 != 2) {
    return 1
  }
  if (biggerReturn.i19 != 2) {
    return 1
  }
  if (biggerReturn.i20 != 2) {
    return 1
  }
  if (biggerReturn.i21 != 2) {
    return 1
  }
  if (biggerReturn.i22 != 2) {
    return 1
  }
  if (biggerReturn.i23 != 2) {
    return 1
  }
  if (biggerReturn.i24 != 2) {
    return 1
  }
  if (biggerReturn.i25 != 2) {
    return 1
  }
  if (biggerReturn.i26 != 2) {
    return 1
  }
  if (biggerReturn.i27 != 2) {
    return 1
  }
  if (biggerReturn.i28 != 2) {
    return 1
  }
  if (biggerReturn.i29 != 2) {
    return 1
  }
  if (biggerReturn.i30 != 2) {
    return 1
  }
  if (biggerReturn.i31 != 2) {
    return 1
  }
  if (biggerReturn.i32 != 2) {
    return 1
  }
  if (biggerReturn.i33 != 2) {
    return 1
  }
  if (biggerReturn.i34 != 2) {
    return 1
  }
  if (biggerReturn.i35 != 2) {
    return 1
  }
  if (biggerReturn.i36 != 2) {
    return 1
  }
  if (biggerReturn.i37 != 2) {
    return 1
  }
  if (biggerReturn.i38 != 2) {
    return 1
  }
  if (biggerReturn.i39 != 2) {
    return 1
  }
  if (biggerReturn.i40 != 2) {
    return 1
  }
  if (biggerReturn.i41 != 2) {
    return 1
  }
  if (biggerReturn.i42 != 2) {
    return 1
  }
  if (biggerReturn.i43 != 2) {
    return 1
  }
  if (biggerReturn.i44 != 2) {
    return 1
  }
  if (biggerReturn.i45 != 2) {
    return 1
  }
  if (biggerReturn.i46 != 2) {
    return 1
  }
  if (biggerReturn.i47 != 2) {
    return 1
  }
  if (biggerReturn.i48 != 2) {
    return 1
  }
  if (biggerReturn.i49 != 2) {
    return 1
  }
  if (biggerReturn.i50 != 2) {
    return 1
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
