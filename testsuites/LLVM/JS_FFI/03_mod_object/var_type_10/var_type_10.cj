// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class object10{
  object10(
      let name!: String
  ) {}
}
 
class Complex {
  static let member=object10(name:"object10")
  static func hh(){
    return 't'
  }
  let num: Int16
  let en:object10
  var num2: Float32
  var num3: Int64
  init(
      num!: Int16,
      en!: object10,
      num2!: Float32,
      num3!: Int64
  ) {
      this.num = num
      this.en = en
      this.num2 = num2
      this.num3 = num3
  }
}

@JavaScript
foreign class Moment {
  func fromNow(obj:Complex) : Float64*Int64
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

func main() {
  object_10().main1()
}

class object_10{
  unsafe func main1() {
  
  let res = moment1().fromNow(Complex(
    num: 3,
    en: object10(name:"object10"),
    num2: 4.0,
    num3: 5
  ))
  if (res[0]!=3.0) {
    return 1
  }
  return 0
}
}

