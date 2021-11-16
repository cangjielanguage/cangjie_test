// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {

    return 0
}


class Boo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1

}

extend Boo{
    prop var m:Int32 {
        get(){
             return ( a + b + c + d )
        }
        set(input){
             a = input + 1
             c = input + 1
        }
    }

    prop let n:Int32 {
        get(){
             return ( (a + b + c + d)*2 )
        }
    }
}


