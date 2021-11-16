// DEPENDENCE: momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

@JsObject
class Complex {
    Complex(
        let Tu!:UInt16*UInt32*UInt64*Int16*Int32,
        var num!:Int64,
        var fun!: (String) -> Bool
    ) {}
}

@JavaScript
foreign class Moment {
  func fromNow(obj:Complex) : UInt8
}

@JsModule["./momentModule"]
foreign func moment1() : Moment

func main() {
    object_06().main1()
}

class object_06{
     func main1() {
        let res = moment1().fromNow(Complex(
        Tu:(0,1,2,3,4),
        num:6,
        fun: { Str: String => return true}
        ))
        print(res.toString())
        if (res !=1) {
            return 1
        }
        return 0
    }
}
