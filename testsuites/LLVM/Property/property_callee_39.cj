// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var x = Boo(1)
    if(x.a != 2 ){
        return 1
    }
    var y = Boo('a')
    if(y.a != 1 ){
        return 1
    }
    var z = Boo("a")
    if(z.a != 1 ){
        return 1
    }
    return 0
}

record Boo{
    var a:Int32 = 1 // a = 1
    prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    prop let n:Int32 {
        get(){
             return a
        }
    }
    init(x:Int32){ m = 1}
    init(x:Char){ n }
    init(x:String){ m }
}

