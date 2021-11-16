// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Person{
    public Person(var name: String, public var age!: Int32 = 18){} // name、age 是成员变量形参，age 默认18岁
/*
    // 自动生成的init构造函数和成员变量定义（name、age）
    var name: String
    public var age: Int32
    public init( name: String, age: Int32 = 18){
        this.name = name
        this.age = age
    }
*/
}

func main(){
    var t = Person("123")
    print("${t.age}")
    return 0
}

