; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare { i32, i32, i32 }* @Rgb(i32, i32, i32)

declare i32 @getR_rgb({ i32, i32, i32 }*)

declare { i32, i32, i32 }* @setR_rgb({ i32, i32, i32 }*, i32)

declare { i32, i32, { i32, i32, i32 }*, double }* @Pointer(i32, i32, { i32, i32, i32 }*, double)

declare { i32, i32 }* @Canvas(i32, i32)

declare { i8*, { i32, i32 }* }* @File(i8*, { i32, i32 }*)

declare i32 @create({ i32, i32 }*)

declare i32 @save(i8*)

declare { i32, i32, { i32, i32, i32 }*, double }* @pixel({ i32, i32, { i32, i32, i32 }*, double }*, i32, i32)

define i32 @fib(i32 %n) {
entry:
  %n1 = alloca i32
  store i32 %n, i32* %n1
  %n2 = load i32, i32* %n1
  %tmp = icmp sle i32 %n2, 1
  br i1 %tmp, label %then, label %else

merge:                                            ; No predecessors!
  ret i32 0

then:                                             ; preds = %entry
  %n3 = load i32, i32* %n1
  ret i32 %n3

else:                                             ; preds = %entry
  %n4 = load i32, i32* %n1
  %tmp5 = sub i32 %n4, 1
  %fib_ret = call i32 @fib(i32 %tmp5)
  %n6 = load i32, i32* %n1
  %tmp7 = sub i32 %n6, 2
  %fib_ret8 = call i32 @fib(i32 %tmp7)
  %tmp9 = add i32 %fib_ret, %fib_ret8
  ret i32 %tmp9
}

define i32 @main() {
entry:
  %m = alloca i32
  %fib_ret = call i32 @fib(i32 9)
  store i32 %fib_ret, i32* %m
  %m1 = load i32, i32* %m
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.3, i32 0, i32 0), i32 %m1)
  ret i32 0
}
