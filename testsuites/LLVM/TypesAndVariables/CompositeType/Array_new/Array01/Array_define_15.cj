// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int8>([1,2,3])

record A{
  static var a1 = Array<Int8>([1,2,3])

  var a2 = Array<Int8>([-1,-2,-3])
}


func main(): Int64 {
    let a=A()

    if(A.a1[0]==1 && A.a1[1]==2 && A.a1[2]==3 && a.a2[0]==-1 && a.a2[1]==-2 && A().a2[2]==-3){
        return 0
    }

    return 1
}
