package p1

external class A<T> {
    static var a: Option<T> = None
    static prop var m:Option<T> {
        get(){
             return a
        }
        set(input){
             a = input
        }
    }
    static prop let n:Option<T> {
        get(){
             return a
        }
    }
}

external class C<T> {
    static var a: Int32 = 1
    static prop var m:Int32 {
        get(){
             return a
        }
        set(input){
             a = input + 1
        }
    }
    static prop let n:Int32 {
        get(){
             return ( a * 2 )
        }
    }
}
