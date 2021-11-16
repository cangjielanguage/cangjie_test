// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Foo<T> {
    var dt: T
    init(x: T){
        dt = x
    }
}

class Bar <: Foo<String> {
    var dt: Int32 = 23
    init(){super("abc")}
}

// B022 æ±è§£ X <: A<X> ,ç°å¨è¿ç§ç±»åæ¨å¯¼æ¨ä¸åºæ¥
//enum Time<T>
//    where T <: Foo<Bar> {
//    Day(T)
//}

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    let bar: Bar = Bar()
    var time = Time.Day(bar)
    var res: Int32 = match time{
        case Day(x) => x.dt
    }
    if (res == 23) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}
