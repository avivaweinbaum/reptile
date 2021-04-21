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
  %color = alloca { i32, i32, i32 }
  %Rgb = call { i32, i32, i32 } @Rgb(i32 1, i32 2, i32 3)
  store { i32, i32, i32 } %Rgb, { i32, i32, i32 }* %color
  %r = alloca i32
  %r1 = getelementptr inbounds { i32, i32, i32 }, { i32, i32, i32 }* %color, i32 0, i32 0
  %r2 = load i32, i32* %r1
  store i32 %r2, i32* %r
  %r3 = load i32, i32* %r
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %r3)
  %r4 = getelementptr inbounds { i32, i32, i32 }, { i32, i32, i32 }* %color, i32 0, i32 0
  store i32 9, i32* %r4
  %r5 = getelementptr inbounds { i32, i32, i32 }, { i32, i32, i32 }* %color, i32 0, i32 0
  %r6 = load i32, i32* %r5
  %printf7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %r6)
  %ptr = alloca { i32, i32, { i32, i32, i32 }, double }
  %color8 = load { i32, i32, i32 }, { i32, i32, i32 }* %color
  %Pointer = call { i32, i32, { i32, i32, i32 }, double } @Pointer(i32 4, i32 5, { i32, i32, i32 } %color8, double 3.300000e+00)
  store { i32, i32, { i32, i32, i32 }, double } %Pointer, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %color9 = getelementptr inbounds { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr, i32 0, i32 2
  %color10 = getelementptr inbounds { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr, i32 0, i32 2
  %b = getelementptr inbounds { i32, i32, i32 }, { i32, i32, i32 }* %color10, i32 0, i32 2
  %b11 = load i32, i32* %b
  %printf12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %b11)
  ret i32 0
}
