// EXEC: %compiler %cmp_opt %n.cj -o %output

func main():Int64 {
    return 0
}

record Boo{
    var a: Int32 = 1
    prop var m1:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
             if(true){ var a = 1}
        }
    }
    prop var m2:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
             if(true){ return () }
        }
    }
    prop var m3:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
             func foo(){return 1}
        }
    }
    prop var m4:Int32 {
        get(){
             return 1
        }
        set(input){
             a = input + 1
             match (a) {
                 case _ => ()
             }
        }
    }
}

