// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {

    return 0
}

class Goo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    open prop var m:Int32 {
        get(){
             return ( this.a + b + c + d )
        }
        set(input){
             a = input + 1
             c = input + 1
        }
    }
    open prop let n:Int32 {
        get(){
             return ( (a + this.b + c + d)*2 )
        }
    }
    func get(){
        return ( (a + this.b + c + d)*2 )
    }

}
