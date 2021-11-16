// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

//catelog:# 泛型## 类型型变### 定义--1
func foo<>(){return 1} // EXPECTED: regex error.*expected identifier here
func main(): Int64 {
    if (foo<>() != 1 ) {
        return 1
    }
    return 0
}
