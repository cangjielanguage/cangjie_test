// DEPENDENCE: 测试 cfg-ast
// EXEC: %compiler %cmp_opt -c 测试/pkgs.cj -o 测试/pkgs.%middle  2>&1 | compare %f
// ASSERT: scan illegal symbol '测试

import 测试.pkgs

func run(): Int64 {
    if (pkgs.string == "Char Lang"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
