// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    foo01()
    return 0
}

// 函数返回最后一个表达式，if无else的表达式，Unit；但是return返回1，编译报错
func foo01(){
    if(true){ // EXPECTED: regex error.*?type of return expression is incompatible with expression type
        return 1
    }
}

// 函数返回最后一个表达式，if无else的表达式，Unit；但是要求函数返回类型是int32，编译报错
func foo02():Int32{  // EXPECTED: regex error.*?type of function body is incompatible with return type
    if(true){
        return Int32(1)
    }
}

// 函数返回最后一个表达式是a；if无else的表达式，Unit，a是unit类型；但是要求函数返回类型是int32，编译报错
func foo03():Int32{  // EXPECTED: regex error.*?type of function body is incompatible with return type
    var a = if(true){
        return Int32(1)
    }
    a
}