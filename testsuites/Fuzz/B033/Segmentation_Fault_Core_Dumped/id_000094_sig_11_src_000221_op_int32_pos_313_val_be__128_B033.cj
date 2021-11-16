// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

//special character
let l: Char = '''
let l1 = '''

let m: Char = '"'
let m1 = '"'

let n: Char = '\u����
let n1 = 'u{1}'
let n2 = 'u{8}'

if l==l1 && l1==''' && m==m1 && m1=='"' && n==n1 && n1=='u{1}' && n2 == 'u{8}'{
return 0
}

return 1
}
