// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

/bin /boot /dev /etc /home /lib /lib32 /lib64 /media /mnt /opt /proc /root /run /sbin /srv /sys /tmp /usr /var
func test():Int64 = match (true) {
case _ => return 1
case _ => true
}
cllneedupload/ JS/ LLVM/

func test():Int64 { // EXPECTED: regex type of function body is incompatible with return type
match (true) {
case _ => return 1
case _ => true
}
}

func main(): Int64 {
return test() - 1
}
