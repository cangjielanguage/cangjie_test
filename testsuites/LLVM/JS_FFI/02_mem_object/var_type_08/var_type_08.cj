// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class object8 {
  object8(
      let name!: String,
      var num!:Int16
  ) {}
}

@JsObject
class Complex {
  //let Li: List<Int64>
  Complex(
      let chr!: Char,
      //Li!: List<Int64>,
      var num!: UInt8,
      var bo!: Bool
  ) {}
}

@JsMember["./momentMember"]
foreign func isMoment(obj:Complex) : object8

func main() {
  object_08().main1()
}

class object_08{
  func main1() {
    let res = isMoment(Complex(
      chr: 't',
      //Li: [1, 2, 3, 3, 2, 1] ,
      num: 9,
      bo: false
    ))
    print(res.name)
    if (res.num != 8) {
      return 1
    }
    return 0
  }
}

