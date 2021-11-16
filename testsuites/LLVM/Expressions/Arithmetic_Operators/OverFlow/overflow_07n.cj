// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data{
    var a: Int8 = 128  //EXPECTED: regex the number '128' exceeds the value range of type 'Int8'
    var b: Float64 = 1.8976_9313_486231570E308      //EXPECTED: regex the number '1.8976_9313_486231570E308' exceeds the value range of type 'Float64'
    init(x:Int32){
        this.a=this.b
    }
}

record Foo{
    var a: Int16 = -32769      //EXPECTED: regex the number '-32769' exceeds the value range of type 'Int16'
    var b: Float32 = 1.8976_9313_486231570E308    //EXPECTED: regex the number '1.8976_9313_486231570E308' exceeds the value range of type 'Float32'
    init(a: Float64){
        b = Float32(a)
    }
}

interface I{
    let a: Int32 = 2147483649     //EXPECTED: regex  the number '2147483649' exceeds the value range of type 'Int32'
    let b: Float16 = 1.8976_9313_486231570E308  //EXPECTED: regex the number '1.8976_9313_486231570E308' exceeds the value range of type 'Float16'
}

func main(): Int64 {
    Foo(4.5)
    Data(1232)
    I.b
    return 1
}