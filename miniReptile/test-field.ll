; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare { i32, i32, i32 } @Rgb(i32, i32, i32)

declare { i32, i32, { i32, i32, i32 }, double } @Pointer(i32, i32, { i32, i32, i32 }, double)

declare { i32, i32 } @Canvas(i32, i32)

declare { i1, { i32, i32 } } @File(i1, { i32, i32 })

define i32 @main() {
entry:
  %color = alloca { i32, i32, i32 }
  %Rgb = call { i32, i32, i32 } @Rgb(i32 1, i32 2, i32 3)
  store { i32, i32, i32 } %Rgb, { i32, i32, i32 }* %color
  %r = alloca i32
  %r1 = getelementptr inbounds { i32, i32, i32 }, { i32, i32, i32 }* %color, i32 0, i32 0
  %r2 = load i32, i32* %r1
  store i32 %r2, i32* %r
  %r3 = load i32, i32* %r
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %r3)
  ret i32 0
}
