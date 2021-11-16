// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var aa = 0

func main():Int64{    
    if (C().b is Data && C.data.a == 8 && aa == 1) {
        return 0
    }
    return 1
}

class Data{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f2(){
        this
    }

    func f1(i: Int64): This{
        f2()
    }
}

class C{
  static var data = Data(a: 8)
  var b = {
    data.f1(3)
  }()
}