; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@str = private unnamed_addr constant [17 x i8] c"turtle_start.png\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare { i32, i32, { i32, i32, i32 }*, double }* @Pointer(i32, i32, { i32, i32, i32 }*, double)

declare { i32, i32 }* @Canvas(i32, i32)

declare i32 @save({ i32, i32 }*, i8*)

declare { i32, i32 }* @pixel({ i32, i32 }*, { i32, i32, i32 }*, i32, i32)

declare double @sine(double)

declare double @cosine(double)

declare double @tangeant(double)

declare i32 @mod(i32, i32)

declare i32 @floors(double)

declare i32 @getRun(i32, double)

declare i32 @getRise(i32, double)

define i32 @main() {
entry:
  %test = alloca i32
  %gcd_ret = call i32 @gcd(i32 366, i32 60)
  store i32 %gcd_ret, i32* %test
  %can = alloca { i32, i32 }*
  %Canvas = call { i32, i32 }* @Canvas(i32 500, i32 500)
  store { i32, i32 }* %Canvas, { i32, i32 }** %can
  %color = alloca { i32, i32, i32 }*
  %Rgb = call { i32, i32, i32 }* @Rgb(i32 0, i32 0, i32 0)
  store { i32, i32, i32 }* %Rgb, { i32, i32, i32 }** %color
  %color1 = load { i32, i32, i32 }*, { i32, i32, i32 }** %color
  %can2 = load { i32, i32 }*, { i32, i32 }** %can
  %turtle_draw_ret = call i32 @turtle_draw({ i32, i32 }* %can2, double 0.000000e+00, i32 100, { i32, i32, i32 }* %color1, i32 100, i32 100)
  %color3 = load { i32, i32, i32 }*, { i32, i32, i32 }** %color
  %can4 = load { i32, i32 }*, { i32, i32 }** %can
  %turtle_draw_ret5 = call i32 @turtle_draw({ i32, i32 }* %can4, double 9.000000e+01, i32 100, { i32, i32, i32 }* %color3, i32 200, i32 100)
  %color6 = load { i32, i32, i32 }*, { i32, i32, i32 }** %color
  %can7 = load { i32, i32 }*, { i32, i32 }** %can
  %turtle_draw_ret8 = call i32 @turtle_draw({ i32, i32 }* %can7, double 2.700000e+02, i32 100, { i32, i32, i32 }* %color6, i32 100, i32 200)
  %can9 = load { i32, i32 }*, { i32, i32 }** %can
  %save = call i32 @save({ i32, i32 }* %can9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @str, i32 0, i32 0))
  ret i32 0
}

define i32 @gcd(i32 %a, i32 %b) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %b2 = alloca i32
  store i32 %b, i32* %b2
  %b3 = load i32, i32* %b2
  %tmp = icmp ne i32 %b3, 0
  br i1 %tmp, label %then, label %else

merge:                                            ; No predecessors!
  ret i32 0

then:                                             ; preds = %entry
  %a4 = load i32, i32* %a1
  %b5 = load i32, i32* %b2
  %mod = call i32 @mod(i32 %a4, i32 %b5)
  %b6 = load i32, i32* %b2
  %gcd_ret = call i32 @gcd(i32 %b6, i32 %mod)
  ret i32 %gcd_ret

else:                                             ; preds = %entry
  %a7 = load i32, i32* %a1
  ret i32 %a7
}

define i32 @step({ i32, i32 }* %can, i32 %rise, i32 %run, i32 %x, i32 %y, { i32, i32, i32 }* %color) {
entry:
  %can1 = alloca { i32, i32 }*
  store { i32, i32 }* %can, { i32, i32 }** %can1
  %rise2 = alloca i32
  store i32 %rise, i32* %rise2
  %run3 = alloca i32
  store i32 %run, i32* %run3
  %x4 = alloca i32
  store i32 %x, i32* %x4
  %y5 = alloca i32
  store i32 %y, i32* %y5
  %color6 = alloca { i32, i32, i32 }*
  store { i32, i32, i32 }* %color, { i32, i32, i32 }** %color6
  %xcount = alloca i32
  store i32 0, i32* %xcount
  %ycount = alloca i32
  store i32 0, i32* %ycount
  %xcur = alloca i32
  %x7 = load i32, i32* %x4
  store i32 %x7, i32* %xcur
  %ycur = alloca i32
  %y8 = load i32, i32* %y5
  store i32 %y8, i32* %ycur
  br label %while

while:                                            ; preds = %while_body, %entry
  %xcount16 = load i32, i32* %xcount
  %run17 = load i32, i32* %run3
  %tmp18 = icmp slt i32 %xcount16, %run17
  br i1 %tmp18, label %while_body, label %merge

while_body:                                       ; preds = %while
  %can9 = load { i32, i32 }*, { i32, i32 }** %can1
  %color10 = load { i32, i32, i32 }*, { i32, i32, i32 }** %color6
  %xcur11 = load i32, i32* %xcur
  %ycur12 = load i32, i32* %ycur
  %pixel = call { i32, i32 }* @pixel({ i32, i32 }* %can9, { i32, i32, i32 }* %color10, i32 %xcur11, i32 %ycur12)
  %xcur13 = load i32, i32* %xcur
  %tmp = add i32 %xcur13, 1
  store i32 %tmp, i32* %xcur
  %xcount14 = load i32, i32* %xcount
  %tmp15 = add i32 %xcount14, 1
  store i32 %tmp15, i32* %xcount
  br label %while

merge:                                            ; preds = %while
  br label %while19

while19:                                          ; preds = %while_body20, %merge
  %ycount30 = load i32, i32* %ycount
  %rise31 = load i32, i32* %rise2
  %tmp32 = icmp slt i32 %ycount30, %rise31
  br i1 %tmp32, label %while_body20, label %merge33

while_body20:                                     ; preds = %while19
  %can21 = load { i32, i32 }*, { i32, i32 }** %can1
  %color22 = load { i32, i32, i32 }*, { i32, i32, i32 }** %color6
  %xcur23 = load i32, i32* %xcur
  %ycur24 = load i32, i32* %ycur
  %pixel25 = call { i32, i32 }* @pixel({ i32, i32 }* %can21, { i32, i32, i32 }* %color22, i32 %xcur23, i32 %ycur24)
  %ycur26 = load i32, i32* %ycur
  %tmp27 = add i32 %ycur26, 1
  store i32 %tmp27, i32* %ycur
  %ycount28 = load i32, i32* %ycount
  %tmp29 = add i32 %ycount28, 1
  store i32 %tmp29, i32* %ycount
  br label %while19

merge33:                                          ; preds = %while19
  ret i32 0
}

