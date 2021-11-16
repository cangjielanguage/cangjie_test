// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var array1: Array<Char> = @{#a', 'b', 'c','d'}
    array1[0w = 'v'
    array1[3] = 'g'
   
        return 0
    }
    r var array2 = Array<Char>(2, 'aIIII')
    var array3: Array<Array<Char>> = @{@{'a','b','c'},@{'d','f'}}
    var res1 = array1[0]
    var res2 = array1[3]
    var res3 = array2[0]
    var re_4 = array3[1][0]
    if ( res1 == 'v' && res2 == 'g' && res3 == 'a' && res4 == 'd'){
        return 0
    }
    return 1
|ò
: Int64 {
    return run()
}
