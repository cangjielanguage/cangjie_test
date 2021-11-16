// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    foo1()
    foo3()
    foo4()
    foo5()
    return 0
}


//自嵌套
enum TimeUnit1 { Year(Int32) | Day(TimeUnit1)}

//自嵌套+互递归
enum TimeUnit2 { Year(TimeUnit3) | Day(TimeUnit2)  }
enum TimeUnit3 { Year(TimeUnit2)  }

//泛型自嵌套
enum TimeUnit10<T> { Year(Int32) | Day(TimeUnit10<T>) | Month(TimeUnit10<Int32>) }

//泛型互递归
enum TimeUnit20<T> { Year(TimeUnit30<T>) | Day(TimeUnit20<T>) | Month(TimeUnit30<Int32>) }
enum TimeUnit30<V> { Year(TimeUnit20<V>)  }

//泛型无递归
enum TimeUnit4<T>{Year(T) | Day}

func foo5(){ // 测试泛型类型加在base还是field：有base的时候field后面不能加
    var a =  TimeUnit4<Int32>.Year(1) // OK
    var aa = Year(1) // EXPECTED: regex find multiple constructor 'Year' of enum declaration
    var m:Int32 = 1
    // 以下m的类型是int32，推断出TimeUnit4<Int32>,这就导致和Year<Int32>一起，构成了'base' and 'field' 都含有type parameter
    var b =  TimeUnit4.Year<Int32>(m) // EXPECTED: regex type arguments cannot appear after 'Year' when enum type 'TimeUnit4' is given
    var b2 = TimeUnit4<Int32>.Year(m) // ok
    var bb2 = Year(m) // EXPECTED: regex find multiple constructor 'Year' of enum declaration
    // 以下m是int32，但是TimeUnit4<Int64>是int64，类型不匹配
    var b3 = TimeUnit4<Int64>.Year(m) // EXPECTED: regex parameters and arguments mismatch
    // 以下是'base' and 'field' 都含有type parameter
    var b4 = TimeUnit4<Int32>.Year<Int32>(m)  // EXPECTED: regex type arguments cannot appear after 'Year' when enum type 'TimeUnit4' is given
    var b5 = TimeUnit4.Year(m) // ok
    var bb5 = Year(m) // EXPECTED: regex find multiple constructor 'Year' of enum declaration
    var c =  TimeUnit4.Day<Int32> // EXPECTED: regex type arguments cannot appear after 'Day' when enum type 'TimeUnit4' is given
    var c2 =  TimeUnit4<Int32>.Day // ok
    var d =  TimeUnit4.Day // EXPECTED: regex generic type should be used with type argument
}



// 前一个TimeUnit10<Int32>的泛型实例化类型为int32,后一个自嵌套类型不一致
func foo3(){
    var a = match (TimeUnit10<Int32>.Day(TimeUnit10<Int64>.Year(1))) { // EXPECTED: regex return type for 'Year' is mismatched
        case Day(Year(1)) => 0
        case Day(Day(x)) => 1
        case _ => 2
    }
    a
}

// 自嵌套.Day(x)中的x可以是TimeUnit.Year(x),也可以是TimeUnit.Day(y)，y还有取值
func foo1(){
    var a = match (TimeUnit1.Day(TimeUnit1.Year(1))) { // EXPECTED: regex all enum constructors must be covered in match
        case Day(Year(1)) => 0
        case Day(Day(x)) => 1
    }
}