define i32 @turtle_draw({ i32, i32 }* %can, double %angle, i32 %distance, { i32, i32, i32 }* %color, i32 %x, i32 %y) {
entry:
  %can1 = alloca { i32, i32 }*
  store { i32, i32 }* %can, { i32, i32 }** %can1
  %angle2 = alloca double
  store double %angle, double* %angle2
  %distance3 = alloca i32
  store i32 %distance, i32* %distance3
  %color4 = alloca { i32, i32, i32 }*
  store { i32, i32, i32 }* %color, { i32, i32, i32 }** %color4
  %x5 = alloca i32
  store i32 %x, i32* %x5
  %y6 = alloca i32
  store i32 %y, i32* %y6
  %rise = alloca i32
  %distance7 = load i32, i32* %distance3
  %angle8 = load double, double* %angle2
  %getRise = call i32 @getRise(i32 %distance7, double %angle8)
  store i32 %getRise, i32* %rise
  %run = alloca i32
  %distance9 = load i32, i32* %distance3
  %angle10 = load double, double* %angle2
  %getRun = call i32 @getRun(i32 %distance9, double %angle10)
  store i32 %getRun, i32* %run
  %gcdval = alloca i32
  %run11 = load i32, i32* %run
  %rise12 = load i32, i32* %rise
  %gcd_ret = call i32 @gcd(i32 %rise12, i32 %run11)
  store i32 %gcd_ret, i32* %gcdval
  %simplerise = alloca i32
  %rise13 = load i32, i32* %rise
  %gcdval14 = load i32, i32* %gcdval
  %tmp = sdiv i32 %rise13, %gcdval14
  store i32 %tmp, i32* %simplerise
  %simplerun = alloca i32
  %run15 = load i32, i32* %run
  %gcdval16 = load i32, i32* %gcdval
  %tmp17 = sdiv i32 %run15, %gcdval16
  store i32 %tmp17, i32* %simplerun
  %simplerise18 = load i32, i32* %simplerise
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.3, i32 0, i32 0), i32 %simplerise18)
  %simplerun19 = load i32, i32* %simplerun
  %printf20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.3, i32 0, i32 0), i32 %simplerun19)
  %counter = alloca i32
  store i32 0, i32* %counter
  %xcur = alloca i32
  %x21 = load i32, i32* %x5
  store i32 %x21, i32* %xcur
  %ycur = alloca i32
  %y22 = load i32, i32* %y6
  store i32 %y22, i32* %ycur
  br label %while

while:                                            ; preds = %while_body, %entry
  %ycur35 = load i32, i32* %ycur
  %y36 = load i32, i32* %y6
  %rise37 = load i32, i32* %rise
  %tmp38 = add i32 %y36, %rise37
  %tmp39 = icmp slt i32 %ycur35, %tmp38
  %xcur40 = load i32, i32* %xcur
  %x41 = load i32, i32* %x5
  %run42 = load i32, i32* %run
  %tmp43 = add i32 %x41, %run42
  %tmp44 = icmp slt i32 %xcur40, %tmp43
  %tmp45 = or i1 %tmp39, %tmp44
  br i1 %tmp45, label %while_body, label %merge

while_body:                                       ; preds = %while
  %z = alloca i32
  %color23 = load { i32, i32, i32 }*, { i32, i32, i32 }** %color4
  %ycur24 = load i32, i32* %ycur
  %xcur25 = load i32, i32* %xcur
  %simplerun26 = load i32, i32* %simplerun
  %simplerise27 = load i32, i32* %simplerise
  %can28 = load { i32, i32 }*, { i32, i32 }** %can1
  %step_ret = call i32 @step({ i32, i32 }* %can28, i32 %simplerise27, i32 %simplerun26, i32 %xcur25, i32 %ycur24, { i32, i32, i32 }* %color23)
  store i32 %step_ret, i32* %z
  %xcur29 = load i32, i32* %xcur
  %simplerun30 = load i32, i32* %simplerun
  %tmp31 = add i32 %xcur29, %simplerun30
  store i32 %tmp31, i32* %xcur
  %ycur32 = load i32, i32* %ycur
  %simplerise33 = load i32, i32* %simplerise
  %tmp34 = add i32 %ycur32, %simplerise33
  store i32 %tmp34, i32* %ycur
  br label %while

merge:                                            ; preds = %while
  ret i32 0
}

declare { i32, i32, i32 }* @Rgb(i32, i32, i32)
