// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var b = Boo()
    if ( b.m != 1 ) {
        return 1
    }
    if ( b.n != 2 ) {
        return 2
    }
    b.m = 3
    if ( b.m != 1 ) {
        return 3
    }
    if ( b.n != 2 ) {
        return 4
    }
    return 0
}

class Boo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    prop var m: Int64 {
        get(){
             1 // retrun 1
        }
        set(input){
             () // return ()
        }
    }
    prop let n: Int32 {
        get(){
             return 2
        }
    }
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
    prop var m: Int64 {
        get(){
             if(false){return 0}else{return 1}
        }
        set(input){
             func set(){}
        }
    }
    prop let n: Int32 {
        get(){
             return 2
        }
    }
}

extend Coo{
    func set(){}
}