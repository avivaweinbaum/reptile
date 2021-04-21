; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare { i32, i32, i32 } @Rgb(i32, i32, i32)

declare { i32, i32, { i32, i32, i32 }, double } @Pointer(i32, i32, { i32, i32, i32 }, double)

declare { i32, i32 } @Canvas(i32, i32)

declare { i8*, { i32, i32 } } @File(i8*, { i32, i32 })

declare i32 @create({ i32, i32 })

declare i32 @save(i8*)

declare { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double }, i32, i32)

define i32 @main() {
entry:
  br i1 true, label %then, label %else

merge:                                            ; preds = %else, %then
  ret i32 0

then:                                             ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 4)
  br label %merge

else:                                             ; preds = %entry
  br label %merge
}
