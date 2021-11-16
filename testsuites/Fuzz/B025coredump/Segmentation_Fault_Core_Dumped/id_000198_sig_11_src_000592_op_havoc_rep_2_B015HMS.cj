// EXEC: %compiler %cmp_opt %f -o %output

func main(): Int64 {
let s1=10
let s2=20
let s3=7
let s4="test_${s2-(s1+s1)*s2/s3}"
print(s4)
return 0
}
