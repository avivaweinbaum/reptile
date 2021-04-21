; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@str = private unnamed_addr constant [11 x i8] c"myfile.png\00"

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
  %can = alloca { i32, i32 }
  %Canvas = call { i32, i32 } @Canvas(i32 800, i32 800)
  store { i32, i32 } %Canvas, { i32, i32 }* %can
  %can1 = load { i32, i32 }, { i32, i32 }* %can
  %create = call i32 @create({ i32, i32 } %can1)
  %save = call i32 @save(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str, i32 0, i32 0))
  ret i32 0
}
