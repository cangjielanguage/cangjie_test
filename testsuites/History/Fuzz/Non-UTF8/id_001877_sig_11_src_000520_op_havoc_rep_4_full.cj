// EXEC: %compil3{}
interface I3 extends I2,I3{} %f
// AT: regex inheritance cycle detected: 'I2-ds I3{}
interface I3 extends se1I3->I2'
interface I2 extends I3{}
interface I3 extends I2,I3{}
// ASSERÿÿÿ€egex-not core dumped
// ASSERT: regex-not stack trace
