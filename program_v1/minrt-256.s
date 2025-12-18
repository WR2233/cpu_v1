# --- File: /home/mouse/is/cpu-ex/mycompiler/to-riscv/cpuex-v1.6/raytracer/minrt.riscv ---
MAIN:
	addi sp, sp, -812
# 18~18
	addi t0, zero, 1
	sw t0, 224(sp)
# 18~18
	addi t0, zero, 0
	sw t0, 52(sp)
# 18~18
	sw ra, -4(sp)
	lw a0, 224(sp)
	lw a1, 52(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 684(sp)
# 23~23
	addi t0, zero, 0
	sw t0, 524(sp)
# 23~23
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 796(sp)
# 23~23
	sw ra, -4(sp)
	lw a0, 524(sp)
	flw fa0, 796(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 692(sp)
# 24~24
	addi t0, zero, 60
	sw t0, 276(sp)
# 24~24
	addi t0, zero, 0
	sw t0, 344(sp)
# 24~24
	addi t0, zero, 0
	sw t0, 228(sp)
# 24~24
	addi t0, zero, 0
	sw t0, 624(sp)
# 24~24
	addi t0, zero, 0
	sw t0, 324(sp)
# 24~24
	addi t0, zero, 0
	sw t0, 480(sp)
# 24~24
	lw t0, 344(sp)
	sw t0, 0(tp)
	lw t0, 228(sp)
	sw t0, 4(tp)
	lw t0, 624(sp)
	sw t0, 8(tp)
	lw t0, 324(sp)
	sw t0, 12(tp)
	lw t0, 692(sp)
	sw t0, 16(tp)
	lw t0, 692(sp)
	sw t0, 20(tp)
	lw t0, 480(sp)
	sw t0, 24(tp)
	lw t0, 692(sp)
	sw t0, 28(tp)
	lw t0, 692(sp)
	sw t0, 32(tp)
	lw t0, 692(sp)
	sw t0, 36(tp)
	lw t0, 692(sp)
	sw t0, 40(tp)
	sw tp, 744(sp)
	addi tp, tp, 44
# 24~24
	sw ra, -4(sp)
	lw a0, 276(sp)
	lw a1, 744(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 240(sp)
# 28~28
	addi t0, zero, 3
	sw t0, 340(sp)
# 28~28
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 28~28
	sw ra, -4(sp)
	lw a0, 340(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 31~31
	addi t0, zero, 3
	sw t0, 652(sp)
# 31~31
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 104(sp)
# 31~31
	sw ra, -4(sp)
	lw a0, 652(sp)
	flw fa0, 104(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 264(sp)
# 34~34
	addi t0, zero, 3
	sw t0, 328(sp)
# 34~34
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 768(sp)
# 34~34
	sw ra, -4(sp)
	lw a0, 328(sp)
	flw fa0, 768(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 748(sp)
# 37~37
	addi t0, zero, 1
	sw t0, 80(sp)
# 37~37
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 392(sp)
# 37~37
	sw ra, -4(sp)
	lw a0, 80(sp)
	flw fa0, 392(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 332(sp)
# 40~40
	addi t0, zero, 50
	sw t0, 40(sp)
# 40~40
	addi t0, zero, 1
	sw t0, 500(sp)
# 40~40
	addi t0, zero, -1
	sw t0, 376(sp)
# 40~40
	sw ra, -4(sp)
	lw a0, 500(sp)
	lw a1, 376(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 740(sp)
# 40~40
	sw ra, -4(sp)
	lw a0, 40(sp)
	lw a1, 740(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 688(sp)
# 43~43
	addi t0, zero, 1
	sw t0, 444(sp)
# 43~43
	addi t0, zero, 1
	sw t0, 772(sp)
# 43~43
	addi t0, zero, 0
	sw t0, 380(sp)
# 43~43
	lw t0, 740(sp)
	sw t0, 100(sp)
# 43~43
	sw ra, -4(sp)
	lw a0, 772(sp)
	lw a1, 100(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 428(sp)
# 43~43
	sw ra, -4(sp)
	lw a0, 444(sp)
	lw a1, 428(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 164(sp)
# 48~48
	addi t0, zero, 1
	sw t0, 8(sp)
# 48~48
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 712(sp)
# 48~48
	sw ra, -4(sp)
	lw a0, 8(sp)
	flw fa0, 712(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 316(sp)
# 51~51
	addi t0, zero, 1
	sw t0, 356(sp)
# 51~51
	addi t0, zero, 0
	sw t0, 56(sp)
# 51~51
	sw ra, -4(sp)
	lw a0, 356(sp)
	lw a1, 56(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 792(sp)
# 54~54
	addi t0, zero, 1
	sw t0, 680(sp)
# 54~54
	la t0, f1000000000.00000f
	flw ft0, 0(t0)
	fsw ft0, 168(sp)
# 54~54
	sw ra, -4(sp)
	lw a0, 680(sp)
	flw fa0, 168(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 572(sp)
# 57~57
	addi t0, zero, 3
	sw t0, 588(sp)
# 57~57
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 752(sp)
# 57~57
	sw ra, -4(sp)
	lw a0, 588(sp)
	flw fa0, 752(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 648(sp)
# 60~60
	addi t0, zero, 1
	sw t0, 564(sp)
# 60~60
	addi t0, zero, 0
	sw t0, 656(sp)
# 60~60
	sw ra, -4(sp)
	lw a0, 564(sp)
	lw a1, 656(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 776(sp)
# 63~63
	addi t0, zero, 3
	sw t0, 92(sp)
# 63~63
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 360(sp)
# 63~63
	sw ra, -4(sp)
	lw a0, 92(sp)
	flw fa0, 360(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 668(sp)
# 66~66
	addi t0, zero, 3
	sw t0, 292(sp)
# 66~66
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 716(sp)
# 66~66
	sw ra, -4(sp)
	lw a0, 292(sp)
	flw fa0, 716(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 644(sp)
# 70~70
	addi t0, zero, 3
	sw t0, 244(sp)
# 70~70
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 432(sp)
# 70~70
	sw ra, -4(sp)
	lw a0, 244(sp)
	flw fa0, 432(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 296(sp)
# 73~73
	addi t0, zero, 3
	sw t0, 200(sp)
# 73~73
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 632(sp)
# 73~73
	sw ra, -4(sp)
	lw a0, 200(sp)
	flw fa0, 632(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 120(sp)
# 77~77
	addi t0, zero, 2
	sw t0, 248(sp)
# 77~77
	addi t0, zero, 0
	sw t0, 476(sp)
# 77~77
	sw ra, -4(sp)
	lw a0, 248(sp)
	lw a1, 476(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 180(sp)
# 80~80
	addi t0, zero, 2
	sw t0, 192(sp)
# 80~80
	addi t0, zero, 0
	sw t0, 44(sp)
# 80~80
	sw ra, -4(sp)
	lw a0, 192(sp)
	lw a1, 44(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 272(sp)
# 83~83
	addi t0, zero, 1
	sw t0, 268(sp)
# 83~83
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 764(sp)
# 83~83
	sw ra, -4(sp)
	lw a0, 268(sp)
	flw fa0, 764(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 612(sp)
# 87~87
	addi t0, zero, 3
	sw t0, 372(sp)
# 87~87
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 584(sp)
# 87~87
	sw ra, -4(sp)
	lw a0, 372(sp)
	flw fa0, 584(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 696(sp)
# 90~90
	addi t0, zero, 3
	sw t0, 616(sp)
# 90~90
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 472(sp)
# 90~90
	sw ra, -4(sp)
	lw a0, 616(sp)
	flw fa0, 472(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 512(sp)
# 94~94
	addi t0, zero, 3
	sw t0, 60(sp)
# 94~94
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 204(sp)
# 94~94
	sw ra, -4(sp)
	lw a0, 60(sp)
	flw fa0, 204(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 484(sp)
# 96~96
	addi t0, zero, 3
	sw t0, 336(sp)
# 96~96
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 436(sp)
# 96~96
	sw ra, -4(sp)
	lw a0, 336(sp)
	flw fa0, 436(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 132(sp)
# 98~98
	addi t0, zero, 3
	sw t0, 528(sp)
# 98~98
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 700(sp)
# 98~98
	sw ra, -4(sp)
	lw a0, 528(sp)
	flw fa0, 700(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 408(sp)
# 102~102
	addi t0, zero, 3
	sw t0, 592(sp)
# 102~102
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 404(sp)
# 102~102
	sw ra, -4(sp)
	lw a0, 592(sp)
	flw fa0, 404(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 107~107
	addi t0, zero, 0
	sw t0, 348(sp)
# 107~107
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 660(sp)
# 107~107
	sw ra, -4(sp)
	lw a0, 348(sp)
	flw fa0, 660(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 352(sp)
# 108~108
	addi t0, zero, 0
	sw t0, 232(sp)
# 108~108
	sw ra, -4(sp)
	lw a0, 232(sp)
	lw a1, 352(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 460(sp)
# 109~109
	addi t0, zero, 0
	sw t0, 84(sp)
# 109~109
	lw t0, 352(sp)
	sw t0, 0(tp)
	lw t0, 460(sp)
	sw t0, 4(tp)
	sw tp, 16(sp)
	addi tp, tp, 8
# 109~109
	sw ra, -4(sp)
	lw a0, 84(sp)
	lw a1, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 532(sp)
# 110~110
	addi t0, zero, 5
	sw t0, 76(sp)
# 110~110
	sw ra, -4(sp)
	lw a0, 76(sp)
	lw a1, 532(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 488(sp)
# 115~115
	addi t0, zero, 0
	sw t0, 384(sp)
# 115~115
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 108(sp)
# 115~115
	sw ra, -4(sp)
	lw a0, 384(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 284(sp)
# 116~116
	addi t0, zero, 3
	sw t0, 456(sp)
# 116~116
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 388(sp)
# 116~116
	sw ra, -4(sp)
	lw a0, 456(sp)
	flw fa0, 388(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 364(sp)
# 117~117
	addi t0, zero, 60
	sw t0, 520(sp)
# 117~117
	sw ra, -4(sp)
	lw a0, 520(sp)
	lw a1, 284(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 756(sp)
# 118~118
	lw t0, 364(sp)
	sw t0, 0(tp)
	lw t0, 756(sp)
	sw t0, 4(tp)
	sw tp, 804(sp)
	addi tp, tp, 8
# 123~123
	addi t0, zero, 0
	sw t0, 464(sp)
# 123~123
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 196(sp)
# 123~123
	sw ra, -4(sp)
	lw a0, 464(sp)
	flw fa0, 196(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 124~124
	addi t0, zero, 0
	sw t0, 492(sp)
# 124~124
	sw ra, -4(sp)
	lw a0, 492(sp)
	lw a1, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 125~125
	lw t0, 20(sp)
	sw t0, 0(tp)
	lw t0, 4(sp)
	sw t0, 4(tp)
	sw tp, 496(sp)
	addi tp, tp, 8
# 126~126
	addi t0, zero, 180
	sw t0, 300(sp)
# 126~126
	addi t0, zero, 0
	sw t0, 24(sp)
# 126~126
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 400(sp)
# 126~126
	lw t0, 24(sp)
	sw t0, 0(tp)
	lw t0, 496(sp)
	sw t0, 4(tp)
	flw ft0, 400(sp)
	fsw ft0, 8(tp)
	sw tp, 536(sp)
	addi tp, tp, 12
# 126~126
	sw ra, -4(sp)
	lw a0, 300(sp)
	lw a1, 536(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 636(sp)
# 130~130
	addi t0, zero, 1
	sw t0, 544(sp)
# 130~130
	addi t0, zero, 0
	sw t0, 88(sp)
# 130~130
	sw ra, -4(sp)
	lw a0, 544(sp)
	lw a1, 88(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 780(sp)
# 561~2310
	sw tp, 556(sp)
	la t0, read_screen_settings.2514
	sw t0, 0(tp)
	lw t0, 48(sp)
	sw t0, 4(tp)
	lw t0, 484(sp)
	sw t0, 8(tp)
	lw t0, 132(sp)
	sw t0, 12(tp)
	lw t0, 408(sp)
	sw t0, 16(tp)
	lw t0, 264(sp)
	sw t0, 20(tp)
	addi tp, tp, 24
# 594~2310
	sw tp, 176(sp)
	la t0, read_light.2516
	sw t0, 0(tp)
	lw t0, 332(sp)
	sw t0, 4(tp)
	lw t0, 748(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 657~2310
	sw tp, 596(sp)
	la t0, read_nth_object.2521
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 740~2310
	sw tp, 220(sp)
	la t0, read_object.2523
	sw t0, 0(tp)
	lw t0, 684(sp)
	sw t0, 4(tp)
	lw t0, 596(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 749~2310
	sw tp, 704(sp)
	la t0, read_all_object.2525
	sw t0, 0(tp)
	lw t0, 220(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 773~2310
	sw tp, 144(sp)
	la t0, read_and_network.2531
	sw t0, 0(tp)
	lw t0, 688(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 782~2310
	sw tp, 208(sp)
	la t0, read_parameter.2533
	sw t0, 0(tp)
	lw t0, 164(sp)
	sw t0, 4(tp)
	lw t0, 704(sp)
	sw t0, 8(tp)
	lw t0, 144(sp)
	sw t0, 12(tp)
	lw t0, 176(sp)
	sw t0, 16(tp)
	lw t0, 556(sp)
	sw t0, 20(tp)
	addi tp, tp, 24
# 798~2310
	sw tp, 452(sp)
	la t0, solver_rect_surface.2535
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 813~2310
	sw tp, 784(sp)
	la t0, solver_rect.2544
	sw t0, 0(tp)
	lw t0, 452(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 822~2310
	sw tp, 664(sp)
	la t0, solver_surface.2550
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 869~2310
	sw tp, 788(sp)
	la t0, solver_second.2569
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 898~2310
	sw tp, 96(sp)
	la t0, solver.2575
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	lw t0, 784(sp)
	sw t0, 8(tp)
	lw t0, 788(sp)
	sw t0, 12(tp)
	lw t0, 664(sp)
	sw t0, 16(tp)
	addi tp, tp, 20
# 915~2310
	sw tp, 72(sp)
	la t0, solver_rect_fast.2579
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 948~2310
	sw tp, 156(sp)
	la t0, solver_surface_fast.2586
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 957~2310
	sw tp, 720(sp)
	la t0, solver_second_fast.2592
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 977~2310
	sw tp, 28(sp)
	la t0, solver_fast.2598
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	lw t0, 72(sp)
	sw t0, 8(tp)
	lw t0, 720(sp)
	sw t0, 12(tp)
	lw t0, 156(sp)
	sw t0, 16(tp)
	addi tp, tp, 20
# 997~2310
	sw tp, 396(sp)
	la t0, solver_surface_fast2.2602
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1005~2310
	sw tp, 504(sp)
	la t0, solver_second_fast2.2609
	sw t0, 0(tp)
	lw t0, 316(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1024~2310
	sw tp, 252(sp)
	la t0, solver_fast2.2616
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	lw t0, 72(sp)
	sw t0, 8(tp)
	lw t0, 504(sp)
	sw t0, 12(tp)
	lw t0, 396(sp)
	sw t0, 16(tp)
	addi tp, tp, 20
# 1118~2310
	sw tp, 64(sp)
	la t0, iter_setup_dirvec_constants.2628
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1135~2310
	sw tp, 708(sp)
	la t0, setup_dirvec_constants.2631
	sw t0, 0(tp)
	lw t0, 64(sp)
	sw t0, 4(tp)
	lw t0, 684(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1141~2310
	sw tp, 576(sp)
	la t0, setup_startp_constants.2633
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1160~2310
	sw tp, 172(sp)
	la t0, setup_startp.2636
	sw t0, 0(tp)
	lw t0, 684(sp)
	sw t0, 4(tp)
	lw t0, 576(sp)
	sw t0, 8(tp)
	lw t0, 512(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 1208~2310
	sw tp, 368(sp)
	la t0, check_all_inside.2658
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1226~2310
	sw tp, 540(sp)
	la t0, shadow_check_and_group.2664
	sw t0, 0(tp)
	lw t0, 368(sp)
	sw t0, 4(tp)
	lw t0, 648(sp)
	sw t0, 8(tp)
	lw t0, 748(sp)
	sw t0, 12(tp)
	lw t0, 804(sp)
	sw t0, 16(tp)
	lw t0, 240(sp)
	sw t0, 20(tp)
	lw t0, 316(sp)
	sw t0, 24(tp)
	lw t0, 28(sp)
	sw t0, 28(tp)
	addi tp, tp, 32
# 1256~2310
	sw tp, 468(sp)
	la t0, shadow_check_one_or_group.2667
	sw t0, 0(tp)
	lw t0, 688(sp)
	sw t0, 4(tp)
	lw t0, 540(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1271~2310
	sw tp, 608(sp)
	la t0, shadow_check_one_or_matrix.2670
	sw t0, 0(tp)
	lw t0, 648(sp)
	sw t0, 4(tp)
	lw t0, 804(sp)
	sw t0, 8(tp)
	lw t0, 468(sp)
	sw t0, 12(tp)
	lw t0, 316(sp)
	sw t0, 16(tp)
	lw t0, 28(sp)
	sw t0, 20(tp)
	addi tp, tp, 24
# 1305~2310
	sw tp, 516(sp)
	la t0, solve_each_element.2673
	sw t0, 0(tp)
	lw t0, 368(sp)
	sw t0, 4(tp)
	lw t0, 776(sp)
	sw t0, 8(tp)
	lw t0, 648(sp)
	sw t0, 12(tp)
	lw t0, 792(sp)
	sw t0, 16(tp)
	lw t0, 240(sp)
	sw t0, 20(tp)
	lw t0, 96(sp)
	sw t0, 24(tp)
	lw t0, 316(sp)
	sw t0, 28(tp)
	lw t0, 696(sp)
	sw t0, 32(tp)
	lw t0, 572(sp)
	sw t0, 36(tp)
	addi tp, tp, 40
# 1346~2310
	sw tp, 32(sp)
	la t0, solve_one_or_network.2677
	sw t0, 0(tp)
	lw t0, 688(sp)
	sw t0, 4(tp)
	lw t0, 516(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1356~2310
	sw tp, 728(sp)
	la t0, trace_or_matrix.2681
	sw t0, 0(tp)
	lw t0, 32(sp)
	sw t0, 4(tp)
	lw t0, 96(sp)
	sw t0, 8(tp)
	lw t0, 316(sp)
	sw t0, 12(tp)
	lw t0, 696(sp)
	sw t0, 16(tp)
	lw t0, 572(sp)
	sw t0, 20(tp)
	addi tp, tp, 24
# 1383~2310
	sw tp, 732(sp)
	la t0, judge_intersection.2685
	sw t0, 0(tp)
	lw t0, 164(sp)
	sw t0, 4(tp)
	lw t0, 572(sp)
	sw t0, 8(tp)
	lw t0, 728(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 1396~2310
	sw tp, 508(sp)
	la t0, solve_each_element_fast.2687
	sw t0, 0(tp)
	lw t0, 368(sp)
	sw t0, 4(tp)
	lw t0, 776(sp)
	sw t0, 8(tp)
	lw t0, 648(sp)
	sw t0, 12(tp)
	lw t0, 792(sp)
	sw t0, 16(tp)
	lw t0, 240(sp)
	sw t0, 20(tp)
	lw t0, 316(sp)
	sw t0, 24(tp)
	lw t0, 252(sp)
	sw t0, 28(tp)
	lw t0, 512(sp)
	sw t0, 32(tp)
	lw t0, 572(sp)
	sw t0, 36(tp)
	addi tp, tp, 40
# 1437~2310
	sw tp, 256(sp)
	la t0, solve_one_or_network_fast.2691
	sw t0, 0(tp)
	lw t0, 688(sp)
	sw t0, 4(tp)
	lw t0, 508(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1447~2310
	sw tp, 640(sp)
	la t0, trace_or_matrix_fast.2695
	sw t0, 0(tp)
	lw t0, 256(sp)
	sw t0, 4(tp)
	lw t0, 316(sp)
	sw t0, 8(tp)
	lw t0, 252(sp)
	sw t0, 12(tp)
	lw t0, 572(sp)
	sw t0, 16(tp)
	addi tp, tp, 20
# 1471~2310
	sw tp, 448(sp)
	la t0, judge_intersection_fast.2699
	sw t0, 0(tp)
	lw t0, 164(sp)
	sw t0, 4(tp)
	lw t0, 572(sp)
	sw t0, 8(tp)
	lw t0, 640(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 1490~2310
	sw tp, 548(sp)
	la t0, get_nvector_rect.2701
	sw t0, 0(tp)
	lw t0, 792(sp)
	sw t0, 4(tp)
	lw t0, 668(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1498~2310
	sw tp, 288(sp)
	la t0, get_nvector_plane.2703
	sw t0, 0(tp)
	lw t0, 668(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1506~2310
	sw tp, 308(sp)
	la t0, get_nvector_second.2705
	sw t0, 0(tp)
	lw t0, 648(sp)
	sw t0, 4(tp)
	lw t0, 668(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1528~2310
	sw tp, 604(sp)
	la t0, get_nvector.2707
	sw t0, 0(tp)
	lw t0, 288(sp)
	sw t0, 4(tp)
	lw t0, 548(sp)
	sw t0, 8(tp)
	lw t0, 308(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 1542~2310
	sw tp, 112(sp)
	la t0, utexture.2710
	sw t0, 0(tp)
	lw t0, 644(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1618~2310
	sw tp, 412(sp)
	la t0, add_light.2713
	sw t0, 0(tp)
	lw t0, 120(sp)
	sw t0, 4(tp)
	lw t0, 644(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1635~2310
	sw tp, 304(sp)
	la t0, trace_reflections.2717
	sw t0, 0(tp)
	lw t0, 412(sp)
	sw t0, 4(tp)
	lw t0, 776(sp)
	sw t0, 8(tp)
	lw t0, 792(sp)
	sw t0, 12(tp)
	lw t0, 448(sp)
	sw t0, 16(tp)
	lw t0, 668(sp)
	sw t0, 20(tp)
	lw t0, 164(sp)
	sw t0, 24(tp)
	lw t0, 636(sp)
	sw t0, 28(tp)
	lw t0, 608(sp)
	sw t0, 32(tp)
	addi tp, tp, 36
# 1662~2310
	sw tp, 280(sp)
	la t0, trace_ray.2722
	sw t0, 0(tp)
	lw t0, 412(sp)
	sw t0, 4(tp)
	lw t0, 332(sp)
	sw t0, 8(tp)
	lw t0, 604(sp)
	sw t0, 12(tp)
	lw t0, 776(sp)
	sw t0, 16(tp)
	lw t0, 648(sp)
	sw t0, 20(tp)
	lw t0, 792(sp)
	sw t0, 24(tp)
	lw t0, 732(sp)
	sw t0, 28(tp)
	lw t0, 748(sp)
	sw t0, 32(tp)
	lw t0, 780(sp)
	sw t0, 36(tp)
	lw t0, 668(sp)
	sw t0, 40(tp)
	lw t0, 240(sp)
	sw t0, 44(tp)
	lw t0, 164(sp)
	sw t0, 48(tp)
	lw t0, 120(sp)
	sw t0, 52(tp)
	lw t0, 172(sp)
	sw t0, 56(tp)
	lw t0, 608(sp)
	sw t0, 60(tp)
	lw t0, 696(sp)
	sw t0, 64(tp)
	lw t0, 644(sp)
	sw t0, 68(tp)
	lw t0, 572(sp)
	sw t0, 72(tp)
	lw t0, 304(sp)
	sw t0, 76(tp)
	lw t0, 112(sp)
	sw t0, 80(tp)
	addi tp, tp, 84
# 1752~2310
	sw tp, 68(sp)
	la t0, trace_diffuse_ray.2728
	sw t0, 0(tp)
	lw t0, 296(sp)
	sw t0, 4(tp)
	lw t0, 604(sp)
	sw t0, 8(tp)
	lw t0, 776(sp)
	sw t0, 12(tp)
	lw t0, 648(sp)
	sw t0, 16(tp)
	lw t0, 448(sp)
	sw t0, 20(tp)
	lw t0, 748(sp)
	sw t0, 24(tp)
	lw t0, 668(sp)
	sw t0, 28(tp)
	lw t0, 240(sp)
	sw t0, 32(tp)
	lw t0, 164(sp)
	sw t0, 36(tp)
	lw t0, 608(sp)
	sw t0, 40(tp)
	lw t0, 644(sp)
	sw t0, 44(tp)
	lw t0, 112(sp)
	sw t0, 48(tp)
	addi tp, tp, 52
# 1770~2310
	sw tp, 676(sp)
	la t0, iter_trace_diffuse_rays.2731
	sw t0, 0(tp)
	lw t0, 68(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1785~2310
	sw tp, 760(sp)
	la t0, trace_diffuse_rays.2736
	sw t0, 0(tp)
	lw t0, 676(sp)
	sw t0, 4(tp)
	lw t0, 172(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1793~2310
	sw tp, 148(sp)
	la t0, trace_diffuse_ray_80percent.2740
	sw t0, 0(tp)
	lw t0, 488(sp)
	sw t0, 4(tp)
	lw t0, 760(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1818~2310
	sw tp, 620(sp)
	la t0, calc_diffuse_using_1point.2744
	sw t0, 0(tp)
	lw t0, 296(sp)
	sw t0, 4(tp)
	lw t0, 120(sp)
	sw t0, 8(tp)
	lw t0, 148(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 1836~2310
	sw tp, 124(sp)
	la t0, calc_diffuse_using_5points.2747
	sw t0, 0(tp)
	lw t0, 296(sp)
	sw t0, 4(tp)
	lw t0, 120(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1856~2310
	sw tp, 800(sp)
	la t0, do_without_neighbors.2753
	sw t0, 0(tp)
	lw t0, 620(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1871~2310
	sw tp, 140(sp)
	la t0, neighbors_exist.2756
	sw t0, 0(tp)
	lw t0, 180(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1905~2310
	sw tp, 808(sp)
	la t0, try_exploit_neighbors.2769
	sw t0, 0(tp)
	lw t0, 124(sp)
	sw t0, 4(tp)
	lw t0, 800(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 1930~2310
	sw tp, 212(sp)
	la t0, write_ppm_header.2776
	sw t0, 0(tp)
	lw t0, 180(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1956~2310
	sw tp, 36(sp)
	la t0, write_rgb.2782
	sw t0, 0(tp)
	lw t0, 120(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 1976~2310
	sw tp, 116(sp)
	la t0, pretrace_diffuse_rays.2784
	sw t0, 0(tp)
	lw t0, 296(sp)
	sw t0, 4(tp)
	lw t0, 488(sp)
	sw t0, 8(tp)
	lw t0, 760(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2005~2310
	sw tp, 672(sp)
	la t0, pretrace_pixels.2787
	sw t0, 0(tp)
	lw t0, 272(sp)
	sw t0, 4(tp)
	lw t0, 116(sp)
	sw t0, 8(tp)
	lw t0, 12(sp)
	sw t0, 12(tp)
	lw t0, 120(sp)
	sw t0, 16(tp)
	lw t0, 612(sp)
	sw t0, 20(tp)
	lw t0, 484(sp)
	sw t0, 24(tp)
	lw t0, 696(sp)
	sw t0, 28(tp)
	lw t0, 280(sp)
	sw t0, 32(tp)
	lw t0, 264(sp)
	sw t0, 36(tp)
	addi tp, tp, 40
# 2030~2310
	sw tp, 128(sp)
	la t0, pretrace_line.2794
	sw t0, 0(tp)
	lw t0, 272(sp)
	sw t0, 4(tp)
	lw t0, 180(sp)
	sw t0, 8(tp)
	lw t0, 672(sp)
	sw t0, 12(tp)
	lw t0, 612(sp)
	sw t0, 16(tp)
	lw t0, 132(sp)
	sw t0, 20(tp)
	lw t0, 408(sp)
	sw t0, 24(tp)
	addi tp, tp, 28
# 2044~2310
	sw tp, 416(sp)
	la t0, scan_pixel.2798
	sw t0, 0(tp)
	lw t0, 800(sp)
	sw t0, 4(tp)
	lw t0, 180(sp)
	sw t0, 8(tp)
	lw t0, 140(sp)
	sw t0, 12(tp)
	lw t0, 120(sp)
	sw t0, 16(tp)
	lw t0, 808(sp)
	sw t0, 20(tp)
	lw t0, 36(sp)
	sw t0, 24(tp)
	addi tp, tp, 28
# 2064~2310
	sw tp, 216(sp)
	la t0, scan_line.2805
	sw t0, 0(tp)
	lw t0, 180(sp)
	sw t0, 4(tp)
	lw t0, 128(sp)
	sw t0, 8(tp)
	lw t0, 416(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2114~2310
	sw tp, 312(sp)
	la t0, create_pixelline.2819
	sw t0, 0(tp)
	lw t0, 180(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 2137~2310
	sw tp, 628(sp)
	la t0, calc_dirvec.2826
	sw t0, 0(tp)
	lw t0, 488(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 2158~2310
	sw tp, 136(sp)
	la t0, calc_dirvecs.2834
	sw t0, 0(tp)
	lw t0, 628(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 2172~2310
	sw tp, 188(sp)
	la t0, calc_dirvec_rows.2839
	sw t0, 0(tp)
	lw t0, 136(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 2183~2310
	sw tp, 736(sp)
	la t0, create_dirvec.2843
	sw t0, 0(tp)
	lw t0, 684(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 2189~2310
	sw tp, 440(sp)
	la t0, create_dirvec_elements.2845
	sw t0, 0(tp)
	lw t0, 736(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 2196~2310
	sw tp, 320(sp)
	la t0, create_dirvecs.2848
	sw t0, 0(tp)
	lw t0, 736(sp)
	sw t0, 4(tp)
	lw t0, 440(sp)
	sw t0, 8(tp)
	lw t0, 488(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2206~2310
	sw tp, 184(sp)
	la t0, init_dirvec_constants.2850
	sw t0, 0(tp)
	lw t0, 708(sp)
	sw t0, 4(tp)
	addi tp, tp, 8
# 2213~2310
	sw tp, 420(sp)
	la t0, init_vecset_constants.2853
	sw t0, 0(tp)
	lw t0, 488(sp)
	sw t0, 4(tp)
	lw t0, 184(sp)
	sw t0, 8(tp)
	addi tp, tp, 12
# 2220~2310
	sw tp, 568(sp)
	la t0, init_dirvecs.2855
	sw t0, 0(tp)
	lw t0, 188(sp)
	sw t0, 4(tp)
	lw t0, 320(sp)
	sw t0, 8(tp)
	lw t0, 420(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2229~2310
	sw tp, 552(sp)
	la t0, add_reflection.2857
	sw t0, 0(tp)
	lw t0, 736(sp)
	sw t0, 4(tp)
	lw t0, 636(sp)
	sw t0, 8(tp)
	lw t0, 708(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2238~2310
	sw tp, 260(sp)
	la t0, setup_rect_reflection.2864
	sw t0, 0(tp)
	lw t0, 552(sp)
	sw t0, 4(tp)
	lw t0, 748(sp)
	sw t0, 8(tp)
	lw t0, 780(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2252~2310
	sw tp, 160(sp)
	la t0, setup_surface_reflection.2867
	sw t0, 0(tp)
	lw t0, 552(sp)
	sw t0, 4(tp)
	lw t0, 748(sp)
	sw t0, 8(tp)
	lw t0, 780(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2267~2310
	sw tp, 724(sp)
	la t0, setup_reflections.2870
	sw t0, 0(tp)
	lw t0, 240(sp)
	sw t0, 4(tp)
	lw t0, 260(sp)
	sw t0, 8(tp)
	lw t0, 160(sp)
	sw t0, 12(tp)
	addi tp, tp, 16
# 2287~2310
	sw tp, 236(sp)
	la t0, rt.2872
	sw t0, 0(tp)
	lw t0, 312(sp)
	sw t0, 4(tp)
	lw t0, 272(sp)
	sw t0, 8(tp)
	lw t0, 180(sp)
	sw t0, 12(tp)
	lw t0, 568(sp)
	sw t0, 16(tp)
	lw t0, 748(sp)
	sw t0, 20(tp)
	lw t0, 804(sp)
	sw t0, 24(tp)
	lw t0, 684(sp)
	sw t0, 28(tp)
	lw t0, 128(sp)
	sw t0, 32(tp)
	lw t0, 208(sp)
	sw t0, 36(tp)
	lw t0, 216(sp)
	sw t0, 40(tp)
	lw t0, 612(sp)
	sw t0, 44(tp)
	lw t0, 708(sp)
	sw t0, 48(tp)
	lw t0, 724(sp)
	sw t0, 52(tp)
	lw t0, 212(sp)
	sw t0, 56(tp)
	addi tp, tp, 60
# 2308~2308
	addi t0, zero, 256
	sw t0, 560(sp)
# 2308~2308
	addi t0, zero, 256
	sw t0, 152(sp)
# 2308~2308
	addi t0, zero, 6
	sw t0, 580(sp)
# 2308~2308
	sw ra, -4(sp)
	lw a0, 560(sp)
	lw a1, 152(sp)
	lw a2, 580(sp)
	lw a3, 236(sp)
	lw t0, 236(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 424(sp)
# 0~0
	lw a0, 600(sp)
	addi sp, sp, 812
	ebreak
sgn.2395:
	addi sp, sp, -28
	fsw fa0, 16(sp)
# 141~141
	sw ra, -4(sp)
	flw fa0, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 141~143
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 4(sp)
	lw t1, 12(sp)
	beq t0, t1, ._0_then
# 141~141
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 24(sp)
	flw fa0, 24(sp)
	addi sp, sp, 28
	ret
	beq zero, zero, ._0_final
._0_then:
# 142~142
	sw ra, -4(sp)
	flw fa0, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 142~143
	addi t0, zero, 0
	sw t0, 20(sp)
	lw t0, 0(sp)
	lw t1, 20(sp)
	beq t0, t1, ._1_then
# 142~142
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 24(sp)
	flw fa0, 24(sp)
	addi sp, sp, 28
	ret
	beq zero, zero, ._1_final
._1_then:
# 143~143
	la t0, f-1.00000f
	flw ft0, 0(t0)
	fsw ft0, 24(sp)
	flw fa0, 24(sp)
	addi sp, sp, 28
	ret
._1_final:
._0_final:
fneg_cond.2397:
	addi sp, sp, -20
	sw a0, 16(sp)
	fsw fa0, 0(sp)
# 148~148
	addi t0, zero, 0
	sw t0, 8(sp)
	lw t0, 16(sp)
	lw t1, 8(sp)
	beq t0, t1, ._2_then
# 148~148
	flw ft0, 0(sp)
	fsw ft0, 0(sp)
	flw fa0, 0(sp)
	addi sp, sp, 20
	ret
	beq zero, zero, ._2_final
._2_then:
# 148~148
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
	flw fa0, 12(sp)
	addi sp, sp, 20
	ret
._2_final:
add_mod5.2400:
	addi sp, sp, -28
	sw a0, 8(sp)
	sw a1, 12(sp)
# 153~153
	lw t0, 8(sp)
	lw t1, 12(sp)
	add t2, t0, t1
	sw t2, 24(sp)
# 154~154
	addi t0, zero, 5
	sw t0, 16(sp)
	lw t0, 24(sp)
	lw t1, 16(sp)
	bge t0, t1, ._3_then
# 154~154
	lw t0, 24(sp)
	sw t0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 28
	ret
	beq zero, zero, ._3_final
._3_then:
# 154~154
	addi t0, zero, 5
	sw t0, 20(sp)
# 154~154
	lw t0, 24(sp)
	addi t2, t0, -5
	sw t2, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 28
	ret
._3_final:
vecset.2403:
	addi sp, sp, -44
	sw a0, 16(sp)
	fsw fa0, 24(sp)
	fsw fa1, 4(sp)
	fsw fa2, 12(sp)
# 163~163
	addi t0, zero, 0
	sw t0, 8(sp)
	lw t0, 16(sp)
	flw ft0, 24(sp)
	fsw ft0, 0(t0)
# 163~163
# 164~164
	addi t0, zero, 1
	sw t0, 28(sp)
	lw t0, 16(sp)
	flw ft0, 4(sp)
	fsw ft0, 4(t0)
# 164~164
# 165~165
	addi t0, zero, 2
	sw t0, 36(sp)
	lw t0, 16(sp)
	flw ft0, 12(sp)
	fsw ft0, 8(t0)
# 165~165
	lw a0, 32(sp)
	addi sp, sp, 44
	ret
vecfill.2408:
	addi sp, sp, -36
	sw a0, 28(sp)
	fsw fa0, 16(sp)
# 170~170
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 28(sp)
	flw ft0, 16(sp)
	fsw ft0, 0(t0)
# 170~170
# 171~171
	addi t0, zero, 1
	sw t0, 24(sp)
	lw t0, 28(sp)
	flw ft0, 16(sp)
	fsw ft0, 4(t0)
# 171~171
# 172~172
	addi t0, zero, 2
	sw t0, 0(sp)
	lw t0, 28(sp)
	flw ft0, 16(sp)
	fsw ft0, 8(t0)
# 172~172
	lw a0, 12(sp)
	addi sp, sp, 36
	ret
vecbzero.2411:
	addi sp, sp, -16
	sw a0, 8(sp)
# 177~177
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
# 177~177
	sw ra, -4(sp)
	lw a0, 8(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, vecfill.2408
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 16
	ret
veccpy.2413:
	addi sp, sp, -60
	sw a0, 4(sp)
	sw a1, 52(sp)
# 182~182
	addi t0, zero, 0
	sw t0, 28(sp)
# 182~182
	addi t0, zero, 0
	sw t0, 0(sp)
# 182~182
	lw t0, 52(sp)
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
	lw t0, 4(sp)
	flw ft0, 48(sp)
	fsw ft0, 0(t0)
# 182~182
# 183~183
	addi t0, zero, 1
	sw t0, 8(sp)
# 183~183
	addi t0, zero, 1
	sw t0, 20(sp)
# 183~183
	lw t0, 52(sp)
	flw ft0, 4(t0)
	fsw ft0, 56(sp)
	lw t0, 4(sp)
	flw ft0, 56(sp)
	fsw ft0, 4(t0)
# 183~183
# 184~184
	addi t0, zero, 2
	sw t0, 16(sp)
# 184~184
	addi t0, zero, 2
	sw t0, 24(sp)
# 184~184
	lw t0, 52(sp)
	flw ft0, 8(t0)
	fsw ft0, 12(sp)
	lw t0, 4(sp)
	flw ft0, 12(sp)
	fsw ft0, 8(t0)
# 184~184
	lw a0, 36(sp)
	addi sp, sp, 60
	ret
vecunit_sgn.2416:
	addi sp, sp, -144
	sw a0, 88(sp)
	sw a1, 104(sp)
# 193~193
	addi t0, zero, 0
	sw t0, 44(sp)
# 193~193
	lw t0, 88(sp)
	flw ft0, 0(t0)
	fsw ft0, 60(sp)
# 193~193
	sw ra, -4(sp)
	flw fa0, 60(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 193~193
	addi t0, zero, 1
	sw t0, 32(sp)
# 193~193
	lw t0, 88(sp)
	flw ft0, 4(t0)
	fsw ft0, 48(sp)
# 193~193
	sw ra, -4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 108(sp)
# 193~193
	flw ft0, 0(sp)
	flw ft1, 108(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 92(sp)
# 193~193
	addi t0, zero, 2
	sw t0, 4(sp)
# 193~193
	lw t0, 88(sp)
	flw ft0, 8(t0)
	fsw ft0, 56(sp)
# 193~193
	sw ra, -4(sp)
	flw fa0, 56(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 120(sp)
# 193~193
	flw ft0, 92(sp)
	flw ft1, 120(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 128(sp)
# 193~193
	sw ra, -4(sp)
	flw fa0, 128(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
# 194~194
	sw ra, -4(sp)
	flw fa0, 24(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 194~194
	addi t0, zero, 0
	sw t0, 52(sp)
	lw t0, 20(sp)
	lw t1, 52(sp)
	beq t0, t1, ._4_then
# 194~194
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
	beq zero, zero, ._4_final
._4_then:
# 194~194
	addi t0, zero, 0
	sw t0, 64(sp)
	lw t0, 104(sp)
	lw t1, 64(sp)
	beq t0, t1, ._5_then
# 194~194
	la t0, f-1.00000f
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 194~194
	flw ft0, 80(sp)
	flw ft1, 24(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 36(sp)
	beq zero, zero, ._5_final
._5_then:
# 194~194
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 140(sp)
# 194~194
	flw ft0, 140(sp)
	flw ft1, 24(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 36(sp)
._5_final:
._4_final:
# 195~195
	addi t0, zero, 0
	sw t0, 8(sp)
# 195~195
	addi t0, zero, 0
	sw t0, 68(sp)
# 195~195
	lw t0, 88(sp)
	flw ft0, 0(t0)
	fsw ft0, 40(sp)
# 195~195
	flw ft0, 40(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 84(sp)
	lw t0, 88(sp)
	flw ft0, 84(sp)
	fsw ft0, 0(t0)
# 195~195
# 196~196
	addi t0, zero, 1
	sw t0, 76(sp)
# 196~196
	addi t0, zero, 1
	sw t0, 28(sp)
# 196~196
	lw t0, 88(sp)
	flw ft0, 4(t0)
	fsw ft0, 136(sp)
# 196~196
	flw ft0, 136(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 96(sp)
	lw t0, 88(sp)
	flw ft0, 96(sp)
	fsw ft0, 4(t0)
# 196~196
# 197~197
	addi t0, zero, 2
	sw t0, 100(sp)
# 197~197
	addi t0, zero, 2
	sw t0, 12(sp)
# 197~197
	lw t0, 88(sp)
	flw ft0, 8(t0)
	fsw ft0, 116(sp)
# 197~197
	flw ft0, 116(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
	lw t0, 88(sp)
	flw ft0, 16(sp)
	fsw ft0, 8(t0)
# 197~197
	lw a0, 112(sp)
	addi sp, sp, 144
	ret
veciprod.2419:
	addi sp, sp, -80
	sw a0, 0(sp)
	sw a1, 76(sp)
# 202~202
	addi t0, zero, 0
	sw t0, 60(sp)
# 202~202
	lw t0, 0(sp)
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
# 202~202
	addi t0, zero, 0
	sw t0, 52(sp)
# 202~202
	lw t0, 76(sp)
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
# 202~202
	flw ft0, 4(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 202~202
	addi t0, zero, 1
	sw t0, 72(sp)
# 202~202
	lw t0, 0(sp)
	flw ft0, 4(t0)
	fsw ft0, 16(sp)
# 202~202
	addi t0, zero, 1
	sw t0, 8(sp)
# 202~202
	lw t0, 76(sp)
	flw ft0, 4(t0)
	fsw ft0, 24(sp)
# 202~202
	flw ft0, 16(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 48(sp)
# 202~202
	flw ft0, 56(sp)
	flw ft1, 48(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 28(sp)
# 202~202
	addi t0, zero, 2
	sw t0, 32(sp)
# 202~202
	lw t0, 0(sp)
	flw ft0, 8(t0)
	fsw ft0, 36(sp)
# 202~202
	addi t0, zero, 2
	sw t0, 68(sp)
# 202~202
	lw t0, 76(sp)
	flw ft0, 8(t0)
	fsw ft0, 40(sp)
# 202~202
	flw ft0, 36(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 12(sp)
# 202~202
	flw ft0, 28(sp)
	flw ft1, 12(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 44(sp)
	flw fa0, 44(sp)
	addi sp, sp, 80
	ret
veciprod2.2422:
	addi sp, sp, -64
	sw a0, 44(sp)
	fsw fa0, 8(sp)
	fsw fa1, 40(sp)
	fsw fa2, 20(sp)
# 207~207
	addi t0, zero, 0
	sw t0, 60(sp)
# 207~207
	lw t0, 44(sp)
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 207~207
	flw ft0, 52(sp)
	flw ft1, 8(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
# 207~207
	addi t0, zero, 1
	sw t0, 48(sp)
# 207~207
	lw t0, 44(sp)
	flw ft0, 4(t0)
	fsw ft0, 12(sp)
# 207~207
	flw ft0, 12(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 207~207
	flw ft0, 16(sp)
	flw ft1, 56(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 4(sp)
# 207~207
	addi t0, zero, 2
	sw t0, 28(sp)
# 207~207
	lw t0, 44(sp)
	flw ft0, 8(t0)
	fsw ft0, 32(sp)
# 207~207
	flw ft0, 32(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 36(sp)
# 207~207
	flw ft0, 4(sp)
	flw ft1, 36(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 0(sp)
	flw fa0, 0(sp)
	addi sp, sp, 64
	ret
vecaccum.2427:
	addi sp, sp, -112
	sw a0, 44(sp)
	fsw fa0, 68(sp)
	sw a1, 100(sp)
# 212~212
	addi t0, zero, 0
	sw t0, 4(sp)
# 212~212
	addi t0, zero, 0
	sw t0, 72(sp)
# 212~212
	lw t0, 44(sp)
	flw ft0, 0(t0)
	fsw ft0, 8(sp)
# 212~212
	addi t0, zero, 0
	sw t0, 80(sp)
# 212~212
	lw t0, 100(sp)
	flw ft0, 0(t0)
	fsw ft0, 88(sp)
# 212~212
	flw ft0, 68(sp)
	flw ft1, 88(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 12(sp)
# 212~212
	flw ft0, 8(sp)
	flw ft1, 12(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 96(sp)
	lw t0, 44(sp)
	flw ft0, 96(sp)
	fsw ft0, 0(t0)
# 212~212
# 213~213
	addi t0, zero, 1
	sw t0, 92(sp)
# 213~213
	addi t0, zero, 1
	sw t0, 104(sp)
# 213~213
	lw t0, 44(sp)
	flw ft0, 4(t0)
	fsw ft0, 108(sp)
# 213~213
	addi t0, zero, 1
	sw t0, 48(sp)
# 213~213
	lw t0, 100(sp)
	flw ft0, 4(t0)
	fsw ft0, 0(sp)
# 213~213
	flw ft0, 68(sp)
	flw ft1, 0(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 20(sp)
# 213~213
	flw ft0, 108(sp)
	flw ft1, 20(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 64(sp)
	lw t0, 44(sp)
	flw ft0, 64(sp)
	fsw ft0, 4(t0)
# 213~213
# 214~214
	addi t0, zero, 2
	sw t0, 76(sp)
# 214~214
	addi t0, zero, 2
	sw t0, 60(sp)
# 214~214
	lw t0, 44(sp)
	flw ft0, 8(t0)
	fsw ft0, 24(sp)
# 214~214
	addi t0, zero, 2
	sw t0, 28(sp)
# 214~214
	lw t0, 100(sp)
	flw ft0, 8(t0)
	fsw ft0, 36(sp)
# 214~214
	flw ft0, 68(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 40(sp)
# 214~214
	flw ft0, 24(sp)
	flw ft1, 40(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 52(sp)
	lw t0, 44(sp)
	flw ft0, 52(sp)
	fsw ft0, 8(t0)
# 214~214
	lw a0, 56(sp)
	addi sp, sp, 112
	ret
vecadd.2431:
	addi sp, sp, -96
	sw a0, 36(sp)
	sw a1, 60(sp)
# 219~219
	addi t0, zero, 0
	sw t0, 8(sp)
# 219~219
	addi t0, zero, 0
	sw t0, 72(sp)
# 219~219
	lw t0, 36(sp)
	flw ft0, 0(t0)
	fsw ft0, 40(sp)
# 219~219
	addi t0, zero, 0
	sw t0, 84(sp)
# 219~219
	lw t0, 60(sp)
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 219~219
	flw ft0, 40(sp)
	flw ft1, 44(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 24(sp)
	lw t0, 36(sp)
	flw ft0, 24(sp)
	fsw ft0, 0(t0)
# 219~219
# 220~220
	addi t0, zero, 1
	sw t0, 64(sp)
# 220~220
	addi t0, zero, 1
	sw t0, 28(sp)
# 220~220
	lw t0, 36(sp)
	flw ft0, 4(t0)
	fsw ft0, 80(sp)
# 220~220
	addi t0, zero, 1
	sw t0, 56(sp)
# 220~220
	lw t0, 60(sp)
	flw ft0, 4(t0)
	fsw ft0, 48(sp)
# 220~220
	flw ft0, 80(sp)
	flw ft1, 48(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 76(sp)
	lw t0, 36(sp)
	flw ft0, 76(sp)
	fsw ft0, 4(t0)
# 220~220
# 221~221
	addi t0, zero, 2
	sw t0, 12(sp)
# 221~221
	addi t0, zero, 2
	sw t0, 52(sp)
# 221~221
	lw t0, 36(sp)
	flw ft0, 8(t0)
	fsw ft0, 88(sp)
# 221~221
	addi t0, zero, 2
	sw t0, 68(sp)
# 221~221
	lw t0, 60(sp)
	flw ft0, 8(t0)
	fsw ft0, 92(sp)
# 221~221
	flw ft0, 88(sp)
	flw ft1, 92(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 0(sp)
	lw t0, 36(sp)
	flw ft0, 0(sp)
	fsw ft0, 8(t0)
# 221~221
	lw a0, 4(sp)
	addi sp, sp, 96
	ret
vecscale.2434:
	addi sp, sp, -72
	sw a0, 60(sp)
	fsw fa0, 52(sp)
# 228~228
	addi t0, zero, 0
	sw t0, 0(sp)
# 228~228
	addi t0, zero, 0
	sw t0, 44(sp)
# 228~228
	lw t0, 60(sp)
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 228~228
	flw ft0, 48(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 4(sp)
	lw t0, 60(sp)
	flw ft0, 4(sp)
	fsw ft0, 0(t0)
# 228~228
# 229~229
	addi t0, zero, 1
	sw t0, 40(sp)
# 229~229
	addi t0, zero, 1
	sw t0, 64(sp)
# 229~229
	lw t0, 60(sp)
	flw ft0, 4(t0)
	fsw ft0, 56(sp)
# 229~229
	flw ft0, 56(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
	lw t0, 60(sp)
	flw ft0, 16(sp)
	fsw ft0, 4(t0)
# 229~229
# 230~230
	addi t0, zero, 2
	sw t0, 32(sp)
# 230~230
	addi t0, zero, 2
	sw t0, 12(sp)
# 230~230
	lw t0, 60(sp)
	flw ft0, 8(t0)
	fsw ft0, 20(sp)
# 230~230
	flw ft0, 20(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
	lw t0, 60(sp)
	flw ft0, 24(sp)
	fsw ft0, 8(t0)
# 230~230
	lw a0, 28(sp)
	addi sp, sp, 72
	ret
vecaccumv.2437:
	addi sp, sp, -136
	sw a0, 48(sp)
	sw a1, 92(sp)
	sw a2, 24(sp)
# 235~235
	addi t0, zero, 0
	sw t0, 52(sp)
# 235~235
	addi t0, zero, 0
	sw t0, 108(sp)
# 235~235
	lw t0, 48(sp)
	flw ft0, 0(t0)
	fsw ft0, 112(sp)
# 235~235
	addi t0, zero, 0
	sw t0, 68(sp)
# 235~235
	lw t0, 92(sp)
	flw ft0, 0(t0)
	fsw ft0, 60(sp)
# 235~235
	addi t0, zero, 0
	sw t0, 8(sp)
# 235~235
	lw t0, 24(sp)
	flw ft0, 0(t0)
	fsw ft0, 84(sp)
# 235~235
	flw ft0, 60(sp)
	flw ft1, 84(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 235~235
	flw ft0, 112(sp)
	flw ft1, 56(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 132(sp)
	lw t0, 48(sp)
	flw ft0, 132(sp)
	fsw ft0, 0(t0)
# 235~235
# 236~236
	addi t0, zero, 1
	sw t0, 72(sp)
# 236~236
	addi t0, zero, 1
	sw t0, 40(sp)
# 236~236
	lw t0, 48(sp)
	flw ft0, 4(t0)
	fsw ft0, 16(sp)
# 236~236
	addi t0, zero, 1
	sw t0, 28(sp)
# 236~236
	lw t0, 92(sp)
	flw ft0, 4(t0)
	fsw ft0, 44(sp)
# 236~236
	addi t0, zero, 1
	sw t0, 76(sp)
# 236~236
	lw t0, 24(sp)
	flw ft0, 4(t0)
	fsw ft0, 32(sp)
# 236~236
	flw ft0, 44(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 120(sp)
# 236~236
	flw ft0, 16(sp)
	flw ft1, 120(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 0(sp)
	lw t0, 48(sp)
	flw ft0, 0(sp)
	fsw ft0, 4(t0)
# 236~236
# 237~237
	addi t0, zero, 2
	sw t0, 128(sp)
# 237~237
	addi t0, zero, 2
	sw t0, 80(sp)
# 237~237
	lw t0, 48(sp)
	flw ft0, 8(t0)
	fsw ft0, 96(sp)
# 237~237
	addi t0, zero, 2
	sw t0, 12(sp)
# 237~237
	lw t0, 92(sp)
	flw ft0, 8(t0)
	fsw ft0, 100(sp)
# 237~237
	addi t0, zero, 2
	sw t0, 88(sp)
# 237~237
	lw t0, 24(sp)
	flw ft0, 8(t0)
	fsw ft0, 64(sp)
# 237~237
	flw ft0, 100(sp)
	flw ft1, 64(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 20(sp)
# 237~237
	flw ft0, 96(sp)
	flw ft1, 20(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 116(sp)
	lw t0, 48(sp)
	flw ft0, 116(sp)
	fsw ft0, 8(t0)
# 237~237
	lw a0, 36(sp)
	addi sp, sp, 136
	ret
o_texturetype.2441:
	addi sp, sp, -52
	sw a0, 0(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 4(t0)
	sw t2, 48(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 8(t0)
	sw t2, 20(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 12(t0)
	sw t2, 44(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 16(t0)
	sw t2, 24(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 20(t0)
	sw t2, 28(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 24(t0)
	sw t2, 12(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 28(t0)
	sw t2, 40(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 32(t0)
	sw t2, 32(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 36(t0)
	sw t2, 36(sp)
# 244~249
	lw t0, 0(sp)
	lw t2, 40(t0)
	sw t2, 16(sp)
# 249~249
	lw t0, 8(sp)
	sw t0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 52
	ret
o_form.2443:
	addi sp, sp, -52
	sw a0, 40(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 0(t0)
	sw t2, 24(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 4(t0)
	sw t2, 44(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 8(t0)
	sw t2, 48(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 12(t0)
	sw t2, 28(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 16(t0)
	sw t2, 12(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 20(t0)
	sw t2, 20(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 24(t0)
	sw t2, 32(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 28(t0)
	sw t2, 16(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 32(t0)
	sw t2, 8(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 36(t0)
	sw t2, 0(sp)
# 254~259
	lw t0, 40(sp)
	lw t2, 40(t0)
	sw t2, 36(sp)
# 259~259
	lw t0, 44(sp)
	sw t0, 44(sp)
	lw a0, 44(sp)
	addi sp, sp, 52
	ret
o_reflectiontype.2445:
	addi sp, sp, -52
	sw a0, 28(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 0(t0)
	sw t2, 48(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 4(t0)
	sw t2, 16(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 8(t0)
	sw t2, 40(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 12(t0)
	sw t2, 32(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 16(t0)
	sw t2, 4(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 20(t0)
	sw t2, 44(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 24(t0)
	sw t2, 24(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 28(t0)
	sw t2, 36(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 32(t0)
	sw t2, 20(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 36(t0)
	sw t2, 0(sp)
# 264~269
	lw t0, 28(sp)
	lw t2, 40(t0)
	sw t2, 12(sp)
# 269~269
	lw t0, 40(sp)
	sw t0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 52
	ret
o_isinvert.2447:
	addi sp, sp, -52
	sw a0, 12(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 0(t0)
	sw t2, 24(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 4(t0)
	sw t2, 48(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 8(t0)
	sw t2, 28(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 12(t0)
	sw t2, 20(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 16(t0)
	sw t2, 36(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 20(t0)
	sw t2, 32(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 24(t0)
	sw t2, 0(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 28(t0)
	sw t2, 16(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 32(t0)
	sw t2, 40(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 36(t0)
	sw t2, 4(sp)
# 274~278
	lw t0, 12(sp)
	lw t2, 40(t0)
	sw t2, 8(sp)
# 278~278
	lw t0, 0(sp)
	sw t0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 52
	ret
o_isrot.2449:
	addi sp, sp, -52
	sw a0, 32(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 0(t0)
	sw t2, 16(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 4(t0)
	sw t2, 48(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 8(t0)
	sw t2, 36(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 12(t0)
	sw t2, 0(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 16(t0)
	sw t2, 20(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 20(t0)
	sw t2, 8(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 24(t0)
	sw t2, 40(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 28(t0)
	sw t2, 44(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 32(t0)
	sw t2, 24(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 36(t0)
	sw t2, 28(sp)
# 283~287
	lw t0, 32(sp)
	lw t2, 40(t0)
	sw t2, 12(sp)
# 287~287
	lw t0, 0(sp)
	sw t0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 52
	ret
o_param_a.2451:
	addi sp, sp, -60
	sw a0, 44(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 0(t0)
	sw t2, 48(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 4(t0)
	sw t2, 56(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 8(t0)
	sw t2, 8(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 12(t0)
	sw t2, 4(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 16(t0)
	sw t2, 36(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 20(t0)
	sw t2, 52(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 24(t0)
	sw t2, 12(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 28(t0)
	sw t2, 20(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 32(t0)
	sw t2, 24(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 36(t0)
	sw t2, 40(sp)
# 292~297
	lw t0, 44(sp)
	lw t2, 40(t0)
	sw t2, 0(sp)
# 297~297
	addi t0, zero, 0
	sw t0, 28(sp)
# 297~297
	lw t0, 36(sp)
	flw ft0, 0(t0)
	fsw ft0, 32(sp)
	flw fa0, 32(sp)
	addi sp, sp, 60
	ret
o_param_b.2453:
	addi sp, sp, -60
	sw a0, 36(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 0(t0)
	sw t2, 0(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 4(t0)
	sw t2, 32(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 8(t0)
	sw t2, 24(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 12(t0)
	sw t2, 56(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 16(t0)
	sw t2, 8(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 20(t0)
	sw t2, 12(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 24(t0)
	sw t2, 4(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 28(t0)
	sw t2, 28(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 32(t0)
	sw t2, 16(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 36(t0)
	sw t2, 44(sp)
# 302~307
	lw t0, 36(sp)
	lw t2, 40(t0)
	sw t2, 20(sp)
# 307~307
	addi t0, zero, 1
	sw t0, 48(sp)
# 307~307
	lw t0, 8(sp)
	flw ft0, 4(t0)
	fsw ft0, 52(sp)
	flw fa0, 52(sp)
	addi sp, sp, 60
	ret
o_param_c.2455:
	addi sp, sp, -60
	sw a0, 4(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 36(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 40(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 8(t0)
	sw t2, 24(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 12(t0)
	sw t2, 56(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 16(t0)
	sw t2, 28(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 20(t0)
	sw t2, 16(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 24(t0)
	sw t2, 44(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 28(t0)
	sw t2, 20(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 32(t0)
	sw t2, 0(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 36(t0)
	sw t2, 52(sp)
# 312~317
	lw t0, 4(sp)
	lw t2, 40(t0)
	sw t2, 8(sp)
# 317~317
	addi t0, zero, 2
	sw t0, 32(sp)
# 317~317
	lw t0, 28(sp)
	flw ft0, 8(t0)
	fsw ft0, 48(sp)
	flw fa0, 48(sp)
	addi sp, sp, 60
	ret
o_param_abc.2457:
	addi sp, sp, -52
	sw a0, 48(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 0(t0)
	sw t2, 12(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 4(t0)
	sw t2, 0(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 8(t0)
	sw t2, 44(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 12(t0)
	sw t2, 32(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 16(t0)
	sw t2, 36(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 20(t0)
	sw t2, 20(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 24(t0)
	sw t2, 16(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 28(t0)
	sw t2, 4(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 32(t0)
	sw t2, 28(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 36(t0)
	sw t2, 8(sp)
# 322~327
	lw t0, 48(sp)
	lw t2, 40(t0)
	sw t2, 40(sp)
# 327~327
	lw t0, 36(sp)
	sw t0, 36(sp)
	lw a0, 36(sp)
	addi sp, sp, 52
	ret
o_param_x.2459:
	addi sp, sp, -60
	sw a0, 24(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 0(t0)
	sw t2, 32(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 4(t0)
	sw t2, 12(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 8(t0)
	sw t2, 52(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 12(t0)
	sw t2, 20(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 16(t0)
	sw t2, 48(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 20(t0)
	sw t2, 8(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 24(t0)
	sw t2, 16(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 28(t0)
	sw t2, 0(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 32(t0)
	sw t2, 56(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 36(t0)
	sw t2, 36(sp)
# 332~337
	lw t0, 24(sp)
	lw t2, 40(t0)
	sw t2, 40(sp)
# 337~337
	addi t0, zero, 0
	sw t0, 44(sp)
# 337~337
	lw t0, 8(sp)
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
	flw fa0, 4(sp)
	addi sp, sp, 60
	ret
o_param_y.2461:
	addi sp, sp, -60
	sw a0, 16(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 0(t0)
	sw t2, 24(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 4(t0)
	sw t2, 48(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 8(t0)
	sw t2, 56(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 12(t0)
	sw t2, 8(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 16(t0)
	sw t2, 20(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 20(t0)
	sw t2, 44(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 24(t0)
	sw t2, 28(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 28(t0)
	sw t2, 0(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 32(t0)
	sw t2, 52(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 36(t0)
	sw t2, 12(sp)
# 342~347
	lw t0, 16(sp)
	lw t2, 40(t0)
	sw t2, 32(sp)
# 347~347
	addi t0, zero, 1
	sw t0, 4(sp)
# 347~347
	lw t0, 44(sp)
	flw ft0, 4(t0)
	fsw ft0, 36(sp)
	flw fa0, 36(sp)
	addi sp, sp, 60
	ret
o_param_z.2463:
	addi sp, sp, -60
	sw a0, 32(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 0(t0)
	sw t2, 52(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 4(t0)
	sw t2, 48(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 8(t0)
	sw t2, 40(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 12(t0)
	sw t2, 36(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 16(t0)
	sw t2, 44(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 20(t0)
	sw t2, 56(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 24(t0)
	sw t2, 16(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 28(t0)
	sw t2, 8(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 32(t0)
	sw t2, 24(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 36(t0)
	sw t2, 20(sp)
# 352~357
	lw t0, 32(sp)
	lw t2, 40(t0)
	sw t2, 4(sp)
# 357~357
	addi t0, zero, 2
	sw t0, 28(sp)
# 357~357
	lw t0, 56(sp)
	flw ft0, 8(t0)
	fsw ft0, 12(sp)
	flw fa0, 12(sp)
	addi sp, sp, 60
	ret
o_diffuse.2465:
	addi sp, sp, -60
	sw a0, 0(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 4(t0)
	sw t2, 48(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 8(t0)
	sw t2, 56(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 12(t0)
	sw t2, 52(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 16(t0)
	sw t2, 12(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 20(t0)
	sw t2, 16(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 24(t0)
	sw t2, 32(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 28(t0)
	sw t2, 44(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 32(t0)
	sw t2, 24(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 36(t0)
	sw t2, 36(sp)
# 362~367
	lw t0, 0(sp)
	lw t2, 40(t0)
	sw t2, 28(sp)
# 367~367
	addi t0, zero, 0
	sw t0, 40(sp)
# 367~367
	lw t0, 44(sp)
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
	flw fa0, 20(sp)
	addi sp, sp, 60
	ret
o_hilight.2467:
	addi sp, sp, -60
	sw a0, 40(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 0(t0)
	sw t2, 4(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 4(t0)
	sw t2, 8(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 8(t0)
	sw t2, 20(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 12(t0)
	sw t2, 44(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 16(t0)
	sw t2, 0(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 20(t0)
	sw t2, 24(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 24(t0)
	sw t2, 56(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 28(t0)
	sw t2, 48(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 32(t0)
	sw t2, 12(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 36(t0)
	sw t2, 16(sp)
# 372~377
	lw t0, 40(sp)
	lw t2, 40(t0)
	sw t2, 32(sp)
# 377~377
	addi t0, zero, 1
	sw t0, 36(sp)
# 377~377
	lw t0, 48(sp)
	flw ft0, 4(t0)
	fsw ft0, 52(sp)
	flw fa0, 52(sp)
	addi sp, sp, 60
	ret
o_color_red.2469:
	addi sp, sp, -60
	sw a0, 56(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 0(t0)
	sw t2, 16(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 4(t0)
	sw t2, 40(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 8(t0)
	sw t2, 48(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 12(t0)
	sw t2, 44(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 16(t0)
	sw t2, 12(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 20(t0)
	sw t2, 24(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 24(t0)
	sw t2, 28(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 28(t0)
	sw t2, 4(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 32(t0)
	sw t2, 20(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 36(t0)
	sw t2, 8(sp)
# 382~387
	lw t0, 56(sp)
	lw t2, 40(t0)
	sw t2, 32(sp)
# 387~387
	addi t0, zero, 0
	sw t0, 0(sp)
# 387~387
	lw t0, 20(sp)
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
	flw fa0, 52(sp)
	addi sp, sp, 60
	ret
o_color_green.2471:
	addi sp, sp, -60
	sw a0, 36(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 0(t0)
	sw t2, 20(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 4(t0)
	sw t2, 4(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 8(t0)
	sw t2, 32(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 12(t0)
	sw t2, 56(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 16(t0)
	sw t2, 24(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 20(t0)
	sw t2, 52(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 24(t0)
	sw t2, 40(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 28(t0)
	sw t2, 48(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 32(t0)
	sw t2, 12(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 36(t0)
	sw t2, 16(sp)
# 392~397
	lw t0, 36(sp)
	lw t2, 40(t0)
	sw t2, 0(sp)
# 397~397
	addi t0, zero, 1
	sw t0, 8(sp)
# 397~397
	lw t0, 12(sp)
	flw ft0, 4(t0)
	fsw ft0, 44(sp)
	flw fa0, 44(sp)
	addi sp, sp, 60
	ret
o_color_blue.2473:
	addi sp, sp, -60
	sw a0, 4(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 44(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 8(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 8(t0)
	sw t2, 12(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 12(t0)
	sw t2, 24(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 16(t0)
	sw t2, 16(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 20(t0)
	sw t2, 28(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 24(t0)
	sw t2, 32(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 28(t0)
	sw t2, 56(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 32(t0)
	sw t2, 36(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 36(t0)
	sw t2, 20(sp)
# 402~407
	lw t0, 4(sp)
	lw t2, 40(t0)
	sw t2, 48(sp)
# 407~407
	addi t0, zero, 2
	sw t0, 52(sp)
# 407~407
	lw t0, 36(sp)
	flw ft0, 8(t0)
	fsw ft0, 0(sp)
	flw fa0, 0(sp)
	addi sp, sp, 60
	ret
o_param_r1.2475:
	addi sp, sp, -60
	sw a0, 4(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 52(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 8(t0)
	sw t2, 28(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 12(t0)
	sw t2, 40(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 16(t0)
	sw t2, 24(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 20(t0)
	sw t2, 32(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 24(t0)
	sw t2, 0(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 28(t0)
	sw t2, 12(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 32(t0)
	sw t2, 16(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 36(t0)
	sw t2, 36(sp)
# 412~417
	lw t0, 4(sp)
	lw t2, 40(t0)
	sw t2, 20(sp)
# 417~417
	addi t0, zero, 0
	sw t0, 44(sp)
# 417~417
	lw t0, 36(sp)
	flw ft0, 0(t0)
	fsw ft0, 56(sp)
	flw fa0, 56(sp)
	addi sp, sp, 60
	ret
o_param_r2.2477:
	addi sp, sp, -60
	sw a0, 40(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 0(t0)
	sw t2, 56(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 4(t0)
	sw t2, 52(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 8(t0)
	sw t2, 24(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 12(t0)
	sw t2, 44(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 16(t0)
	sw t2, 32(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 20(t0)
	sw t2, 16(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 24(t0)
	sw t2, 12(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 28(t0)
	sw t2, 8(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 32(t0)
	sw t2, 0(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 36(t0)
	sw t2, 20(sp)
# 422~427
	lw t0, 40(sp)
	lw t2, 40(t0)
	sw t2, 4(sp)
# 427~427
	addi t0, zero, 1
	sw t0, 28(sp)
# 427~427
	lw t0, 20(sp)
	flw ft0, 4(t0)
	fsw ft0, 36(sp)
	flw fa0, 36(sp)
	addi sp, sp, 60
	ret
o_param_r3.2479:
	addi sp, sp, -60
	sw a0, 36(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 0(t0)
	sw t2, 4(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 4(t0)
	sw t2, 40(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 8(t0)
	sw t2, 28(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 12(t0)
	sw t2, 48(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 16(t0)
	sw t2, 0(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 20(t0)
	sw t2, 52(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 24(t0)
	sw t2, 12(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 28(t0)
	sw t2, 24(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 32(t0)
	sw t2, 8(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 36(t0)
	sw t2, 56(sp)
# 432~437
	lw t0, 36(sp)
	lw t2, 40(t0)
	sw t2, 16(sp)
# 437~437
	addi t0, zero, 2
	sw t0, 32(sp)
# 437~437
	lw t0, 56(sp)
	flw ft0, 8(t0)
	fsw ft0, 20(sp)
	flw fa0, 20(sp)
	addi sp, sp, 60
	ret
o_param_ctbl.2481:
	addi sp, sp, -52
	sw a0, 28(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 0(t0)
	sw t2, 0(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 4(t0)
	sw t2, 24(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 8(t0)
	sw t2, 32(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 12(t0)
	sw t2, 16(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 16(t0)
	sw t2, 20(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 20(t0)
	sw t2, 36(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 24(t0)
	sw t2, 4(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 28(t0)
	sw t2, 48(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 32(t0)
	sw t2, 8(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 36(t0)
	sw t2, 40(sp)
# 443~448
	lw t0, 28(sp)
	lw t2, 40(t0)
	sw t2, 44(sp)
# 448~448
	lw t0, 44(sp)
	sw t0, 44(sp)
	lw a0, 44(sp)
	addi sp, sp, 52
	ret
p_rgb.2483:
	addi sp, sp, -40
	sw a0, 32(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 0(t0)
	sw t2, 0(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 4(t0)
	sw t2, 4(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 8(t0)
	sw t2, 8(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 12(t0)
	sw t2, 20(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 16(t0)
	sw t2, 36(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 20(t0)
	sw t2, 12(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 24(t0)
	sw t2, 16(sp)
# 455~457
	lw t0, 32(sp)
	lw t2, 28(t0)
	sw t2, 28(sp)
# 457~457
	lw t0, 0(sp)
	sw t0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 40
	ret
p_intersection_points.2485:
	addi sp, sp, -40
	sw a0, 32(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 0(t0)
	sw t2, 28(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 4(t0)
	sw t2, 24(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 8(t0)
	sw t2, 20(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 12(t0)
	sw t2, 12(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 16(t0)
	sw t2, 8(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 20(t0)
	sw t2, 16(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 24(t0)
	sw t2, 36(sp)
# 462~464
	lw t0, 32(sp)
	lw t2, 28(t0)
	sw t2, 4(sp)
# 464~464
	lw t0, 24(sp)
	sw t0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 40
	ret
p_surface_ids.2487:
	addi sp, sp, -40
	sw a0, 4(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 16(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 12(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 8(t0)
	sw t2, 36(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 12(t0)
	sw t2, 32(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 16(t0)
	sw t2, 0(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 20(t0)
	sw t2, 8(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 24(t0)
	sw t2, 20(sp)
# 470~472
	lw t0, 4(sp)
	lw t2, 28(t0)
	sw t2, 24(sp)
# 472~472
	lw t0, 36(sp)
	sw t0, 36(sp)
	lw a0, 36(sp)
	addi sp, sp, 40
	ret
p_calc_diffuse.2489:
	addi sp, sp, -40
	sw a0, 12(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 0(t0)
	sw t2, 28(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 4(t0)
	sw t2, 32(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 8(t0)
	sw t2, 0(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 12(t0)
	sw t2, 20(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 16(t0)
	sw t2, 24(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 20(t0)
	sw t2, 4(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 24(t0)
	sw t2, 8(sp)
# 477~479
	lw t0, 12(sp)
	lw t2, 28(t0)
	sw t2, 36(sp)
# 479~479
	lw t0, 20(sp)
	sw t0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 40
	ret
p_energy.2491:
	addi sp, sp, -40
	sw a0, 20(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 0(t0)
	sw t2, 0(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 4(t0)
	sw t2, 24(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 8(t0)
	sw t2, 12(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 12(t0)
	sw t2, 36(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 16(t0)
	sw t2, 8(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 20(t0)
	sw t2, 4(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 24(t0)
	sw t2, 16(sp)
# 484~486
	lw t0, 20(sp)
	lw t2, 28(t0)
	sw t2, 32(sp)
# 486~486
	lw t0, 8(sp)
	sw t0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 40
	ret
p_received_ray_20percent.2493:
	addi sp, sp, -40
	sw a0, 4(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 16(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 32(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 8(t0)
	sw t2, 28(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 12(t0)
	sw t2, 0(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 16(t0)
	sw t2, 8(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 20(t0)
	sw t2, 36(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 24(t0)
	sw t2, 20(sp)
# 491~493
	lw t0, 4(sp)
	lw t2, 28(t0)
	sw t2, 24(sp)
# 493~493
	lw t0, 36(sp)
	sw t0, 36(sp)
	lw a0, 36(sp)
	addi sp, sp, 40
	ret
p_group_id.2495:
	addi sp, sp, -48
	sw a0, 24(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 0(t0)
	sw t2, 4(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 4(t0)
	sw t2, 28(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 8(t0)
	sw t2, 0(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 12(t0)
	sw t2, 32(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 16(t0)
	sw t2, 20(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 20(t0)
	sw t2, 40(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 24(t0)
	sw t2, 8(sp)
# 500~502
	lw t0, 24(sp)
	lw t2, 28(t0)
	sw t2, 36(sp)
# 502~502
	addi t0, zero, 0
	sw t0, 12(sp)
# 502~502
	lw t0, 8(sp)
	lw t2, 0(t0)
	sw t2, 44(sp)
	lw a0, 44(sp)
	addi sp, sp, 48
	ret
p_set_group_id.2497:
	addi sp, sp, -52
	sw a0, 48(sp)
	sw a1, 20(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 0(t0)
	sw t2, 24(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 4(t0)
	sw t2, 28(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 8(t0)
	sw t2, 32(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 12(t0)
	sw t2, 16(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 16(t0)
	sw t2, 36(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 20(t0)
	sw t2, 12(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 24(t0)
	sw t2, 0(sp)
# 507~509
	lw t0, 48(sp)
	lw t2, 28(t0)
	sw t2, 40(sp)
# 509~509
	addi t0, zero, 0
	sw t0, 4(sp)
	lw t0, 0(sp)
	lw t2, 20(sp)
	sw t2, 0(t0)
# 509~509
	lw a0, 8(sp)
	addi sp, sp, 52
	ret
p_nvectors.2500:
	addi sp, sp, -40
	sw a0, 0(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 0(t0)
	sw t2, 20(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 4(t0)
	sw t2, 36(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 8(t0)
	sw t2, 12(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 12(t0)
	sw t2, 16(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 16(t0)
	sw t2, 8(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 20(t0)
	sw t2, 28(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 24(t0)
	sw t2, 4(sp)
# 514~516
	lw t0, 0(sp)
	lw t2, 28(t0)
	sw t2, 32(sp)
# 516~516
	lw t0, 32(sp)
	sw t0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 40
	ret
d_vec.2502:
	addi sp, sp, -16
	sw a0, 4(sp)
# 523~524
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 0(sp)
# 523~524
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 12(sp)
# 524~524
	lw t0, 0(sp)
	sw t0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 16
	ret
d_const.2504:
	addi sp, sp, -16
	sw a0, 4(sp)
# 529~530
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 529~530
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 12(sp)
# 530~530
	lw t0, 12(sp)
	sw t0, 12(sp)
	lw a0, 12(sp)
	addi sp, sp, 16
	ret
r_surface_id.2506:
	addi sp, sp, -20
	sw a0, 16(sp)
# 537~538
	lw t0, 16(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 537~538
	lw t0, 16(sp)
	lw t2, 4(t0)
	sw t2, 4(sp)
# 537~538
	lw t0, 16(sp)
	flw ft0, 8(t0)
	fsw ft0, 12(sp)
# 538~538
	lw t0, 8(sp)
	sw t0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 20
	ret
r_dvec.2508:
	addi sp, sp, -20
	sw a0, 16(sp)
# 543~544
	lw t0, 16(sp)
	lw t2, 0(t0)
	sw t2, 12(sp)
# 543~544
	lw t0, 16(sp)
	lw t2, 4(t0)
	sw t2, 4(sp)
# 543~544
	lw t0, 16(sp)
	flw ft0, 8(t0)
	fsw ft0, 0(sp)
# 544~544
	lw t0, 4(sp)
	sw t0, 4(sp)
	lw a0, 4(sp)
	addi sp, sp, 20
	ret
r_bright.2510:
	addi sp, sp, -20
	sw a0, 12(sp)
# 549~550
	lw t0, 12(sp)
	lw t2, 0(t0)
	sw t2, 0(sp)
# 549~550
	lw t0, 12(sp)
	lw t2, 4(t0)
	sw t2, 16(sp)
# 549~550
	lw t0, 12(sp)
	flw ft0, 8(t0)
	fsw ft0, 4(sp)
# 550~550
	flw ft0, 4(sp)
	fsw ft0, 4(sp)
	flw fa0, 4(sp)
	addi sp, sp, 20
	ret
rad.2512:
	addi sp, sp, -16
	fsw fa0, 4(sp)
# 557~557
	la t0, f0.01745f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 557~557
	flw ft0, 4(sp)
	flw ft1, 0(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 12(sp)
	flw fa0, 12(sp)
	addi sp, sp, 16
	ret
read_screen_settings.2514:
	addi sp, sp, -332
	sw a0, 108(sp)
	sw a1, 20(sp)
	lw t0, 20(sp)
	lw t1, 4(t0)
	sw t1, 260(sp)
	lw t1, 8(t0)
	sw t1, 120(sp)
	lw t1, 12(t0)
	sw t1, 152(sp)
	lw t1, 16(t0)
	sw t1, 84(sp)
	lw t1, 20(t0)
	sw t1, 32(sp)
# 564~564
	addi t0, zero, 0
	sw t0, 112(sp)
# 0~0
# 564~564
	sw ra, -4(sp)
	lw a0, 240(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 252(sp)
	lw t0, 260(sp)
	flw ft0, 252(sp)
	fsw ft0, 0(t0)
# 564~564
# 565~565
	addi t0, zero, 1
	sw t0, 192(sp)
# 0~0
# 565~565
	sw ra, -4(sp)
	lw a0, 148(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 72(sp)
	lw t0, 260(sp)
	flw ft0, 72(sp)
	fsw ft0, 4(t0)
# 565~565
# 566~566
	addi t0, zero, 2
	sw t0, 156(sp)
# 0~0
# 566~566
	sw ra, -4(sp)
	lw a0, 176(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 64(sp)
	lw t0, 260(sp)
	flw ft0, 64(sp)
	fsw ft0, 8(t0)
# 566~566
# 0~0
# 568~568
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
# 568~568
	sw ra, -4(sp)
	flw fa0, 76(sp)
	addi sp, sp, -4
	jal ra, rad.2512
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 264(sp)
# 569~569
	sw ra, -4(sp)
	flw fa0, 264(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 180(sp)
# 570~570
	sw ra, -4(sp)
	flw fa0, 264(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 316(sp)
# 0~0
# 571~571
	sw ra, -4(sp)
	lw a0, 116(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 168(sp)
# 571~571
	sw ra, -4(sp)
	flw fa0, 168(sp)
	addi sp, sp, -4
	jal ra, rad.2512
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 292(sp)
# 572~572
	sw ra, -4(sp)
	flw fa0, 292(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 284(sp)
# 573~573
	sw ra, -4(sp)
	flw fa0, 292(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 160(sp)
# 575~575
	addi t0, zero, 0
	sw t0, 12(sp)
# 575~575
	flw ft0, 180(sp)
	flw ft1, 160(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 256(sp)
# 575~575
	la t0, f200.00000f
	flw ft0, 0(t0)
	fsw ft0, 196(sp)
# 575~575
	flw ft0, 256(sp)
	flw ft1, 196(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 92(sp)
	lw t0, 84(sp)
	flw ft0, 92(sp)
	fsw ft0, 0(t0)
# 575~575
# 576~576
	addi t0, zero, 1
	sw t0, 304(sp)
# 576~576
	la t0, f-200.00000f
	flw ft0, 0(t0)
	fsw ft0, 96(sp)
# 576~576
	flw ft0, 316(sp)
	flw ft1, 96(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 268(sp)
	lw t0, 84(sp)
	flw ft0, 268(sp)
	fsw ft0, 4(t0)
# 576~576
# 577~577
	addi t0, zero, 2
	sw t0, 68(sp)
# 577~577
	flw ft0, 180(sp)
	flw ft1, 284(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 184(sp)
# 577~577
	la t0, f200.00000f
	flw ft0, 0(t0)
	fsw ft0, 8(sp)
# 577~577
	flw ft0, 184(sp)
	flw ft1, 8(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 188(sp)
	lw t0, 84(sp)
	flw ft0, 188(sp)
	fsw ft0, 8(t0)
# 577~577
# 579~579
	addi t0, zero, 0
	sw t0, 124(sp)
	lw t0, 120(sp)
	flw ft0, 284(sp)
	fsw ft0, 0(t0)
# 579~579
# 580~580
	addi t0, zero, 1
	sw t0, 104(sp)
# 580~580
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 100(sp)
	lw t0, 120(sp)
	flw ft0, 100(sp)
	fsw ft0, 4(t0)
# 580~580
# 581~581
	addi t0, zero, 2
	sw t0, 224(sp)
# 581~581
	sw ra, -4(sp)
	flw fa0, 160(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 236(sp)
	lw t0, 120(sp)
	flw ft0, 236(sp)
	fsw ft0, 8(t0)
# 581~581
# 583~583
	addi t0, zero, 0
	sw t0, 144(sp)
# 583~583
	sw ra, -4(sp)
	flw fa0, 316(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 228(sp)
# 583~583
	flw ft0, 228(sp)
	flw ft1, 160(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 136(sp)
	lw t0, 152(sp)
	flw ft0, 136(sp)
	fsw ft0, 0(t0)
# 583~583
# 584~584
	addi t0, zero, 1
	sw t0, 232(sp)
# 584~584
	sw ra, -4(sp)
	flw fa0, 180(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 80(sp)
	lw t0, 152(sp)
	flw ft0, 80(sp)
	fsw ft0, 4(t0)
# 584~584
# 585~585
	addi t0, zero, 2
	sw t0, 320(sp)
# 585~585
	sw ra, -4(sp)
	flw fa0, 316(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 308(sp)
# 585~585
	flw ft0, 308(sp)
	flw ft1, 284(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
	lw t0, 152(sp)
	flw ft0, 16(sp)
	fsw ft0, 8(t0)
# 585~585
# 587~587
	addi t0, zero, 0
	sw t0, 132(sp)
# 587~587
	addi t0, zero, 0
	sw t0, 44(sp)
# 587~587
	lw t0, 260(sp)
	flw ft0, 0(t0)
	fsw ft0, 40(sp)
# 587~587
	addi t0, zero, 0
	sw t0, 212(sp)
# 587~587
	lw t0, 84(sp)
	flw ft0, 0(t0)
	fsw ft0, 276(sp)
# 587~587
	flw ft0, 40(sp)
	flw ft1, 276(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 248(sp)
	lw t0, 32(sp)
	flw ft0, 248(sp)
	fsw ft0, 0(t0)
# 587~587
# 588~588
	addi t0, zero, 1
	sw t0, 288(sp)
# 588~588
	addi t0, zero, 1
	sw t0, 52(sp)
# 588~588
	lw t0, 260(sp)
	flw ft0, 4(t0)
	fsw ft0, 244(sp)
# 588~588
	addi t0, zero, 1
	sw t0, 24(sp)
# 588~588
	lw t0, 84(sp)
	flw ft0, 4(t0)
	fsw ft0, 28(sp)
# 588~588
	flw ft0, 244(sp)
	flw ft1, 28(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 48(sp)
	lw t0, 32(sp)
	flw ft0, 48(sp)
	fsw ft0, 4(t0)
# 588~588
# 589~589
	addi t0, zero, 2
	sw t0, 220(sp)
# 589~589
	addi t0, zero, 2
	sw t0, 128(sp)
# 589~589
	lw t0, 260(sp)
	flw ft0, 8(t0)
	fsw ft0, 60(sp)
# 589~589
	addi t0, zero, 2
	sw t0, 296(sp)
# 589~589
	lw t0, 84(sp)
	flw ft0, 8(t0)
	fsw ft0, 324(sp)
# 589~589
	flw ft0, 60(sp)
	flw ft1, 324(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 36(sp)
	lw t0, 32(sp)
	flw ft0, 36(sp)
	fsw ft0, 8(t0)
# 589~589
	lw a0, 56(sp)
	addi sp, sp, 332
	ret
read_light.2516:
	addi sp, sp, -116
	sw a0, 88(sp)
	sw a1, 80(sp)
	lw t0, 80(sp)
	lw t1, 4(t0)
	sw t1, 36(sp)
	lw t1, 8(t0)
	sw t1, 0(sp)
# 0~0
# 596~596
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 0~0
# 599~599
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 104(sp)
# 599~599
	sw ra, -4(sp)
	flw fa0, 104(sp)
	addi sp, sp, -4
	jal ra, rad.2512
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 108(sp)
# 600~600
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 72(sp)
# 601~601
	addi t0, zero, 1
	sw t0, 28(sp)
# 601~601
	sw ra, -4(sp)
	flw fa0, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
	lw t0, 0(sp)
	flw ft0, 76(sp)
	fsw ft0, 4(t0)
# 601~601
# 0~0
# 602~602
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 100(sp)
# 602~602
	sw ra, -4(sp)
	flw fa0, 100(sp)
	addi sp, sp, -4
	jal ra, rad.2512
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 603~603
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 16(sp)
# 604~604
	sw ra, -4(sp)
	flw fa0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 8(sp)
# 605~605
	addi t0, zero, 0
	sw t0, 64(sp)
# 605~605
	flw ft0, 16(sp)
	flw ft1, 8(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
	lw t0, 0(sp)
	flw ft0, 56(sp)
	fsw ft0, 0(t0)
# 605~605
# 606~606
	sw ra, -4(sp)
	flw fa0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 68(sp)
# 607~607
	addi t0, zero, 2
	sw t0, 112(sp)
# 607~607
	flw ft0, 16(sp)
	flw ft1, 68(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 32(sp)
	lw t0, 0(sp)
	flw ft0, 32(sp)
	fsw ft0, 8(t0)
# 607~607
# 608~608
	addi t0, zero, 0
	sw t0, 40(sp)
# 0~0
# 608~608
	sw ra, -4(sp)
	lw a0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 84(sp)
	lw t0, 36(sp)
	flw ft0, 84(sp)
	fsw ft0, 0(t0)
# 608~608
	lw a0, 60(sp)
	addi sp, sp, 116
	ret
rotate_quadratic_matrix.2518:
	addi sp, sp, -440
	sw a0, 128(sp)
	sw a1, 80(sp)
# 618~618
	addi t0, zero, 0
	sw t0, 296(sp)
# 618~618
	lw t0, 80(sp)
	flw ft0, 0(t0)
	fsw ft0, 384(sp)
# 618~618
	sw ra, -4(sp)
	flw fa0, 384(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 619~619
	addi t0, zero, 0
	sw t0, 380(sp)
# 619~619
	lw t0, 80(sp)
	flw ft0, 0(t0)
	fsw ft0, 92(sp)
# 619~619
	sw ra, -4(sp)
	flw fa0, 92(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 120(sp)
# 620~620
	addi t0, zero, 1
	sw t0, 192(sp)
# 620~620
	lw t0, 80(sp)
	flw ft0, 4(t0)
	fsw ft0, 124(sp)
# 620~620
	sw ra, -4(sp)
	flw fa0, 124(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 132(sp)
# 621~621
	addi t0, zero, 1
	sw t0, 176(sp)
# 621~621
	lw t0, 80(sp)
	flw ft0, 4(t0)
	fsw ft0, 200(sp)
# 621~621
	sw ra, -4(sp)
	flw fa0, 200(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 40(sp)
# 622~622
	addi t0, zero, 2
	sw t0, 376(sp)
# 622~622
	lw t0, 80(sp)
	flw ft0, 8(t0)
	fsw ft0, 336(sp)
# 622~622
	sw ra, -4(sp)
	flw fa0, 336(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 196(sp)
# 623~623
	addi t0, zero, 2
	sw t0, 140(sp)
# 623~623
	lw t0, 80(sp)
	flw ft0, 8(t0)
	fsw ft0, 388(sp)
# 623~623
	sw ra, -4(sp)
	flw fa0, 388(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 260(sp)
# 625~625
	flw ft0, 132(sp)
	flw ft1, 196(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 4(sp)
# 626~626
	flw ft0, 120(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 252(sp)
# 626~626
	flw ft0, 252(sp)
	flw ft1, 196(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 184(sp)
# 626~626
	flw ft0, 12(sp)
	flw ft1, 260(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 340(sp)
# 626~626
	flw ft0, 184(sp)
	flw ft1, 340(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 156(sp)
# 627~627
	flw ft0, 12(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 8(sp)
# 627~627
	flw ft0, 8(sp)
	flw ft1, 196(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 148(sp)
# 627~627
	flw ft0, 120(sp)
	flw ft1, 260(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 88(sp)
# 627~627
	flw ft0, 148(sp)
	flw ft1, 88(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 256(sp)
# 629~629
	flw ft0, 132(sp)
	flw ft1, 260(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 264(sp)
# 630~630
	flw ft0, 120(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 84(sp)
# 630~630
	flw ft0, 84(sp)
	flw ft1, 260(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 96(sp)
# 630~630
	flw ft0, 12(sp)
	flw ft1, 196(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 312(sp)
# 630~630
	flw ft0, 96(sp)
	flw ft1, 312(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 144(sp)
# 631~631
	flw ft0, 8(sp)
	flw ft1, 260(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 68(sp)
# 631~631
	flw ft0, 120(sp)
	flw ft1, 196(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 172(sp)
# 631~631
	flw ft0, 68(sp)
	flw ft1, 172(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 152(sp)
# 633~633
	sw ra, -4(sp)
	flw fa0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 56(sp)
# 634~634
	flw ft0, 120(sp)
	flw ft1, 132(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 164(sp)
# 635~635
	flw ft0, 12(sp)
	flw ft1, 132(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 160(sp)
# 638~638
	addi t0, zero, 0
	sw t0, 352(sp)
# 638~638
	lw t0, 128(sp)
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 639~639
	addi t0, zero, 1
	sw t0, 316(sp)
# 639~639
	lw t0, 128(sp)
	flw ft0, 4(t0)
	fsw ft0, 356(sp)
# 640~640
	addi t0, zero, 2
	sw t0, 52(sp)
# 640~640
	lw t0, 128(sp)
	flw ft0, 8(t0)
	fsw ft0, 396(sp)
# 645~645
	addi t0, zero, 0
	sw t0, 276(sp)
# 645~645
	sw ra, -4(sp)
	flw fa0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 368(sp)
# 645~645
	flw ft0, 48(sp)
	flw ft1, 368(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 645~645
	sw ra, -4(sp)
	flw fa0, 264(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 100(sp)
# 645~645
	flw ft0, 356(sp)
	flw ft1, 100(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 216(sp)
# 645~645
	flw ft0, 28(sp)
	flw ft1, 216(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 320(sp)
# 645~645
	sw ra, -4(sp)
	flw fa0, 56(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 328(sp)
# 645~645
	flw ft0, 396(sp)
	flw ft1, 328(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
# 645~645
	flw ft0, 320(sp)
	flw ft1, 24(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 76(sp)
	lw t0, 128(sp)
	flw ft0, 76(sp)
	fsw ft0, 0(t0)
# 645~645
# 646~646
	addi t0, zero, 1
	sw t0, 400(sp)
# 646~646
	sw ra, -4(sp)
	flw fa0, 156(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 428(sp)
# 646~646
	flw ft0, 48(sp)
	flw ft1, 428(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 432(sp)
# 646~646
	sw ra, -4(sp)
	flw fa0, 144(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 136(sp)
# 646~646
	flw ft0, 356(sp)
	flw ft1, 136(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 364(sp)
# 646~646
	flw ft0, 432(sp)
	flw ft1, 364(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 436(sp)
# 646~646
	sw ra, -4(sp)
	flw fa0, 164(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 168(sp)
# 646~646
	flw ft0, 396(sp)
	flw ft1, 168(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 104(sp)
# 646~646
	flw ft0, 436(sp)
	flw ft1, 104(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 404(sp)
	lw t0, 128(sp)
	flw ft0, 404(sp)
	fsw ft0, 4(t0)
# 646~646
# 647~647
	addi t0, zero, 2
	sw t0, 348(sp)
# 647~647
	sw ra, -4(sp)
	flw fa0, 256(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 108(sp)
# 647~647
	flw ft0, 48(sp)
	flw ft1, 108(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 408(sp)
# 647~647
	sw ra, -4(sp)
	flw fa0, 152(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 392(sp)
# 647~647
	flw ft0, 356(sp)
	flw ft1, 392(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 188(sp)
# 647~647
	flw ft0, 408(sp)
	flw ft1, 188(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 32(sp)
# 647~647
	sw ra, -4(sp)
	flw fa0, 160(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 36(sp)
# 647~647
	flw ft0, 396(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 424(sp)
# 647~647
	flw ft0, 32(sp)
	flw ft1, 424(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 268(sp)
	lw t0, 128(sp)
	flw ft0, 268(sp)
	fsw ft0, 8(t0)
# 647~647
# 650~650
	addi t0, zero, 0
	sw t0, 44(sp)
# 650~650
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 412(sp)
# 650~650
	flw ft0, 48(sp)
	flw ft1, 156(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 64(sp)
# 650~650
	flw ft0, 64(sp)
	flw ft1, 256(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 112(sp)
# 650~650
	flw ft0, 356(sp)
	flw ft1, 144(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 0(sp)
# 650~650
	flw ft0, 0(sp)
	flw ft1, 152(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 372(sp)
# 650~650
	flw ft0, 112(sp)
	flw ft1, 372(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 204(sp)
# 650~650
	flw ft0, 396(sp)
	flw ft1, 164(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 416(sp)
# 650~650
	flw ft0, 416(sp)
	flw ft1, 160(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 324(sp)
# 650~650
	flw ft0, 204(sp)
	flw ft1, 324(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 208(sp)
# 650~650
	flw ft0, 412(sp)
	flw ft1, 208(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 212(sp)
	lw t0, 80(sp)
	flw ft0, 212(sp)
	fsw ft0, 0(t0)
# 650~650
# 651~651
	addi t0, zero, 1
	sw t0, 220(sp)
# 651~651
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 72(sp)
# 651~651
	flw ft0, 48(sp)
	flw ft1, 4(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 300(sp)
# 651~651
	flw ft0, 300(sp)
	flw ft1, 256(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 224(sp)
# 651~651
	flw ft0, 356(sp)
	flw ft1, 264(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 60(sp)
# 651~651
	flw ft0, 60(sp)
	flw ft1, 152(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 20(sp)
# 651~651
	flw ft0, 224(sp)
	flw ft1, 20(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 228(sp)
# 651~651
	flw ft0, 396(sp)
	flw ft1, 56(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 232(sp)
# 651~651
	flw ft0, 232(sp)
	flw ft1, 160(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 236(sp)
# 651~651
	flw ft0, 228(sp)
	flw ft1, 236(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 272(sp)
# 651~651
	flw ft0, 72(sp)
	flw ft1, 272(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 292(sp)
	lw t0, 80(sp)
	flw ft0, 292(sp)
	fsw ft0, 4(t0)
# 651~651
# 652~652
	addi t0, zero, 2
	sw t0, 240(sp)
# 652~652
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 344(sp)
# 652~652
	flw ft0, 300(sp)
	flw ft1, 156(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 420(sp)
# 652~652
	flw ft0, 60(sp)
	flw ft1, 144(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 244(sp)
# 652~652
	flw ft0, 420(sp)
	flw ft1, 244(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 248(sp)
# 652~652
	flw ft0, 232(sp)
	flw ft1, 164(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 360(sp)
# 652~652
	flw ft0, 248(sp)
	flw ft1, 360(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 308(sp)
# 652~652
	flw ft0, 344(sp)
	flw ft1, 308(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 332(sp)
	lw t0, 80(sp)
	flw ft0, 332(sp)
	fsw ft0, 8(t0)
# 652~652
	lw a0, 288(sp)
	addi sp, sp, 440
	ret
read_nth_object.2521:
	addi sp, sp, -524
	sw a0, 148(sp)
	sw a1, 500(sp)
	lw t0, 500(sp)
	lw t1, 4(t0)
	sw t1, 64(sp)
# 0~0
# 659~659
	sw ra, -4(sp)
	lw a0, 376(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 416(sp)
# 660~660
	addi t0, zero, -1
	sw t0, 92(sp)
	lw t0, 416(sp)
	lw t1, 92(sp)
	beq t0, t1, ._6_then
# 0~0
# 662~662
	sw ra, -4(sp)
	lw a0, 492(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 412(sp)
# 0~0
# 663~663
	sw ra, -4(sp)
	lw a0, 504(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 260(sp)
# 0~0
# 664~664
	sw ra, -4(sp)
	lw a0, 380(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 128(sp)
# 666~666
	addi t0, zero, 3
	sw t0, 264(sp)
# 666~666
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 172(sp)
# 666~666
	sw ra, -4(sp)
	lw a0, 264(sp)
	flw fa0, 172(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 276(sp)
# 667~667
	addi t0, zero, 0
	sw t0, 132(sp)
# 0~0
# 667~667
	sw ra, -4(sp)
	lw a0, 480(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 196(sp)
	lw t0, 276(sp)
	flw ft0, 196(sp)
	fsw ft0, 0(t0)
# 667~667
# 668~668
	addi t0, zero, 1
	sw t0, 300(sp)
# 0~0
# 668~668
	sw ra, -4(sp)
	lw a0, 112(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 428(sp)
	lw t0, 276(sp)
	flw ft0, 428(sp)
	fsw ft0, 4(t0)
# 668~668
# 669~669
	addi t0, zero, 2
	sw t0, 188(sp)
# 0~0
# 669~669
	sw ra, -4(sp)
	lw a0, 372(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 140(sp)
	lw t0, 276(sp)
	flw ft0, 140(sp)
	fsw ft0, 8(t0)
# 669~669
# 671~671
	addi t0, zero, 3
	sw t0, 248(sp)
# 671~671
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 316(sp)
# 671~671
	sw ra, -4(sp)
	lw a0, 248(sp)
	flw fa0, 316(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 136(sp)
# 672~672
	addi t0, zero, 0
	sw t0, 84(sp)
# 0~0
# 672~672
	sw ra, -4(sp)
	lw a0, 344(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 424(sp)
	lw t0, 136(sp)
	flw ft0, 424(sp)
	fsw ft0, 0(t0)
# 672~672
# 673~673
	addi t0, zero, 1
	sw t0, 52(sp)
# 0~0
# 673~673
	sw ra, -4(sp)
	lw a0, 296(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 124(sp)
	lw t0, 136(sp)
	flw ft0, 124(sp)
	fsw ft0, 4(t0)
# 673~673
# 674~674
	addi t0, zero, 2
	sw t0, 512(sp)
# 0~0
# 674~674
	sw ra, -4(sp)
	lw a0, 212(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 312(sp)
	lw t0, 136(sp)
	flw ft0, 312(sp)
	fsw ft0, 8(t0)
# 674~674
# 0~0
# 676~676
	sw ra, -4(sp)
	lw a0, 304(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 88(sp)
# 676~676
	sw ra, -4(sp)
	flw fa0, 88(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 448(sp)
# 678~678
	addi t0, zero, 2
	sw t0, 176(sp)
# 678~678
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 678~678
	sw ra, -4(sp)
	lw a0, 176(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 440(sp)
# 679~679
	addi t0, zero, 0
	sw t0, 508(sp)
# 0~0
# 679~679
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 272(sp)
	lw t0, 440(sp)
	flw ft0, 272(sp)
	fsw ft0, 0(t0)
# 679~679
# 680~680
	addi t0, zero, 1
	sw t0, 452(sp)
# 0~0
# 680~680
	sw ra, -4(sp)
	lw a0, 280(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 200(sp)
	lw t0, 440(sp)
	flw ft0, 200(sp)
	fsw ft0, 4(t0)
# 680~680
# 682~682
	addi t0, zero, 3
	sw t0, 12(sp)
# 682~682
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 268(sp)
# 682~682
	sw ra, -4(sp)
	lw a0, 12(sp)
	flw fa0, 268(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 683~683
	addi t0, zero, 0
	sw t0, 320(sp)
# 0~0
# 683~683
	sw ra, -4(sp)
	lw a0, 384(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 288(sp)
	lw t0, 8(sp)
	flw ft0, 288(sp)
	fsw ft0, 0(t0)
# 683~683
# 684~684
	addi t0, zero, 1
	sw t0, 36(sp)
# 0~0
# 684~684
	sw ra, -4(sp)
	lw a0, 204(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 456(sp)
	lw t0, 8(sp)
	flw ft0, 456(sp)
	fsw ft0, 4(t0)
# 684~684
# 685~685
	addi t0, zero, 2
	sw t0, 244(sp)
# 0~0
# 685~685
	sw ra, -4(sp)
	lw a0, 236(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 324(sp)
	lw t0, 8(sp)
	flw ft0, 324(sp)
	fsw ft0, 8(t0)
# 685~685
# 687~687
	addi t0, zero, 3
	sw t0, 192(sp)
# 687~687
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 152(sp)
# 687~687
	sw ra, -4(sp)
	lw a0, 192(sp)
	flw fa0, 152(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 284(sp)
# 688~688
	addi t0, zero, 0
	sw t0, 160(sp)
	lw t0, 128(sp)
	lw t1, 160(sp)
	beq t0, t1, ._7_then
# 690~690
	addi t0, zero, 0
	sw t0, 40(sp)
# 0~0
# 690~690
	sw ra, -4(sp)
	lw a0, 104(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 690~690
	sw ra, -4(sp)
	flw fa0, 28(sp)
	addi sp, sp, -4
	jal ra, rad.2512
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 164(sp)
	lw t0, 284(sp)
	flw ft0, 164(sp)
	fsw ft0, 0(t0)
# 690~690
# 691~691
	addi t0, zero, 1
	sw t0, 224(sp)
# 0~0
# 691~691
	sw ra, -4(sp)
	lw a0, 388(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 392(sp)
# 691~691
	sw ra, -4(sp)
	flw fa0, 392(sp)
	addi sp, sp, -4
	jal ra, rad.2512
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
	lw t0, 284(sp)
	flw ft0, 76(sp)
	fsw ft0, 4(t0)
# 691~691
# 692~692
	addi t0, zero, 2
	sw t0, 420(sp)
# 0~0
# 692~692
	sw ra, -4(sp)
	lw a0, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 432(sp)
# 692~692
	sw ra, -4(sp)
	flw fa0, 432(sp)
	addi sp, sp, -4
	jal ra, rad.2512
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 460(sp)
	lw t0, 284(sp)
	flw ft0, 460(sp)
	fsw ft0, 8(t0)
# 692~692
	beq zero, zero, ._7_final
._7_then:
# 0~0
._7_final:
# 699~699
	addi t0, zero, 2
	sw t0, 208(sp)
	lw t0, 412(sp)
	lw t1, 208(sp)
	beq t0, t1, ._8_then
# 699~699
	lw t0, 448(sp)
	sw t0, 516(sp)
	beq zero, zero, ._8_final
._8_then:
# 699~699
	addi t0, zero, 1
	sw t0, 516(sp)
._8_final:
# 700~700
	addi t0, zero, 4
	sw t0, 156(sp)
# 700~700
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 472(sp)
# 700~700
	sw ra, -4(sp)
	lw a0, 156(sp)
	flw fa0, 472(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 520(sp)
# 703~709
	lw t0, 416(sp)
	sw t0, 0(tp)
	lw t0, 412(sp)
	sw t0, 4(tp)
	lw t0, 260(sp)
	sw t0, 8(tp)
	lw t0, 128(sp)
	sw t0, 12(tp)
	lw t0, 276(sp)
	sw t0, 16(tp)
	lw t0, 136(sp)
	sw t0, 20(tp)
	lw t0, 516(sp)
	sw t0, 24(tp)
	lw t0, 440(sp)
	sw t0, 28(tp)
	lw t0, 8(sp)
	sw t0, 32(tp)
	lw t0, 284(sp)
	sw t0, 36(tp)
	lw t0, 520(sp)
	sw t0, 40(tp)
	sw tp, 464(sp)
	addi tp, tp, 44
	lw t0, 64(sp)
	lw t2, 464(sp)
	lw t1, 148(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 711~711
# 713~713
	addi t0, zero, 3
	sw t0, 16(sp)
	lw t0, 412(sp)
	lw t1, 16(sp)
	beq t0, t1, ._9_then
# 723~723
	addi t0, zero, 2
	sw t0, 360(sp)
	lw t0, 412(sp)
	lw t1, 360(sp)
	beq t0, t1, ._10_then
# 0~0
	beq zero, zero, ._10_final
._10_then:
# 725~725
	addi t0, zero, 0
	sw t0, 232(sp)
	lw t0, 448(sp)
	lw t1, 232(sp)
	beq t0, t1, ._11_then
# 725~725
	addi t0, zero, 0
	sw t0, 228(sp)
	beq zero, zero, ._11_final
._11_then:
# 725~725
	addi t0, zero, 1
	sw t0, 228(sp)
._11_final:
# 725~725
	sw ra, -4(sp)
	lw a0, 276(sp)
	lw a1, 228(sp)
	addi sp, sp, -4
	jal ra, vecunit_sgn.2416
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 328(sp)
._10_final:
	beq zero, zero, ._9_final
._9_then:
# 716~716
	addi t0, zero, 0
	sw t0, 24(sp)
# 716~716
	flw ft0, 196(sp)
	fsw ft0, 60(sp)
# 717~717
	addi t0, zero, 0
	sw t0, 476(sp)
# 717~717
	sw ra, -4(sp)
	flw fa0, 60(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 340(sp)
# 717~717
	addi t0, zero, 0
	sw t0, 256(sp)
	lw t0, 340(sp)
	lw t1, 256(sp)
	beq t0, t1, ._12_then
# 717~717
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 484(sp)
	beq zero, zero, ._12_final
._12_then:
# 717~717
	sw ra, -4(sp)
	flw fa0, 60(sp)
	addi sp, sp, -4
	jal ra, sgn.2395
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 408(sp)
# 717~717
	sw ra, -4(sp)
	flw fa0, 60(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 332(sp)
# 717~717
	flw ft0, 408(sp)
	flw ft1, 332(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 484(sp)
._12_final:
	lw t0, 276(sp)
	flw ft0, 484(sp)
	fsw ft0, 0(t0)
# 717~717
# 718~718
	addi t0, zero, 1
	sw t0, 116(sp)
# 718~718
	flw ft0, 428(sp)
	fsw ft0, 48(sp)
# 719~719
	addi t0, zero, 1
	sw t0, 216(sp)
# 719~719
	sw ra, -4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 168(sp)
# 719~719
	addi t0, zero, 0
	sw t0, 488(sp)
	lw t0, 168(sp)
	lw t1, 488(sp)
	beq t0, t1, ._13_then
# 719~719
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 364(sp)
	beq zero, zero, ._13_final
._13_then:
# 719~719
	sw ra, -4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, sgn.2395
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 96(sp)
# 719~719
	sw ra, -4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 240(sp)
# 719~719
	flw ft0, 96(sp)
	flw ft1, 240(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 364(sp)
._13_final:
	lw t0, 276(sp)
	flw ft0, 364(sp)
	fsw ft0, 4(t0)
# 719~719
# 720~720
	addi t0, zero, 2
	sw t0, 292(sp)
# 720~720
	flw ft0, 140(sp)
	fsw ft0, 108(sp)
# 721~721
	addi t0, zero, 2
	sw t0, 336(sp)
# 721~721
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 721~721
	addi t0, zero, 0
	sw t0, 44(sp)
	lw t0, 4(sp)
	lw t1, 44(sp)
	beq t0, t1, ._14_then
# 721~721
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 308(sp)
	beq zero, zero, ._14_final
._14_then:
# 721~721
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, sgn.2395
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 348(sp)
# 721~721
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 436(sp)
# 721~721
	flw ft0, 348(sp)
	flw ft1, 436(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 308(sp)
._14_final:
	lw t0, 276(sp)
	flw ft0, 308(sp)
	fsw ft0, 8(t0)
# 721~721
._9_final:
# 729~729
	addi t0, zero, 0
	sw t0, 396(sp)
	lw t0, 128(sp)
	lw t1, 396(sp)
	beq t0, t1, ._15_then
# 730~730
	sw ra, -4(sp)
	lw a0, 276(sp)
	lw a1, 284(sp)
	addi sp, sp, -4
	jal ra, rotate_quadratic_matrix.2518
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 496(sp)
	beq zero, zero, ._15_final
._15_then:
# 0~0
._15_final:
# 733~733
	addi t0, zero, 1
	sw t0, 100(sp)
	lw a0, 100(sp)
	addi sp, sp, 524
	ret
	beq zero, zero, ._6_final
._6_then:
# 736~736
	addi t0, zero, 0
	sw t0, 100(sp)
	lw a0, 100(sp)
	addi sp, sp, 524
	ret
._6_final:
read_object.2523:
	addi sp, sp, -44
	sw a0, 20(sp)
	sw a1, 32(sp)
	lw t0, 32(sp)
	lw t1, 4(t0)
	sw t1, 36(sp)
	lw t1, 8(t0)
	sw t1, 12(sp)
# 741~741
	addi t0, zero, 60
	sw t0, 0(sp)
	lw t0, 20(sp)
	lw t1, 0(sp)
	bge t0, t1, ._16_then
# 742~742
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 12(sp)
	lw t0, 12(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 742~745
	addi t0, zero, 0
	sw t0, 4(sp)
	lw t0, 24(sp)
	lw t1, 4(sp)
	beq t0, t1, ._17_then
# 743~743
	addi t0, zero, 1
	sw t0, 28(sp)
# 743~743
	lw t0, 20(sp)
	addi t2, t0, 1
	sw t2, 40(sp)
# 743~743
	sw ra, -4(sp)
	lw a0, 40(sp)
	lw a1, 32(sp)
	lw t0, 32(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 44
	ret
	beq zero, zero, ._17_final
._17_then:
# 745~745
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 36(sp)
	lw t2, 20(sp)
	sw t2, 0(t0)
# 745~745
	lw a0, 8(sp)
	addi sp, sp, 44
	ret
._17_final:
	beq zero, zero, ._16_final
._16_then:
# 0~0
	lw a0, 8(sp)
	addi sp, sp, 44
	ret
._16_final:
read_all_object.2525:
	addi sp, sp, -20
	sw a0, 8(sp)
	sw a1, 4(sp)
	lw t0, 4(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
# 750~750
	addi t0, zero, 0
	sw t0, 16(sp)
# 750~750
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 12(sp)
	lw t0, 12(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 20
	ret
read_net_item.2527:
	addi sp, sp, -52
	sw a0, 20(sp)
# 0~0
# 757~757
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 758~758
	addi t0, zero, -1
	sw t0, 4(sp)
	lw t0, 12(sp)
	lw t1, 4(sp)
	beq t0, t1, ._18_then
# 760~760
	addi t0, zero, 1
	sw t0, 28(sp)
# 760~760
	lw t0, 20(sp)
	addi t2, t0, 1
	sw t2, 16(sp)
# 760~760
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, read_net_item.2527
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw t0, 32(sp)
	lw t2, 12(sp)
	lw t1, 20(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 761~761
# 761~761
	lw t0, 32(sp)
	sw t0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 52
	ret
	beq zero, zero, ._18_final
._18_then:
# 758~758
	addi t0, zero, 1
	sw t0, 36(sp)
# 758~758
	lw t0, 20(sp)
	addi t2, t0, 1
	sw t2, 40(sp)
# 758~758
	addi t0, zero, -1
	sw t0, 44(sp)
# 758~758
	sw ra, -4(sp)
	lw a0, 40(sp)
	lw a1, 44(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 52
	ret
._18_final:
read_or_network.2529:
	addi sp, sp, -56
	sw a0, 52(sp)
# 765~765
	addi t0, zero, 0
	sw t0, 48(sp)
# 765~765
	sw ra, -4(sp)
	lw a0, 48(sp)
	addi sp, sp, -4
	jal ra, read_net_item.2527
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 766~766
	addi t0, zero, 0
	sw t0, 20(sp)
# 766~766
	lw t0, 24(sp)
	lw t2, 0(t0)
	sw t2, 28(sp)
# 766~766
	addi t0, zero, -1
	sw t0, 40(sp)
	lw t0, 28(sp)
	lw t1, 40(sp)
	beq t0, t1, ._19_then
# 769~769
	addi t0, zero, 1
	sw t0, 4(sp)
# 769~769
	lw t0, 52(sp)
	addi t2, t0, 1
	sw t2, 32(sp)
# 769~769
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, read_or_network.2529
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
	lw t0, 16(sp)
	lw t2, 24(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 770~770
# 770~770
	lw t0, 16(sp)
	sw t0, 16(sp)
	lw a0, 16(sp)
	addi sp, sp, 56
	ret
	beq zero, zero, ._19_final
._19_then:
# 767~767
	addi t0, zero, 1
	sw t0, 44(sp)
# 767~767
	lw t0, 52(sp)
	addi t2, t0, 1
	sw t2, 8(sp)
# 767~767
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 24(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
	lw a0, 12(sp)
	addi sp, sp, 56
	ret
._19_final:
read_and_network.2531:
	addi sp, sp, -48
	sw a0, 8(sp)
	sw a1, 0(sp)
	lw t0, 0(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
# 774~774
	addi t0, zero, 0
	sw t0, 24(sp)
# 774~774
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, read_net_item.2527
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
# 775~775
	addi t0, zero, 0
	sw t0, 40(sp)
# 775~775
	lw t0, 44(sp)
	lw t2, 0(t0)
	sw t2, 36(sp)
# 775~775
	addi t0, zero, -1
	sw t0, 4(sp)
	lw t0, 36(sp)
	lw t1, 4(sp)
	beq t0, t1, ._20_then
	lw t0, 12(sp)
	lw t2, 44(sp)
	lw t1, 8(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 777~777
# 778~778
	addi t0, zero, 1
	sw t0, 20(sp)
# 778~778
	lw t0, 8(sp)
	addi t2, t0, 1
	sw t2, 28(sp)
# 778~778
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 48
	ret
	beq zero, zero, ._20_final
._20_then:
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 48
	ret
._20_final:
read_parameter.2533:
	addi sp, sp, -76
	sw a0, 64(sp)
	sw a1, 8(sp)
	lw t0, 8(sp)
	lw t1, 4(t0)
	sw t1, 40(sp)
	lw t1, 8(t0)
	sw t1, 28(sp)
	lw t1, 12(t0)
	sw t1, 0(sp)
	lw t1, 16(t0)
	sw t1, 72(sp)
	lw t1, 20(t0)
	sw t1, 36(sp)
# 0~0
# 784~784
	sw ra, -4(sp)
	lw a0, 68(sp)
	lw a1, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
# 0~0
# 785~785
	sw ra, -4(sp)
	lw a0, 32(sp)
	lw a1, 72(sp)
	lw t0, 72(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 0~0
# 786~786
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 28(sp)
	lw t0, 28(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 787~787
	addi t0, zero, 0
	sw t0, 16(sp)
# 787~787
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 788~788
	addi t0, zero, 0
	sw t0, 56(sp)
# 788~788
	addi t0, zero, 0
	sw t0, 60(sp)
# 788~788
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, read_or_network.2529
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
	lw t0, 40(sp)
	lw t2, 4(sp)
	sw t2, 0(t0)
# 788~788
	lw a0, 20(sp)
	addi sp, sp, 76
	ret
solver_rect_surface.2535:
	addi sp, sp, -160
	sw a0, 100(sp)
	sw a1, 128(sp)
	fsw fa0, 104(sp)
	fsw fa1, 132(sp)
	fsw fa2, 136(sp)
	sw a2, 68(sp)
	sw a3, 76(sp)
	sw a4, 108(sp)
	sw a5, 8(sp)
	lw t0, 8(sp)
	lw t1, 4(t0)
	sw t1, 64(sp)
# 799~799
	lw t0, 128(sp)
	lw t1, 68(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 0(sp)
# 799~799
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 124(sp)
# 799~808
	addi t0, zero, 0
	sw t0, 112(sp)
	lw t0, 124(sp)
	lw t1, 112(sp)
	beq t0, t1, ._21_then
# 799~799
	addi t0, zero, 0
	sw t0, 116(sp)
	lw a0, 116(sp)
	addi sp, sp, 160
	ret
	beq zero, zero, ._21_final
._21_then:
# 800~800
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_param_abc.2457
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 140(sp)
# 801~801
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 801~801
	lw t0, 128(sp)
	lw t1, 68(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 12(sp)
# 801~801
	sw ra, -4(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 801~801
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_xor
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 144(sp)
# 801~801
	lw t0, 140(sp)
	lw t1, 68(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 16(sp)
# 801~801
	sw ra, -4(sp)
	lw a0, 144(sp)
	flw fa0, 16(sp)
	addi sp, sp, -4
	jal ra, fneg_cond.2397
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 803~803
	flw ft0, 44(sp)
	flw ft1, 104(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 40(sp)
# 803~803
	lw t0, 128(sp)
	lw t1, 68(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 84(sp)
# 803~803
	flw ft0, 40(sp)
	flw ft1, 84(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 60(sp)
# 804~804
	lw t0, 128(sp)
	lw t1, 76(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 156(sp)
# 804~804
	flw ft0, 60(sp)
	flw ft1, 156(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
# 804~804
	flw ft0, 24(sp)
	flw ft1, 132(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 120(sp)
# 804~804
	sw ra, -4(sp)
	flw fa0, 120(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 96(sp)
# 804~804
	lw t0, 140(sp)
	lw t1, 76(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 148(sp)
# 804~804
	sw ra, -4(sp)
	flw fa0, 96(sp)
	flw fa1, 148(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 152(sp)
# 804~808
	addi t0, zero, 0
	sw t0, 48(sp)
	lw t0, 152(sp)
	lw t1, 48(sp)
	beq t0, t1, ._22_then
# 805~805
	lw t0, 128(sp)
	lw t1, 108(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 88(sp)
# 805~805
	flw ft0, 60(sp)
	flw ft1, 88(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 20(sp)
# 805~805
	flw ft0, 20(sp)
	flw ft1, 136(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 28(sp)
# 805~805
	sw ra, -4(sp)
	flw fa0, 28(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 56(sp)
# 805~805
	lw t0, 140(sp)
	lw t1, 108(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 4(sp)
# 805~805
	sw ra, -4(sp)
	flw fa0, 56(sp)
	flw fa1, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 805~807
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 52(sp)
	lw t1, 32(sp)
	beq t0, t1, ._23_then
# 806~806
	addi t0, zero, 0
	sw t0, 80(sp)
	lw t0, 64(sp)
	flw ft0, 60(sp)
	fsw ft0, 0(t0)
# 806~806
# 806~806
	addi t0, zero, 1
	sw t0, 116(sp)
	lw a0, 116(sp)
	addi sp, sp, 160
	ret
	beq zero, zero, ._23_final
._23_then:
# 807~807
	addi t0, zero, 0
	sw t0, 116(sp)
	lw a0, 116(sp)
	addi sp, sp, 160
	ret
._23_final:
	beq zero, zero, ._22_final
._22_then:
# 808~808
	addi t0, zero, 0
	sw t0, 116(sp)
	lw a0, 116(sp)
	addi sp, sp, 160
	ret
._22_final:
._21_final:
solver_rect.2544:
	addi sp, sp, -92
	sw a0, 8(sp)
	sw a1, 16(sp)
	fsw fa0, 40(sp)
	fsw fa1, 44(sp)
	fsw fa2, 4(sp)
	sw a2, 56(sp)
	lw t0, 56(sp)
	lw t1, 4(t0)
	sw t1, 36(sp)
# 814~814
	addi t0, zero, 0
	sw t0, 0(sp)
# 814~814
	addi t0, zero, 1
	sw t0, 48(sp)
# 814~814
	addi t0, zero, 2
	sw t0, 24(sp)
# 814~814
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 16(sp)
	flw fa0, 40(sp)
	flw fa1, 44(sp)
	flw fa2, 4(sp)
	lw a2, 0(sp)
	lw a3, 48(sp)
	lw a4, 24(sp)
	lw a5, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 814~817
	addi t0, zero, 0
	sw t0, 64(sp)
	lw t0, 20(sp)
	lw t1, 64(sp)
	beq t0, t1, ._24_then
# 814~814
	addi t0, zero, 1
	sw t0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 92
	ret
	beq zero, zero, ._24_final
._24_then:
# 815~815
	addi t0, zero, 1
	sw t0, 84(sp)
# 815~815
	addi t0, zero, 2
	sw t0, 52(sp)
# 815~815
	addi t0, zero, 0
	sw t0, 72(sp)
# 815~815
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 16(sp)
	flw fa0, 44(sp)
	flw fa1, 4(sp)
	flw fa2, 40(sp)
	lw a2, 84(sp)
	lw a3, 52(sp)
	lw a4, 72(sp)
	lw a5, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 68(sp)
# 815~817
	addi t0, zero, 0
	sw t0, 88(sp)
	lw t0, 68(sp)
	lw t1, 88(sp)
	beq t0, t1, ._25_then
# 815~815
	addi t0, zero, 2
	sw t0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 92
	ret
	beq zero, zero, ._25_final
._25_then:
# 816~816
	addi t0, zero, 2
	sw t0, 60(sp)
# 816~816
	addi t0, zero, 0
	sw t0, 80(sp)
# 816~816
	addi t0, zero, 1
	sw t0, 76(sp)
# 816~816
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 16(sp)
	flw fa0, 4(sp)
	flw fa1, 40(sp)
	flw fa2, 44(sp)
	lw a2, 60(sp)
	lw a3, 80(sp)
	lw a4, 76(sp)
	lw a5, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 816~817
	addi t0, zero, 0
	sw t0, 28(sp)
	lw t0, 12(sp)
	lw t1, 28(sp)
	beq t0, t1, ._26_then
# 816~816
	addi t0, zero, 3
	sw t0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 92
	ret
	beq zero, zero, ._26_final
._26_then:
# 817~817
	addi t0, zero, 0
	sw t0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 92
	ret
._26_final:
._25_final:
._24_final:
solver_surface.2550:
	addi sp, sp, -68
	sw a0, 32(sp)
	sw a1, 28(sp)
	fsw fa0, 8(sp)
	fsw fa1, 52(sp)
	fsw fa2, 44(sp)
	sw a2, 24(sp)
	lw t0, 24(sp)
	lw t1, 4(t0)
	sw t1, 56(sp)
# 825~825
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, o_param_abc.2457
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 826~826
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 36(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 16(sp)
# 827~827
	sw ra, -4(sp)
	flw fa0, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 827~830
	addi t0, zero, 0
	sw t0, 48(sp)
	lw t0, 40(sp)
	lw t1, 48(sp)
	beq t0, t1, ._27_then
# 828~828
	addi t0, zero, 0
	sw t0, 12(sp)
# 828~828
	sw ra, -4(sp)
	lw a0, 36(sp)
	flw fa0, 8(sp)
	flw fa1, 52(sp)
	flw fa2, 44(sp)
	addi sp, sp, -4
	jal ra, veciprod2.2422
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 20(sp)
# 828~828
	sw ra, -4(sp)
	flw fa0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 60(sp)
# 828~828
	flw ft0, 60(sp)
	flw ft1, 16(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 64(sp)
	lw t0, 56(sp)
	flw ft0, 64(sp)
	fsw ft0, 0(t0)
# 828~828
# 829~829
	addi t0, zero, 1
	sw t0, 4(sp)
	lw a0, 4(sp)
	addi sp, sp, 68
	ret
	beq zero, zero, ._27_final
._27_then:
# 830~830
	addi t0, zero, 0
	sw t0, 4(sp)
	lw a0, 4(sp)
	addi sp, sp, 68
	ret
._27_final:
quadratic.2556:
	addi sp, sp, -120
	sw a0, 20(sp)
	fsw fa0, 80(sp)
	fsw fa1, 36(sp)
	fsw fa2, 40(sp)
# 838~838
	sw ra, -4(sp)
	flw fa0, 80(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 100(sp)
# 838~838
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 838~838
	flw ft0, 100(sp)
	flw ft1, 44(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 88(sp)
# 838~838
	sw ra, -4(sp)
	flw fa0, 36(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 112(sp)
# 838~838
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 84(sp)
# 838~838
	flw ft0, 112(sp)
	flw ft1, 84(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 4(sp)
# 838~838
	flw ft0, 88(sp)
	flw ft1, 4(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 24(sp)
# 838~838
	sw ra, -4(sp)
	flw fa0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
# 838~838
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 838~838
	flw ft0, 76(sp)
	flw ft1, 0(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 32(sp)
# 838~838
	flw ft0, 24(sp)
	flw ft1, 32(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 72(sp)
# 840~840
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_isrot.2449
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 840~840
	addi t0, zero, 0
	sw t0, 52(sp)
	lw t0, 92(sp)
	lw t1, 52(sp)
	beq t0, t1, ._28_then
# 844~844
	flw ft0, 36(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 116(sp)
# 844~844
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_r1.2475
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 96(sp)
# 844~844
	flw ft0, 116(sp)
	flw ft1, 96(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
# 843~844
	flw ft0, 72(sp)
	flw ft1, 16(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 68(sp)
# 845~845
	flw ft0, 40(sp)
	flw ft1, 80(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 8(sp)
# 845~845
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_r2.2477
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 64(sp)
# 845~845
	flw ft0, 8(sp)
	flw ft1, 64(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 843~845
	flw ft0, 68(sp)
	flw ft1, 56(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 104(sp)
# 846~846
	flw ft0, 80(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 108(sp)
# 846~846
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_r3.2479
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 846~846
	flw ft0, 108(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 48(sp)
# 843~846
	flw ft0, 104(sp)
	flw ft1, 48(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 60(sp)
	flw fa0, 60(sp)
	addi sp, sp, 120
	ret
	beq zero, zero, ._28_final
._28_then:
# 841~841
	flw ft0, 72(sp)
	fsw ft0, 72(sp)
	flw fa0, 72(sp)
	addi sp, sp, 120
	ret
._28_final:
bilinear.2561:
	addi sp, sp, -160
	sw a0, 8(sp)
	fsw fa0, 92(sp)
	fsw fa1, 136(sp)
	fsw fa2, 0(sp)
	fsw fa3, 20(sp)
	fsw fa4, 36(sp)
	fsw fa5, 156(sp)
# 852~852
	flw ft0, 92(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 140(sp)
# 852~852
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 852~852
	flw ft0, 140(sp)
	flw ft1, 4(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 100(sp)
# 853~853
	flw ft0, 136(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 80(sp)
# 853~853
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 40(sp)
# 853~853
	flw ft0, 80(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 124(sp)
# 852~853
	flw ft0, 100(sp)
	flw ft1, 124(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 84(sp)
# 854~854
	flw ft0, 0(sp)
	flw ft1, 156(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 112(sp)
# 854~854
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 854~854
	flw ft0, 112(sp)
	flw ft1, 12(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 88(sp)
# 852~854
	flw ft0, 84(sp)
	flw ft1, 88(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 108(sp)
# 856~856
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, o_isrot.2449
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 148(sp)
# 856~856
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 148(sp)
	lw t1, 16(sp)
	beq t0, t1, ._29_then
# 860~860
	flw ft0, 0(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 76(sp)
# 860~860
	flw ft0, 136(sp)
	flw ft1, 156(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 116(sp)
# 860~860
	flw ft0, 76(sp)
	flw ft1, 116(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 32(sp)
# 860~860
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, o_param_r1.2475
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 96(sp)
# 860~860
	flw ft0, 32(sp)
	flw ft1, 96(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 72(sp)
# 861~861
	flw ft0, 92(sp)
	flw ft1, 156(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 144(sp)
# 861~861
	flw ft0, 0(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 44(sp)
# 861~861
	flw ft0, 144(sp)
	flw ft1, 44(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 60(sp)
# 861~861
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, o_param_r2.2477
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 52(sp)
# 861~861
	flw ft0, 60(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 860~861
	flw ft0, 72(sp)
	flw ft1, 56(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 24(sp)
# 862~862
	flw ft0, 92(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 120(sp)
# 862~862
	flw ft0, 136(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 48(sp)
# 862~862
	flw ft0, 120(sp)
	flw ft1, 48(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 128(sp)
# 862~862
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, o_param_r3.2479
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 132(sp)
# 862~862
	flw ft0, 128(sp)
	flw ft1, 132(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 64(sp)
# 860~862
	flw ft0, 24(sp)
	flw ft1, 64(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 104(sp)
# 859~862
	sw ra, -4(sp)
	flw fa0, 104(sp)
	addi sp, sp, -4
	jal ra, min_caml_fhalf
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 68(sp)
# 859~862
	flw ft0, 108(sp)
	flw ft1, 68(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 28(sp)
	flw fa0, 28(sp)
	addi sp, sp, 160
	ret
	beq zero, zero, ._29_final
._29_then:
# 857~857
	flw ft0, 108(sp)
	fsw ft0, 108(sp)
	flw fa0, 108(sp)
	addi sp, sp, 160
	ret
._29_final:
solver_second.2569:
	addi sp, sp, -168
	sw a0, 76(sp)
	sw a1, 68(sp)
	fsw fa0, 12(sp)
	fsw fa1, 8(sp)
	fsw fa2, 84(sp)
	sw a2, 16(sp)
	lw t0, 16(sp)
	lw t1, 4(t0)
	sw t1, 60(sp)
# 873~873
	addi t0, zero, 0
	sw t0, 36(sp)
# 873~873
	lw t0, 68(sp)
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 873~873
	addi t0, zero, 1
	sw t0, 0(sp)
# 873~873
	lw t0, 68(sp)
	flw ft0, 4(t0)
	fsw ft0, 132(sp)
# 873~873
	addi t0, zero, 2
	sw t0, 88(sp)
# 873~873
	lw t0, 68(sp)
	flw ft0, 8(t0)
	fsw ft0, 40(sp)
# 873~873
	sw ra, -4(sp)
	lw a0, 76(sp)
	flw fa0, 80(sp)
	flw fa1, 132(sp)
	flw fa2, 40(sp)
	addi sp, sp, -4
	jal ra, quadratic.2556
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 128(sp)
# 875~875
	sw ra, -4(sp)
	flw fa0, 128(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 140(sp)
# 875~894
	addi t0, zero, 0
	sw t0, 136(sp)
	lw t0, 140(sp)
	lw t1, 136(sp)
	beq t0, t1, ._30_then
# 876~876
	addi t0, zero, 0
	sw t0, 92(sp)
	lw a0, 92(sp)
	addi sp, sp, 168
	ret
	beq zero, zero, ._30_final
._30_then:
# 880~880
	addi t0, zero, 0
	sw t0, 20(sp)
# 880~880
	lw t0, 68(sp)
	flw ft0, 0(t0)
	fsw ft0, 96(sp)
# 880~880
	addi t0, zero, 1
	sw t0, 152(sp)
# 880~880
	lw t0, 68(sp)
	flw ft0, 4(t0)
	fsw ft0, 48(sp)
# 880~880
	addi t0, zero, 2
	sw t0, 144(sp)
# 880~880
	lw t0, 68(sp)
	flw ft0, 8(t0)
	fsw ft0, 120(sp)
# 880~880
	sw ra, -4(sp)
	lw a0, 76(sp)
	flw fa0, 96(sp)
	flw fa1, 48(sp)
	flw fa2, 120(sp)
	flw fa3, 12(sp)
	flw fa4, 8(sp)
	flw fa5, 84(sp)
	addi sp, sp, -4
	jal ra, bilinear.2561
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 882~882
	sw ra, -4(sp)
	lw a0, 76(sp)
	flw fa0, 12(sp)
	flw fa1, 8(sp)
	flw fa2, 84(sp)
	addi sp, sp, -4
	jal ra, quadratic.2556
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 160(sp)
# 883~883
	sw ra, -4(sp)
	lw a0, 76(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
# 883~883
	addi t0, zero, 3
	sw t0, 156(sp)
	lw t0, 100(sp)
	lw t1, 156(sp)
	beq t0, t1, ._31_then
# 883~883
	flw ft0, 160(sp)
	fsw ft0, 52(sp)
	beq zero, zero, ._31_final
._31_then:
# 883~883
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 112(sp)
# 883~883
	flw ft0, 160(sp)
	flw ft1, 112(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 52(sp)
._31_final:
# 885~885
	sw ra, -4(sp)
	flw fa0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 56(sp)
# 885~885
	flw ft0, 128(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 64(sp)
# 885~885
	flw ft0, 56(sp)
	flw ft1, 64(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 24(sp)
# 887~887
	sw ra, -4(sp)
	flw fa0, 24(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 108(sp)
# 887~893
	addi t0, zero, 0
	sw t0, 28(sp)
	lw t0, 108(sp)
	lw t1, 28(sp)
	beq t0, t1, ._32_then
# 888~888
	sw ra, -4(sp)
	flw fa0, 24(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 164(sp)
# 889~889
	sw ra, -4(sp)
	lw a0, 76(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 124(sp)
# 889~889
	addi t0, zero, 0
	sw t0, 148(sp)
	lw t0, 124(sp)
	lw t1, 148(sp)
	beq t0, t1, ._33_then
# 889~889
	flw ft0, 164(sp)
	fsw ft0, 72(sp)
	beq zero, zero, ._33_final
._33_then:
# 889~889
	sw ra, -4(sp)
	flw fa0, 164(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 72(sp)
._33_final:
# 890~890
	addi t0, zero, 0
	sw t0, 104(sp)
# 890~890
	flw ft0, 72(sp)
	flw ft1, 4(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 44(sp)
# 890~890
	flw ft0, 44(sp)
	flw ft1, 128(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 116(sp)
	lw t0, 60(sp)
	flw ft0, 116(sp)
	fsw ft0, 0(t0)
# 890~890
# 890~890
	addi t0, zero, 1
	sw t0, 92(sp)
	lw a0, 92(sp)
	addi sp, sp, 168
	ret
	beq zero, zero, ._32_final
._32_then:
# 893~893
	addi t0, zero, 0
	sw t0, 92(sp)
	lw a0, 92(sp)
	addi sp, sp, 168
	ret
._32_final:
._30_final:
solver.2575:
	addi sp, sp, -100
	sw a0, 16(sp)
	sw a1, 40(sp)
	sw a2, 44(sp)
	sw a3, 52(sp)
	lw t0, 52(sp)
	lw t1, 4(t0)
	sw t1, 4(sp)
	lw t1, 8(t0)
	sw t1, 68(sp)
	lw t1, 12(t0)
	sw t1, 12(sp)
	lw t1, 16(t0)
	sw t1, 60(sp)
# 899~899
	lw t0, 4(sp)
	lw t1, 16(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 20(sp)
# 901~901
	addi t0, zero, 0
	sw t0, 24(sp)
# 901~901
	lw t0, 44(sp)
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 901~901
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
# 901~901
	flw ft0, 80(sp)
	flw ft1, 76(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 36(sp)
# 902~902
	addi t0, zero, 1
	sw t0, 28(sp)
# 902~902
	lw t0, 44(sp)
	flw ft0, 4(t0)
	fsw ft0, 64(sp)
# 902~902
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_y.2461
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 92(sp)
# 902~902
	flw ft0, 64(sp)
	flw ft1, 92(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 0(sp)
# 903~903
	addi t0, zero, 2
	sw t0, 72(sp)
# 903~903
	lw t0, 44(sp)
	flw ft0, 8(t0)
	fsw ft0, 84(sp)
# 903~903
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 96(sp)
# 903~903
	flw ft0, 84(sp)
	flw ft1, 96(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 88(sp)
# 904~904
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 906~906
	addi t0, zero, 1
	sw t0, 48(sp)
	lw t0, 8(sp)
	lw t1, 48(sp)
	beq t0, t1, ._34_then
# 907~907
	addi t0, zero, 2
	sw t0, 56(sp)
	lw t0, 8(sp)
	lw t1, 56(sp)
	beq t0, t1, ._35_then
# 908~908
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 40(sp)
	flw fa0, 36(sp)
	flw fa1, 0(sp)
	flw fa2, 88(sp)
	lw a2, 12(sp)
	lw t0, 12(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 100
	ret
	beq zero, zero, ._35_final
._35_then:
# 907~907
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 40(sp)
	flw fa0, 36(sp)
	flw fa1, 0(sp)
	flw fa2, 88(sp)
	lw a2, 60(sp)
	lw t0, 60(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 100
	ret
._35_final:
	beq zero, zero, ._34_final
._34_then:
# 906~906
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 40(sp)
	flw fa0, 36(sp)
	flw fa1, 0(sp)
	flw fa2, 88(sp)
	lw a2, 68(sp)
	lw t0, 68(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 100
	ret
._34_final:
solver_rect_fast.2579:
	addi sp, sp, -396
	sw a0, 168(sp)
	sw a1, 124(sp)
	sw a2, 300(sp)
	fsw fa0, 196(sp)
	fsw fa1, 28(sp)
	fsw fa2, 272(sp)
	sw a3, 276(sp)
	lw t0, 276(sp)
	lw t1, 4(t0)
	sw t1, 268(sp)
# 916~916
	addi t0, zero, 0
	sw t0, 324(sp)
# 916~916
	lw t0, 300(sp)
	flw ft0, 0(t0)
	fsw ft0, 368(sp)
# 916~916
	flw ft0, 368(sp)
	flw ft1, 196(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 36(sp)
# 916~916
	addi t0, zero, 1
	sw t0, 228(sp)
# 916~916
	lw t0, 300(sp)
	flw ft0, 4(t0)
	fsw ft0, 76(sp)
# 916~916
	flw ft0, 36(sp)
	flw ft1, 76(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 156(sp)
# 918~918
	addi t0, zero, 1
	sw t0, 360(sp)
# 918~918
	lw t0, 124(sp)
	flw ft0, 4(t0)
	fsw ft0, 340(sp)
# 918~918
	flw ft0, 156(sp)
	flw ft1, 340(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 48(sp)
# 918~918
	flw ft0, 48(sp)
	flw ft1, 28(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 304(sp)
# 918~918
	sw ra, -4(sp)
	flw fa0, 304(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 204(sp)
# 918~918
	sw ra, -4(sp)
	lw a0, 168(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 918~918
	sw ra, -4(sp)
	flw fa0, 204(sp)
	flw fa1, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 132(sp)
# 918~922
	addi t0, zero, 0
	sw t0, 152(sp)
	lw t0, 132(sp)
	lw t1, 152(sp)
	beq t0, t1, ._36_then
# 919~919
	addi t0, zero, 2
	sw t0, 308(sp)
# 919~919
	lw t0, 124(sp)
	flw ft0, 8(t0)
	fsw ft0, 224(sp)
# 919~919
	flw ft0, 156(sp)
	flw ft1, 224(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 236(sp)
# 919~919
	flw ft0, 236(sp)
	flw ft1, 272(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 72(sp)
# 919~919
	sw ra, -4(sp)
	flw fa0, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 919~919
	sw ra, -4(sp)
	lw a0, 168(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 180(sp)
# 919~919
	sw ra, -4(sp)
	flw fa0, 4(sp)
	flw fa1, 180(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 144(sp)
# 919~921
	addi t0, zero, 0
	sw t0, 24(sp)
	lw t0, 144(sp)
	lw t1, 24(sp)
	beq t0, t1, ._37_then
# 920~920
	addi t0, zero, 1
	sw t0, 184(sp)
# 920~920
	lw t0, 300(sp)
	flw ft0, 4(t0)
	fsw ft0, 356(sp)
# 920~920
	sw ra, -4(sp)
	flw fa0, 356(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 288(sp)
# 920~920
	addi t0, zero, 0
	sw t0, 364(sp)
	lw t0, 288(sp)
	lw t1, 364(sp)
	beq t0, t1, ._38_then
# 920~920
	addi t0, zero, 0
	sw t0, 280(sp)
	beq zero, zero, ._38_final
._38_then:
# 920~920
	addi t0, zero, 1
	sw t0, 280(sp)
._38_final:
	beq zero, zero, ._37_final
._37_then:
# 921~921
	addi t0, zero, 0
	sw t0, 280(sp)
._37_final:
	beq zero, zero, ._36_final
._36_then:
# 922~922
	addi t0, zero, 0
	sw t0, 280(sp)
._36_final:
# 917~944
	addi t0, zero, 0
	sw t0, 60(sp)
	lw t0, 280(sp)
	lw t1, 60(sp)
	beq t0, t1, ._39_then
# 924~924
	addi t0, zero, 0
	sw t0, 208(sp)
	lw t0, 268(sp)
	flw ft0, 156(sp)
	fsw ft0, 0(t0)
# 924~924
# 924~924
	addi t0, zero, 1
	sw t0, 188(sp)
	lw a0, 188(sp)
	addi sp, sp, 396
	ret
	beq zero, zero, ._39_final
._39_then:
# 925~925
	addi t0, zero, 2
	sw t0, 52(sp)
# 925~925
	lw t0, 300(sp)
	flw ft0, 8(t0)
	fsw ft0, 380(sp)
# 925~925
	flw ft0, 380(sp)
	flw ft1, 28(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 64(sp)
# 925~925
	addi t0, zero, 3
	sw t0, 296(sp)
# 925~925
	lw t0, 300(sp)
	flw ft0, 12(t0)
	fsw ft0, 32(sp)
# 925~925
	flw ft0, 64(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 248(sp)
# 927~927
	addi t0, zero, 0
	sw t0, 128(sp)
# 927~927
	lw t0, 124(sp)
	flw ft0, 0(t0)
	fsw ft0, 260(sp)
# 927~927
	flw ft0, 248(sp)
	flw ft1, 260(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 96(sp)
# 927~927
	flw ft0, 96(sp)
	flw ft1, 196(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 320(sp)
# 927~927
	sw ra, -4(sp)
	flw fa0, 320(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 344(sp)
# 927~927
	sw ra, -4(sp)
	lw a0, 168(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 292(sp)
# 927~927
	sw ra, -4(sp)
	flw fa0, 344(sp)
	flw fa1, 292(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 927~931
	addi t0, zero, 0
	sw t0, 200(sp)
	lw t0, 40(sp)
	lw t1, 200(sp)
	beq t0, t1, ._40_then
# 928~928
	addi t0, zero, 2
	sw t0, 252(sp)
# 928~928
	lw t0, 124(sp)
	flw ft0, 8(t0)
	fsw ft0, 160(sp)
# 928~928
	flw ft0, 248(sp)
	flw ft1, 160(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 164(sp)
# 928~928
	flw ft0, 164(sp)
	flw ft1, 272(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 20(sp)
# 928~928
	sw ra, -4(sp)
	flw fa0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 172(sp)
# 928~928
	sw ra, -4(sp)
	lw a0, 168(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 176(sp)
# 928~928
	sw ra, -4(sp)
	flw fa0, 172(sp)
	flw fa1, 176(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 928~930
	addi t0, zero, 0
	sw t0, 328(sp)
	lw t0, 56(sp)
	lw t1, 328(sp)
	beq t0, t1, ._41_then
# 929~929
	addi t0, zero, 3
	sw t0, 12(sp)
# 929~929
	lw t0, 300(sp)
	flw ft0, 12(t0)
	fsw ft0, 212(sp)
# 929~929
	sw ra, -4(sp)
	flw fa0, 212(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 216(sp)
# 929~929
	addi t0, zero, 0
	sw t0, 240(sp)
	lw t0, 216(sp)
	lw t1, 240(sp)
	beq t0, t1, ._42_then
# 929~929
	addi t0, zero, 0
	sw t0, 120(sp)
	beq zero, zero, ._42_final
._42_then:
# 929~929
	addi t0, zero, 1
	sw t0, 120(sp)
._42_final:
	beq zero, zero, ._41_final
._41_then:
# 930~930
	addi t0, zero, 0
	sw t0, 120(sp)
._41_final:
	beq zero, zero, ._40_final
._40_then:
# 931~931
	addi t0, zero, 0
	sw t0, 120(sp)
._40_final:
# 926~944
	addi t0, zero, 0
	sw t0, 112(sp)
	lw t0, 120(sp)
	lw t1, 112(sp)
	beq t0, t1, ._43_then
# 933~933
	addi t0, zero, 0
	sw t0, 256(sp)
	lw t0, 268(sp)
	flw ft0, 248(sp)
	fsw ft0, 0(t0)
# 933~933
# 933~933
	addi t0, zero, 2
	sw t0, 188(sp)
	lw a0, 188(sp)
	addi sp, sp, 396
	ret
	beq zero, zero, ._43_final
._43_then:
# 934~934
	addi t0, zero, 4
	sw t0, 392(sp)
# 934~934
	lw t0, 300(sp)
	flw ft0, 16(t0)
	fsw ft0, 100(sp)
# 934~934
	flw ft0, 100(sp)
	flw ft1, 272(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 348(sp)
# 934~934
	addi t0, zero, 5
	sw t0, 68(sp)
# 934~934
	lw t0, 300(sp)
	flw ft0, 20(t0)
	fsw ft0, 80(sp)
# 934~934
	flw ft0, 348(sp)
	flw ft1, 80(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 192(sp)
# 936~936
	addi t0, zero, 0
	sw t0, 116(sp)
# 936~936
	lw t0, 124(sp)
	flw ft0, 0(t0)
	fsw ft0, 384(sp)
# 936~936
	flw ft0, 192(sp)
	flw ft1, 384(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 104(sp)
# 936~936
	flw ft0, 104(sp)
	flw ft1, 196(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 84(sp)
# 936~936
	sw ra, -4(sp)
	flw fa0, 84(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 136(sp)
# 936~936
	sw ra, -4(sp)
	lw a0, 168(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 332(sp)
# 936~936
	sw ra, -4(sp)
	flw fa0, 136(sp)
	flw fa1, 332(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 372(sp)
# 936~940
	addi t0, zero, 0
	sw t0, 88(sp)
	lw t0, 372(sp)
	lw t1, 88(sp)
	beq t0, t1, ._44_then
# 937~937
	addi t0, zero, 1
	sw t0, 244(sp)
# 937~937
	lw t0, 124(sp)
	flw ft0, 4(t0)
	fsw ft0, 312(sp)
# 937~937
	flw ft0, 192(sp)
	flw ft1, 312(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 92(sp)
# 937~937
	flw ft0, 92(sp)
	flw ft1, 28(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 220(sp)
# 937~937
	sw ra, -4(sp)
	flw fa0, 220(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 140(sp)
# 937~937
	sw ra, -4(sp)
	lw a0, 168(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 388(sp)
# 937~937
	sw ra, -4(sp)
	flw fa0, 140(sp)
	flw fa1, 388(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 352(sp)
# 937~939
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 352(sp)
	lw t1, 16(sp)
	beq t0, t1, ._45_then
# 938~938
	addi t0, zero, 5
	sw t0, 108(sp)
# 938~938
	lw t0, 300(sp)
	flw ft0, 20(t0)
	fsw ft0, 376(sp)
# 938~938
	sw ra, -4(sp)
	flw fa0, 376(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 264(sp)
# 938~938
	addi t0, zero, 0
	sw t0, 8(sp)
	lw t0, 264(sp)
	lw t1, 8(sp)
	beq t0, t1, ._46_then
# 938~938
	addi t0, zero, 0
	sw t0, 336(sp)
	beq zero, zero, ._46_final
._46_then:
# 938~938
	addi t0, zero, 1
	sw t0, 336(sp)
._46_final:
	beq zero, zero, ._45_final
._45_then:
# 939~939
	addi t0, zero, 0
	sw t0, 336(sp)
._45_final:
	beq zero, zero, ._44_final
._44_then:
# 940~940
	addi t0, zero, 0
	sw t0, 336(sp)
._44_final:
# 935~944
	addi t0, zero, 0
	sw t0, 148(sp)
	lw t0, 336(sp)
	lw t1, 148(sp)
	beq t0, t1, ._47_then
# 942~942
	addi t0, zero, 0
	sw t0, 316(sp)
	lw t0, 268(sp)
	flw ft0, 192(sp)
	fsw ft0, 0(t0)
# 942~942
# 942~942
	addi t0, zero, 3
	sw t0, 188(sp)
	lw a0, 188(sp)
	addi sp, sp, 396
	ret
	beq zero, zero, ._47_final
._47_then:
# 944~944
	addi t0, zero, 0
	sw t0, 188(sp)
	lw a0, 188(sp)
	addi sp, sp, 396
	ret
._47_final:
._43_final:
._39_final:
solver_surface_fast.2586:
	addi sp, sp, -100
	sw a0, 32(sp)
	sw a1, 68(sp)
	fsw fa0, 60(sp)
	fsw fa1, 36(sp)
	fsw fa2, 28(sp)
	sw a2, 48(sp)
	lw t0, 48(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
# 949~949
	addi t0, zero, 0
	sw t0, 80(sp)
# 949~949
	lw t0, 68(sp)
	flw ft0, 0(t0)
	fsw ft0, 76(sp)
# 949~949
	sw ra, -4(sp)
	flw fa0, 76(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 949~953
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 72(sp)
	lw t1, 16(sp)
	beq t0, t1, ._48_then
# 950~950
	addi t0, zero, 0
	sw t0, 96(sp)
# 951~951
	addi t0, zero, 1
	sw t0, 4(sp)
# 951~951
	lw t0, 68(sp)
	flw ft0, 4(t0)
	fsw ft0, 84(sp)
# 951~951
	flw ft0, 84(sp)
	flw ft1, 60(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
# 951~951
	addi t0, zero, 2
	sw t0, 64(sp)
# 951~951
	lw t0, 68(sp)
	flw ft0, 8(t0)
	fsw ft0, 44(sp)
# 951~951
	flw ft0, 44(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 88(sp)
# 951~951
	flw ft0, 24(sp)
	flw ft1, 88(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 92(sp)
# 951~951
	addi t0, zero, 3
	sw t0, 40(sp)
# 951~951
	lw t0, 68(sp)
	flw ft0, 12(t0)
	fsw ft0, 0(sp)
# 951~951
	flw ft0, 0(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 8(sp)
# 951~951
	flw ft0, 92(sp)
	flw ft1, 8(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 20(sp)
	lw t0, 12(sp)
	flw ft0, 20(sp)
	fsw ft0, 0(t0)
# 950~951
# 952~952
	addi t0, zero, 1
	sw t0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 100
	ret
	beq zero, zero, ._48_final
._48_then:
# 953~953
	addi t0, zero, 0
	sw t0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 100
	ret
._48_final:
solver_second_fast.2592:
	addi sp, sp, -192
	sw a0, 116(sp)
	sw a1, 168(sp)
	fsw fa0, 84(sp)
	fsw fa1, 16(sp)
	fsw fa2, 136(sp)
	sw a2, 144(sp)
	lw t0, 144(sp)
	lw t1, 4(t0)
	sw t1, 132(sp)
# 959~959
	addi t0, zero, 0
	sw t0, 20(sp)
# 959~959
	lw t0, 168(sp)
	flw ft0, 0(t0)
	fsw ft0, 120(sp)
# 960~960
	sw ra, -4(sp)
	flw fa0, 120(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 960~973
	addi t0, zero, 0
	sw t0, 52(sp)
	lw t0, 24(sp)
	lw t1, 52(sp)
	beq t0, t1, ._49_then
# 961~961
	addi t0, zero, 0
	sw t0, 80(sp)
	lw a0, 80(sp)
	addi sp, sp, 192
	ret
	beq zero, zero, ._49_final
._49_then:
# 963~963
	addi t0, zero, 1
	sw t0, 100(sp)
# 963~963
	lw t0, 168(sp)
	flw ft0, 4(t0)
	fsw ft0, 96(sp)
# 963~963
	flw ft0, 96(sp)
	flw ft1, 84(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 176(sp)
# 963~963
	addi t0, zero, 2
	sw t0, 72(sp)
# 963~963
	lw t0, 168(sp)
	flw ft0, 8(t0)
	fsw ft0, 88(sp)
# 963~963
	flw ft0, 88(sp)
	flw ft1, 16(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 104(sp)
# 963~963
	flw ft0, 176(sp)
	flw ft1, 104(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 140(sp)
# 963~963
	addi t0, zero, 3
	sw t0, 32(sp)
# 963~963
	lw t0, 168(sp)
	flw ft0, 12(t0)
	fsw ft0, 164(sp)
# 963~963
	flw ft0, 164(sp)
	flw ft1, 136(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 0(sp)
# 963~963
	flw ft0, 140(sp)
	flw ft1, 0(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 148(sp)
# 964~964
	sw ra, -4(sp)
	lw a0, 116(sp)
	flw fa0, 84(sp)
	flw fa1, 16(sp)
	flw fa2, 136(sp)
	addi sp, sp, -4
	jal ra, quadratic.2556
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
# 965~965
	sw ra, -4(sp)
	lw a0, 116(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
# 965~965
	addi t0, zero, 3
	sw t0, 180(sp)
	lw t0, 64(sp)
	lw t1, 180(sp)
	beq t0, t1, ._50_then
# 965~965
	flw ft0, 76(sp)
	fsw ft0, 36(sp)
	beq zero, zero, ._50_final
._50_then:
# 965~965
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 124(sp)
# 965~965
	flw ft0, 76(sp)
	flw ft1, 124(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 36(sp)
._50_final:
# 966~966
	sw ra, -4(sp)
	flw fa0, 148(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 184(sp)
# 966~966
	flw ft0, 120(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 108(sp)
# 966~966
	flw ft0, 184(sp)
	flw ft1, 108(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 8(sp)
# 967~967
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 112(sp)
# 967~973
	addi t0, zero, 0
	sw t0, 56(sp)
	lw t0, 112(sp)
	lw t1, 56(sp)
	beq t0, t1, ._51_then
# 968~968
	sw ra, -4(sp)
	lw a0, 116(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 128(sp)
# 968~971
	addi t0, zero, 0
	sw t0, 40(sp)
	lw t0, 128(sp)
	lw t1, 40(sp)
	beq t0, t1, ._52_then
# 969~969
	addi t0, zero, 0
	sw t0, 172(sp)
# 969~969
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 152(sp)
# 969~969
	flw ft0, 148(sp)
	flw ft1, 152(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 92(sp)
# 969~969
	addi t0, zero, 4
	sw t0, 156(sp)
# 969~969
	lw t0, 168(sp)
	flw ft0, 16(t0)
	fsw ft0, 60(sp)
# 969~969
	flw ft0, 92(sp)
	flw ft1, 60(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 44(sp)
	lw t0, 132(sp)
	flw ft0, 44(sp)
	fsw ft0, 0(t0)
# 969~969
	beq zero, zero, ._52_final
._52_then:
# 971~971
	addi t0, zero, 0
	sw t0, 48(sp)
# 971~971
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 971~971
	flw ft0, 148(sp)
	flw ft1, 12(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 68(sp)
# 971~971
	addi t0, zero, 4
	sw t0, 188(sp)
# 971~971
	lw t0, 168(sp)
	flw ft0, 16(t0)
	fsw ft0, 160(sp)
# 971~971
	flw ft0, 68(sp)
	flw ft1, 160(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 4(sp)
	lw t0, 132(sp)
	flw ft0, 4(sp)
	fsw ft0, 0(t0)
# 971~971
._52_final:
# 972~972
	addi t0, zero, 1
	sw t0, 80(sp)
	lw a0, 80(sp)
	addi sp, sp, 192
	ret
	beq zero, zero, ._51_final
._51_then:
# 973~973
	addi t0, zero, 0
	sw t0, 80(sp)
	lw a0, 80(sp)
	addi sp, sp, 192
	ret
._51_final:
._49_final:
solver_fast.2598:
	addi sp, sp, -112
	sw a0, 84(sp)
	sw a1, 56(sp)
	sw a2, 28(sp)
	sw a3, 4(sp)
	lw t0, 4(sp)
	lw t1, 4(t0)
	sw t1, 8(sp)
	lw t1, 8(t0)
	sw t1, 104(sp)
	lw t1, 12(t0)
	sw t1, 12(sp)
	lw t1, 16(t0)
	sw t1, 108(sp)
# 978~978
	lw t0, 8(sp)
	lw t1, 84(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 68(sp)
# 979~979
	addi t0, zero, 0
	sw t0, 88(sp)
# 979~979
	lw t0, 28(sp)
	flw ft0, 0(t0)
	fsw ft0, 72(sp)
# 979~979
	sw ra, -4(sp)
	lw a0, 68(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
# 979~979
	flw ft0, 72(sp)
	flw ft1, 76(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 48(sp)
# 980~980
	addi t0, zero, 1
	sw t0, 40(sp)
# 980~980
	lw t0, 28(sp)
	flw ft0, 4(t0)
	fsw ft0, 32(sp)
# 980~980
	sw ra, -4(sp)
	lw a0, 68(sp)
	addi sp, sp, -4
	jal ra, o_param_y.2461
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 20(sp)
# 980~980
	flw ft0, 32(sp)
	flw ft1, 20(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 64(sp)
# 981~981
	addi t0, zero, 2
	sw t0, 36(sp)
# 981~981
	lw t0, 28(sp)
	flw ft0, 8(t0)
	fsw ft0, 44(sp)
# 981~981
	sw ra, -4(sp)
	lw a0, 68(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 52(sp)
# 981~981
	flw ft0, 44(sp)
	flw ft1, 52(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 60(sp)
# 982~982
	sw ra, -4(sp)
	lw a0, 56(sp)
	addi sp, sp, -4
	jal ra, d_const.2504
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 983~983
	lw t0, 0(sp)
	lw t1, 84(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 16(sp)
# 984~984
	sw ra, -4(sp)
	lw a0, 68(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 985~985
	addi t0, zero, 1
	sw t0, 100(sp)
	lw t0, 96(sp)
	lw t1, 100(sp)
	beq t0, t1, ._53_then
# 987~987
	addi t0, zero, 2
	sw t0, 80(sp)
	lw t0, 96(sp)
	lw t1, 80(sp)
	beq t0, t1, ._54_then
# 990~990
	sw ra, -4(sp)
	lw a0, 68(sp)
	lw a1, 16(sp)
	flw fa0, 48(sp)
	flw fa1, 64(sp)
	flw fa2, 60(sp)
	lw a2, 12(sp)
	lw t0, 12(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 112
	ret
	beq zero, zero, ._54_final
._54_then:
# 988~988
	sw ra, -4(sp)
	lw a0, 68(sp)
	lw a1, 16(sp)
	flw fa0, 48(sp)
	flw fa1, 64(sp)
	flw fa2, 60(sp)
	lw a2, 108(sp)
	lw t0, 108(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 112
	ret
._54_final:
	beq zero, zero, ._53_final
._53_then:
# 986~986
	sw ra, -4(sp)
	lw a0, 56(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 986~986
	sw ra, -4(sp)
	lw a0, 68(sp)
	lw a1, 92(sp)
	lw a2, 16(sp)
	flw fa0, 48(sp)
	flw fa1, 64(sp)
	flw fa2, 60(sp)
	lw a3, 104(sp)
	lw t0, 104(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 112
	ret
._53_final:
solver_surface_fast2.2602:
	addi sp, sp, -80
	sw a0, 56(sp)
	sw a1, 68(sp)
	sw a2, 72(sp)
	fsw fa0, 4(sp)
	fsw fa1, 32(sp)
	fsw fa2, 8(sp)
	sw a3, 44(sp)
	lw t0, 44(sp)
	lw t1, 4(t0)
	sw t1, 36(sp)
# 998~998
	addi t0, zero, 0
	sw t0, 64(sp)
# 998~998
	lw t0, 68(sp)
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
# 998~998
	sw ra, -4(sp)
	flw fa0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 998~1001
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 0(sp)
	lw t1, 12(sp)
	beq t0, t1, ._55_then
# 999~999
	addi t0, zero, 0
	sw t0, 16(sp)
# 999~999
	addi t0, zero, 0
	sw t0, 40(sp)
# 999~999
	lw t0, 68(sp)
	flw ft0, 0(t0)
	fsw ft0, 24(sp)
# 999~999
	addi t0, zero, 3
	sw t0, 52(sp)
# 999~999
	lw t0, 72(sp)
	flw ft0, 12(t0)
	fsw ft0, 60(sp)
# 999~999
	flw ft0, 24(sp)
	flw ft1, 60(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
	lw t0, 36(sp)
	flw ft0, 28(sp)
	fsw ft0, 0(t0)
# 999~999
# 1000~1000
	addi t0, zero, 1
	sw t0, 48(sp)
	lw a0, 48(sp)
	addi sp, sp, 80
	ret
	beq zero, zero, ._55_final
._55_then:
# 1001~1001
	addi t0, zero, 0
	sw t0, 48(sp)
	lw a0, 48(sp)
	addi sp, sp, 80
	ret
._55_final:
solver_second_fast2.2609:
	addi sp, sp, -184
	sw a0, 100(sp)
	sw a1, 0(sp)
	sw a2, 180(sp)
	fsw fa0, 84(sp)
	fsw fa1, 128(sp)
	fsw fa2, 64(sp)
	sw a3, 116(sp)
	lw t0, 116(sp)
	lw t1, 4(t0)
	sw t1, 172(sp)
# 1007~1007
	addi t0, zero, 0
	sw t0, 28(sp)
# 1007~1007
	lw t0, 0(sp)
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
# 1008~1008
	sw ra, -4(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 108(sp)
# 1008~1020
	addi t0, zero, 0
	sw t0, 36(sp)
	lw t0, 108(sp)
	lw t1, 36(sp)
	beq t0, t1, ._56_then
# 1009~1009
	addi t0, zero, 0
	sw t0, 160(sp)
	lw a0, 160(sp)
	addi sp, sp, 184
	ret
	beq zero, zero, ._56_final
._56_then:
# 1011~1011
	addi t0, zero, 1
	sw t0, 68(sp)
# 1011~1011
	lw t0, 0(sp)
	flw ft0, 4(t0)
	fsw ft0, 124(sp)
# 1011~1011
	flw ft0, 124(sp)
	flw ft1, 84(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 72(sp)
# 1011~1011
	addi t0, zero, 2
	sw t0, 152(sp)
# 1011~1011
	lw t0, 0(sp)
	flw ft0, 8(t0)
	fsw ft0, 168(sp)
# 1011~1011
	flw ft0, 168(sp)
	flw ft1, 128(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 120(sp)
# 1011~1011
	flw ft0, 72(sp)
	flw ft1, 120(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 4(sp)
# 1011~1011
	addi t0, zero, 3
	sw t0, 132(sp)
# 1011~1011
	lw t0, 0(sp)
	flw ft0, 12(t0)
	fsw ft0, 44(sp)
# 1011~1011
	flw ft0, 44(sp)
	flw ft1, 64(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 136(sp)
# 1011~1011
	flw ft0, 4(sp)
	flw ft1, 136(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 40(sp)
# 1012~1012
	addi t0, zero, 3
	sw t0, 24(sp)
# 1012~1012
	lw t0, 180(sp)
	flw ft0, 12(t0)
	fsw ft0, 32(sp)
# 1013~1013
	sw ra, -4(sp)
	flw fa0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 176(sp)
# 1013~1013
	flw ft0, 12(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 76(sp)
# 1013~1013
	flw ft0, 176(sp)
	flw ft1, 76(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 8(sp)
# 1014~1014
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
# 1014~1020
	addi t0, zero, 0
	sw t0, 104(sp)
	lw t0, 80(sp)
	lw t1, 104(sp)
	beq t0, t1, ._57_then
# 1015~1015
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1015~1018
	addi t0, zero, 0
	sw t0, 164(sp)
	lw t0, 16(sp)
	lw t1, 164(sp)
	beq t0, t1, ._58_then
# 1016~1016
	addi t0, zero, 0
	sw t0, 156(sp)
# 1016~1016
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 48(sp)
# 1016~1016
	flw ft0, 40(sp)
	flw ft1, 48(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 20(sp)
# 1016~1016
	addi t0, zero, 4
	sw t0, 140(sp)
# 1016~1016
	lw t0, 0(sp)
	flw ft0, 16(t0)
	fsw ft0, 96(sp)
# 1016~1016
	flw ft0, 20(sp)
	flw ft1, 96(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 52(sp)
	lw t0, 172(sp)
	flw ft0, 52(sp)
	fsw ft0, 0(t0)
# 1016~1016
	beq zero, zero, ._58_final
._58_then:
# 1018~1018
	addi t0, zero, 0
	sw t0, 56(sp)
# 1018~1018
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 60(sp)
# 1018~1018
	flw ft0, 40(sp)
	flw ft1, 60(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 92(sp)
# 1018~1018
	addi t0, zero, 4
	sw t0, 112(sp)
# 1018~1018
	lw t0, 0(sp)
	flw ft0, 16(t0)
	fsw ft0, 144(sp)
# 1018~1018
	flw ft0, 92(sp)
	flw ft1, 144(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 148(sp)
	lw t0, 172(sp)
	flw ft0, 148(sp)
	fsw ft0, 0(t0)
# 1018~1018
._58_final:
# 1019~1019
	addi t0, zero, 1
	sw t0, 160(sp)
	lw a0, 160(sp)
	addi sp, sp, 184
	ret
	beq zero, zero, ._57_final
._57_then:
# 1020~1020
	addi t0, zero, 0
	sw t0, 160(sp)
	lw a0, 160(sp)
	addi sp, sp, 184
	ret
._57_final:
._56_final:
solver_fast2.2616:
	addi sp, sp, -88
	sw a0, 76(sp)
	sw a1, 8(sp)
	sw a2, 64(sp)
	lw t0, 64(sp)
	lw t1, 4(t0)
	sw t1, 44(sp)
	lw t1, 8(t0)
	sw t1, 28(sp)
	lw t1, 12(t0)
	sw t1, 4(sp)
	lw t1, 16(t0)
	sw t1, 60(sp)
# 1025~1025
	lw t0, 44(sp)
	lw t1, 76(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 52(sp)
# 1026~1026
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, o_param_ctbl.2481
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 1027~1027
	addi t0, zero, 0
	sw t0, 20(sp)
# 1027~1027
	lw t0, 0(sp)
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
# 1028~1028
	addi t0, zero, 1
	sw t0, 68(sp)
# 1028~1028
	lw t0, 0(sp)
	flw ft0, 4(t0)
	fsw ft0, 16(sp)
# 1029~1029
	addi t0, zero, 2
	sw t0, 24(sp)
# 1029~1029
	lw t0, 0(sp)
	flw ft0, 8(t0)
	fsw ft0, 48(sp)
# 1030~1030
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, d_const.2504
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 1031~1031
	lw t0, 72(sp)
	lw t1, 76(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 56(sp)
# 1032~1032
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
# 1033~1033
	addi t0, zero, 1
	sw t0, 84(sp)
	lw t0, 80(sp)
	lw t1, 84(sp)
	beq t0, t1, ._59_then
# 1035~1035
	addi t0, zero, 2
	sw t0, 36(sp)
	lw t0, 80(sp)
	lw t1, 36(sp)
	beq t0, t1, ._60_then
# 1038~1038
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 56(sp)
	lw a2, 0(sp)
	flw fa0, 12(sp)
	flw fa1, 16(sp)
	flw fa2, 48(sp)
	lw a3, 4(sp)
	lw t0, 4(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 88
	ret
	beq zero, zero, ._60_final
._60_then:
# 1036~1036
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 56(sp)
	lw a2, 0(sp)
	flw fa0, 12(sp)
	flw fa1, 16(sp)
	flw fa2, 48(sp)
	lw a3, 60(sp)
	lw t0, 60(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 88
	ret
._60_final:
	beq zero, zero, ._59_final
._59_then:
# 1034~1034
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1034~1034
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 32(sp)
	lw a2, 56(sp)
	flw fa0, 12(sp)
	flw fa1, 16(sp)
	flw fa2, 48(sp)
	lw a3, 28(sp)
	lw t0, 28(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 88
	ret
._59_final:
setup_rect_table.2619:
	addi sp, sp, -276
	sw a0, 180(sp)
	sw a1, 192(sp)
# 1045~1045
	addi t0, zero, 6
	sw t0, 136(sp)
# 1045~1045
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 212(sp)
# 1045~1045
	sw ra, -4(sp)
	lw a0, 136(sp)
	flw fa0, 212(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 120(sp)
# 1047~1047
	addi t0, zero, 0
	sw t0, 156(sp)
# 1047~1047
	lw t0, 180(sp)
	flw ft0, 0(t0)
	fsw ft0, 256(sp)
# 1047~1047
	sw ra, -4(sp)
	flw fa0, 256(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1047~1054
	addi t0, zero, 0
	sw t0, 100(sp)
	lw t0, 56(sp)
	lw t1, 100(sp)
	beq t0, t1, ._61_then
# 1048~1048
	addi t0, zero, 1
	sw t0, 60(sp)
# 1048~1048
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 88(sp)
	lw t0, 120(sp)
	flw ft0, 88(sp)
	fsw ft0, 4(t0)
# 1048~1048
	beq zero, zero, ._61_final
._61_then:
# 1051~1051
	addi t0, zero, 0
	sw t0, 260(sp)
# 1051~1051
	sw ra, -4(sp)
	lw a0, 192(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 228(sp)
# 1051~1051
	addi t0, zero, 0
	sw t0, 168(sp)
# 1051~1051
	lw t0, 180(sp)
	flw ft0, 0(t0)
	fsw ft0, 244(sp)
# 1051~1051
	sw ra, -4(sp)
	flw fa0, 244(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 232(sp)
# 1051~1051
	sw ra, -4(sp)
	lw a0, 228(sp)
	lw a1, 232(sp)
	addi sp, sp, -4
	jal ra, min_caml_xor
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 236(sp)
# 1051~1051
	sw ra, -4(sp)
	lw a0, 192(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 1051~1051
	sw ra, -4(sp)
	lw a0, 236(sp)
	flw fa0, 44(sp)
	addi sp, sp, -4
	jal ra, fneg_cond.2397
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 80(sp)
	lw t0, 120(sp)
	flw ft0, 80(sp)
	fsw ft0, 0(t0)
# 1051~1051
# 1053~1053
	addi t0, zero, 1
	sw t0, 8(sp)
# 1053~1053
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 104(sp)
# 1053~1053
	addi t0, zero, 0
	sw t0, 216(sp)
# 1053~1053
	lw t0, 180(sp)
	flw ft0, 0(t0)
	fsw ft0, 64(sp)
# 1053~1053
	flw ft0, 104(sp)
	flw ft1, 64(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 76(sp)
	lw t0, 120(sp)
	flw ft0, 76(sp)
	fsw ft0, 4(t0)
# 1053~1053
._61_final:
# 1055~1055
	addi t0, zero, 1
	sw t0, 124(sp)
# 1055~1055
	lw t0, 180(sp)
	flw ft0, 4(t0)
	fsw ft0, 20(sp)
# 1055~1055
	sw ra, -4(sp)
	flw fa0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 1055~1060
	addi t0, zero, 0
	sw t0, 208(sp)
	lw t0, 40(sp)
	lw t1, 208(sp)
	beq t0, t1, ._62_then
# 1056~1056
	addi t0, zero, 3
	sw t0, 0(sp)
# 1056~1056
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 196(sp)
	lw t0, 120(sp)
	flw ft0, 196(sp)
	fsw ft0, 12(t0)
# 1056~1056
	beq zero, zero, ._62_final
._62_then:
# 1058~1058
	addi t0, zero, 2
	sw t0, 164(sp)
# 1058~1058
	sw ra, -4(sp)
	lw a0, 192(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1058~1058
	addi t0, zero, 1
	sw t0, 152(sp)
# 1058~1058
	lw t0, 180(sp)
	flw ft0, 4(t0)
	fsw ft0, 108(sp)
# 1058~1058
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 172(sp)
# 1058~1058
	sw ra, -4(sp)
	lw a0, 32(sp)
	lw a1, 172(sp)
	addi sp, sp, -4
	jal ra, min_caml_xor
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 200(sp)
# 1058~1058
	sw ra, -4(sp)
	lw a0, 192(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 16(sp)
# 1058~1058
	sw ra, -4(sp)
	lw a0, 200(sp)
	flw fa0, 16(sp)
	addi sp, sp, -4
	jal ra, fneg_cond.2397
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 84(sp)
	lw t0, 120(sp)
	flw ft0, 84(sp)
	fsw ft0, 8(t0)
# 1058~1058
# 1059~1059
	addi t0, zero, 3
	sw t0, 28(sp)
# 1059~1059
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 128(sp)
# 1059~1059
	addi t0, zero, 1
	sw t0, 184(sp)
# 1059~1059
	lw t0, 180(sp)
	flw ft0, 4(t0)
	fsw ft0, 264(sp)
# 1059~1059
	flw ft0, 128(sp)
	flw ft1, 264(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 4(sp)
	lw t0, 120(sp)
	flw ft0, 4(sp)
	fsw ft0, 12(t0)
# 1059~1059
._62_final:
# 1061~1061
	addi t0, zero, 2
	sw t0, 148(sp)
# 1061~1061
	lw t0, 180(sp)
	flw ft0, 8(t0)
	fsw ft0, 36(sp)
# 1061~1061
	sw ra, -4(sp)
	flw fa0, 36(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 188(sp)
# 1061~1066
	addi t0, zero, 0
	sw t0, 68(sp)
	lw t0, 188(sp)
	lw t1, 68(sp)
	beq t0, t1, ._63_then
# 1062~1062
	addi t0, zero, 5
	sw t0, 140(sp)
# 1062~1062
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 144(sp)
	lw t0, 120(sp)
	flw ft0, 144(sp)
	fsw ft0, 20(t0)
# 1062~1062
	beq zero, zero, ._63_final
._63_then:
# 1064~1064
	addi t0, zero, 4
	sw t0, 72(sp)
# 1064~1064
	sw ra, -4(sp)
	lw a0, 192(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 1064~1064
	addi t0, zero, 2
	sw t0, 112(sp)
# 1064~1064
	lw t0, 180(sp)
	flw ft0, 8(t0)
	fsw ft0, 268(sp)
# 1064~1064
	sw ra, -4(sp)
	flw fa0, 268(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 1064~1064
	sw ra, -4(sp)
	lw a0, 48(sp)
	lw a1, 96(sp)
	addi sp, sp, -4
	jal ra, min_caml_xor
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 240(sp)
# 1064~1064
	sw ra, -4(sp)
	lw a0, 192(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 132(sp)
# 1064~1064
	sw ra, -4(sp)
	lw a0, 240(sp)
	flw fa0, 132(sp)
	addi sp, sp, -4
	jal ra, fneg_cond.2397
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
	lw t0, 120(sp)
	flw ft0, 24(sp)
	fsw ft0, 16(t0)
# 1064~1064
# 1065~1065
	addi t0, zero, 5
	sw t0, 92(sp)
# 1065~1065
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 272(sp)
# 1065~1065
	addi t0, zero, 2
	sw t0, 116(sp)
# 1065~1065
	lw t0, 180(sp)
	flw ft0, 8(t0)
	fsw ft0, 52(sp)
# 1065~1065
	flw ft0, 272(sp)
	flw ft1, 52(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 176(sp)
	lw t0, 120(sp)
	flw ft0, 176(sp)
	fsw ft0, 20(t0)
# 1065~1065
._63_final:
# 1067~1067
	lw t0, 120(sp)
	sw t0, 120(sp)
	lw a0, 120(sp)
	addi sp, sp, 276
	ret
setup_surface_table.2622:
	addi sp, sp, -172
	sw a0, 108(sp)
	sw a1, 4(sp)
# 1072~1072
	addi t0, zero, 4
	sw t0, 136(sp)
# 1072~1072
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 32(sp)
# 1072~1072
	sw ra, -4(sp)
	lw a0, 136(sp)
	flw fa0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1074~1074
	addi t0, zero, 0
	sw t0, 112(sp)
# 1074~1074
	lw t0, 108(sp)
	flw ft0, 0(t0)
	fsw ft0, 72(sp)
# 1074~1074
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 168(sp)
# 1074~1074
	flw ft0, 72(sp)
	flw ft1, 168(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 1074~1074
	addi t0, zero, 1
	sw t0, 132(sp)
# 1074~1074
	lw t0, 108(sp)
	flw ft0, 4(t0)
	fsw ft0, 152(sp)
# 1074~1074
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 64(sp)
# 1074~1074
	flw ft0, 152(sp)
	flw ft1, 64(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 120(sp)
# 1074~1074
	flw ft0, 28(sp)
	flw ft1, 120(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 8(sp)
# 1074~1074
	addi t0, zero, 2
	sw t0, 60(sp)
# 1074~1074
	lw t0, 108(sp)
	flw ft0, 8(t0)
	fsw ft0, 124(sp)
# 1074~1074
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
# 1074~1074
	flw ft0, 124(sp)
	flw ft1, 76(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 140(sp)
# 1074~1074
	flw ft0, 8(sp)
	flw ft1, 140(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 44(sp)
# 1076~1076
	sw ra, -4(sp)
	flw fa0, 44(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 68(sp)
# 1076~1084
	addi t0, zero, 0
	sw t0, 48(sp)
	lw t0, 68(sp)
	lw t1, 48(sp)
	beq t0, t1, ._64_then
# 1078~1078
	addi t0, zero, 0
	sw t0, 16(sp)
# 1078~1078
	la t0, f-1.00000f
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
# 1078~1078
	flw ft0, 36(sp)
	flw ft1, 44(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 156(sp)
	lw t0, 56(sp)
	flw ft0, 156(sp)
	fsw ft0, 0(t0)
# 1078~1078
# 1080~1080
	addi t0, zero, 1
	sw t0, 160(sp)
# 1080~1080
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 80(sp)
# 1080~1080
	flw ft0, 80(sp)
	flw ft1, 44(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 88(sp)
# 1080~1080
	sw ra, -4(sp)
	flw fa0, 88(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 104(sp)
	lw t0, 56(sp)
	flw ft0, 104(sp)
	fsw ft0, 4(t0)
# 1080~1080
# 1081~1081
	addi t0, zero, 2
	sw t0, 52(sp)
# 1081~1081
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 164(sp)
# 1081~1081
	flw ft0, 164(sp)
	flw ft1, 44(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 0(sp)
# 1081~1081
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 144(sp)
	lw t0, 56(sp)
	flw ft0, 144(sp)
	fsw ft0, 8(t0)
# 1081~1081
# 1082~1082
	addi t0, zero, 3
	sw t0, 116(sp)
# 1082~1082
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
# 1082~1082
	flw ft0, 24(sp)
	flw ft1, 44(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 128(sp)
# 1082~1082
	sw ra, -4(sp)
	flw fa0, 128(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 92(sp)
	lw t0, 56(sp)
	flw ft0, 92(sp)
	fsw ft0, 12(t0)
# 1082~1082
	beq zero, zero, ._64_final
._64_then:
# 1084~1084
	addi t0, zero, 0
	sw t0, 96(sp)
# 1084~1084
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
	lw t0, 56(sp)
	flw ft0, 12(sp)
	fsw ft0, 0(t0)
# 1084~1084
._64_final:
# 1085~1085
	lw t0, 56(sp)
	sw t0, 56(sp)
	lw a0, 56(sp)
	addi sp, sp, 172
	ret
setup_second_table.2625:
	addi sp, sp, -328
	sw a0, 316(sp)
	sw a1, 248(sp)
# 1091~1091
	addi t0, zero, 5
	sw t0, 220(sp)
# 1091~1091
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 60(sp)
# 1091~1091
	sw ra, -4(sp)
	lw a0, 220(sp)
	flw fa0, 60(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 256(sp)
# 1093~1093
	addi t0, zero, 0
	sw t0, 284(sp)
# 1093~1093
	lw t0, 316(sp)
	flw ft0, 0(t0)
	fsw ft0, 64(sp)
# 1093~1093
	addi t0, zero, 1
	sw t0, 232(sp)
# 1093~1093
	lw t0, 316(sp)
	flw ft0, 4(t0)
	fsw ft0, 76(sp)
# 1093~1093
	addi t0, zero, 2
	sw t0, 8(sp)
# 1093~1093
	lw t0, 316(sp)
	flw ft0, 8(t0)
	fsw ft0, 28(sp)
# 1093~1093
	sw ra, -4(sp)
	lw a0, 248(sp)
	flw fa0, 64(sp)
	flw fa1, 76(sp)
	flw fa2, 28(sp)
	addi sp, sp, -4
	jal ra, quadratic.2556
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 276(sp)
# 1094~1094
	addi t0, zero, 0
	sw t0, 68(sp)
# 1094~1094
	lw t0, 316(sp)
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 1094~1094
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 224(sp)
# 1094~1094
	flw ft0, 80(sp)
	flw ft1, 224(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 116(sp)
# 1094~1094
	sw ra, -4(sp)
	flw fa0, 116(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 204(sp)
# 1095~1095
	addi t0, zero, 1
	sw t0, 56(sp)
# 1095~1095
	lw t0, 316(sp)
	flw ft0, 4(t0)
	fsw ft0, 152(sp)
# 1095~1095
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 48(sp)
# 1095~1095
	flw ft0, 152(sp)
	flw ft1, 48(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 0(sp)
# 1095~1095
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 1096~1096
	addi t0, zero, 2
	sw t0, 304(sp)
# 1096~1096
	lw t0, 316(sp)
	flw ft0, 8(t0)
	fsw ft0, 268(sp)
# 1096~1096
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 228(sp)
# 1096~1096
	flw ft0, 268(sp)
	flw ft1, 228(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 300(sp)
# 1096~1096
	sw ra, -4(sp)
	flw fa0, 300(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 36(sp)
# 1098~1098
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 256(sp)
	flw ft0, 276(sp)
	fsw ft0, 0(t0)
# 1098~1098
# 1101~1101
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_isrot.2449
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
# 1101~1101
	addi t0, zero, 0
	sw t0, 296(sp)
	lw t0, 100(sp)
	lw t1, 296(sp)
	beq t0, t1, ._65_then
# 1102~1102
	addi t0, zero, 1
	sw t0, 88(sp)
# 1102~1102
	addi t0, zero, 2
	sw t0, 272(sp)
# 1102~1102
	lw t0, 316(sp)
	flw ft0, 8(t0)
	fsw ft0, 252(sp)
# 1102~1102
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_r2.2477
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 200(sp)
# 1102~1102
	flw ft0, 252(sp)
	flw ft1, 200(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
# 1102~1102
	addi t0, zero, 1
	sw t0, 144(sp)
# 1102~1102
	lw t0, 316(sp)
	flw ft0, 4(t0)
	fsw ft0, 216(sp)
# 1102~1102
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_r3.2479
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 84(sp)
# 1102~1102
	flw ft0, 216(sp)
	flw ft1, 84(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 192(sp)
# 1102~1102
	flw ft0, 16(sp)
	flw ft1, 192(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 164(sp)
# 1102~1102
	sw ra, -4(sp)
	flw fa0, 164(sp)
	addi sp, sp, -4
	jal ra, min_caml_fhalf
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 1102~1102
	flw ft0, 204(sp)
	flw ft1, 4(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 124(sp)
	lw t0, 256(sp)
	flw ft0, 124(sp)
	fsw ft0, 4(t0)
# 1102~1102
# 1103~1103
	addi t0, zero, 2
	sw t0, 280(sp)
# 1103~1103
	addi t0, zero, 2
	sw t0, 184(sp)
# 1103~1103
	lw t0, 316(sp)
	flw ft0, 8(t0)
	fsw ft0, 128(sp)
# 1103~1103
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_r1.2475
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 156(sp)
# 1103~1103
	flw ft0, 128(sp)
	flw ft1, 156(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 208(sp)
# 1103~1103
	addi t0, zero, 0
	sw t0, 236(sp)
# 1103~1103
	lw t0, 316(sp)
	flw ft0, 0(t0)
	fsw ft0, 136(sp)
# 1103~1103
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_r3.2479
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 112(sp)
# 1103~1103
	flw ft0, 136(sp)
	flw ft1, 112(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 260(sp)
# 1103~1103
	flw ft0, 208(sp)
	flw ft1, 260(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 120(sp)
# 1103~1103
	sw ra, -4(sp)
	flw fa0, 120(sp)
	addi sp, sp, -4
	jal ra, min_caml_fhalf
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 92(sp)
# 1103~1103
	flw ft0, 12(sp)
	flw ft1, 92(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 160(sp)
	lw t0, 256(sp)
	flw ft0, 160(sp)
	fsw ft0, 8(t0)
# 1103~1103
# 1104~1104
	addi t0, zero, 3
	sw t0, 148(sp)
# 1104~1104
	addi t0, zero, 1
	sw t0, 244(sp)
# 1104~1104
	lw t0, 316(sp)
	flw ft0, 4(t0)
	fsw ft0, 264(sp)
# 1104~1104
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_r1.2475
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 20(sp)
# 1104~1104
	flw ft0, 264(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 140(sp)
# 1104~1104
	addi t0, zero, 0
	sw t0, 52(sp)
# 1104~1104
	lw t0, 316(sp)
	flw ft0, 0(t0)
	fsw ft0, 168(sp)
# 1104~1104
	sw ra, -4(sp)
	lw a0, 248(sp)
	addi sp, sp, -4
	jal ra, o_param_r2.2477
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 96(sp)
# 1104~1104
	flw ft0, 168(sp)
	flw ft1, 96(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 308(sp)
# 1104~1104
	flw ft0, 140(sp)
	flw ft1, 308(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 180(sp)
# 1104~1104
	sw ra, -4(sp)
	flw fa0, 180(sp)
	addi sp, sp, -4
	jal ra, min_caml_fhalf
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 320(sp)
# 1104~1104
	flw ft0, 36(sp)
	flw ft1, 320(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 176(sp)
	lw t0, 256(sp)
	flw ft0, 176(sp)
	fsw ft0, 12(t0)
# 1104~1104
	beq zero, zero, ._65_final
._65_then:
# 1106~1106
	addi t0, zero, 1
	sw t0, 40(sp)
	lw t0, 256(sp)
	flw ft0, 204(sp)
	fsw ft0, 4(t0)
# 1106~1106
# 1107~1107
	addi t0, zero, 2
	sw t0, 292(sp)
	lw t0, 256(sp)
	flw ft0, 12(sp)
	fsw ft0, 8(t0)
# 1107~1107
# 1108~1108
	addi t0, zero, 3
	sw t0, 132(sp)
	lw t0, 256(sp)
	flw ft0, 36(sp)
	fsw ft0, 12(t0)
# 1108~1108
._65_final:
# 1110~1110
	sw ra, -4(sp)
	flw fa0, 276(sp)
	addi sp, sp, -4
	jal ra, min_caml_fiszero
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 324(sp)
# 1110~1110
	addi t0, zero, 0
	sw t0, 188(sp)
	lw t0, 324(sp)
	lw t1, 188(sp)
	beq t0, t1, ._66_then
# 0~0
	beq zero, zero, ._66_final
._66_then:
# 1111~1111
	addi t0, zero, 4
	sw t0, 172(sp)
# 1111~1111
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 1111~1111
	flw ft0, 44(sp)
	flw ft1, 276(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 104(sp)
	lw t0, 256(sp)
	flw ft0, 104(sp)
	fsw ft0, 16(t0)
# 1111~1111
._66_final:
# 1113~1113
	lw t0, 256(sp)
	sw t0, 256(sp)
	lw a0, 256(sp)
	addi sp, sp, 328
	ret
iter_setup_dirvec_constants.2628:
	addi sp, sp, -72
	sw a0, 24(sp)
	sw a1, 28(sp)
	sw a2, 36(sp)
	lw t0, 36(sp)
	lw t1, 4(t0)
	sw t1, 32(sp)
# 1119~1119
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 28(sp)
	lw t1, 16(sp)
	bge t0, t1, ._67_then
# 0~0
	lw a0, 40(sp)
	addi sp, sp, 72
	ret
	beq zero, zero, ._67_final
._67_then:
# 1120~1120
	lw t0, 32(sp)
	lw t1, 28(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 20(sp)
# 1121~1121
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, d_const.2504
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1122~1122
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 1123~1123
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 1124~1124
	addi t0, zero, 1
	sw t0, 44(sp)
	lw t0, 48(sp)
	lw t1, 44(sp)
	beq t0, t1, ._68_then
# 1126~1126
	addi t0, zero, 2
	sw t0, 4(sp)
	lw t0, 48(sp)
	lw t1, 4(sp)
	beq t0, t1, ._69_then
# 1129~1129
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 20(sp)
	addi sp, sp, -4
	jal ra, setup_second_table.2625
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw t0, 8(sp)
	lw t2, 64(sp)
	lw t1, 28(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1129~1129
	beq zero, zero, ._69_final
._69_then:
# 1127~1127
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 20(sp)
	addi sp, sp, -4
	jal ra, setup_surface_table.2622
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
	lw t0, 8(sp)
	lw t2, 56(sp)
	lw t1, 28(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1127~1127
._69_final:
	beq zero, zero, ._68_final
._68_then:
# 1125~1125
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 20(sp)
	addi sp, sp, -4
	jal ra, setup_rect_table.2619
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw t0, 8(sp)
	lw t2, 0(sp)
	lw t1, 28(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1125~1125
._68_final:
# 1131~1131
	addi t0, zero, 1
	sw t0, 68(sp)
# 1131~1131
	lw t0, 28(sp)
	addi t2, t0, -1
	sw t2, 60(sp)
# 1131~1131
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 60(sp)
	lw a2, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 72
	ret
._67_final:
setup_dirvec_constants.2631:
	addi sp, sp, -36
	sw a0, 32(sp)
	sw a1, 20(sp)
	lw t0, 20(sp)
	lw t1, 4(t0)
	sw t1, 28(sp)
	lw t1, 8(t0)
	sw t1, 4(sp)
# 1136~1136
	addi t0, zero, 0
	sw t0, 12(sp)
# 1136~1136
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 1136~1136
	addi t0, zero, 1
	sw t0, 0(sp)
# 1136~1136
	lw t0, 8(sp)
	addi t2, t0, -1
	sw t2, 16(sp)
# 1136~1136
	sw ra, -4(sp)
	lw a0, 32(sp)
	lw a1, 16(sp)
	lw a2, 28(sp)
	lw t0, 28(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 36
	ret
setup_startp_constants.2633:
	addi sp, sp, -208
	sw a0, 72(sp)
	sw a1, 124(sp)
	sw a2, 24(sp)
	lw t0, 24(sp)
	lw t1, 4(t0)
	sw t1, 164(sp)
# 1142~1142
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 124(sp)
	lw t1, 32(sp)
	bge t0, t1, ._70_then
# 0~0
	lw a0, 184(sp)
	addi sp, sp, 208
	ret
	beq zero, zero, ._70_final
._70_then:
# 1143~1143
	lw t0, 164(sp)
	lw t1, 124(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 64(sp)
# 1144~1144
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, o_param_ctbl.2481
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 160(sp)
# 1145~1145
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 128(sp)
# 1146~1146
	addi t0, zero, 0
	sw t0, 28(sp)
# 1146~1146
	addi t0, zero, 0
	sw t0, 168(sp)
# 1146~1146
	lw t0, 72(sp)
	flw ft0, 0(t0)
	fsw ft0, 56(sp)
# 1146~1146
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 48(sp)
# 1146~1146
	flw ft0, 56(sp)
	flw ft1, 48(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 120(sp)
	lw t0, 160(sp)
	flw ft0, 120(sp)
	fsw ft0, 0(t0)
# 1146~1146
# 1147~1147
	addi t0, zero, 1
	sw t0, 108(sp)
# 1147~1147
	addi t0, zero, 1
	sw t0, 148(sp)
# 1147~1147
	lw t0, 72(sp)
	flw ft0, 4(t0)
	fsw ft0, 36(sp)
# 1147~1147
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, o_param_y.2461
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 76(sp)
# 1147~1147
	flw ft0, 36(sp)
	flw ft1, 76(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 132(sp)
	lw t0, 160(sp)
	flw ft0, 132(sp)
	fsw ft0, 4(t0)
# 1147~1147
# 1148~1148
	addi t0, zero, 2
	sw t0, 92(sp)
# 1148~1148
	addi t0, zero, 2
	sw t0, 188(sp)
# 1148~1148
	lw t0, 72(sp)
	flw ft0, 8(t0)
	fsw ft0, 44(sp)
# 1148~1148
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 172(sp)
# 1148~1148
	flw ft0, 44(sp)
	flw ft1, 172(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 136(sp)
	lw t0, 160(sp)
	flw ft0, 136(sp)
	fsw ft0, 8(t0)
# 1148~1148
# 1149~1149
	addi t0, zero, 2
	sw t0, 40(sp)
	lw t0, 128(sp)
	lw t1, 40(sp)
	beq t0, t1, ._71_then
# 1152~1152
	addi t0, zero, 2
	sw t0, 180(sp)
	lw t0, 180(sp)
	lw t1, 128(sp)
	bge t0, t1, ._72_then
# 1153~1153
	addi t0, zero, 0
	sw t0, 8(sp)
# 1153~1153
	lw t0, 160(sp)
	flw ft0, 0(t0)
	fsw ft0, 200(sp)
# 1153~1153
	addi t0, zero, 1
	sw t0, 144(sp)
# 1153~1153
	lw t0, 160(sp)
	flw ft0, 4(t0)
	fsw ft0, 152(sp)
# 1153~1153
	addi t0, zero, 2
	sw t0, 104(sp)
# 1153~1153
	lw t0, 160(sp)
	flw ft0, 8(t0)
	fsw ft0, 68(sp)
# 1153~1153
	sw ra, -4(sp)
	lw a0, 64(sp)
	flw fa0, 200(sp)
	flw fa1, 152(sp)
	flw fa2, 68(sp)
	addi sp, sp, -4
	jal ra, quadratic.2556
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 1154~1154
	addi t0, zero, 3
	sw t0, 16(sp)
# 1154~1154
	addi t0, zero, 3
	sw t0, 20(sp)
	lw t0, 128(sp)
	lw t1, 20(sp)
	beq t0, t1, ._73_then
# 1154~1154
	flw ft0, 12(sp)
	fsw ft0, 116(sp)
	beq zero, zero, ._73_final
._73_then:
# 1154~1154
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
# 1154~1154
	flw ft0, 12(sp)
	flw ft1, 4(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 116(sp)
._73_final:
	lw t0, 160(sp)
	flw ft0, 116(sp)
	fsw ft0, 12(t0)
# 1154~1154
	beq zero, zero, ._72_final
._72_then:
# 0~0
._72_final:
	beq zero, zero, ._71_final
._71_then:
# 1150~1150
	addi t0, zero, 3
	sw t0, 52(sp)
# 1151~1151
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, o_param_abc.2457
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 204(sp)
# 1151~1151
	addi t0, zero, 0
	sw t0, 96(sp)
# 1151~1151
	lw t0, 160(sp)
	flw ft0, 0(t0)
	fsw ft0, 192(sp)
# 1151~1151
	addi t0, zero, 1
	sw t0, 196(sp)
# 1151~1151
	lw t0, 160(sp)
	flw ft0, 4(t0)
	fsw ft0, 112(sp)
# 1151~1151
	addi t0, zero, 2
	sw t0, 60(sp)
# 1151~1151
	lw t0, 160(sp)
	flw ft0, 8(t0)
	fsw ft0, 80(sp)
# 1151~1151
	sw ra, -4(sp)
	lw a0, 204(sp)
	flw fa0, 192(sp)
	flw fa1, 112(sp)
	flw fa2, 80(sp)
	addi sp, sp, -4
	jal ra, veciprod2.2422
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 176(sp)
	lw t0, 160(sp)
	flw ft0, 176(sp)
	fsw ft0, 12(t0)
# 1150~1151
._71_final:
# 1156~1156
	addi t0, zero, 1
	sw t0, 84(sp)
# 1156~1156
	lw t0, 124(sp)
	addi t2, t0, -1
	sw t2, 88(sp)
# 1156~1156
	sw ra, -4(sp)
	lw a0, 72(sp)
	lw a1, 88(sp)
	lw a2, 24(sp)
	lw t0, 24(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 184(sp)
	lw a0, 184(sp)
	addi sp, sp, 208
	ret
._70_final:
setup_startp.2636:
	addi sp, sp, -44
	sw a0, 4(sp)
	sw a1, 20(sp)
	lw t0, 20(sp)
	lw t1, 4(t0)
	sw t1, 16(sp)
	lw t1, 8(t0)
	sw t1, 24(sp)
	lw t1, 12(t0)
	sw t1, 12(sp)
# 1161~1161
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 4(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1162~1162
	addi t0, zero, 0
	sw t0, 0(sp)
# 1162~1162
	lw t0, 16(sp)
	lw t2, 0(t0)
	sw t2, 36(sp)
# 1162~1162
	addi t0, zero, 1
	sw t0, 8(sp)
# 1162~1162
	lw t0, 36(sp)
	addi t2, t0, -1
	sw t2, 28(sp)
# 1162~1162
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 28(sp)
	lw a2, 24(sp)
	lw t0, 24(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 44
	ret
is_rect_outside.2638:
	addi sp, sp, -80
	sw a0, 36(sp)
	fsw fa0, 52(sp)
	fsw fa1, 48(sp)
	fsw fa2, 28(sp)
# 1172~1172
	sw ra, -4(sp)
	flw fa0, 52(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 8(sp)
# 1172~1172
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 56(sp)
# 1172~1172
	sw ra, -4(sp)
	flw fa0, 8(sp)
	flw fa1, 56(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 76(sp)
# 1172~1176
	addi t0, zero, 0
	sw t0, 40(sp)
	lw t0, 76(sp)
	lw t1, 40(sp)
	beq t0, t1, ._74_then
# 1173~1173
	sw ra, -4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 1173~1173
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 1173~1173
	sw ra, -4(sp)
	flw fa0, 44(sp)
	flw fa1, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 1173~1175
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 0(sp)
	lw t1, 16(sp)
	beq t0, t1, ._75_then
# 1174~1174
	sw ra, -4(sp)
	flw fa0, 28(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 64(sp)
# 1174~1174
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 1174~1174
	sw ra, -4(sp)
	flw fa0, 64(sp)
	flw fa1, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	beq zero, zero, ._75_final
._75_then:
# 1175~1175
	addi t0, zero, 0
	sw t0, 24(sp)
._75_final:
	beq zero, zero, ._74_final
._74_then:
# 1176~1176
	addi t0, zero, 0
	sw t0, 24(sp)
._74_final:
# 1171~1177
	addi t0, zero, 0
	sw t0, 68(sp)
	lw t0, 24(sp)
	lw t1, 68(sp)
	beq t0, t1, ._76_then
# 1177~1177
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 80
	ret
	beq zero, zero, ._76_final
._76_then:
# 1177~1177
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 1177~1177
	addi t0, zero, 0
	sw t0, 72(sp)
	lw t0, 12(sp)
	lw t1, 72(sp)
	beq t0, t1, ._77_then
# 1177~1177
	addi t0, zero, 0
	sw t0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 80
	ret
	beq zero, zero, ._77_final
._77_then:
# 1177~1177
	addi t0, zero, 1
	sw t0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 80
	ret
._77_final:
._76_final:
is_plane_outside.2643:
	addi sp, sp, -48
	sw a0, 24(sp)
	fsw fa0, 28(sp)
	fsw fa1, 0(sp)
	fsw fa2, 4(sp)
# 1182~1182
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, o_param_abc.2457
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1182~1182
	sw ra, -4(sp)
	lw a0, 8(sp)
	flw fa0, 28(sp)
	flw fa1, 0(sp)
	flw fa2, 4(sp)
	addi sp, sp, -4
	jal ra, veciprod2.2422
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 1183~1183
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 1183~1183
	sw ra, -4(sp)
	flw fa0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1183~1183
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_xor
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 1183~1183
	addi t0, zero, 0
	sw t0, 36(sp)
	lw t0, 20(sp)
	lw t1, 36(sp)
	beq t0, t1, ._78_then
# 1183~1183
	addi t0, zero, 0
	sw t0, 44(sp)
	lw a0, 44(sp)
	addi sp, sp, 48
	ret
	beq zero, zero, ._78_final
._78_then:
# 1183~1183
	addi t0, zero, 1
	sw t0, 44(sp)
	lw a0, 44(sp)
	addi sp, sp, 48
	ret
._78_final:
is_second_outside.2648:
	addi sp, sp, -60
	sw a0, 12(sp)
	fsw fa0, 20(sp)
	fsw fa1, 8(sp)
	fsw fa2, 56(sp)
# 1188~1188
	sw ra, -4(sp)
	lw a0, 12(sp)
	flw fa0, 20(sp)
	flw fa1, 8(sp)
	flw fa2, 56(sp)
	addi sp, sp, -4
	jal ra, quadratic.2556
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 1189~1189
	sw ra, -4(sp)
	lw a0, 12(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 1189~1189
	addi t0, zero, 3
	sw t0, 48(sp)
	lw t0, 28(sp)
	lw t1, 48(sp)
	beq t0, t1, ._79_then
# 1189~1189
	flw ft0, 32(sp)
	fsw ft0, 40(sp)
	beq zero, zero, ._79_final
._79_then:
# 1189~1189
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
# 1189~1189
	flw ft0, 32(sp)
	flw ft1, 4(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 40(sp)
._79_final:
# 1190~1190
	sw ra, -4(sp)
	lw a0, 12(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
# 1190~1190
	sw ra, -4(sp)
	flw fa0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 1190~1190
	sw ra, -4(sp)
	lw a0, 44(sp)
	lw a1, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_xor
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 1190~1190
	addi t0, zero, 0
	sw t0, 24(sp)
	lw t0, 52(sp)
	lw t1, 24(sp)
	beq t0, t1, ._80_then
# 1190~1190
	addi t0, zero, 0
	sw t0, 36(sp)
	lw a0, 36(sp)
	addi sp, sp, 60
	ret
	beq zero, zero, ._80_final
._80_then:
# 1190~1190
	addi t0, zero, 1
	sw t0, 36(sp)
	lw a0, 36(sp)
	addi sp, sp, 60
	ret
._80_final:
is_outside.2653:
	addi sp, sp, -60
	sw a0, 52(sp)
	fsw fa0, 0(sp)
	fsw fa1, 20(sp)
	fsw fa2, 40(sp)
# 1195~1195
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 1195~1195
	flw ft0, 0(sp)
	flw ft1, 4(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 44(sp)
# 1196~1196
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, o_param_y.2461
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
# 1196~1196
	flw ft0, 20(sp)
	flw ft1, 24(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 16(sp)
# 1197~1197
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 1197~1197
	flw ft0, 40(sp)
	flw ft1, 28(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 12(sp)
# 1198~1198
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1199~1199
	addi t0, zero, 1
	sw t0, 8(sp)
	lw t0, 32(sp)
	lw t1, 8(sp)
	beq t0, t1, ._81_then
# 1201~1201
	addi t0, zero, 2
	sw t0, 36(sp)
	lw t0, 32(sp)
	lw t1, 36(sp)
	beq t0, t1, ._82_then
# 1204~1204
	sw ra, -4(sp)
	lw a0, 52(sp)
	flw fa0, 44(sp)
	flw fa1, 16(sp)
	flw fa2, 12(sp)
	addi sp, sp, -4
	jal ra, is_second_outside.2648
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
	lw a0, 56(sp)
	addi sp, sp, 60
	ret
	beq zero, zero, ._82_final
._82_then:
# 1202~1202
	sw ra, -4(sp)
	lw a0, 52(sp)
	flw fa0, 44(sp)
	flw fa1, 16(sp)
	flw fa2, 12(sp)
	addi sp, sp, -4
	jal ra, is_plane_outside.2643
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
	lw a0, 56(sp)
	addi sp, sp, 60
	ret
._82_final:
	beq zero, zero, ._81_final
._81_then:
# 1200~1200
	sw ra, -4(sp)
	lw a0, 52(sp)
	flw fa0, 44(sp)
	flw fa1, 16(sp)
	flw fa2, 12(sp)
	addi sp, sp, -4
	jal ra, is_rect_outside.2638
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
	lw a0, 56(sp)
	addi sp, sp, 60
	ret
._81_final:
check_all_inside.2658:
	addi sp, sp, -60
	sw a0, 8(sp)
	sw a1, 44(sp)
	fsw fa0, 12(sp)
	fsw fa1, 52(sp)
	fsw fa2, 48(sp)
	sw a2, 16(sp)
	lw t0, 16(sp)
	lw t1, 4(t0)
	sw t1, 32(sp)
# 1209~1209
	lw t0, 44(sp)
	lw t1, 8(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 36(sp)
# 1210~1210
	addi t0, zero, -1
	sw t0, 24(sp)
	lw t0, 36(sp)
	lw t1, 24(sp)
	beq t0, t1, ._83_then
# 1213~1213
	lw t0, 32(sp)
	lw t1, 36(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 0(sp)
# 1213~1213
	sw ra, -4(sp)
	lw a0, 0(sp)
	flw fa0, 12(sp)
	flw fa1, 52(sp)
	flw fa2, 48(sp)
	addi sp, sp, -4
	jal ra, is_outside.2653
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 1213~1216
	addi t0, zero, 0
	sw t0, 20(sp)
	lw t0, 4(sp)
	lw t1, 20(sp)
	beq t0, t1, ._84_then
# 1214~1214
	addi t0, zero, 0
	sw t0, 28(sp)
	lw a0, 28(sp)
	addi sp, sp, 60
	ret
	beq zero, zero, ._84_final
._84_then:
# 1216~1216
	addi t0, zero, 1
	sw t0, 40(sp)
# 1216~1216
	lw t0, 8(sp)
	addi t2, t0, 1
	sw t2, 56(sp)
# 1216~1216
	sw ra, -4(sp)
	lw a0, 56(sp)
	lw a1, 44(sp)
	flw fa0, 12(sp)
	flw fa1, 52(sp)
	flw fa2, 48(sp)
	lw a2, 16(sp)
	lw t0, 16(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
	lw a0, 28(sp)
	addi sp, sp, 60
	ret
._84_final:
	beq zero, zero, ._83_final
._83_then:
# 1211~1211
	addi t0, zero, 1
	sw t0, 28(sp)
	lw a0, 28(sp)
	addi sp, sp, 60
	ret
._83_final:
shadow_check_and_group.2664:
	addi sp, sp, -204
	sw a0, 196(sp)
	sw a1, 88(sp)
	sw a2, 16(sp)
	lw t0, 16(sp)
	lw t1, 4(t0)
	sw t1, 20(sp)
	lw t1, 8(t0)
	sw t1, 8(sp)
	lw t1, 12(t0)
	sw t1, 156(sp)
	lw t1, 16(t0)
	sw t1, 12(sp)
	lw t1, 20(t0)
	sw t1, 68(sp)
	lw t1, 24(t0)
	sw t1, 148(sp)
	lw t1, 28(t0)
	sw t1, 116(sp)
# 1227~1227
	lw t0, 88(sp)
	lw t1, 196(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 152(sp)
# 1227~1227
	addi t0, zero, -1
	sw t0, 140(sp)
	lw t0, 152(sp)
	lw t1, 140(sp)
	beq t0, t1, ._85_then
# 1230~1230
	lw t0, 88(sp)
	lw t1, 196(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 128(sp)
# 1231~1231
	sw ra, -4(sp)
	lw a0, 128(sp)
	lw a1, 12(sp)
	lw a2, 8(sp)
	lw a3, 116(sp)
	lw t0, 116(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 1232~1232
	addi t0, zero, 0
	sw t0, 44(sp)
# 1232~1232
	lw t0, 148(sp)
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
# 1233~1233
	addi t0, zero, 0
	sw t0, 24(sp)
	lw t0, 0(sp)
	lw t1, 24(sp)
	beq t0, t1, ._86_then
# 1233~1233
	la t0, f-0.20000f
	flw ft0, 0(t0)
	fsw ft0, 176(sp)
# 1233~1233
	sw ra, -4(sp)
	flw fa0, 4(sp)
	flw fa1, 176(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 160(sp)
	beq zero, zero, ._86_final
._86_then:
# 1233~1233
	addi t0, zero, 0
	sw t0, 160(sp)
._86_final:
# 1233~1252
	addi t0, zero, 0
	sw t0, 164(sp)
	lw t0, 160(sp)
	lw t1, 164(sp)
	beq t0, t1, ._87_then
# 1236~1236
	la t0, f0.01000f
	flw ft0, 0(t0)
	fsw ft0, 92(sp)
# 1236~1236
	flw ft0, 4(sp)
	flw ft1, 92(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 28(sp)
# 1237~1237
	addi t0, zero, 0
	sw t0, 32(sp)
# 1237~1237
	lw t0, 156(sp)
	flw ft0, 0(t0)
	fsw ft0, 100(sp)
# 1237~1237
	flw ft0, 100(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 120(sp)
# 1237~1237
	addi t0, zero, 0
	sw t0, 36(sp)
# 1237~1237
	lw t0, 8(sp)
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 1237~1237
	flw ft0, 120(sp)
	flw ft1, 80(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 172(sp)
# 1238~1238
	addi t0, zero, 1
	sw t0, 112(sp)
# 1238~1238
	lw t0, 156(sp)
	flw ft0, 4(t0)
	fsw ft0, 180(sp)
# 1238~1238
	flw ft0, 180(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 40(sp)
# 1238~1238
	addi t0, zero, 1
	sw t0, 56(sp)
# 1238~1238
	lw t0, 8(sp)
	flw ft0, 4(t0)
	fsw ft0, 48(sp)
# 1238~1238
	flw ft0, 40(sp)
	flw ft1, 48(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 168(sp)
# 1239~1239
	addi t0, zero, 2
	sw t0, 72(sp)
# 1239~1239
	lw t0, 156(sp)
	flw ft0, 8(t0)
	fsw ft0, 184(sp)
# 1239~1239
	flw ft0, 184(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 132(sp)
# 1239~1239
	addi t0, zero, 2
	sw t0, 192(sp)
# 1239~1239
	lw t0, 8(sp)
	flw ft0, 8(t0)
	fsw ft0, 104(sp)
# 1239~1239
	flw ft0, 132(sp)
	flw ft1, 104(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 188(sp)
# 1240~1240
	addi t0, zero, 0
	sw t0, 52(sp)
# 1240~1240
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 88(sp)
	flw fa0, 172(sp)
	flw fa1, 168(sp)
	flw fa2, 188(sp)
	lw a2, 20(sp)
	lw t0, 20(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 200(sp)
# 1240~1243
	addi t0, zero, 0
	sw t0, 60(sp)
	lw t0, 200(sp)
	lw t1, 60(sp)
	beq t0, t1, ._88_then
# 1241~1241
	addi t0, zero, 1
	sw t0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 204
	ret
	beq zero, zero, ._88_final
._88_then:
# 1243~1243
	addi t0, zero, 1
	sw t0, 84(sp)
# 1243~1243
	lw t0, 196(sp)
	addi t2, t0, 1
	sw t2, 76(sp)
# 1243~1243
	sw ra, -4(sp)
	lw a0, 76(sp)
	lw a1, 88(sp)
	lw a2, 16(sp)
	lw t0, 16(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 204
	ret
._88_final:
	beq zero, zero, ._87_final
._87_then:
# 1249~1249
	lw t0, 68(sp)
	lw t1, 128(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 124(sp)
# 1249~1249
	sw ra, -4(sp)
	lw a0, 124(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 1249~1252
	addi t0, zero, 0
	sw t0, 144(sp)
	lw t0, 96(sp)
	lw t1, 144(sp)
	beq t0, t1, ._89_then
# 1250~1250
	addi t0, zero, 1
	sw t0, 108(sp)
# 1250~1250
	lw t0, 196(sp)
	addi t2, t0, 1
	sw t2, 136(sp)
# 1250~1250
	sw ra, -4(sp)
	lw a0, 136(sp)
	lw a1, 88(sp)
	lw a2, 16(sp)
	lw t0, 16(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 204
	ret
	beq zero, zero, ._89_final
._89_then:
# 1252~1252
	addi t0, zero, 0
	sw t0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 204
	ret
._89_final:
._87_final:
	beq zero, zero, ._85_final
._85_then:
# 1228~1228
	addi t0, zero, 0
	sw t0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 204
	ret
._85_final:
shadow_check_one_or_group.2667:
	addi sp, sp, -56
	sw a0, 16(sp)
	sw a1, 36(sp)
	sw a2, 32(sp)
	lw t0, 32(sp)
	lw t1, 4(t0)
	sw t1, 44(sp)
	lw t1, 8(t0)
	sw t1, 52(sp)
# 1257~1257
	lw t0, 36(sp)
	lw t1, 16(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 20(sp)
# 1258~1258
	addi t0, zero, -1
	sw t0, 8(sp)
	lw t0, 20(sp)
	lw t1, 8(sp)
	beq t0, t1, ._90_then
# 1261~1261
	lw t0, 44(sp)
	lw t1, 20(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 24(sp)
# 1262~1262
	addi t0, zero, 0
	sw t0, 48(sp)
# 1262~1262
	sw ra, -4(sp)
	lw a0, 48(sp)
	lw a1, 24(sp)
	lw a2, 52(sp)
	lw t0, 52(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 1263~1266
	addi t0, zero, 0
	sw t0, 0(sp)
	lw t0, 4(sp)
	lw t1, 0(sp)
	beq t0, t1, ._91_then
# 1264~1264
	addi t0, zero, 1
	sw t0, 28(sp)
	lw a0, 28(sp)
	addi sp, sp, 56
	ret
	beq zero, zero, ._91_final
._91_then:
# 1266~1266
	addi t0, zero, 1
	sw t0, 40(sp)
# 1266~1266
	lw t0, 16(sp)
	addi t2, t0, 1
	sw t2, 12(sp)
# 1266~1266
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 36(sp)
	lw a2, 32(sp)
	lw t0, 32(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
	lw a0, 28(sp)
	addi sp, sp, 56
	ret
._91_final:
	beq zero, zero, ._90_final
._90_then:
# 1259~1259
	addi t0, zero, 0
	sw t0, 28(sp)
	lw a0, 28(sp)
	addi sp, sp, 56
	ret
._90_final:
shadow_check_one_or_matrix.2670:
	addi sp, sp, -132
	sw a0, 88(sp)
	sw a1, 4(sp)
	sw a2, 32(sp)
	lw t0, 32(sp)
	lw t1, 4(t0)
	sw t1, 80(sp)
	lw t1, 8(t0)
	sw t1, 108(sp)
	lw t1, 12(t0)
	sw t1, 68(sp)
	lw t1, 16(t0)
	sw t1, 52(sp)
	lw t1, 20(t0)
	sw t1, 64(sp)
# 1272~1272
	lw t0, 4(sp)
	lw t1, 88(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 72(sp)
# 1273~1273
	addi t0, zero, 0
	sw t0, 92(sp)
# 1273~1273
	lw t0, 72(sp)
	lw t2, 0(t0)
	sw t2, 96(sp)
# 1274~1274
	addi t0, zero, -1
	sw t0, 112(sp)
	lw t0, 96(sp)
	lw t1, 112(sp)
	beq t0, t1, ._92_then
# 1278~1278
	addi t0, zero, 99
	sw t0, 0(sp)
	lw t0, 96(sp)
	lw t1, 0(sp)
	beq t0, t1, ._93_then
# 1281~1281
	sw ra, -4(sp)
	lw a0, 96(sp)
	lw a1, 108(sp)
	lw a2, 80(sp)
	lw a3, 64(sp)
	lw t0, 64(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 1284~1284
	addi t0, zero, 0
	sw t0, 28(sp)
	lw t0, 40(sp)
	lw t1, 28(sp)
	beq t0, t1, ._94_then
# 1285~1285
	addi t0, zero, 0
	sw t0, 76(sp)
# 1285~1285
	lw t0, 52(sp)
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
# 1285~1285
	la t0, f-0.10000f
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
# 1285~1285
	sw ra, -4(sp)
	flw fa0, 20(sp)
	flw fa1, 36(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 84(sp)
# 1285~1289
	addi t0, zero, 0
	sw t0, 100(sp)
	lw t0, 84(sp)
	lw t1, 100(sp)
	beq t0, t1, ._95_then
# 1286~1286
	addi t0, zero, 1
	sw t0, 12(sp)
# 1286~1286
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 72(sp)
	lw a2, 68(sp)
	lw t0, 68(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 1286~1288
	addi t0, zero, 0
	sw t0, 116(sp)
	lw t0, 48(sp)
	lw t1, 116(sp)
	beq t0, t1, ._96_then
# 1287~1287
	addi t0, zero, 1
	sw t0, 16(sp)
	beq zero, zero, ._96_final
._96_then:
# 1288~1288
	addi t0, zero, 0
	sw t0, 16(sp)
._96_final:
	beq zero, zero, ._95_final
._95_then:
# 1289~1289
	addi t0, zero, 0
	sw t0, 16(sp)
._95_final:
	beq zero, zero, ._94_final
._94_then:
# 1290~1290
	addi t0, zero, 0
	sw t0, 16(sp)
._94_final:
	beq zero, zero, ._93_final
._93_then:
# 1279~1279
	addi t0, zero, 1
	sw t0, 16(sp)
._93_final:
# 1277~1297
	addi t0, zero, 0
	sw t0, 8(sp)
	lw t0, 16(sp)
	lw t1, 8(sp)
	beq t0, t1, ._97_then
# 1292~1292
	addi t0, zero, 1
	sw t0, 24(sp)
# 1292~1292
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 72(sp)
	lw a2, 68(sp)
	lw t0, 68(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 60(sp)
# 1292~1295
	addi t0, zero, 0
	sw t0, 128(sp)
	lw t0, 60(sp)
	lw t1, 128(sp)
	beq t0, t1, ._98_then
# 1293~1293
	addi t0, zero, 1
	sw t0, 120(sp)
	lw a0, 120(sp)
	addi sp, sp, 132
	ret
	beq zero, zero, ._98_final
._98_then:
# 1295~1295
	addi t0, zero, 1
	sw t0, 44(sp)
# 1295~1295
	lw t0, 88(sp)
	addi t2, t0, 1
	sw t2, 104(sp)
# 1295~1295
	sw ra, -4(sp)
	lw a0, 104(sp)
	lw a1, 4(sp)
	lw a2, 32(sp)
	lw t0, 32(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 120(sp)
	lw a0, 120(sp)
	addi sp, sp, 132
	ret
._98_final:
	beq zero, zero, ._97_final
._97_then:
# 1297~1297
	addi t0, zero, 1
	sw t0, 124(sp)
# 1297~1297
	lw t0, 88(sp)
	addi t2, t0, 1
	sw t2, 56(sp)
# 1297~1297
	sw ra, -4(sp)
	lw a0, 56(sp)
	lw a1, 4(sp)
	lw a2, 32(sp)
	lw t0, 32(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 120(sp)
	lw a0, 120(sp)
	addi sp, sp, 132
	ret
._97_final:
	beq zero, zero, ._92_final
._92_then:
# 1275~1275
	addi t0, zero, 0
	sw t0, 120(sp)
	lw a0, 120(sp)
	addi sp, sp, 132
	ret
._92_final:
solve_each_element.2673:
	addi sp, sp, -256
	sw a0, 248(sp)
	sw a1, 196(sp)
	sw a2, 252(sp)
	sw a3, 40(sp)
	lw t0, 40(sp)
	lw t1, 4(t0)
	sw t1, 0(sp)
	lw t1, 8(t0)
	sw t1, 120(sp)
	lw t1, 12(t0)
	sw t1, 244(sp)
	lw t1, 16(t0)
	sw t1, 96(sp)
	lw t1, 20(t0)
	sw t1, 212(sp)
	lw t1, 24(t0)
	sw t1, 8(sp)
	lw t1, 28(t0)
	sw t1, 12(sp)
	lw t1, 32(t0)
	sw t1, 4(sp)
	lw t1, 36(t0)
	sw t1, 228(sp)
# 1306~1306
	lw t0, 196(sp)
	lw t1, 248(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 48(sp)
# 1307~1307
	addi t0, zero, -1
	sw t0, 200(sp)
	lw t0, 48(sp)
	lw t1, 200(sp)
	beq t0, t1, ._99_then
# 1309~1309
	sw ra, -4(sp)
	lw a0, 48(sp)
	lw a1, 252(sp)
	lw a2, 4(sp)
	lw a3, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 236(sp)
# 1310~1310
	addi t0, zero, 0
	sw t0, 112(sp)
	lw t0, 236(sp)
	lw t1, 112(sp)
	beq t0, t1, ._100_then
# 1314~1314
	addi t0, zero, 0
	sw t0, 64(sp)
# 1314~1314
	lw t0, 12(sp)
	flw ft0, 0(t0)
	fsw ft0, 152(sp)
# 1316~1316
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 140(sp)
# 1316~1316
	sw ra, -4(sp)
	flw fa0, 140(sp)
	flw fa1, 152(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 1316~1333
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 72(sp)
	lw t1, 32(sp)
	beq t0, t1, ._101_then
# 1317~1317
	addi t0, zero, 0
	sw t0, 160(sp)
# 1317~1317
	lw t0, 228(sp)
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 1317~1317
	sw ra, -4(sp)
	flw fa0, 152(sp)
	flw fa1, 80(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 88(sp)
# 1317~1332
	addi t0, zero, 0
	sw t0, 20(sp)
	lw t0, 88(sp)
	lw t1, 20(sp)
	beq t0, t1, ._102_then
# 1319~1319
	la t0, f0.01000f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 1319~1319
	flw ft0, 152(sp)
	flw ft1, 44(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 52(sp)
# 1320~1320
	addi t0, zero, 0
	sw t0, 104(sp)
# 1320~1320
	lw t0, 252(sp)
	flw ft0, 0(t0)
	fsw ft0, 100(sp)
# 1320~1320
	flw ft0, 100(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 144(sp)
# 1320~1320
	addi t0, zero, 0
	sw t0, 124(sp)
# 1320~1320
	lw t0, 4(sp)
	flw ft0, 0(t0)
	fsw ft0, 240(sp)
# 1320~1320
	flw ft0, 144(sp)
	flw ft1, 240(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 224(sp)
# 1321~1321
	addi t0, zero, 1
	sw t0, 172(sp)
# 1321~1321
	lw t0, 252(sp)
	flw ft0, 4(t0)
	fsw ft0, 92(sp)
# 1321~1321
	flw ft0, 92(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 204(sp)
# 1321~1321
	addi t0, zero, 1
	sw t0, 216(sp)
# 1321~1321
	lw t0, 4(sp)
	flw ft0, 4(t0)
	fsw ft0, 184(sp)
# 1321~1321
	flw ft0, 204(sp)
	flw ft1, 184(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 156(sp)
# 1322~1322
	addi t0, zero, 2
	sw t0, 168(sp)
# 1322~1322
	lw t0, 252(sp)
	flw ft0, 8(t0)
	fsw ft0, 192(sp)
# 1322~1322
	flw ft0, 192(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 76(sp)
# 1322~1322
	addi t0, zero, 2
	sw t0, 68(sp)
# 1322~1322
	lw t0, 4(sp)
	flw ft0, 8(t0)
	fsw ft0, 128(sp)
# 1322~1322
	flw ft0, 76(sp)
	flw ft1, 128(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 24(sp)
# 1323~1323
	addi t0, zero, 0
	sw t0, 164(sp)
# 1323~1323
	sw ra, -4(sp)
	lw a0, 164(sp)
	lw a1, 196(sp)
	flw fa0, 224(sp)
	flw fa1, 156(sp)
	flw fa2, 24(sp)
	lw a2, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 176(sp)
# 1323~1330
	addi t0, zero, 0
	sw t0, 116(sp)
	lw t0, 176(sp)
	lw t1, 116(sp)
	beq t0, t1, ._103_then
# 1325~1325
	addi t0, zero, 0
	sw t0, 84(sp)
	lw t0, 228(sp)
	flw ft0, 52(sp)
	fsw ft0, 0(t0)
# 1325~1325
# 1326~1326
	sw ra, -4(sp)
	lw a0, 244(sp)
	flw fa0, 224(sp)
	flw fa1, 156(sp)
	flw fa2, 24(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1327~1327
	addi t0, zero, 0
	sw t0, 108(sp)
	lw t0, 120(sp)
	lw t2, 48(sp)
	sw t2, 0(t0)
# 1327~1327
# 1328~1328
	addi t0, zero, 0
	sw t0, 232(sp)
	lw t0, 96(sp)
	lw t2, 236(sp)
	sw t2, 0(t0)
# 1328~1328
	beq zero, zero, ._103_final
._103_then:
# 0~0
._103_final:
	beq zero, zero, ._102_final
._102_then:
# 0~0
._102_final:
	beq zero, zero, ._101_final
._101_then:
# 0~0
._101_final:
# 1334~1334
	addi t0, zero, 1
	sw t0, 16(sp)
# 1334~1334
	lw t0, 248(sp)
	addi t2, t0, 1
	sw t2, 208(sp)
# 1334~1334
	sw ra, -4(sp)
	lw a0, 208(sp)
	lw a1, 196(sp)
	lw a2, 252(sp)
	lw a3, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 148(sp)
	lw a0, 148(sp)
	addi sp, sp, 256
	ret
	beq zero, zero, ._100_final
._100_then:
# 1338~1338
	lw t0, 212(sp)
	lw t1, 48(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 136(sp)
# 1338~1338
	sw ra, -4(sp)
	lw a0, 136(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 60(sp)
# 1338~1340
	addi t0, zero, 0
	sw t0, 188(sp)
	lw t0, 60(sp)
	lw t1, 188(sp)
	beq t0, t1, ._104_then
# 1339~1339
	addi t0, zero, 1
	sw t0, 132(sp)
# 1339~1339
	lw t0, 248(sp)
	addi t2, t0, 1
	sw t2, 28(sp)
# 1339~1339
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 196(sp)
	lw a2, 252(sp)
	lw a3, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 148(sp)
	lw a0, 148(sp)
	addi sp, sp, 256
	ret
	beq zero, zero, ._104_final
._104_then:
# 0~0
	lw a0, 148(sp)
	addi sp, sp, 256
	ret
._104_final:
._100_final:
	beq zero, zero, ._99_final
._99_then:
# 0~0
	lw a0, 148(sp)
	addi sp, sp, 256
	ret
._99_final:
solve_one_or_network.2677:
	addi sp, sp, -56
	sw a0, 44(sp)
	sw a1, 20(sp)
	sw a2, 52(sp)
	sw a3, 4(sp)
	lw t0, 4(sp)
	lw t1, 4(t0)
	sw t1, 0(sp)
	lw t1, 8(t0)
	sw t1, 24(sp)
# 1347~1347
	lw t0, 20(sp)
	lw t1, 44(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 28(sp)
# 1348~1348
	addi t0, zero, -1
	sw t0, 8(sp)
	lw t0, 28(sp)
	lw t1, 8(sp)
	beq t0, t1, ._105_then
# 1349~1349
	lw t0, 0(sp)
	lw t1, 28(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 12(sp)
# 1350~1350
	addi t0, zero, 0
	sw t0, 48(sp)
# 1350~1350
	sw ra, -4(sp)
	lw a0, 48(sp)
	lw a1, 12(sp)
	lw a2, 52(sp)
	lw a3, 24(sp)
	lw t0, 24(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 1351~1351
	addi t0, zero, 1
	sw t0, 36(sp)
# 1351~1351
	lw t0, 44(sp)
	addi t2, t0, 1
	sw t2, 16(sp)
# 1351~1351
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 20(sp)
	lw a2, 52(sp)
	lw a3, 4(sp)
	lw t0, 4(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 56
	ret
	beq zero, zero, ._105_final
._105_then:
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 56
	ret
._105_final:
trace_or_matrix.2681:
	addi sp, sp, -112
	sw a0, 68(sp)
	sw a1, 28(sp)
	sw a2, 12(sp)
	sw a3, 96(sp)
	lw t0, 96(sp)
	lw t1, 4(t0)
	sw t1, 52(sp)
	lw t1, 8(t0)
	sw t1, 48(sp)
	lw t1, 12(t0)
	sw t1, 88(sp)
	lw t1, 16(t0)
	sw t1, 16(sp)
	lw t1, 20(t0)
	sw t1, 104(sp)
# 1357~1357
	lw t0, 28(sp)
	lw t1, 68(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 24(sp)
# 1358~1358
	addi t0, zero, 0
	sw t0, 64(sp)
# 1358~1358
	lw t0, 24(sp)
	lw t2, 0(t0)
	sw t2, 56(sp)
# 1359~1359
	addi t0, zero, -1
	sw t0, 44(sp)
	lw t0, 56(sp)
	lw t1, 44(sp)
	beq t0, t1, ._106_then
# 1362~1362
	addi t0, zero, 99
	sw t0, 100(sp)
	lw t0, 56(sp)
	lw t1, 100(sp)
	beq t0, t1, ._107_then
# 1367~1367
	sw ra, -4(sp)
	lw a0, 56(sp)
	lw a1, 12(sp)
	lw a2, 16(sp)
	lw a3, 48(sp)
	lw t0, 48(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1368~1368
	addi t0, zero, 0
	sw t0, 20(sp)
	lw t0, 32(sp)
	lw t1, 20(sp)
	beq t0, t1, ._108_then
# 1369~1369
	addi t0, zero, 0
	sw t0, 60(sp)
# 1369~1369
	lw t0, 88(sp)
	flw ft0, 0(t0)
	fsw ft0, 108(sp)
# 1370~1370
	addi t0, zero, 0
	sw t0, 92(sp)
# 1370~1370
	lw t0, 104(sp)
	flw ft0, 0(t0)
	fsw ft0, 76(sp)
# 1370~1370
	sw ra, -4(sp)
	flw fa0, 108(sp)
	flw fa1, 76(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 1370~1372
	addi t0, zero, 0
	sw t0, 80(sp)
	lw t0, 36(sp)
	lw t1, 80(sp)
	beq t0, t1, ._109_then
# 1371~1371
	addi t0, zero, 1
	sw t0, 0(sp)
# 1371~1371
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 24(sp)
	lw a2, 12(sp)
	lw a3, 52(sp)
	lw t0, 52(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 84(sp)
	beq zero, zero, ._109_final
._109_then:
# 0~0
._109_final:
	beq zero, zero, ._108_final
._108_then:
# 0~0
._108_final:
	beq zero, zero, ._107_final
._107_then:
# 1363~1363
	addi t0, zero, 1
	sw t0, 72(sp)
# 1363~1363
	sw ra, -4(sp)
	lw a0, 72(sp)
	lw a1, 24(sp)
	lw a2, 12(sp)
	lw a3, 52(sp)
	lw t0, 52(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 84(sp)
._107_final:
# 1375~1375
	addi t0, zero, 1
	sw t0, 40(sp)
# 1375~1375
	lw t0, 68(sp)
	addi t2, t0, 1
	sw t2, 4(sp)
# 1375~1375
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 28(sp)
	lw a2, 12(sp)
	lw a3, 96(sp)
	lw t0, 96(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 112
	ret
	beq zero, zero, ._106_final
._106_then:
# 0~0
	lw a0, 8(sp)
	addi sp, sp, 112
	ret
._106_final:
judge_intersection.2685:
	addi sp, sp, -76
	sw a0, 0(sp)
	sw a1, 24(sp)
	lw t0, 24(sp)
	lw t1, 4(t0)
	sw t1, 64(sp)
	lw t1, 8(t0)
	sw t1, 8(sp)
	lw t1, 12(t0)
	sw t1, 36(sp)
# 1384~1384
	addi t0, zero, 0
	sw t0, 68(sp)
# 1384~1384
	la t0, f1000000000.00000f
	flw ft0, 0(t0)
	fsw ft0, 72(sp)
	lw t0, 8(sp)
	flw ft0, 72(sp)
	fsw ft0, 0(t0)
# 1384~1384
# 1385~1385
	addi t0, zero, 0
	sw t0, 48(sp)
# 1385~1385
	addi t0, zero, 0
	sw t0, 40(sp)
# 1385~1385
	lw t0, 64(sp)
	lw t2, 0(t0)
	sw t2, 20(sp)
# 1385~1385
	sw ra, -4(sp)
	lw a0, 48(sp)
	lw a1, 20(sp)
	lw a2, 0(sp)
	lw a3, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 1386~1386
	addi t0, zero, 0
	sw t0, 4(sp)
# 1386~1386
	lw t0, 8(sp)
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
# 1388~1388
	la t0, f-0.10000f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 1388~1388
	sw ra, -4(sp)
	flw fa0, 44(sp)
	flw fa1, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1388~1390
	addi t0, zero, 0
	sw t0, 60(sp)
	lw t0, 16(sp)
	lw t1, 60(sp)
	beq t0, t1, ._110_then
# 1389~1389
	la t0, f100000000.00000f
	flw ft0, 0(t0)
	fsw ft0, 28(sp)
# 1389~1389
	sw ra, -4(sp)
	flw fa0, 12(sp)
	flw fa1, 28(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 76
	ret
	beq zero, zero, ._110_final
._110_then:
# 1390~1390
	addi t0, zero, 0
	sw t0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 76
	ret
._110_final:
solve_each_element_fast.2687:
	addi sp, sp, -260
	sw a0, 180(sp)
	sw a1, 140(sp)
	sw a2, 88(sp)
	sw a3, 20(sp)
	lw t0, 20(sp)
	lw t1, 4(t0)
	sw t1, 248(sp)
	lw t1, 8(t0)
	sw t1, 84(sp)
	lw t1, 12(t0)
	sw t1, 244(sp)
	lw t1, 16(t0)
	sw t1, 40(sp)
	lw t1, 20(t0)
	sw t1, 208(sp)
	lw t1, 24(t0)
	sw t1, 52(sp)
	lw t1, 28(t0)
	sw t1, 0(sp)
	lw t1, 32(t0)
	sw t1, 228(sp)
	lw t1, 36(t0)
	sw t1, 172(sp)
# 1397~1397
	sw ra, -4(sp)
	lw a0, 88(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 184(sp)
# 1398~1398
	lw t0, 140(sp)
	lw t1, 180(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 28(sp)
# 1399~1399
	addi t0, zero, -1
	sw t0, 220(sp)
	lw t0, 28(sp)
	lw t1, 220(sp)
	beq t0, t1, ._111_then
# 1401~1401
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 88(sp)
	lw a2, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 1402~1402
	addi t0, zero, 0
	sw t0, 68(sp)
	lw t0, 48(sp)
	lw t1, 68(sp)
	beq t0, t1, ._112_then
# 1406~1406
	addi t0, zero, 0
	sw t0, 148(sp)
# 1406~1406
	lw t0, 52(sp)
	flw ft0, 0(t0)
	fsw ft0, 164(sp)
# 1408~1408
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 152(sp)
# 1408~1408
	sw ra, -4(sp)
	flw fa0, 152(sp)
	flw fa1, 164(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 1408~1425
	addi t0, zero, 0
	sw t0, 236(sp)
	lw t0, 92(sp)
	lw t1, 236(sp)
	beq t0, t1, ._113_then
# 1409~1409
	addi t0, zero, 0
	sw t0, 44(sp)
# 1409~1409
	lw t0, 172(sp)
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 1409~1409
	sw ra, -4(sp)
	flw fa0, 164(sp)
	flw fa1, 80(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 256(sp)
# 1409~1424
	addi t0, zero, 0
	sw t0, 96(sp)
	lw t0, 256(sp)
	lw t1, 96(sp)
	beq t0, t1, ._114_then
# 1411~1411
	la t0, f0.01000f
	flw ft0, 0(t0)
	fsw ft0, 112(sp)
# 1411~1411
	flw ft0, 164(sp)
	flw ft1, 112(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 224(sp)
# 1412~1412
	addi t0, zero, 0
	sw t0, 196(sp)
# 1412~1412
	lw t0, 184(sp)
	flw ft0, 0(t0)
	fsw ft0, 216(sp)
# 1412~1412
	flw ft0, 216(sp)
	flw ft1, 224(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 1412~1412
	addi t0, zero, 0
	sw t0, 232(sp)
# 1412~1412
	lw t0, 228(sp)
	flw ft0, 0(t0)
	fsw ft0, 212(sp)
# 1412~1412
	flw ft0, 56(sp)
	flw ft1, 212(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 100(sp)
# 1413~1413
	addi t0, zero, 1
	sw t0, 200(sp)
# 1413~1413
	lw t0, 184(sp)
	flw ft0, 4(t0)
	fsw ft0, 160(sp)
# 1413~1413
	flw ft0, 160(sp)
	flw ft1, 224(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
# 1413~1413
	addi t0, zero, 1
	sw t0, 32(sp)
# 1413~1413
	lw t0, 228(sp)
	flw ft0, 4(t0)
	fsw ft0, 64(sp)
# 1413~1413
	flw ft0, 16(sp)
	flw ft1, 64(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 104(sp)
# 1414~1414
	addi t0, zero, 2
	sw t0, 4(sp)
# 1414~1414
	lw t0, 184(sp)
	flw ft0, 8(t0)
	fsw ft0, 192(sp)
# 1414~1414
	flw ft0, 192(sp)
	flw ft1, 224(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 124(sp)
# 1414~1414
	addi t0, zero, 2
	sw t0, 60(sp)
# 1414~1414
	lw t0, 228(sp)
	flw ft0, 8(t0)
	fsw ft0, 36(sp)
# 1414~1414
	flw ft0, 124(sp)
	flw ft1, 36(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 136(sp)
# 1415~1415
	addi t0, zero, 0
	sw t0, 204(sp)
# 1415~1415
	sw ra, -4(sp)
	lw a0, 204(sp)
	lw a1, 140(sp)
	flw fa0, 100(sp)
	flw fa1, 104(sp)
	flw fa2, 136(sp)
	lw a2, 248(sp)
	lw t0, 248(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 1415~1422
	addi t0, zero, 0
	sw t0, 132(sp)
	lw t0, 12(sp)
	lw t1, 132(sp)
	beq t0, t1, ._115_then
# 1417~1417
	addi t0, zero, 0
	sw t0, 128(sp)
	lw t0, 172(sp)
	flw ft0, 224(sp)
	fsw ft0, 0(t0)
# 1417~1417
# 1418~1418
	sw ra, -4(sp)
	lw a0, 244(sp)
	flw fa0, 100(sp)
	flw fa1, 104(sp)
	flw fa2, 136(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 1419~1419
	addi t0, zero, 0
	sw t0, 8(sp)
	lw t0, 84(sp)
	lw t2, 28(sp)
	sw t2, 0(t0)
# 1419~1419
# 1420~1420
	addi t0, zero, 0
	sw t0, 240(sp)
	lw t0, 40(sp)
	lw t2, 48(sp)
	sw t2, 0(t0)
# 1420~1420
	beq zero, zero, ._115_final
._115_then:
# 0~0
._115_final:
	beq zero, zero, ._114_final
._114_then:
# 0~0
._114_final:
	beq zero, zero, ._113_final
._113_then:
# 0~0
._113_final:
# 1426~1426
	addi t0, zero, 1
	sw t0, 156(sp)
# 1426~1426
	lw t0, 180(sp)
	addi t2, t0, 1
	sw t2, 144(sp)
# 1426~1426
	sw ra, -4(sp)
	lw a0, 144(sp)
	lw a1, 140(sp)
	lw a2, 88(sp)
	lw a3, 20(sp)
	lw t0, 20(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
	lw a0, 72(sp)
	addi sp, sp, 260
	ret
	beq zero, zero, ._112_final
._112_then:
# 1430~1430
	lw t0, 208(sp)
	lw t1, 28(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 108(sp)
# 1430~1430
	sw ra, -4(sp)
	lw a0, 108(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 168(sp)
# 1430~1432
	addi t0, zero, 0
	sw t0, 252(sp)
	lw t0, 168(sp)
	lw t1, 252(sp)
	beq t0, t1, ._116_then
# 1431~1431
	addi t0, zero, 1
	sw t0, 76(sp)
# 1431~1431
	lw t0, 180(sp)
	addi t2, t0, 1
	sw t2, 176(sp)
# 1431~1431
	sw ra, -4(sp)
	lw a0, 176(sp)
	lw a1, 140(sp)
	lw a2, 88(sp)
	lw a3, 20(sp)
	lw t0, 20(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
	lw a0, 72(sp)
	addi sp, sp, 260
	ret
	beq zero, zero, ._116_final
._116_then:
# 0~0
	lw a0, 72(sp)
	addi sp, sp, 260
	ret
._116_final:
._112_final:
	beq zero, zero, ._111_final
._111_then:
# 0~0
	lw a0, 72(sp)
	addi sp, sp, 260
	ret
._111_final:
solve_one_or_network_fast.2691:
	addi sp, sp, -56
	sw a0, 36(sp)
	sw a1, 28(sp)
	sw a2, 0(sp)
	sw a3, 48(sp)
	lw t0, 48(sp)
	lw t1, 4(t0)
	sw t1, 52(sp)
	lw t1, 8(t0)
	sw t1, 4(sp)
# 1438~1438
	lw t0, 28(sp)
	lw t1, 36(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 44(sp)
# 1439~1439
	addi t0, zero, -1
	sw t0, 12(sp)
	lw t0, 44(sp)
	lw t1, 12(sp)
	beq t0, t1, ._117_then
# 1440~1440
	lw t0, 52(sp)
	lw t1, 44(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 20(sp)
# 1441~1441
	addi t0, zero, 0
	sw t0, 40(sp)
# 1441~1441
	sw ra, -4(sp)
	lw a0, 40(sp)
	lw a1, 20(sp)
	lw a2, 0(sp)
	lw a3, 4(sp)
	lw t0, 4(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1442~1442
	addi t0, zero, 1
	sw t0, 16(sp)
# 1442~1442
	lw t0, 36(sp)
	addi t2, t0, 1
	sw t2, 8(sp)
# 1442~1442
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 28(sp)
	lw a2, 0(sp)
	lw a3, 48(sp)
	lw t0, 48(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 56
	ret
	beq zero, zero, ._117_final
._117_then:
# 0~0
	lw a0, 24(sp)
	addi sp, sp, 56
	ret
._117_final:
trace_or_matrix_fast.2695:
	addi sp, sp, -108
	sw a0, 44(sp)
	sw a1, 52(sp)
	sw a2, 64(sp)
	sw a3, 32(sp)
	lw t0, 32(sp)
	lw t1, 4(t0)
	sw t1, 68(sp)
	lw t1, 8(t0)
	sw t1, 28(sp)
	lw t1, 12(t0)
	sw t1, 88(sp)
	lw t1, 16(t0)
	sw t1, 56(sp)
# 1448~1448
	lw t0, 52(sp)
	lw t1, 44(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 60(sp)
# 1449~1449
	addi t0, zero, 0
	sw t0, 20(sp)
# 1449~1449
	lw t0, 60(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 1450~1450
	addi t0, zero, -1
	sw t0, 72(sp)
	lw t0, 8(sp)
	lw t1, 72(sp)
	beq t0, t1, ._118_then
# 1453~1453
	addi t0, zero, 99
	sw t0, 48(sp)
	lw t0, 8(sp)
	lw t1, 48(sp)
	beq t0, t1, ._119_then
# 1458~1458
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 64(sp)
	lw a2, 88(sp)
	lw t0, 88(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 1459~1459
	addi t0, zero, 0
	sw t0, 96(sp)
	lw t0, 12(sp)
	lw t1, 96(sp)
	beq t0, t1, ._120_then
# 1460~1460
	addi t0, zero, 0
	sw t0, 100(sp)
# 1460~1460
	lw t0, 28(sp)
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
# 1461~1461
	addi t0, zero, 0
	sw t0, 40(sp)
# 1461~1461
	lw t0, 56(sp)
	flw ft0, 0(t0)
	fsw ft0, 84(sp)
# 1461~1461
	sw ra, -4(sp)
	flw fa0, 36(sp)
	flw fa1, 84(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 104(sp)
# 1461~1463
	addi t0, zero, 0
	sw t0, 76(sp)
	lw t0, 104(sp)
	lw t1, 76(sp)
	beq t0, t1, ._121_then
# 1462~1462
	addi t0, zero, 1
	sw t0, 24(sp)
# 1462~1462
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 60(sp)
	lw a2, 64(sp)
	lw a3, 68(sp)
	lw t0, 68(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	beq zero, zero, ._121_final
._121_then:
# 0~0
._121_final:
	beq zero, zero, ._120_final
._120_then:
# 0~0
._120_final:
	beq zero, zero, ._119_final
._119_then:
# 1454~1454
	addi t0, zero, 1
	sw t0, 92(sp)
# 1454~1454
	sw ra, -4(sp)
	lw a0, 92(sp)
	lw a1, 60(sp)
	lw a2, 64(sp)
	lw a3, 68(sp)
	lw t0, 68(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
._119_final:
# 1466~1466
	addi t0, zero, 1
	sw t0, 80(sp)
# 1466~1466
	lw t0, 44(sp)
	addi t2, t0, 1
	sw t2, 16(sp)
# 1466~1466
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 52(sp)
	lw a2, 64(sp)
	lw a3, 32(sp)
	lw t0, 32(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
	lw a0, 4(sp)
	addi sp, sp, 108
	ret
	beq zero, zero, ._118_final
._118_then:
# 0~0
	lw a0, 4(sp)
	addi sp, sp, 108
	ret
._118_final:
judge_intersection_fast.2699:
	addi sp, sp, -76
	sw a0, 44(sp)
	sw a1, 60(sp)
	lw t0, 60(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
	lw t1, 8(t0)
	sw t1, 52(sp)
	lw t1, 12(t0)
	sw t1, 64(sp)
# 1473~1473
	addi t0, zero, 0
	sw t0, 40(sp)
# 1473~1473
	la t0, f1000000000.00000f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
	lw t0, 52(sp)
	flw ft0, 0(sp)
	fsw ft0, 0(t0)
# 1473~1473
# 1474~1474
	addi t0, zero, 0
	sw t0, 24(sp)
# 1474~1474
	addi t0, zero, 0
	sw t0, 28(sp)
# 1474~1474
	lw t0, 12(sp)
	lw t2, 0(t0)
	sw t2, 20(sp)
# 1474~1474
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 20(sp)
	lw a2, 44(sp)
	lw a3, 64(sp)
	lw t0, 64(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1475~1475
	addi t0, zero, 0
	sw t0, 32(sp)
# 1475~1475
	lw t0, 52(sp)
	flw ft0, 0(t0)
	fsw ft0, 68(sp)
# 1477~1477
	la t0, f-0.10000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 1477~1477
	sw ra, -4(sp)
	flw fa0, 48(sp)
	flw fa1, 68(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1477~1479
	addi t0, zero, 0
	sw t0, 4(sp)
	lw t0, 56(sp)
	lw t1, 4(sp)
	beq t0, t1, ._122_then
# 1478~1478
	la t0, f100000000.00000f
	flw ft0, 0(t0)
	fsw ft0, 72(sp)
# 1478~1478
	sw ra, -4(sp)
	flw fa0, 68(sp)
	flw fa1, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
	lw a0, 36(sp)
	addi sp, sp, 76
	ret
	beq zero, zero, ._122_final
._122_then:
# 1479~1479
	addi t0, zero, 0
	sw t0, 36(sp)
	lw a0, 36(sp)
	addi sp, sp, 76
	ret
._122_final:
get_nvector_rect.2701:
	addi sp, sp, -60
	sw a0, 4(sp)
	sw a1, 8(sp)
	lw t0, 8(sp)
	lw t1, 4(t0)
	sw t1, 44(sp)
	lw t1, 8(t0)
	sw t1, 12(sp)
# 1491~1491
	addi t0, zero, 0
	sw t0, 56(sp)
# 1491~1491
	lw t0, 44(sp)
	lw t2, 0(t0)
	sw t2, 28(sp)
# 1493~1493
	sw ra, -4(sp)
	lw a0, 12(sp)
	addi sp, sp, -4
	jal ra, vecbzero.2411
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 1494~1494
	addi t0, zero, 1
	sw t0, 48(sp)
# 1494~1494
	lw t0, 28(sp)
	addi t2, t0, -1
	sw t2, 16(sp)
# 1494~1494
	addi t0, zero, 1
	sw t0, 36(sp)
# 1494~1494
	lw t0, 28(sp)
	addi t2, t0, -1
	sw t2, 40(sp)
# 1494~1494
	lw t0, 4(sp)
	lw t1, 40(sp)
	slli t1, t1, 2
	add t1, t1, t0
	flw ft0, 0(t1)
	fsw ft0, 52(sp)
# 1494~1494
	sw ra, -4(sp)
	flw fa0, 52(sp)
	addi sp, sp, -4
	jal ra, sgn.2395
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 1494~1494
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
	lw t0, 12(sp)
	flw ft0, 32(sp)
	lw t1, 16(sp)
	slli t1, t1, 2
	add t1, t1, t0
	fsw ft0, 0(t1)
# 1494~1494
	lw a0, 24(sp)
	addi sp, sp, 60
	ret
get_nvector_plane.2703:
	addi sp, sp, -60
	sw a0, 20(sp)
	sw a1, 28(sp)
	lw t0, 28(sp)
	lw t1, 4(t0)
	sw t1, 16(sp)
# 1500~1500
	addi t0, zero, 0
	sw t0, 0(sp)
# 1500~1500
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 1500~1500
	sw ra, -4(sp)
	flw fa0, 44(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
	lw t0, 16(sp)
	flw ft0, 4(sp)
	fsw ft0, 0(t0)
# 1500~1500
# 1501~1501
	addi t0, zero, 1
	sw t0, 56(sp)
# 1501~1501
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 1501~1501
	sw ra, -4(sp)
	flw fa0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
	lw t0, 16(sp)
	flw ft0, 12(sp)
	fsw ft0, 4(t0)
# 1501~1501
# 1502~1502
	addi t0, zero, 2
	sw t0, 52(sp)
# 1502~1502
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 8(sp)
# 1502~1502
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 36(sp)
	lw t0, 16(sp)
	flw ft0, 36(sp)
	fsw ft0, 8(t0)
# 1502~1502
	lw a0, 48(sp)
	addi sp, sp, 60
	ret
get_nvector_second.2705:
	addi sp, sp, -232
	sw a0, 60(sp)
	sw a1, 120(sp)
	lw t0, 120(sp)
	lw t1, 4(t0)
	sw t1, 52(sp)
	lw t1, 8(t0)
	sw t1, 172(sp)
# 1507~1507
	addi t0, zero, 0
	sw t0, 104(sp)
# 1507~1507
	lw t0, 52(sp)
	flw ft0, 0(t0)
	fsw ft0, 124(sp)
# 1507~1507
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 116(sp)
# 1507~1507
	flw ft0, 124(sp)
	flw ft1, 116(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 0(sp)
# 1508~1508
	addi t0, zero, 1
	sw t0, 72(sp)
# 1508~1508
	lw t0, 52(sp)
	flw ft0, 4(t0)
	fsw ft0, 112(sp)
# 1508~1508
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_y.2461
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 108(sp)
# 1508~1508
	flw ft0, 112(sp)
	flw ft1, 108(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 96(sp)
# 1509~1509
	addi t0, zero, 2
	sw t0, 76(sp)
# 1509~1509
	lw t0, 52(sp)
	flw ft0, 8(t0)
	fsw ft0, 152(sp)
# 1509~1509
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 144(sp)
# 1509~1509
	flw ft0, 152(sp)
	flw ft1, 144(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 44(sp)
# 1511~1511
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 160(sp)
# 1511~1511
	flw ft0, 0(sp)
	flw ft1, 160(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 204(sp)
# 1512~1512
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 16(sp)
# 1512~1512
	flw ft0, 96(sp)
	flw ft1, 16(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 1513~1513
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 36(sp)
# 1513~1513
	flw ft0, 44(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 132(sp)
# 1515~1515
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_isrot.2449
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 1515~1515
	addi t0, zero, 0
	sw t0, 40(sp)
	lw t0, 92(sp)
	lw t1, 40(sp)
	beq t0, t1, ._123_then
# 1520~1520
	addi t0, zero, 0
	sw t0, 208(sp)
# 1520~1520
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_r3.2479
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 196(sp)
# 1520~1520
	flw ft0, 96(sp)
	flw ft1, 196(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 88(sp)
# 1520~1520
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_r2.2477
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 164(sp)
# 1520~1520
	flw ft0, 44(sp)
	flw ft1, 164(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 228(sp)
# 1520~1520
	flw ft0, 88(sp)
	flw ft1, 228(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 128(sp)
# 1520~1520
	sw ra, -4(sp)
	flw fa0, 128(sp)
	addi sp, sp, -4
	jal ra, min_caml_fhalf
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 168(sp)
# 1520~1520
	flw ft0, 204(sp)
	flw ft1, 168(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 8(sp)
	lw t0, 172(sp)
	flw ft0, 8(sp)
	fsw ft0, 0(t0)
# 1520~1520
# 1521~1521
	addi t0, zero, 1
	sw t0, 176(sp)
# 1521~1521
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_r3.2479
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 1521~1521
	flw ft0, 0(sp)
	flw ft1, 12(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 84(sp)
# 1521~1521
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_r1.2475
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 180(sp)
# 1521~1521
	flw ft0, 44(sp)
	flw ft1, 180(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 136(sp)
# 1521~1521
	flw ft0, 84(sp)
	flw ft1, 136(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 192(sp)
# 1521~1521
	sw ra, -4(sp)
	flw fa0, 192(sp)
	addi sp, sp, -4
	jal ra, min_caml_fhalf
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 212(sp)
# 1521~1521
	flw ft0, 28(sp)
	flw ft1, 212(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 216(sp)
	lw t0, 172(sp)
	flw ft0, 216(sp)
	fsw ft0, 4(t0)
# 1521~1521
# 1522~1522
	addi t0, zero, 2
	sw t0, 200(sp)
# 1522~1522
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_r2.2477
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 220(sp)
# 1522~1522
	flw ft0, 0(sp)
	flw ft1, 220(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
# 1522~1522
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_param_r1.2475
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 148(sp)
# 1522~1522
	flw ft0, 96(sp)
	flw ft1, 148(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 64(sp)
# 1522~1522
	flw ft0, 24(sp)
	flw ft1, 64(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 156(sp)
# 1522~1522
	sw ra, -4(sp)
	flw fa0, 156(sp)
	addi sp, sp, -4
	jal ra, min_caml_fhalf
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 224(sp)
# 1522~1522
	flw ft0, 132(sp)
	flw ft1, 224(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 20(sp)
	lw t0, 172(sp)
	flw ft0, 20(sp)
	fsw ft0, 8(t0)
# 1522~1522
	beq zero, zero, ._123_final
._123_then:
# 1516~1516
	addi t0, zero, 0
	sw t0, 188(sp)
	lw t0, 172(sp)
	flw ft0, 204(sp)
	fsw ft0, 0(t0)
# 1516~1516
# 1517~1517
	addi t0, zero, 1
	sw t0, 68(sp)
	lw t0, 172(sp)
	flw ft0, 28(sp)
	fsw ft0, 4(t0)
# 1517~1517
# 1518~1518
	addi t0, zero, 2
	sw t0, 56(sp)
	lw t0, 172(sp)
	flw ft0, 132(sp)
	fsw ft0, 8(t0)
# 1518~1518
._123_final:
# 1524~1524
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, o_isinvert.2447
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
# 1524~1524
	sw ra, -4(sp)
	lw a0, 172(sp)
	lw a1, 100(sp)
	addi sp, sp, -4
	jal ra, vecunit_sgn.2416
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 140(sp)
	lw a0, 140(sp)
	addi sp, sp, 232
	ret
get_nvector.2707:
	addi sp, sp, -40
	sw a0, 4(sp)
	sw a1, 36(sp)
	sw a2, 16(sp)
	lw t0, 16(sp)
	lw t1, 4(t0)
	sw t1, 0(sp)
	lw t1, 8(t0)
	sw t1, 20(sp)
	lw t1, 12(t0)
	sw t1, 28(sp)
# 1529~1529
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1530~1530
	addi t0, zero, 1
	sw t0, 12(sp)
	lw t0, 8(sp)
	lw t1, 12(sp)
	beq t0, t1, ._124_then
# 1532~1532
	addi t0, zero, 2
	sw t0, 32(sp)
	lw t0, 8(sp)
	lw t1, 32(sp)
	beq t0, t1, ._125_then
# 1535~1535
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 28(sp)
	lw t0, 28(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 40
	ret
	beq zero, zero, ._125_final
._125_then:
# 1533~1533
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 40
	ret
._125_final:
	beq zero, zero, ._124_final
._124_then:
# 1531~1531
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 20(sp)
	lw t0, 20(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 40
	ret
._124_final:
utexture.2710:
	addi sp, sp, -636
	sw a0, 364(sp)
	sw a1, 280(sp)
	sw a2, 4(sp)
	lw t0, 4(sp)
	lw t1, 4(t0)
	sw t1, 204(sp)
# 1543~1543
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_texturetype.2441
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 508(sp)
# 1545~1545
	addi t0, zero, 0
	sw t0, 544(sp)
# 1545~1545
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_color_red.2469
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 500(sp)
	lw t0, 204(sp)
	flw ft0, 500(sp)
	fsw ft0, 0(t0)
# 1545~1545
# 1546~1546
	addi t0, zero, 1
	sw t0, 380(sp)
# 1546~1546
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_color_green.2471
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 308(sp)
	lw t0, 204(sp)
	flw ft0, 308(sp)
	fsw ft0, 4(t0)
# 1546~1546
# 1547~1547
	addi t0, zero, 2
	sw t0, 384(sp)
# 1547~1547
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_color_blue.2473
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 568(sp)
	lw t0, 204(sp)
	flw ft0, 568(sp)
	fsw ft0, 8(t0)
# 1547~1547
# 1548~1548
	addi t0, zero, 1
	sw t0, 180(sp)
	lw t0, 508(sp)
	lw t1, 180(sp)
	beq t0, t1, ._126_then
# 1566~1566
	addi t0, zero, 2
	sw t0, 60(sp)
	lw t0, 508(sp)
	lw t1, 60(sp)
	beq t0, t1, ._127_then
# 1573~1573
	addi t0, zero, 3
	sw t0, 468(sp)
	lw t0, 508(sp)
	lw t1, 468(sp)
	beq t0, t1, ._128_then
# 1584~1584
	addi t0, zero, 4
	sw t0, 420(sp)
	lw t0, 508(sp)
	lw t1, 420(sp)
	beq t0, t1, ._129_then
# 0~0
	lw a0, 316(sp)
	addi sp, sp, 636
	ret
	beq zero, zero, ._129_final
._129_then:
# 1586~1586
	addi t0, zero, 0
	sw t0, 552(sp)
# 1586~1586
	lw t0, 280(sp)
	flw ft0, 0(t0)
	fsw ft0, 252(sp)
# 1586~1586
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 108(sp)
# 1586~1586
	flw ft0, 252(sp)
	flw ft1, 108(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 412(sp)
# 1586~1586
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 176(sp)
# 1586~1586
	sw ra, -4(sp)
	flw fa0, 176(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 268(sp)
# 1586~1586
	flw ft0, 412(sp)
	flw ft1, 268(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 1587~1587
	addi t0, zero, 2
	sw t0, 144(sp)
# 1587~1587
	lw t0, 280(sp)
	flw ft0, 8(t0)
	fsw ft0, 548(sp)
# 1587~1587
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 476(sp)
# 1587~1587
	flw ft0, 548(sp)
	flw ft1, 476(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 564(sp)
# 1587~1587
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 240(sp)
# 1587~1587
	sw ra, -4(sp)
	flw fa0, 240(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 612(sp)
# 1587~1587
	flw ft0, 564(sp)
	flw ft1, 612(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 372(sp)
# 1588~1588
	sw ra, -4(sp)
	flw fa0, 28(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 360(sp)
# 1588~1588
	sw ra, -4(sp)
	flw fa0, 372(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 1588~1588
	flw ft0, 360(sp)
	flw ft1, 12(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 196(sp)
# 1590~1590
	sw ra, -4(sp)
	flw fa0, 28(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 452(sp)
# 1590~1590
	la t0, f0.00010f
	flw ft0, 0(t0)
	fsw ft0, 540(sp)
# 1590~1590
	sw ra, -4(sp)
	flw fa0, 452(sp)
	flw fa1, 540(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1590~1595
	addi t0, zero, 0
	sw t0, 148(sp)
	lw t0, 32(sp)
	lw t1, 148(sp)
	beq t0, t1, ._130_then
# 1591~1591
	la t0, f15.00000f
	flw ft0, 0(t0)
	fsw ft0, 84(sp)
	beq zero, zero, ._130_final
._130_then:
# 1593~1593
	flw ft0, 372(sp)
	flw ft1, 28(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 604(sp)
# 1593~1593
	sw ra, -4(sp)
	flw fa0, 604(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 424(sp)
# 1595~1595
	sw ra, -4(sp)
	flw fa0, 424(sp)
	addi sp, sp, -4
	jal ra, min_caml_atan
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 124(sp)
# 1595~1595
	la t0, f30.00000f
	flw ft0, 0(t0)
	fsw ft0, 276(sp)
# 1595~1595
	flw ft0, 124(sp)
	flw ft1, 276(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 532(sp)
# 1595~1595
	la t0, f3.14159f
	flw ft0, 0(t0)
	fsw ft0, 368(sp)
# 1595~1595
	flw ft0, 532(sp)
	flw ft1, 368(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 84(sp)
._130_final:
# 1597~1597
	sw ra, -4(sp)
	flw fa0, 84(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 112(sp)
# 1597~1597
	flw ft0, 84(sp)
	flw ft1, 112(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 388(sp)
# 1599~1599
	addi t0, zero, 1
	sw t0, 520(sp)
# 1599~1599
	lw t0, 280(sp)
	flw ft0, 4(t0)
	fsw ft0, 512(sp)
# 1599~1599
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_y.2461
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 584(sp)
# 1599~1599
	flw ft0, 512(sp)
	flw ft1, 584(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 164(sp)
# 1599~1599
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 88(sp)
# 1599~1599
	sw ra, -4(sp)
	flw fa0, 88(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 580(sp)
# 1599~1599
	flw ft0, 164(sp)
	flw ft1, 580(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 212(sp)
# 1601~1601
	sw ra, -4(sp)
	flw fa0, 196(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 312(sp)
# 1601~1601
	la t0, f0.00010f
	flw ft0, 0(t0)
	fsw ft0, 224(sp)
# 1601~1601
	sw ra, -4(sp)
	flw fa0, 312(sp)
	flw fa1, 224(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 236(sp)
# 1601~1605
	addi t0, zero, 0
	sw t0, 160(sp)
	lw t0, 236(sp)
	lw t1, 160(sp)
	beq t0, t1, ._131_then
# 1602~1602
	la t0, f15.00000f
	flw ft0, 0(t0)
	fsw ft0, 220(sp)
	beq zero, zero, ._131_final
._131_then:
# 1604~1604
	flw ft0, 212(sp)
	flw ft1, 196(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 244(sp)
# 1604~1604
	sw ra, -4(sp)
	flw fa0, 244(sp)
	addi sp, sp, -4
	jal ra, min_caml_fabs
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 480(sp)
# 1605~1605
	sw ra, -4(sp)
	flw fa0, 480(sp)
	addi sp, sp, -4
	jal ra, min_caml_atan
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 596(sp)
# 1605~1605
	la t0, f30.00000f
	flw ft0, 0(t0)
	fsw ft0, 16(sp)
# 1605~1605
	flw ft0, 596(sp)
	flw ft1, 16(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 120(sp)
# 1605~1605
	la t0, f3.14159f
	flw ft0, 0(t0)
	fsw ft0, 256(sp)
# 1605~1605
	flw ft0, 120(sp)
	flw ft1, 256(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 220(sp)
._131_final:
# 1607~1607
	sw ra, -4(sp)
	flw fa0, 220(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 36(sp)
# 1607~1607
	flw ft0, 220(sp)
	flw ft1, 36(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 260(sp)
# 1608~1608
	la t0, f0.15000f
	flw ft0, 0(t0)
	fsw ft0, 392(sp)
# 1608~1608
	la t0, f0.50000f
	flw ft0, 0(t0)
	fsw ft0, 408(sp)
# 1608~1608
	flw ft0, 408(sp)
	flw ft1, 388(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 20(sp)
# 1608~1608
	sw ra, -4(sp)
	flw fa0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 320(sp)
# 1608~1608
	flw ft0, 392(sp)
	flw ft1, 320(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 348(sp)
# 1608~1608
	la t0, f0.50000f
	flw ft0, 0(t0)
	fsw ft0, 556(sp)
# 1608~1608
	flw ft0, 556(sp)
	flw ft1, 260(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 172(sp)
# 1608~1608
	sw ra, -4(sp)
	flw fa0, 172(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 248(sp)
# 1608~1608
	flw ft0, 348(sp)
	flw ft1, 248(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 608(sp)
# 1609~1609
	sw ra, -4(sp)
	flw fa0, 608(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 356(sp)
# 1609~1609
	addi t0, zero, 0
	sw t0, 24(sp)
	lw t0, 356(sp)
	lw t1, 24(sp)
	beq t0, t1, ._132_then
# 1609~1609
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 56(sp)
	beq zero, zero, ._132_final
._132_then:
# 1609~1609
	flw ft0, 608(sp)
	fsw ft0, 56(sp)
._132_final:
# 1610~1610
	addi t0, zero, 2
	sw t0, 156(sp)
# 1610~1610
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 272(sp)
# 1610~1610
	flw ft0, 272(sp)
	flw ft1, 56(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 440(sp)
# 1610~1610
	la t0, f0.30000f
	flw ft0, 0(t0)
	fsw ft0, 128(sp)
# 1610~1610
	flw ft0, 440(sp)
	flw ft1, 128(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 208(sp)
	lw t0, 204(sp)
	flw ft0, 208(sp)
	fsw ft0, 8(t0)
# 1610~1610
	lw a0, 316(sp)
	addi sp, sp, 636
	ret
._129_final:
	beq zero, zero, ._128_final
._128_then:
# 1576~1576
	addi t0, zero, 0
	sw t0, 152(sp)
# 1576~1576
	lw t0, 280(sp)
	flw ft0, 0(t0)
	fsw ft0, 104(sp)
# 1576~1576
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 264(sp)
# 1576~1576
	flw ft0, 104(sp)
	flw ft1, 264(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 44(sp)
# 1577~1577
	addi t0, zero, 2
	sw t0, 324(sp)
# 1577~1577
	lw t0, 280(sp)
	flw ft0, 8(t0)
	fsw ft0, 184(sp)
# 1577~1577
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 624(sp)
# 1577~1577
	flw ft0, 184(sp)
	flw ft1, 624(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 448(sp)
# 1578~1578
	sw ra, -4(sp)
	flw fa0, 44(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 216(sp)
# 1578~1578
	sw ra, -4(sp)
	flw fa0, 448(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 328(sp)
# 1578~1578
	flw ft0, 216(sp)
	flw ft1, 328(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 292(sp)
# 1578~1578
	sw ra, -4(sp)
	flw fa0, 292(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 352(sp)
# 1578~1578
	la t0, f10.00000f
	flw ft0, 0(t0)
	fsw ft0, 284(sp)
# 1578~1578
	flw ft0, 352(sp)
	flw ft1, 284(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 304(sp)
# 1579~1579
	sw ra, -4(sp)
	flw fa0, 304(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 64(sp)
# 1579~1579
	flw ft0, 304(sp)
	flw ft1, 64(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 140(sp)
# 1579~1579
	la t0, f3.14159f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 1579~1579
	flw ft0, 140(sp)
	flw ft1, 0(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 344(sp)
# 1580~1580
	sw ra, -4(sp)
	flw fa0, 344(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 536(sp)
# 1580~1580
	sw ra, -4(sp)
	flw fa0, 536(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 92(sp)
# 1581~1581
	addi t0, zero, 1
	sw t0, 228(sp)
# 1581~1581
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 524(sp)
# 1581~1581
	flw ft0, 92(sp)
	flw ft1, 524(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 332(sp)
	lw t0, 204(sp)
	flw ft0, 332(sp)
	fsw ft0, 4(t0)
# 1581~1581
# 1582~1582
	addi t0, zero, 2
	sw t0, 460(sp)
# 1582~1582
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 628(sp)
# 1582~1582
	flw ft0, 628(sp)
	flw ft1, 92(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 116(sp)
# 1582~1582
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 560(sp)
# 1582~1582
	flw ft0, 116(sp)
	flw ft1, 560(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 68(sp)
	lw t0, 204(sp)
	flw ft0, 68(sp)
	fsw ft0, 8(t0)
# 1582~1582
	lw a0, 316(sp)
	addi sp, sp, 636
	ret
._128_final:
	beq zero, zero, ._127_final
._127_then:
# 1569~1569
	addi t0, zero, 1
	sw t0, 72(sp)
# 1569~1569
	lw t0, 280(sp)
	flw ft0, 4(t0)
	fsw ft0, 484(sp)
# 1569~1569
	la t0, f0.25000f
	flw ft0, 0(t0)
	fsw ft0, 432(sp)
# 1569~1569
	flw ft0, 484(sp)
	flw ft1, 432(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 488(sp)
# 1569~1569
	sw ra, -4(sp)
	flw fa0, 488(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 456(sp)
# 1569~1569
	sw ra, -4(sp)
	flw fa0, 456(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 132(sp)
# 1570~1570
	addi t0, zero, 0
	sw t0, 572(sp)
# 1570~1570
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 632(sp)
# 1570~1570
	flw ft0, 632(sp)
	flw ft1, 132(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 472(sp)
	lw t0, 204(sp)
	flw ft0, 472(sp)
	fsw ft0, 0(t0)
# 1570~1570
# 1571~1571
	addi t0, zero, 1
	sw t0, 8(sp)
# 1571~1571
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 288(sp)
# 1571~1571
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 396(sp)
# 1571~1571
	flw ft0, 396(sp)
	flw ft1, 132(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 296(sp)
# 1571~1571
	flw ft0, 288(sp)
	flw ft1, 296(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 400(sp)
	lw t0, 204(sp)
	flw ft0, 400(sp)
	fsw ft0, 4(t0)
# 1571~1571
	lw a0, 316(sp)
	addi sp, sp, 636
	ret
._127_final:
	beq zero, zero, ._126_final
._126_then:
# 1551~1551
	addi t0, zero, 0
	sw t0, 80(sp)
# 1551~1551
	lw t0, 280(sp)
	flw ft0, 0(t0)
	fsw ft0, 592(sp)
# 1551~1551
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_x.2459
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 100(sp)
# 1551~1551
	flw ft0, 592(sp)
	flw ft1, 100(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 576(sp)
# 1553~1553
	la t0, f0.05000f
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 1553~1553
	flw ft0, 576(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 416(sp)
# 1553~1553
	sw ra, -4(sp)
	flw fa0, 416(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 136(sp)
# 1553~1553
	la t0, f20.00000f
	flw ft0, 0(t0)
	fsw ft0, 300(sp)
# 1553~1553
	flw ft0, 136(sp)
	flw ft1, 300(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 516(sp)
# 1554~1554
	flw ft0, 576(sp)
	flw ft1, 516(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 616(sp)
# 1554~1554
	la t0, f10.00000f
	flw ft0, 0(t0)
	fsw ft0, 464(sp)
# 1554~1554
	sw ra, -4(sp)
	flw fa0, 616(sp)
	flw fa1, 464(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 200(sp)
# 1556~1556
	addi t0, zero, 2
	sw t0, 528(sp)
# 1556~1556
	lw t0, 280(sp)
	flw ft0, 8(t0)
	fsw ft0, 588(sp)
# 1556~1556
	sw ra, -4(sp)
	lw a0, 364(sp)
	addi sp, sp, -4
	jal ra, o_param_z.2463
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 504(sp)
# 1556~1556
	flw ft0, 588(sp)
	flw ft1, 504(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 404(sp)
# 1558~1558
	la t0, f0.05000f
	flw ft0, 0(t0)
	fsw ft0, 192(sp)
# 1558~1558
	flw ft0, 404(sp)
	flw ft1, 192(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 336(sp)
# 1558~1558
	sw ra, -4(sp)
	flw fa0, 336(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 340(sp)
# 1558~1558
	la t0, f20.00000f
	flw ft0, 0(t0)
	fsw ft0, 40(sp)
# 1558~1558
	flw ft0, 340(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 428(sp)
# 1559~1559
	flw ft0, 404(sp)
	flw ft1, 428(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 168(sp)
# 1559~1559
	la t0, f10.00000f
	flw ft0, 0(t0)
	fsw ft0, 496(sp)
# 1559~1559
	sw ra, -4(sp)
	flw fa0, 168(sp)
	flw fa1, 496(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 1561~1561
	addi t0, zero, 1
	sw t0, 436(sp)
# 1562~1564
	addi t0, zero, 0
	sw t0, 444(sp)
	lw t0, 200(sp)
	lw t1, 444(sp)
	beq t0, t1, ._133_then
# 1563~1563
	addi t0, zero, 0
	sw t0, 188(sp)
	lw t0, 96(sp)
	lw t1, 188(sp)
	beq t0, t1, ._134_then
# 1563~1563
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
	beq zero, zero, ._134_final
._134_then:
# 1563~1563
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
._134_final:
	beq zero, zero, ._133_final
._133_then:
# 1564~1564
	addi t0, zero, 0
	sw t0, 76(sp)
	lw t0, 96(sp)
	lw t1, 76(sp)
	beq t0, t1, ._135_then
# 1564~1564
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
	beq zero, zero, ._135_final
._135_then:
# 1564~1564
	la t0, f255.00000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
._135_final:
._133_final:
	lw t0, 204(sp)
	flw ft0, 48(sp)
	fsw ft0, 4(t0)
# 1561~1564
	lw a0, 316(sp)
	addi sp, sp, 636
	ret
._126_final:
add_light.2713:
	addi sp, sp, -116
	fsw fa0, 36(sp)
	fsw fa1, 104(sp)
	fsw fa2, 40(sp)
	sw a0, 8(sp)
	lw t0, 8(sp)
	lw t1, 4(t0)
	sw t1, 28(sp)
	lw t1, 8(t0)
	sw t1, 4(sp)
# 1621~1621
	sw ra, -4(sp)
	flw fa0, 36(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 1621~1623
	addi t0, zero, 0
	sw t0, 72(sp)
	lw t0, 92(sp)
	lw t1, 72(sp)
	beq t0, t1, ._136_then
# 1622~1622
	sw ra, -4(sp)
	lw a0, 28(sp)
	flw fa0, 36(sp)
	lw a1, 4(sp)
	addi sp, sp, -4
	jal ra, vecaccum.2427
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
	beq zero, zero, ._136_final
._136_then:
# 0~0
._136_final:
# 1626~1626
	sw ra, -4(sp)
	flw fa0, 104(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 1626~1631
	addi t0, zero, 0
	sw t0, 96(sp)
	lw t0, 12(sp)
	lw t1, 96(sp)
	beq t0, t1, ._137_then
# 1627~1627
	sw ra, -4(sp)
	flw fa0, 104(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 108(sp)
# 1627~1627
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 1627~1627
	flw ft0, 44(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 68(sp)
# 1628~1628
	addi t0, zero, 0
	sw t0, 48(sp)
# 1628~1628
	addi t0, zero, 0
	sw t0, 16(sp)
# 1628~1628
	lw t0, 28(sp)
	flw ft0, 0(t0)
	fsw ft0, 112(sp)
# 1628~1628
	flw ft0, 112(sp)
	flw ft1, 68(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 88(sp)
	lw t0, 28(sp)
	flw ft0, 88(sp)
	fsw ft0, 0(t0)
# 1628~1628
# 1629~1629
	addi t0, zero, 1
	sw t0, 24(sp)
# 1629~1629
	addi t0, zero, 1
	sw t0, 20(sp)
# 1629~1629
	lw t0, 28(sp)
	flw ft0, 4(t0)
	fsw ft0, 56(sp)
# 1629~1629
	flw ft0, 56(sp)
	flw ft1, 68(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 64(sp)
	lw t0, 28(sp)
	flw ft0, 64(sp)
	fsw ft0, 4(t0)
# 1629~1629
# 1630~1630
	addi t0, zero, 2
	sw t0, 0(sp)
# 1630~1630
	addi t0, zero, 2
	sw t0, 52(sp)
# 1630~1630
	lw t0, 28(sp)
	flw ft0, 8(t0)
	fsw ft0, 60(sp)
# 1630~1630
	flw ft0, 60(sp)
	flw ft1, 68(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 84(sp)
	lw t0, 28(sp)
	flw ft0, 84(sp)
	fsw ft0, 8(t0)
# 1630~1630
	lw a0, 100(sp)
	addi sp, sp, 116
	ret
	beq zero, zero, ._137_final
._137_then:
# 0~0
	lw a0, 100(sp)
	addi sp, sp, 116
	ret
._137_final:
trace_reflections.2717:
	addi sp, sp, -168
	sw a0, 72(sp)
	fsw fa0, 100(sp)
	fsw fa1, 24(sp)
	sw a1, 40(sp)
	sw a2, 148(sp)
	lw t0, 148(sp)
	lw t1, 4(t0)
	sw t1, 88(sp)
	lw t1, 8(t0)
	sw t1, 68(sp)
	lw t1, 12(t0)
	sw t1, 140(sp)
	lw t1, 16(t0)
	sw t1, 76(sp)
	lw t1, 20(t0)
	sw t1, 104(sp)
	lw t1, 24(t0)
	sw t1, 120(sp)
	lw t1, 28(t0)
	sw t1, 144(sp)
	lw t1, 32(t0)
	sw t1, 44(sp)
# 1637~1637
	addi t0, zero, 0
	sw t0, 152(sp)
	lw t0, 72(sp)
	lw t1, 152(sp)
	bge t0, t1, ._138_then
# 0~0
	lw a0, 108(sp)
	addi sp, sp, 168
	ret
	beq zero, zero, ._138_final
._138_then:
# 1638~1638
	lw t0, 144(sp)
	lw t1, 72(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 52(sp)
# 1639~1639
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, r_dvec.2508
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 124(sp)
# 1642~1642
	sw ra, -4(sp)
	lw a0, 124(sp)
	lw a1, 76(sp)
	lw t0, 76(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 112(sp)
# 1642~1655
	addi t0, zero, 0
	sw t0, 48(sp)
	lw t0, 112(sp)
	lw t1, 48(sp)
	beq t0, t1, ._139_then
# 1643~1643
	addi t0, zero, 0
	sw t0, 8(sp)
# 1643~1643
	lw t0, 68(sp)
	lw t2, 0(t0)
	sw t2, 60(sp)
# 1643~1643
	lw t0, 60(sp)
	slli t2, t0, 2
	sw t2, 92(sp)
# 1643~1643
	addi t0, zero, 0
	sw t0, 12(sp)
# 1643~1643
	lw t0, 140(sp)
	lw t2, 0(t0)
	sw t2, 128(sp)
# 1643~1643
	lw t0, 92(sp)
	lw t1, 128(sp)
	add t2, t0, t1
	sw t2, 156(sp)
# 1644~1644
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, r_surface_id.2506
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw t0, 156(sp)
	lw t1, 0(sp)
	beq t0, t1, ._140_then
# 0~0
	beq zero, zero, ._140_final
._140_then:
# 1646~1646
	addi t0, zero, 0
	sw t0, 4(sp)
# 1646~1646
	addi t0, zero, 0
	sw t0, 64(sp)
# 1646~1646
	lw t0, 120(sp)
	lw t2, 0(t0)
	sw t2, 80(sp)
# 1646~1646
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 80(sp)
	lw a2, 44(sp)
	lw t0, 44(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 160(sp)
# 1646~1646
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 160(sp)
	lw t1, 16(sp)
	beq t0, t1, ._141_then
# 0~0
	beq zero, zero, ._141_final
._141_then:
# 1648~1648
	sw ra, -4(sp)
	lw a0, 124(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 1648~1648
	sw ra, -4(sp)
	lw a0, 104(sp)
	lw a1, 36(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 96(sp)
# 1649~1649
	sw ra, -4(sp)
	lw a0, 52(sp)
	addi sp, sp, -4
	jal ra, r_bright.2510
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 1650~1650
	flw ft0, 32(sp)
	flw ft1, 100(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 132(sp)
# 1650~1650
	flw ft0, 132(sp)
	flw ft1, 96(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 116(sp)
# 1651~1651
	sw ra, -4(sp)
	lw a0, 124(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1651~1651
	sw ra, -4(sp)
	lw a0, 40(sp)
	lw a1, 56(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 1651~1651
	flw ft0, 32(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 136(sp)
# 1652~1652
	sw ra, -4(sp)
	flw fa0, 116(sp)
	flw fa1, 136(sp)
	flw fa2, 24(sp)
	lw a0, 88(sp)
	lw t0, 88(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 84(sp)
._141_final:
._140_final:
	beq zero, zero, ._139_final
._139_then:
# 0~0
._139_final:
# 1656~1656
	addi t0, zero, 1
	sw t0, 164(sp)
# 1656~1656
	lw t0, 72(sp)
	addi t2, t0, -1
	sw t2, 20(sp)
# 1656~1656
	sw ra, -4(sp)
	lw a0, 20(sp)
	flw fa0, 100(sp)
	flw fa1, 24(sp)
	lw a1, 40(sp)
	lw a2, 148(sp)
	lw t0, 148(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 108(sp)
	lw a0, 108(sp)
	addi sp, sp, 168
	ret
._138_final:
trace_ray.2722:
	addi sp, sp, -536
	sw a0, 504(sp)
	fsw fa0, 12(sp)
	sw a1, 288(sp)
	sw a2, 284(sp)
	fsw fa1, 372(sp)
	sw a3, 156(sp)
	lw t0, 156(sp)
	lw t1, 4(t0)
	sw t1, 0(sp)
	lw t1, 8(t0)
	sw t1, 36(sp)
	lw t1, 12(t0)
	sw t1, 144(sp)
	lw t1, 16(t0)
	sw t1, 320(sp)
	lw t1, 20(t0)
	sw t1, 412(sp)
	lw t1, 24(t0)
	sw t1, 80(sp)
	lw t1, 28(t0)
	sw t1, 416(sp)
	lw t1, 32(t0)
	sw t1, 404(sp)
	lw t1, 36(t0)
	sw t1, 208(sp)
	lw t1, 40(t0)
	sw t1, 248(sp)
	lw t1, 44(t0)
	sw t1, 516(sp)
	lw t1, 48(t0)
	sw t1, 424(sp)
	lw t1, 52(t0)
	sw t1, 376(sp)
	lw t1, 56(t0)
	sw t1, 216(sp)
	lw t1, 60(t0)
	sw t1, 488(sp)
	lw t1, 64(t0)
	sw t1, 492(sp)
	lw t1, 68(t0)
	sw t1, 268(sp)
	lw t1, 72(t0)
	sw t1, 444(sp)
	lw t1, 76(t0)
	sw t1, 180(sp)
	lw t1, 80(t0)
	sw t1, 464(sp)
# 1663~1663
	addi t0, zero, 4
	sw t0, 184(sp)
	lw t0, 184(sp)
	lw t1, 504(sp)
	bge t0, t1, ._142_then
# 0~0
	lw a0, 356(sp)
	addi sp, sp, 536
	ret
	beq zero, zero, ._142_final
._142_then:
# 1664~1664
	sw ra, -4(sp)
	lw a0, 284(sp)
	addi sp, sp, -4
	jal ra, p_surface_ids.2487
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 496(sp)
# 1665~1665
	sw ra, -4(sp)
	lw a0, 288(sp)
	lw a1, 416(sp)
	lw t0, 416(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 260(sp)
# 1665~1743
	addi t0, zero, 0
	sw t0, 336(sp)
	lw t0, 260(sp)
	lw t1, 336(sp)
	beq t0, t1, ._143_then
# 1667~1667
	addi t0, zero, 0
	sw t0, 428(sp)
# 1667~1667
	lw t0, 320(sp)
	lw t2, 0(t0)
	sw t2, 236(sp)
# 1668~1668
	lw t0, 516(sp)
	lw t1, 236(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 340(sp)
# 1669~1669
	sw ra, -4(sp)
	lw a0, 340(sp)
	addi sp, sp, -4
	jal ra, o_reflectiontype.2445
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 348(sp)
# 1670~1670
	sw ra, -4(sp)
	lw a0, 340(sp)
	addi sp, sp, -4
	jal ra, o_diffuse.2465
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 1670~1670
	flw ft0, 28(sp)
	flw ft1, 12(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 188(sp)
# 1672~1672
	sw ra, -4(sp)
	lw a0, 340(sp)
	lw a1, 288(sp)
	lw a2, 144(sp)
	lw t0, 144(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 380(sp)
# 1673~1673
	sw ra, -4(sp)
	lw a0, 492(sp)
	lw a1, 412(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 196(sp)
# 1674~1674
	sw ra, -4(sp)
	lw a0, 340(sp)
	lw a1, 412(sp)
	lw a2, 464(sp)
	lw t0, 464(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 324(sp)
# 1677~1677
	lw t0, 236(sp)
	slli t2, t0, 2
	sw t2, 528(sp)
# 1677~1677
	addi t0, zero, 0
	sw t0, 104(sp)
# 1677~1677
	lw t0, 80(sp)
	lw t2, 0(t0)
	sw t2, 132(sp)
# 1677~1677
	lw t0, 528(sp)
	lw t1, 132(sp)
	add t2, t0, t1
	sw t2, 116(sp)
	lw t0, 496(sp)
	lw t2, 116(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1677~1677
# 1678~1678
	sw ra, -4(sp)
	lw a0, 284(sp)
	addi sp, sp, -4
	jal ra, p_intersection_points.2485
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 112(sp)
# 1679~1679
	lw t0, 112(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 152(sp)
# 1679~1679
	sw ra, -4(sp)
	lw a0, 152(sp)
	lw a1, 412(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 264(sp)
# 1682~1682
	sw ra, -4(sp)
	lw a0, 284(sp)
	addi sp, sp, -4
	jal ra, p_calc_diffuse.2489
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 472(sp)
# 1683~1683
	sw ra, -4(sp)
	lw a0, 340(sp)
	addi sp, sp, -4
	jal ra, o_diffuse.2465
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 140(sp)
# 1683~1683
	la t0, f0.50000f
	flw ft0, 0(t0)
	fsw ft0, 360(sp)
# 1683~1683
	sw ra, -4(sp)
	flw fa0, 140(sp)
	flw fa1, 360(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 384(sp)
# 1683~1692
	addi t0, zero, 0
	sw t0, 388(sp)
	lw t0, 384(sp)
	lw t1, 388(sp)
	beq t0, t1, ._144_then
# 1684~1684
	addi t0, zero, 0
	sw t0, 524(sp)
	lw t0, 472(sp)
	lw t2, 524(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1684~1684
	beq zero, zero, ._144_final
._144_then:
# 1686~1686
	addi t0, zero, 1
	sw t0, 52(sp)
	lw t0, 472(sp)
	lw t2, 52(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1686~1686
# 1687~1687
	sw ra, -4(sp)
	lw a0, 284(sp)
	addi sp, sp, -4
	jal ra, p_energy.2491
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 108(sp)
# 1688~1688
	lw t0, 108(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 456(sp)
# 1688~1688
	sw ra, -4(sp)
	lw a0, 456(sp)
	lw a1, 268(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 84(sp)
# 1689~1689
	lw t0, 108(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 280(sp)
# 1689~1689
	la t0, f0.00391f
	flw ft0, 0(t0)
	fsw ft0, 408(sp)
# 1689~1689
	flw ft0, 408(sp)
	flw ft1, 188(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 1689~1689
	sw ra, -4(sp)
	lw a0, 280(sp)
	flw fa0, 56(sp)
	addi sp, sp, -4
	jal ra, vecscale.2434
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 468(sp)
# 1690~1690
	sw ra, -4(sp)
	lw a0, 284(sp)
	addi sp, sp, -4
	jal ra, p_nvectors.2500
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 440(sp)
# 1691~1691
	lw t0, 440(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 4(sp)
# 1691~1691
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 248(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
._144_final:
# 1694~1694
	la t0, f-2.00000f
	flw ft0, 0(t0)
	fsw ft0, 352(sp)
# 1694~1694
	sw ra, -4(sp)
	lw a0, 288(sp)
	lw a1, 248(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 508(sp)
# 1694~1694
	flw ft0, 352(sp)
	flw ft1, 508(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 512(sp)
# 1696~1696
	sw ra, -4(sp)
	lw a0, 288(sp)
	flw fa0, 512(sp)
	lw a1, 248(sp)
	addi sp, sp, -4
	jal ra, vecaccum.2427
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1698~1698
	sw ra, -4(sp)
	lw a0, 340(sp)
	addi sp, sp, -4
	jal ra, o_hilight.2467
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 48(sp)
# 1698~1698
	flw ft0, 12(sp)
	flw ft1, 48(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 400(sp)
# 1701~1701
	addi t0, zero, 0
	sw t0, 432(sp)
# 1701~1701
	addi t0, zero, 0
	sw t0, 392(sp)
# 1701~1701
	lw t0, 424(sp)
	lw t2, 0(t0)
	sw t2, 72(sp)
# 1701~1701
	sw ra, -4(sp)
	lw a0, 432(sp)
	lw a1, 72(sp)
	lw a2, 488(sp)
	lw t0, 488(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 176(sp)
# 1701~1701
	addi t0, zero, 0
	sw t0, 20(sp)
	lw t0, 176(sp)
	lw t1, 20(sp)
	beq t0, t1, ._145_then
# 0~0
	beq zero, zero, ._145_final
._145_then:
# 1702~1702
	sw ra, -4(sp)
	lw a0, 248(sp)
	lw a1, 404(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 436(sp)
# 1702~1702
	sw ra, -4(sp)
	flw fa0, 436(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 304(sp)
# 1702~1702
	flw ft0, 304(sp)
	flw ft1, 188(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 204(sp)
# 1703~1703
	sw ra, -4(sp)
	lw a0, 288(sp)
	lw a1, 404(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 68(sp)
# 1703~1703
	sw ra, -4(sp)
	flw fa0, 68(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 40(sp)
# 1704~1704
	sw ra, -4(sp)
	flw fa0, 204(sp)
	flw fa1, 40(sp)
	flw fa2, 400(sp)
	lw a0, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 364(sp)
._145_final:
# 1708~1708
	sw ra, -4(sp)
	lw a0, 412(sp)
	lw a1, 216(sp)
	lw t0, 216(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 448(sp)
# 1709~1709
	addi t0, zero, 0
	sw t0, 520(sp)
# 1709~1709
	lw t0, 208(sp)
	lw t2, 0(t0)
	sw t2, 328(sp)
# 1709~1709
	addi t0, zero, 1
	sw t0, 60(sp)
# 1709~1709
	lw t0, 328(sp)
	addi t2, t0, -1
	sw t2, 460(sp)
# 1709~1709
	sw ra, -4(sp)
	lw a0, 460(sp)
	flw fa0, 188(sp)
	flw fa1, 400(sp)
	lw a1, 288(sp)
	lw a2, 180(sp)
	lw t0, 180(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
# 1712~1712
	la t0, f0.10000f
	flw ft0, 0(t0)
	fsw ft0, 300(sp)
# 1712~1712
	sw ra, -4(sp)
	flw fa0, 300(sp)
	flw fa1, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 160(sp)
# 1712~1723
	addi t0, zero, 0
	sw t0, 396(sp)
	lw t0, 160(sp)
	lw t1, 396(sp)
	beq t0, t1, ._146_then
# 1714~1714
	addi t0, zero, 4
	sw t0, 344(sp)
	lw t0, 504(sp)
	lw t1, 344(sp)
	bge t0, t1, ._147_then
# 1715~1715
	addi t0, zero, 1
	sw t0, 420(sp)
# 1715~1715
	lw t0, 504(sp)
	addi t2, t0, 1
	sw t2, 276(sp)
# 1715~1715
	addi t0, zero, -1
	sw t0, 244(sp)
	lw t0, 496(sp)
	lw t2, 244(sp)
	lw t1, 276(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1715~1715
	beq zero, zero, ._147_final
._147_then:
# 0~0
._147_final:
# 1718~1718
	addi t0, zero, 2
	sw t0, 192(sp)
	lw t0, 348(sp)
	lw t1, 192(sp)
	beq t0, t1, ._148_then
# 0~0
	lw a0, 356(sp)
	addi sp, sp, 536
	ret
	beq zero, zero, ._148_final
._148_then:
# 1719~1719
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 100(sp)
# 1719~1719
	sw ra, -4(sp)
	lw a0, 340(sp)
	addi sp, sp, -4
	jal ra, o_diffuse.2465
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 480(sp)
# 1719~1719
	flw ft0, 100(sp)
	flw ft1, 480(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 24(sp)
# 1719~1719
	flw ft0, 12(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 332(sp)
# 1720~1720
	addi t0, zero, 1
	sw t0, 76(sp)
# 1720~1720
	lw t0, 504(sp)
	addi t2, t0, 1
	sw t2, 212(sp)
# 1720~1720
	addi t0, zero, 0
	sw t0, 228(sp)
# 1720~1720
	lw t0, 444(sp)
	flw ft0, 0(t0)
	fsw ft0, 252(sp)
# 1720~1720
	flw ft0, 372(sp)
	flw ft1, 252(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 168(sp)
# 1720~1720
	sw ra, -4(sp)
	lw a0, 212(sp)
	flw fa0, 332(sp)
	lw a1, 288(sp)
	lw a2, 284(sp)
	flw fa1, 168(sp)
	lw a3, 156(sp)
	lw t0, 156(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 356(sp)
	lw a0, 356(sp)
	addi sp, sp, 536
	ret
._148_final:
	beq zero, zero, ._146_final
._146_then:
# 0~0
	lw a0, 356(sp)
	addi sp, sp, 536
	ret
._146_final:
	beq zero, zero, ._143_final
._143_then:
# 1728~1728
	addi t0, zero, -1
	sw t0, 476(sp)
	lw t0, 496(sp)
	lw t2, 476(sp)
	lw t1, 504(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 1728~1728
# 1730~1730
	addi t0, zero, 0
	sw t0, 224(sp)
	lw t0, 504(sp)
	lw t1, 224(sp)
	beq t0, t1, ._149_then
# 1731~1731
	sw ra, -4(sp)
	lw a0, 288(sp)
	lw a1, 404(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 500(sp)
# 1731~1731
	sw ra, -4(sp)
	flw fa0, 500(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 148(sp)
# 1733~1733
	sw ra, -4(sp)
	flw fa0, 148(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 232(sp)
# 1733~1741
	addi t0, zero, 0
	sw t0, 296(sp)
	lw t0, 232(sp)
	lw t1, 296(sp)
	beq t0, t1, ._150_then
# 1736~1736
	sw ra, -4(sp)
	flw fa0, 148(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 368(sp)
# 1736~1736
	flw ft0, 368(sp)
	flw ft1, 148(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 220(sp)
# 1736~1736
	flw ft0, 220(sp)
	flw ft1, 12(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 200(sp)
# 1736~1736
	addi t0, zero, 0
	sw t0, 452(sp)
# 1736~1736
	lw t0, 36(sp)
	flw ft0, 0(t0)
	fsw ft0, 124(sp)
# 1736~1736
	flw ft0, 200(sp)
	flw ft1, 124(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 240(sp)
# 1737~1737
	addi t0, zero, 0
	sw t0, 96(sp)
# 1737~1737
	addi t0, zero, 0
	sw t0, 92(sp)
# 1737~1737
	lw t0, 376(sp)
	flw ft0, 0(t0)
	fsw ft0, 292(sp)
# 1737~1737
	flw ft0, 292(sp)
	flw ft1, 240(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 8(sp)
	lw t0, 376(sp)
	flw ft0, 8(sp)
	fsw ft0, 0(t0)
# 1737~1737
# 1738~1738
	addi t0, zero, 1
	sw t0, 120(sp)
# 1738~1738
	addi t0, zero, 1
	sw t0, 308(sp)
# 1738~1738
	lw t0, 376(sp)
	flw ft0, 4(t0)
	fsw ft0, 32(sp)
# 1738~1738
	flw ft0, 32(sp)
	flw ft1, 240(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 312(sp)
	lw t0, 376(sp)
	flw ft0, 312(sp)
	fsw ft0, 4(t0)
# 1738~1738
# 1739~1739
	addi t0, zero, 2
	sw t0, 484(sp)
# 1739~1739
	addi t0, zero, 2
	sw t0, 88(sp)
# 1739~1739
	lw t0, 376(sp)
	flw ft0, 8(t0)
	fsw ft0, 316(sp)
# 1739~1739
	flw ft0, 316(sp)
	flw ft1, 240(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 136(sp)
	lw t0, 376(sp)
	flw ft0, 136(sp)
	fsw ft0, 8(t0)
# 1739~1739
	lw a0, 356(sp)
	addi sp, sp, 536
	ret
	beq zero, zero, ._150_final
._150_then:
# 0~0
	lw a0, 356(sp)
	addi sp, sp, 536
	ret
._150_final:
	beq zero, zero, ._149_final
._149_then:
# 0~0
	lw a0, 356(sp)
	addi sp, sp, 536
	ret
._149_final:
._143_final:
._142_final:
trace_diffuse_ray.2728:
	addi sp, sp, -148
	sw a0, 4(sp)
	fsw fa0, 36(sp)
	sw a1, 92(sp)
	lw t0, 92(sp)
	lw t1, 4(t0)
	sw t1, 88(sp)
	lw t1, 8(t0)
	sw t1, 40(sp)
	lw t1, 12(t0)
	sw t1, 120(sp)
	lw t1, 16(t0)
	sw t1, 56(sp)
	lw t1, 20(t0)
	sw t1, 96(sp)
	lw t1, 24(t0)
	sw t1, 16(sp)
	lw t1, 28(t0)
	sw t1, 72(sp)
	lw t1, 32(t0)
	sw t1, 20(sp)
	lw t1, 36(t0)
	sw t1, 100(sp)
	lw t1, 40(t0)
	sw t1, 112(sp)
	lw t1, 44(t0)
	sw t1, 116(sp)
	lw t1, 48(t0)
	sw t1, 108(sp)
# 1755~1755
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 96(sp)
	lw t0, 96(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1755~1766
	addi t0, zero, 0
	sw t0, 44(sp)
	lw t0, 8(sp)
	lw t1, 44(sp)
	beq t0, t1, ._151_then
# 1756~1756
	addi t0, zero, 0
	sw t0, 76(sp)
# 1756~1756
	lw t0, 120(sp)
	lw t2, 0(t0)
	sw t2, 48(sp)
# 1756~1756
	lw t0, 20(sp)
	lw t1, 48(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 24(sp)
# 1757~1757
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
# 1757~1757
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 80(sp)
	lw a2, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 140(sp)
# 1758~1758
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 56(sp)
	lw a2, 108(sp)
	lw t0, 108(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 136(sp)
# 1761~1761
	addi t0, zero, 0
	sw t0, 128(sp)
# 1761~1761
	addi t0, zero, 0
	sw t0, 84(sp)
# 1761~1761
	lw t0, 100(sp)
	lw t2, 0(t0)
	sw t2, 60(sp)
# 1761~1761
	sw ra, -4(sp)
	lw a0, 128(sp)
	lw a1, 60(sp)
	lw a2, 112(sp)
	lw t0, 112(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
# 1761~1761
	addi t0, zero, 0
	sw t0, 68(sp)
	lw t0, 64(sp)
	lw t1, 68(sp)
	beq t0, t1, ._152_then
# 0~0
	lw a0, 144(sp)
	addi sp, sp, 148
	ret
	beq zero, zero, ._152_final
._152_then:
# 1762~1762
	sw ra, -4(sp)
	lw a0, 72(sp)
	lw a1, 16(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 1762~1762
	sw ra, -4(sp)
	flw fa0, 28(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 124(sp)
# 1763~1763
	sw ra, -4(sp)
	flw fa0, 124(sp)
	addi sp, sp, -4
	jal ra, min_caml_fispos
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 1763~1763
	addi t0, zero, 0
	sw t0, 0(sp)
	lw t0, 52(sp)
	lw t1, 0(sp)
	beq t0, t1, ._153_then
# 1763~1763
	flw ft0, 124(sp)
	fsw ft0, 12(sp)
	beq zero, zero, ._153_final
._153_then:
# 1763~1763
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
._153_final:
# 1764~1764
	flw ft0, 36(sp)
	flw ft1, 12(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 132(sp)
# 1764~1764
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, o_diffuse.2465
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 1764~1764
	flw ft0, 132(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 104(sp)
# 1764~1764
	sw ra, -4(sp)
	lw a0, 88(sp)
	flw fa0, 104(sp)
	lw a1, 116(sp)
	addi sp, sp, -4
	jal ra, vecaccum.2427
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 144(sp)
	lw a0, 144(sp)
	addi sp, sp, 148
	ret
._152_final:
	beq zero, zero, ._151_final
._151_then:
# 0~0
	lw a0, 144(sp)
	addi sp, sp, 148
	ret
._151_final:
iter_trace_diffuse_rays.2731:
	addi sp, sp, -96
	sw a0, 56(sp)
	sw a1, 28(sp)
	sw a2, 24(sp)
	sw a3, 52(sp)
	sw a4, 8(sp)
	lw t0, 8(sp)
	lw t1, 4(t0)
	sw t1, 4(sp)
# 1771~1771
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 52(sp)
	lw t1, 12(sp)
	bge t0, t1, ._154_then
# 0~0
	lw a0, 16(sp)
	addi sp, sp, 96
	ret
	beq zero, zero, ._154_final
._154_then:
# 1772~1772
	lw t0, 56(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 68(sp)
# 1772~1772
	sw ra, -4(sp)
	lw a0, 68(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 1772~1772
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 28(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 1775~1775
	sw ra, -4(sp)
	flw fa0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_fisneg
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 1775~1778
	addi t0, zero, 0
	sw t0, 20(sp)
	lw t0, 72(sp)
	lw t1, 20(sp)
	beq t0, t1, ._155_then
# 1776~1776
	addi t0, zero, 1
	sw t0, 76(sp)
# 1776~1776
	lw t0, 52(sp)
	addi t2, t0, 1
	sw t2, 44(sp)
# 1776~1776
	lw t0, 56(sp)
	lw t1, 44(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 0(sp)
# 1776~1776
	la t0, f-150.00000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 1776~1776
	flw ft0, 32(sp)
	flw ft1, 48(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 80(sp)
# 1776~1776
	sw ra, -4(sp)
	lw a0, 0(sp)
	flw fa0, 80(sp)
	lw a1, 4(sp)
	lw t0, 4(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	beq zero, zero, ._155_final
._155_then:
# 1778~1778
	lw t0, 56(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 88(sp)
# 1778~1778
	la t0, f150.00000f
	flw ft0, 0(t0)
	fsw ft0, 92(sp)
# 1778~1778
	flw ft0, 32(sp)
	flw ft1, 92(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 84(sp)
# 1778~1778
	sw ra, -4(sp)
	lw a0, 88(sp)
	flw fa0, 84(sp)
	lw a1, 4(sp)
	lw t0, 4(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
._155_final:
# 1780~1780
	addi t0, zero, 2
	sw t0, 64(sp)
# 1780~1780
	lw t0, 52(sp)
	addi t2, t0, -2
	sw t2, 60(sp)
# 1780~1780
	sw ra, -4(sp)
	lw a0, 56(sp)
	lw a1, 28(sp)
	lw a2, 24(sp)
	lw a3, 60(sp)
	lw a4, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
	lw a0, 16(sp)
	addi sp, sp, 96
	ret
._154_final:
trace_diffuse_rays.2736:
	addi sp, sp, -36
	sw a0, 32(sp)
	sw a1, 28(sp)
	sw a2, 0(sp)
	sw a3, 12(sp)
	lw t0, 12(sp)
	lw t1, 4(t0)
	sw t1, 8(sp)
	lw t1, 8(t0)
	sw t1, 16(sp)
# 1786~1786
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 16(sp)
	lw t0, 16(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 1789~1789
	addi t0, zero, 118
	sw t0, 20(sp)
# 1789~1789
	sw ra, -4(sp)
	lw a0, 32(sp)
	lw a1, 28(sp)
	lw a2, 0(sp)
	lw a3, 20(sp)
	lw a4, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw a0, 24(sp)
	addi sp, sp, 36
	ret
trace_diffuse_ray_80percent.2740:
	addi sp, sp, -104
	sw a0, 72(sp)
	sw a1, 88(sp)
	sw a2, 12(sp)
	sw a3, 0(sp)
	lw t0, 0(sp)
	lw t1, 4(t0)
	sw t1, 96(sp)
	lw t1, 8(t0)
	sw t1, 8(sp)
# 1795~1795
	addi t0, zero, 0
	sw t0, 64(sp)
	lw t0, 72(sp)
	lw t1, 64(sp)
	beq t0, t1, ._156_then
# 1796~1796
	addi t0, zero, 0
	sw t0, 4(sp)
# 1796~1796
	lw t0, 96(sp)
	lw t2, 0(t0)
	sw t2, 92(sp)
# 1796~1796
	sw ra, -4(sp)
	lw a0, 92(sp)
	lw a1, 88(sp)
	lw a2, 12(sp)
	lw a3, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 84(sp)
	beq zero, zero, ._156_final
._156_then:
# 0~0
._156_final:
# 1799~1799
	addi t0, zero, 1
	sw t0, 68(sp)
	lw t0, 72(sp)
	lw t1, 68(sp)
	beq t0, t1, ._157_then
# 1800~1800
	addi t0, zero, 1
	sw t0, 36(sp)
# 1800~1800
	lw t0, 96(sp)
	lw t2, 4(t0)
	sw t2, 16(sp)
# 1800~1800
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 88(sp)
	lw a2, 12(sp)
	lw a3, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
	beq zero, zero, ._157_final
._157_then:
# 0~0
._157_final:
# 1803~1803
	addi t0, zero, 2
	sw t0, 60(sp)
	lw t0, 72(sp)
	lw t1, 60(sp)
	beq t0, t1, ._158_then
# 1804~1804
	addi t0, zero, 2
	sw t0, 28(sp)
# 1804~1804
	lw t0, 96(sp)
	lw t2, 8(t0)
	sw t2, 44(sp)
# 1804~1804
	sw ra, -4(sp)
	lw a0, 44(sp)
	lw a1, 88(sp)
	lw a2, 12(sp)
	lw a3, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
	beq zero, zero, ._158_final
._158_then:
# 0~0
._158_final:
# 1807~1807
	addi t0, zero, 3
	sw t0, 20(sp)
	lw t0, 72(sp)
	lw t1, 20(sp)
	beq t0, t1, ._159_then
# 1808~1808
	addi t0, zero, 3
	sw t0, 48(sp)
# 1808~1808
	lw t0, 96(sp)
	lw t2, 12(t0)
	sw t2, 24(sp)
# 1808~1808
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 88(sp)
	lw a2, 12(sp)
	lw a3, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 76(sp)
	beq zero, zero, ._159_final
._159_then:
# 0~0
._159_final:
# 1811~1811
	addi t0, zero, 4
	sw t0, 56(sp)
	lw t0, 72(sp)
	lw t1, 56(sp)
	beq t0, t1, ._160_then
# 1812~1812
	addi t0, zero, 4
	sw t0, 40(sp)
# 1812~1812
	lw t0, 96(sp)
	lw t2, 16(t0)
	sw t2, 80(sp)
# 1812~1812
	sw ra, -4(sp)
	lw a0, 80(sp)
	lw a1, 88(sp)
	lw a2, 12(sp)
	lw a3, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 104
	ret
	beq zero, zero, ._160_final
._160_then:
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 104
	ret
._160_final:
calc_diffuse_using_1point.2744:
	addi sp, sp, -72
	sw a0, 16(sp)
	sw a1, 24(sp)
	sw a2, 20(sp)
	lw t0, 20(sp)
	lw t1, 4(t0)
	sw t1, 64(sp)
	lw t1, 8(t0)
	sw t1, 52(sp)
	lw t1, 12(t0)
	sw t1, 68(sp)
# 1820~1820
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, p_received_ray_20percent.2493
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 1821~1821
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, p_nvectors.2500
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 1822~1822
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, p_intersection_points.2485
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1823~1823
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, p_energy.2491
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1825~1825
	lw t0, 0(sp)
	lw t1, 24(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 8(sp)
# 1825~1825
	sw ra, -4(sp)
	lw a0, 64(sp)
	lw a1, 8(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 1827~1827
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, p_group_id.2495
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 1828~1828
	lw t0, 36(sp)
	lw t1, 24(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 44(sp)
# 1829~1829
	lw t0, 56(sp)
	lw t1, 24(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 12(sp)
# 1826~1829
	sw ra, -4(sp)
	lw a0, 4(sp)
	lw a1, 44(sp)
	lw a2, 12(sp)
	lw a3, 68(sp)
	lw t0, 68(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 1830~1830
	lw t0, 32(sp)
	lw t1, 24(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 28(sp)
# 1830~1830
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 28(sp)
	lw a2, 64(sp)
	addi sp, sp, -4
	jal ra, vecaccumv.2437
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 60(sp)
	lw a0, 60(sp)
	addi sp, sp, 72
	ret
calc_diffuse_using_5points.2747:
	addi sp, sp, -144
	sw a0, 100(sp)
	sw a1, 132(sp)
	sw a2, 84(sp)
	sw a3, 80(sp)
	sw a4, 136(sp)
	sw a5, 48(sp)
	lw t0, 48(sp)
	lw t1, 4(t0)
	sw t1, 24(sp)
	lw t1, 8(t0)
	sw t1, 60(sp)
# 1838~1838
	lw t0, 132(sp)
	lw t1, 100(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 4(sp)
# 1838~1838
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, p_received_ray_20percent.2493
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 116(sp)
# 1839~1839
	addi t0, zero, 1
	sw t0, 0(sp)
# 1839~1839
	lw t0, 100(sp)
	addi t2, t0, -1
	sw t2, 104(sp)
# 1839~1839
	lw t0, 84(sp)
	lw t1, 104(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 72(sp)
# 1839~1839
	sw ra, -4(sp)
	lw a0, 72(sp)
	addi sp, sp, -4
	jal ra, p_received_ray_20percent.2493
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 1840~1840
	lw t0, 84(sp)
	lw t1, 100(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 64(sp)
# 1840~1840
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, p_received_ray_20percent.2493
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 120(sp)
# 1841~1841
	addi t0, zero, 1
	sw t0, 52(sp)
# 1841~1841
	lw t0, 100(sp)
	addi t2, t0, 1
	sw t2, 76(sp)
# 1841~1841
	lw t0, 84(sp)
	lw t1, 76(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 112(sp)
# 1841~1841
	sw ra, -4(sp)
	lw a0, 112(sp)
	addi sp, sp, -4
	jal ra, p_received_ray_20percent.2493
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 1842~1842
	lw t0, 80(sp)
	lw t1, 100(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 44(sp)
# 1842~1842
	sw ra, -4(sp)
	lw a0, 44(sp)
	addi sp, sp, -4
	jal ra, p_received_ray_20percent.2493
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 1844~1844
	lw t0, 116(sp)
	lw t1, 136(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 36(sp)
# 1844~1844
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 36(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 68(sp)
# 1845~1845
	lw t0, 92(sp)
	lw t1, 136(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 40(sp)
# 1845~1845
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 40(sp)
	addi sp, sp, -4
	jal ra, vecadd.2431
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1846~1846
	lw t0, 120(sp)
	lw t1, 136(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 12(sp)
# 1846~1846
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 12(sp)
	addi sp, sp, -4
	jal ra, vecadd.2431
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1847~1847
	lw t0, 32(sp)
	lw t1, 136(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 108(sp)
# 1847~1847
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 108(sp)
	addi sp, sp, -4
	jal ra, vecadd.2431
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 124(sp)
# 1848~1848
	lw t0, 96(sp)
	lw t1, 136(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 88(sp)
# 1848~1848
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 88(sp)
	addi sp, sp, -4
	jal ra, vecadd.2431
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 128(sp)
# 1850~1850
	lw t0, 84(sp)
	lw t1, 100(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 140(sp)
# 1850~1850
	sw ra, -4(sp)
	lw a0, 140(sp)
	addi sp, sp, -4
	jal ra, p_energy.2491
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 1851~1851
	lw t0, 28(sp)
	lw t1, 136(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 16(sp)
# 1851~1851
	sw ra, -4(sp)
	lw a0, 60(sp)
	lw a1, 16(sp)
	lw a2, 24(sp)
	addi sp, sp, -4
	jal ra, vecaccumv.2437
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 144
	ret
do_without_neighbors.2753:
	addi sp, sp, -60
	sw a0, 0(sp)
	sw a1, 20(sp)
	sw a2, 24(sp)
	lw t0, 24(sp)
	lw t1, 4(t0)
	sw t1, 8(sp)
# 1857~1857
	addi t0, zero, 4
	sw t0, 52(sp)
	lw t0, 52(sp)
	lw t1, 20(sp)
	bge t0, t1, ._161_then
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 60
	ret
	beq zero, zero, ._161_final
._161_then:
# 1859~1859
	sw ra, -4(sp)
	lw a0, 0(sp)
	addi sp, sp, -4
	jal ra, p_surface_ids.2487
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1860~1860
	addi t0, zero, 0
	sw t0, 36(sp)
# 1860~1860
	lw t0, 16(sp)
	lw t1, 20(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 12(sp)
	lw t0, 12(sp)
	lw t1, 36(sp)
	bge t0, t1, ._162_then
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 60
	ret
	beq zero, zero, ._162_final
._162_then:
# 1861~1861
	sw ra, -4(sp)
	lw a0, 0(sp)
	addi sp, sp, -4
	jal ra, p_calc_diffuse.2489
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1862~1862
	lw t0, 56(sp)
	lw t1, 20(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 28(sp)
# 1862~1864
	addi t0, zero, 0
	sw t0, 40(sp)
	lw t0, 28(sp)
	lw t1, 40(sp)
	beq t0, t1, ._163_then
# 1863~1863
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 20(sp)
	lw a2, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
	beq zero, zero, ._163_final
._163_then:
# 0~0
._163_final:
# 1865~1865
	addi t0, zero, 1
	sw t0, 48(sp)
# 1865~1865
	lw t0, 20(sp)
	addi t2, t0, 1
	sw t2, 4(sp)
# 1865~1865
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw a2, 24(sp)
	lw t0, 24(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 60
	ret
._162_final:
._161_final:
neighbors_exist.2756:
	addi sp, sp, -64
	sw a0, 56(sp)
	sw a1, 40(sp)
	sw a2, 20(sp)
	sw a3, 36(sp)
	lw t0, 36(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
# 1872~1872
	addi t0, zero, 1
	sw t0, 60(sp)
# 1872~1872
	lw t0, 12(sp)
	lw t2, 4(t0)
	sw t2, 16(sp)
# 1872~1872
	addi t0, zero, 1
	sw t0, 4(sp)
# 1872~1872
	lw t0, 40(sp)
	addi t2, t0, 1
	sw t2, 24(sp)
	lw t0, 24(sp)
	lw t1, 16(sp)
	bge t0, t1, ._164_then
# 1873~1873
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 32(sp)
	lw t1, 40(sp)
	bge t0, t1, ._165_then
# 1874~1874
	addi t0, zero, 0
	sw t0, 44(sp)
# 1874~1874
	lw t0, 12(sp)
	lw t2, 0(t0)
	sw t2, 48(sp)
# 1874~1874
	addi t0, zero, 1
	sw t0, 8(sp)
# 1874~1874
	lw t0, 56(sp)
	addi t2, t0, 1
	sw t2, 0(sp)
	lw t0, 0(sp)
	lw t1, 48(sp)
	bge t0, t1, ._166_then
# 1875~1875
	addi t0, zero, 0
	sw t0, 28(sp)
	lw t0, 28(sp)
	lw t1, 56(sp)
	bge t0, t1, ._167_then
# 1876~1876
	addi t0, zero, 1
	sw t0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 64
	ret
	beq zero, zero, ._167_final
._167_then:
# 1877~1877
	addi t0, zero, 0
	sw t0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 64
	ret
._167_final:
	beq zero, zero, ._166_final
._166_then:
# 1878~1878
	addi t0, zero, 0
	sw t0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 64
	ret
._166_final:
	beq zero, zero, ._165_final
._165_then:
# 1879~1879
	addi t0, zero, 0
	sw t0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 64
	ret
._165_final:
	beq zero, zero, ._164_final
._164_then:
# 1880~1880
	addi t0, zero, 0
	sw t0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 64
	ret
._164_final:
get_surface_id.2760:
	addi sp, sp, -20
	sw a0, 4(sp)
	sw a1, 16(sp)
# 1884~1884
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, p_surface_ids.2487
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
# 1885~1885
	lw t0, 0(sp)
	lw t1, 16(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 20
	ret
neighbors_are_available.2763:
	addi sp, sp, -84
	sw a0, 4(sp)
	sw a1, 36(sp)
	sw a2, 8(sp)
	sw a3, 44(sp)
	sw a4, 12(sp)
# 1890~1890
	lw t0, 8(sp)
	lw t1, 4(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 76(sp)
# 1890~1890
	sw ra, -4(sp)
	lw a0, 76(sp)
	lw a1, 12(sp)
	addi sp, sp, -4
	jal ra, get_surface_id.2760
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1892~1892
	lw t0, 36(sp)
	lw t1, 4(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 48(sp)
# 1892~1892
	sw ra, -4(sp)
	lw a0, 48(sp)
	lw a1, 12(sp)
	addi sp, sp, -4
	jal ra, get_surface_id.2760
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
	lw t0, 52(sp)
	lw t1, 16(sp)
	beq t0, t1, ._168_then
# 1900~1900
	addi t0, zero, 0
	sw t0, 60(sp)
	lw a0, 60(sp)
	addi sp, sp, 84
	ret
	beq zero, zero, ._168_final
._168_then:
# 1893~1893
	lw t0, 44(sp)
	lw t1, 4(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 64(sp)
# 1893~1893
	sw ra, -4(sp)
	lw a0, 64(sp)
	lw a1, 12(sp)
	addi sp, sp, -4
	jal ra, get_surface_id.2760
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw t0, 32(sp)
	lw t1, 16(sp)
	beq t0, t1, ._169_then
# 1899~1899
	addi t0, zero, 0
	sw t0, 60(sp)
	lw a0, 60(sp)
	addi sp, sp, 84
	ret
	beq zero, zero, ._169_final
._169_then:
# 1894~1894
	addi t0, zero, 1
	sw t0, 68(sp)
# 1894~1894
	lw t0, 4(sp)
	addi t2, t0, -1
	sw t2, 56(sp)
# 1894~1894
	lw t0, 8(sp)
	lw t1, 56(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 0(sp)
# 1894~1894
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 12(sp)
	addi sp, sp, -4
	jal ra, get_surface_id.2760
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw t0, 24(sp)
	lw t1, 16(sp)
	beq t0, t1, ._170_then
# 1898~1898
	addi t0, zero, 0
	sw t0, 60(sp)
	lw a0, 60(sp)
	addi sp, sp, 84
	ret
	beq zero, zero, ._170_final
._170_then:
# 1895~1895
	addi t0, zero, 1
	sw t0, 80(sp)
# 1895~1895
	lw t0, 4(sp)
	addi t2, t0, 1
	sw t2, 72(sp)
# 1895~1895
	lw t0, 8(sp)
	lw t1, 72(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 20(sp)
# 1895~1895
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 12(sp)
	addi sp, sp, -4
	jal ra, get_surface_id.2760
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
	lw t0, 28(sp)
	lw t1, 16(sp)
	beq t0, t1, ._171_then
# 1897~1897
	addi t0, zero, 0
	sw t0, 60(sp)
	lw a0, 60(sp)
	addi sp, sp, 84
	ret
	beq zero, zero, ._171_final
._171_then:
# 1896~1896
	addi t0, zero, 1
	sw t0, 60(sp)
	lw a0, 60(sp)
	addi sp, sp, 84
	ret
._171_final:
._170_final:
._169_final:
._168_final:
try_exploit_neighbors.2769:
	addi sp, sp, -92
	sw a0, 52(sp)
	sw a1, 32(sp)
	sw a2, 48(sp)
	sw a3, 20(sp)
	sw a4, 24(sp)
	sw a5, 16(sp)
	sw a6, 0(sp)
	lw t0, 0(sp)
	lw t1, 4(t0)
	sw t1, 80(sp)
	lw t1, 8(t0)
	sw t1, 28(sp)
# 1906~1906
	lw t0, 20(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 84(sp)
# 1907~1907
	addi t0, zero, 4
	sw t0, 4(sp)
	lw t0, 4(sp)
	lw t1, 16(sp)
	bge t0, t1, ._172_then
# 0~0
	lw a0, 40(sp)
	addi sp, sp, 92
	ret
	beq zero, zero, ._172_final
._172_then:
# 1910~1910
	addi t0, zero, 0
	sw t0, 68(sp)
# 1910~1910
	sw ra, -4(sp)
	lw a0, 84(sp)
	lw a1, 16(sp)
	addi sp, sp, -4
	jal ra, get_surface_id.2760
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
	lw t0, 36(sp)
	lw t1, 68(sp)
	bge t0, t1, ._173_then
# 0~0
	lw a0, 40(sp)
	addi sp, sp, 92
	ret
	beq zero, zero, ._173_final
._173_then:
# 1912~1912
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 48(sp)
	lw a2, 20(sp)
	lw a3, 24(sp)
	lw a4, 16(sp)
	addi sp, sp, -4
	jal ra, neighbors_are_available.2763
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1912~1924
	addi t0, zero, 0
	sw t0, 76(sp)
	lw t0, 8(sp)
	lw t1, 76(sp)
	beq t0, t1, ._174_then
# 1915~1915
	sw ra, -4(sp)
	lw a0, 84(sp)
	addi sp, sp, -4
	jal ra, p_calc_diffuse.2489
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
# 1916~1916
	lw t0, 64(sp)
	lw t1, 16(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 44(sp)
# 1916~1918
	addi t0, zero, 0
	sw t0, 72(sp)
	lw t0, 44(sp)
	lw t1, 72(sp)
	beq t0, t1, ._175_then
# 1917~1917
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 48(sp)
	lw a2, 20(sp)
	lw a3, 24(sp)
	lw a4, 16(sp)
	lw a5, 80(sp)
	lw t0, 80(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
	beq zero, zero, ._175_final
._175_then:
# 0~0
._175_final:
# 1921~1921
	addi t0, zero, 1
	sw t0, 88(sp)
# 1921~1921
	lw t0, 16(sp)
	addi t2, t0, 1
	sw t2, 56(sp)
# 1921~1921
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 32(sp)
	lw a2, 48(sp)
	lw a3, 20(sp)
	lw a4, 24(sp)
	lw a5, 56(sp)
	lw a6, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 92
	ret
	beq zero, zero, ._174_final
._174_then:
# 1924~1924
	lw t0, 20(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 60(sp)
# 1924~1924
	sw ra, -4(sp)
	lw a0, 60(sp)
	lw a1, 16(sp)
	lw a2, 28(sp)
	lw t0, 28(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
	lw a0, 40(sp)
	addi sp, sp, 92
	ret
._174_final:
._173_final:
._172_final:
write_ppm_header.2776:
	addi sp, sp, -96
	sw a0, 0(sp)
	sw a1, 48(sp)
	lw t0, 48(sp)
	lw t1, 4(t0)
	sw t1, 36(sp)
# 1932~1932
	addi t0, zero, 80
	sw t0, 84(sp)
# 1932~1932
	sw ra, -4(sp)
	lw a0, 84(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 88(sp)
# 1933~1933
	addi t0, zero, 48
	sw t0, 20(sp)
# 1933~1933
	lw t0, 0(sp)
	addi t2, t0, 48
	sw t2, 80(sp)
# 1933~1933
	sw ra, -4(sp)
	lw a0, 80(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 1934~1934
	addi t0, zero, 10
	sw t0, 56(sp)
# 1934~1934
	sw ra, -4(sp)
	lw a0, 56(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 1935~1935
	addi t0, zero, 0
	sw t0, 8(sp)
# 1935~1935
	lw t0, 36(sp)
	lw t2, 0(t0)
	sw t2, 68(sp)
# 1935~1935
	sw ra, -4(sp)
	lw a0, 68(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 1936~1936
	addi t0, zero, 32
	sw t0, 4(sp)
# 1936~1936
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 76(sp)
# 1937~1937
	addi t0, zero, 1
	sw t0, 92(sp)
# 1937~1937
	lw t0, 36(sp)
	lw t2, 4(t0)
	sw t2, 60(sp)
# 1937~1937
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1938~1938
	addi t0, zero, 32
	sw t0, 32(sp)
# 1938~1938
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 1939~1939
	addi t0, zero, 255
	sw t0, 64(sp)
# 1939~1939
	sw ra, -4(sp)
	lw a0, 64(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 1940~1940
	addi t0, zero, 10
	sw t0, 12(sp)
# 1940~1940
	sw ra, -4(sp)
	lw a0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
	lw a0, 44(sp)
	addi sp, sp, 96
	ret
write_rgb_element_int.2778:
	addi sp, sp, -28
	fsw fa0, 8(sp)
# 1945~1945
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_int_of_float
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 1946~1946
	addi t0, zero, 255
	sw t0, 0(sp)
	lw t0, 0(sp)
	lw t1, 24(sp)
	bge t0, t1, ._176_then
# 1946~1946
	addi t0, zero, 255
	sw t0, 4(sp)
	beq zero, zero, ._176_final
._176_then:
# 1946~1946
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 24(sp)
	lw t1, 12(sp)
	bge t0, t1, ._177_then
# 1946~1946
	addi t0, zero, 0
	sw t0, 4(sp)
	beq zero, zero, ._177_final
._177_then:
# 1946~1946
	lw t0, 24(sp)
	sw t0, 4(sp)
._177_final:
._176_final:
# 1947~1947
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 28
	ret
write_rgb_element_char.2780:
	addi sp, sp, -28
	fsw fa0, 0(sp)
# 1951~1951
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_int_of_float
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 1952~1952
	addi t0, zero, 255
	sw t0, 8(sp)
	lw t0, 8(sp)
	lw t1, 16(sp)
	bge t0, t1, ._178_then
# 1952~1952
	addi t0, zero, 255
	sw t0, 4(sp)
	beq zero, zero, ._178_final
._178_then:
# 1952~1952
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 16(sp)
	lw t1, 12(sp)
	bge t0, t1, ._179_then
# 1952~1952
	addi t0, zero, 0
	sw t0, 4(sp)
	beq zero, zero, ._179_final
._179_then:
# 1952~1952
	lw t0, 16(sp)
	sw t0, 4(sp)
._179_final:
._178_final:
# 1953~1953
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 28
	ret
write_rgb.2782:
	addi sp, sp, -108
	sw a0, 0(sp)
	sw a1, 44(sp)
	lw t0, 44(sp)
	lw t1, 4(t0)
	sw t1, 56(sp)
# 1957~1957
	addi t0, zero, 3
	sw t0, 80(sp)
	lw t0, 0(sp)
	lw t1, 80(sp)
	beq t0, t1, ._180_then
# 1965~1965
	addi t0, zero, 0
	sw t0, 100(sp)
# 1965~1965
	lw t0, 56(sp)
	flw ft0, 0(t0)
	fsw ft0, 64(sp)
# 1965~1965
	sw ra, -4(sp)
	flw fa0, 64(sp)
	addi sp, sp, -4
	jal ra, write_rgb_element_char.2780
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 1966~1966
	addi t0, zero, 1
	sw t0, 88(sp)
# 1966~1966
	lw t0, 56(sp)
	flw ft0, 4(t0)
	fsw ft0, 84(sp)
# 1966~1966
	sw ra, -4(sp)
	flw fa0, 84(sp)
	addi sp, sp, -4
	jal ra, write_rgb_element_char.2780
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 1967~1967
	addi t0, zero, 2
	sw t0, 92(sp)
# 1967~1967
	lw t0, 56(sp)
	flw ft0, 8(t0)
	fsw ft0, 60(sp)
# 1967~1967
	sw ra, -4(sp)
	flw fa0, 60(sp)
	addi sp, sp, -4
	jal ra, write_rgb_element_char.2780
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
	lw a0, 12(sp)
	addi sp, sp, 108
	ret
	beq zero, zero, ._180_final
._180_then:
# 1958~1958
	addi t0, zero, 0
	sw t0, 28(sp)
# 1958~1958
	lw t0, 56(sp)
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
# 1958~1958
	sw ra, -4(sp)
	flw fa0, 36(sp)
	addi sp, sp, -4
	jal ra, write_rgb_element_int.2778
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1959~1959
	addi t0, zero, 32
	sw t0, 32(sp)
# 1959~1959
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 1960~1960
	addi t0, zero, 1
	sw t0, 52(sp)
# 1960~1960
	lw t0, 56(sp)
	flw ft0, 4(t0)
	fsw ft0, 72(sp)
# 1960~1960
	sw ra, -4(sp)
	flw fa0, 72(sp)
	addi sp, sp, -4
	jal ra, write_rgb_element_int.2778
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 1961~1961
	addi t0, zero, 32
	sw t0, 76(sp)
# 1961~1961
	sw ra, -4(sp)
	lw a0, 76(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 1962~1962
	addi t0, zero, 2
	sw t0, 16(sp)
# 1962~1962
	lw t0, 56(sp)
	flw ft0, 8(t0)
	fsw ft0, 104(sp)
# 1962~1962
	sw ra, -4(sp)
	flw fa0, 104(sp)
	addi sp, sp, -4
	jal ra, write_rgb_element_int.2778
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 1963~1963
	addi t0, zero, 10
	sw t0, 68(sp)
# 1963~1963
	sw ra, -4(sp)
	lw a0, 68(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_char
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
	lw a0, 12(sp)
	addi sp, sp, 108
	ret
._180_final:
pretrace_diffuse_rays.2784:
	addi sp, sp, -104
	sw a0, 36(sp)
	sw a1, 40(sp)
	sw a2, 96(sp)
	lw t0, 96(sp)
	lw t1, 4(t0)
	sw t1, 88(sp)
	lw t1, 8(t0)
	sw t1, 32(sp)
	lw t1, 12(t0)
	sw t1, 76(sp)
# 1977~1977
	addi t0, zero, 4
	sw t0, 72(sp)
	lw t0, 72(sp)
	lw t1, 40(sp)
	bge t0, t1, ._181_then
# 0~0
	lw a0, 80(sp)
	addi sp, sp, 104
	ret
	beq zero, zero, ._181_final
._181_then:
# 1980~1980
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 40(sp)
	addi sp, sp, -4
	jal ra, get_surface_id.2760
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 1981~1981
	addi t0, zero, 0
	sw t0, 68(sp)
	lw t0, 56(sp)
	lw t1, 68(sp)
	bge t0, t1, ._182_then
# 0~0
	lw a0, 80(sp)
	addi sp, sp, 104
	ret
	beq zero, zero, ._182_final
._182_then:
# 1983~1983
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, p_calc_diffuse.2489
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 1984~1984
	lw t0, 4(sp)
	lw t1, 40(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 16(sp)
# 1984~1997
	addi t0, zero, 0
	sw t0, 0(sp)
	lw t0, 16(sp)
	lw t1, 0(sp)
	beq t0, t1, ._183_then
# 1985~1985
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, p_group_id.2495
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
# 1986~1986
	sw ra, -4(sp)
	lw a0, 88(sp)
	addi sp, sp, -4
	jal ra, vecbzero.2411
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 1989~1989
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, p_nvectors.2500
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 1990~1990
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, p_intersection_points.2485
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 1992~1992
	lw t0, 32(sp)
	lw t1, 100(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 20(sp)
# 1993~1993
	lw t0, 12(sp)
	lw t1, 40(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 24(sp)
# 1994~1994
	lw t0, 52(sp)
	lw t1, 40(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 44(sp)
# 1991~1994
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 24(sp)
	lw a2, 44(sp)
	lw a3, 76(sp)
	lw t0, 76(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
# 1995~1995
	sw ra, -4(sp)
	lw a0, 36(sp)
	addi sp, sp, -4
	jal ra, p_received_ray_20percent.2493
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 1996~1996
	lw t0, 48(sp)
	lw t1, 40(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 28(sp)
# 1996~1996
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 88(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
	beq zero, zero, ._183_final
._183_then:
# 0~0
._183_final:
# 1998~1998
	addi t0, zero, 1
	sw t0, 84(sp)
# 1998~1998
	lw t0, 40(sp)
	addi t2, t0, 1
	sw t2, 60(sp)
# 1998~1998
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 60(sp)
	lw a2, 96(sp)
	lw t0, 96(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
	lw a0, 80(sp)
	addi sp, sp, 104
	ret
._182_final:
._181_final:
pretrace_pixels.2787:
	addi sp, sp, -256
	sw a0, 88(sp)
	sw a1, 52(sp)
	sw a2, 0(sp)
	fsw fa0, 132(sp)
	fsw fa1, 172(sp)
	fsw fa2, 40(sp)
	sw a3, 140(sp)
	lw t0, 140(sp)
	lw t1, 4(t0)
	sw t1, 176(sp)
	lw t1, 8(t0)
	sw t1, 108(sp)
	lw t1, 12(t0)
	sw t1, 228(sp)
	lw t1, 16(t0)
	sw t1, 148(sp)
	lw t1, 20(t0)
	sw t1, 4(sp)
	lw t1, 24(t0)
	sw t1, 8(sp)
	lw t1, 28(t0)
	sw t1, 180(sp)
	lw t1, 32(t0)
	sw t1, 72(sp)
	lw t1, 36(t0)
	sw t1, 44(sp)
# 2006~2006
	addi t0, zero, 0
	sw t0, 24(sp)
	lw t0, 52(sp)
	lw t1, 24(sp)
	bge t0, t1, ._184_then
# 0~0
	lw a0, 12(sp)
	addi sp, sp, 256
	ret
	beq zero, zero, ._184_final
._184_then:
# 2008~2008
	addi t0, zero, 0
	sw t0, 184(sp)
# 2008~2008
	lw t0, 4(sp)
	flw ft0, 0(t0)
	fsw ft0, 136(sp)
# 2008~2008
	addi t0, zero, 0
	sw t0, 76(sp)
# 2008~2008
	lw t0, 176(sp)
	lw t2, 0(t0)
	sw t2, 240(sp)
# 2008~2008
	lw t0, 52(sp)
	lw t1, 240(sp)
	sub t2, t0, t1
	sw t2, 84(sp)
# 2008~2008
	sw ra, -4(sp)
	lw a0, 84(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 116(sp)
# 2008~2008
	flw ft0, 136(sp)
	flw ft1, 116(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 200(sp)
# 2009~2009
	addi t0, zero, 0
	sw t0, 232(sp)
# 2009~2009
	addi t0, zero, 0
	sw t0, 96(sp)
# 2009~2009
	lw t0, 8(sp)
	flw ft0, 0(t0)
	fsw ft0, 104(sp)
# 2009~2009
	flw ft0, 200(sp)
	flw ft1, 104(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 244(sp)
# 2009~2009
	flw ft0, 244(sp)
	flw ft1, 132(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 112(sp)
	lw t0, 228(sp)
	flw ft0, 112(sp)
	fsw ft0, 0(t0)
# 2009~2009
# 2010~2010
	addi t0, zero, 1
	sw t0, 92(sp)
# 2010~2010
	addi t0, zero, 1
	sw t0, 252(sp)
# 2010~2010
	lw t0, 8(sp)
	flw ft0, 4(t0)
	fsw ft0, 188(sp)
# 2010~2010
	flw ft0, 200(sp)
	flw ft1, 188(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 60(sp)
# 2010~2010
	flw ft0, 60(sp)
	flw ft1, 172(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 248(sp)
	lw t0, 228(sp)
	flw ft0, 248(sp)
	fsw ft0, 4(t0)
# 2010~2010
# 2011~2011
	addi t0, zero, 2
	sw t0, 64(sp)
# 2011~2011
	addi t0, zero, 2
	sw t0, 160(sp)
# 2011~2011
	lw t0, 8(sp)
	flw ft0, 8(t0)
	fsw ft0, 236(sp)
# 2011~2011
	flw ft0, 200(sp)
	flw ft1, 236(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 2011~2011
	flw ft0, 28(sp)
	flw ft1, 40(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 192(sp)
	lw t0, 228(sp)
	flw ft0, 192(sp)
	fsw ft0, 8(t0)
# 2011~2011
# 2012~2012
	addi t0, zero, 0
	sw t0, 204(sp)
# 2012~2012
	sw ra, -4(sp)
	lw a0, 228(sp)
	lw a1, 204(sp)
	addi sp, sp, -4
	jal ra, vecunit_sgn.2416
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 168(sp)
# 2013~2013
	sw ra, -4(sp)
	lw a0, 148(sp)
	addi sp, sp, -4
	jal ra, vecbzero.2411
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 2014~2014
	sw ra, -4(sp)
	lw a0, 180(sp)
	lw a1, 44(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 208(sp)
# 2017~2017
	addi t0, zero, 0
	sw t0, 32(sp)
# 2017~2017
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 152(sp)
# 2017~2017
	lw t0, 88(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 212(sp)
# 2017~2017
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 124(sp)
# 2017~2017
	sw ra, -4(sp)
	lw a0, 32(sp)
	flw fa0, 152(sp)
	lw a1, 228(sp)
	lw a2, 212(sp)
	flw fa1, 124(sp)
	lw a3, 72(sp)
	lw t0, 72(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 156(sp)
# 2018~2018
	lw t0, 88(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 220(sp)
# 2018~2018
	sw ra, -4(sp)
	lw a0, 220(sp)
	addi sp, sp, -4
	jal ra, p_rgb.2483
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 128(sp)
# 2018~2018
	sw ra, -4(sp)
	lw a0, 128(sp)
	lw a1, 148(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 164(sp)
# 2019~2019
	lw t0, 88(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 80(sp)
# 2019~2019
	sw ra, -4(sp)
	lw a0, 80(sp)
	lw a1, 0(sp)
	addi sp, sp, -4
	jal ra, p_set_group_id.2497
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 68(sp)
# 2022~2022
	lw t0, 88(sp)
	lw t1, 52(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 144(sp)
# 2022~2022
	addi t0, zero, 0
	sw t0, 16(sp)
# 2022~2022
	sw ra, -4(sp)
	lw a0, 144(sp)
	lw a1, 16(sp)
	lw a2, 108(sp)
	lw t0, 108(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
# 2024~2024
	addi t0, zero, 1
	sw t0, 224(sp)
# 2024~2024
	lw t0, 52(sp)
	addi t2, t0, -1
	sw t2, 216(sp)
# 2024~2024
	addi t0, zero, 1
	sw t0, 36(sp)
# 2024~2024
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 36(sp)
	addi sp, sp, -4
	jal ra, add_mod5.2400
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 2024~2024
	sw ra, -4(sp)
	lw a0, 88(sp)
	lw a1, 216(sp)
	lw a2, 20(sp)
	flw fa0, 132(sp)
	flw fa1, 172(sp)
	flw fa2, 40(sp)
	lw a3, 140(sp)
	lw t0, 140(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
	lw a0, 12(sp)
	addi sp, sp, 256
	ret
._184_final:
pretrace_line.2794:
	addi sp, sp, -160
	sw a0, 76(sp)
	sw a1, 56(sp)
	sw a2, 40(sp)
	sw a3, 132(sp)
	lw t0, 132(sp)
	lw t1, 4(t0)
	sw t1, 68(sp)
	lw t1, 8(t0)
	sw t1, 16(sp)
	lw t1, 12(t0)
	sw t1, 72(sp)
	lw t1, 16(t0)
	sw t1, 28(sp)
	lw t1, 20(t0)
	sw t1, 88(sp)
	lw t1, 24(t0)
	sw t1, 136(sp)
# 2031~2031
	addi t0, zero, 0
	sw t0, 12(sp)
# 2031~2031
	lw t0, 28(sp)
	flw ft0, 0(t0)
	fsw ft0, 124(sp)
# 2031~2031
	addi t0, zero, 1
	sw t0, 152(sp)
# 2031~2031
	lw t0, 68(sp)
	lw t2, 4(t0)
	sw t2, 8(sp)
# 2031~2031
	lw t0, 56(sp)
	lw t1, 8(sp)
	sub t2, t0, t1
	sw t2, 32(sp)
# 2031~2031
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 108(sp)
# 2031~2031
	flw ft0, 124(sp)
	flw ft1, 108(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 112(sp)
# 2034~2034
	addi t0, zero, 0
	sw t0, 128(sp)
# 2034~2034
	lw t0, 88(sp)
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 2034~2034
	flw ft0, 112(sp)
	flw ft1, 0(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 44(sp)
# 2034~2034
	addi t0, zero, 0
	sw t0, 80(sp)
# 2034~2034
	lw t0, 136(sp)
	flw ft0, 0(t0)
	fsw ft0, 84(sp)
# 2034~2034
	flw ft0, 44(sp)
	flw ft1, 84(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 104(sp)
# 2035~2035
	addi t0, zero, 1
	sw t0, 92(sp)
# 2035~2035
	lw t0, 88(sp)
	flw ft0, 4(t0)
	fsw ft0, 60(sp)
# 2035~2035
	flw ft0, 112(sp)
	flw ft1, 60(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 96(sp)
# 2035~2035
	addi t0, zero, 1
	sw t0, 48(sp)
# 2035~2035
	lw t0, 136(sp)
	flw ft0, 4(t0)
	fsw ft0, 140(sp)
# 2035~2035
	flw ft0, 96(sp)
	flw ft1, 140(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 4(sp)
# 2036~2036
	addi t0, zero, 2
	sw t0, 36(sp)
# 2036~2036
	lw t0, 88(sp)
	flw ft0, 8(t0)
	fsw ft0, 52(sp)
# 2036~2036
	flw ft0, 112(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
# 2036~2036
	addi t0, zero, 2
	sw t0, 156(sp)
# 2036~2036
	lw t0, 136(sp)
	flw ft0, 8(t0)
	fsw ft0, 116(sp)
# 2036~2036
	flw ft0, 24(sp)
	flw ft1, 116(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 64(sp)
# 2037~2037
	addi t0, zero, 0
	sw t0, 100(sp)
# 2037~2037
	lw t0, 16(sp)
	lw t2, 0(t0)
	sw t2, 144(sp)
# 2037~2037
	addi t0, zero, 1
	sw t0, 20(sp)
# 2037~2037
	lw t0, 144(sp)
	addi t2, t0, -1
	sw t2, 120(sp)
# 2037~2037
	sw ra, -4(sp)
	lw a0, 76(sp)
	lw a1, 120(sp)
	lw a2, 40(sp)
	flw fa0, 104(sp)
	flw fa1, 4(sp)
	flw fa2, 64(sp)
	lw a3, 72(sp)
	lw t0, 72(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 148(sp)
	lw a0, 148(sp)
	addi sp, sp, 160
	ret
scan_pixel.2798:
	addi sp, sp, -112
	sw a0, 88(sp)
	sw a1, 80(sp)
	sw a2, 36(sp)
	sw a3, 48(sp)
	sw a4, 92(sp)
	sw a5, 76(sp)
	sw a6, 64(sp)
	lw t0, 64(sp)
	lw t1, 4(t0)
	sw t1, 0(sp)
	lw t1, 8(t0)
	sw t1, 68(sp)
	lw t1, 12(t0)
	sw t1, 96(sp)
	lw t1, 16(t0)
	sw t1, 56(sp)
	lw t1, 20(t0)
	sw t1, 52(sp)
	lw t1, 24(t0)
	sw t1, 84(sp)
# 2045~2045
	addi t0, zero, 0
	sw t0, 20(sp)
# 2045~2045
	lw t0, 68(sp)
	lw t2, 0(t0)
	sw t2, 44(sp)
	lw t0, 88(sp)
	lw t1, 44(sp)
	bge t0, t1, ._185_then
# 2048~2048
	lw t0, 48(sp)
	lw t1, 88(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 16(sp)
# 2048~2048
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, p_rgb.2483
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 108(sp)
# 2048~2048
	sw ra, -4(sp)
	lw a0, 56(sp)
	lw a1, 108(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
# 2051~2051
	sw ra, -4(sp)
	lw a0, 88(sp)
	lw a1, 80(sp)
	lw a2, 92(sp)
	lw a3, 96(sp)
	lw t0, 96(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 2051~2054
	addi t0, zero, 0
	sw t0, 28(sp)
	lw t0, 72(sp)
	lw t1, 28(sp)
	beq t0, t1, ._186_then
# 2052~2052
	addi t0, zero, 0
	sw t0, 8(sp)
# 2052~2052
	sw ra, -4(sp)
	lw a0, 88(sp)
	lw a1, 80(sp)
	lw a2, 36(sp)
	lw a3, 48(sp)
	lw a4, 92(sp)
	lw a5, 8(sp)
	lw a6, 52(sp)
	lw t0, 52(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
	beq zero, zero, ._186_final
._186_then:
# 2054~2054
	lw t0, 48(sp)
	lw t1, 88(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 12(sp)
# 2054~2054
	addi t0, zero, 0
	sw t0, 40(sp)
# 2054~2054
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 40(sp)
	lw a2, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
._186_final:
# 2057~2057
	sw ra, -4(sp)
	lw a0, 76(sp)
	lw a1, 84(sp)
	lw t0, 84(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 2059~2059
	addi t0, zero, 1
	sw t0, 60(sp)
# 2059~2059
	lw t0, 88(sp)
	addi t2, t0, 1
	sw t2, 32(sp)
# 2059~2059
	sw ra, -4(sp)
	lw a0, 32(sp)
	lw a1, 80(sp)
	lw a2, 36(sp)
	lw a3, 48(sp)
	lw a4, 92(sp)
	lw a5, 76(sp)
	lw a6, 64(sp)
	lw t0, 64(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 104(sp)
	lw a0, 104(sp)
	addi sp, sp, 112
	ret
	beq zero, zero, ._185_final
._185_then:
# 0~0
	lw a0, 104(sp)
	addi sp, sp, 112
	ret
._185_final:
scan_line.2805:
	addi sp, sp, -104
	sw a0, 36(sp)
	sw a1, 0(sp)
	sw a2, 40(sp)
	sw a3, 60(sp)
	sw a4, 28(sp)
	sw a5, 12(sp)
	sw a6, 44(sp)
	lw t0, 44(sp)
	lw t1, 4(t0)
	sw t1, 76(sp)
	lw t1, 8(t0)
	sw t1, 80(sp)
	lw t1, 12(t0)
	sw t1, 24(sp)
# 2066~2066
	addi t0, zero, 1
	sw t0, 68(sp)
# 2066~2066
	lw t0, 76(sp)
	lw t2, 4(t0)
	sw t2, 52(sp)
	lw t0, 36(sp)
	lw t1, 52(sp)
	bge t0, t1, ._187_then
# 2068~2068
	addi t0, zero, 1
	sw t0, 84(sp)
# 2068~2068
	lw t0, 76(sp)
	lw t2, 4(t0)
	sw t2, 88(sp)
# 2068~2068
	addi t0, zero, 1
	sw t0, 48(sp)
# 2068~2068
	lw t0, 88(sp)
	addi t2, t0, -1
	sw t2, 16(sp)
	lw t0, 36(sp)
	lw t1, 16(sp)
	bge t0, t1, ._188_then
# 2069~2069
	addi t0, zero, 1
	sw t0, 4(sp)
# 2069~2069
	lw t0, 36(sp)
	addi t2, t0, 1
	sw t2, 72(sp)
# 2069~2069
	sw ra, -4(sp)
	lw a0, 60(sp)
	lw a1, 72(sp)
	lw a2, 28(sp)
	lw a3, 80(sp)
	lw t0, 80(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	beq zero, zero, ._188_final
._188_then:
# 0~0
._188_final:
# 2071~2071
	addi t0, zero, 0
	sw t0, 56(sp)
# 2071~2071
	sw ra, -4(sp)
	lw a0, 56(sp)
	lw a1, 36(sp)
	lw a2, 0(sp)
	lw a3, 40(sp)
	lw a4, 60(sp)
	lw a5, 12(sp)
	lw a6, 24(sp)
	lw t0, 24(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 2072~2072
	addi t0, zero, 1
	sw t0, 96(sp)
# 2072~2072
	lw t0, 36(sp)
	addi t2, t0, 1
	sw t2, 20(sp)
# 2072~2072
	addi t0, zero, 2
	sw t0, 64(sp)
# 2072~2072
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 64(sp)
	addi sp, sp, -4
	jal ra, add_mod5.2400
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 2072~2072
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 40(sp)
	lw a2, 60(sp)
	lw a3, 0(sp)
	lw a4, 8(sp)
	lw a5, 12(sp)
	lw a6, 44(sp)
	lw t0, 44(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 100(sp)
	lw a0, 100(sp)
	addi sp, sp, 104
	ret
	beq zero, zero, ._187_final
._187_then:
# 0~0
	lw a0, 100(sp)
	addi sp, sp, 104
	ret
._187_final:
create_float5x3array.2812:
	addi sp, sp, -108
	sw a0, 0(sp)
# 2081~2081
	addi t0, zero, 3
	sw t0, 64(sp)
# 2081~2081
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 88(sp)
# 2081~2081
	sw ra, -4(sp)
	lw a0, 64(sp)
	flw fa0, 88(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 2082~2082
	addi t0, zero, 5
	sw t0, 104(sp)
# 2082~2082
	sw ra, -4(sp)
	lw a0, 104(sp)
	lw a1, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 2083~2083
	addi t0, zero, 1
	sw t0, 100(sp)
# 2083~2083
	addi t0, zero, 3
	sw t0, 4(sp)
# 2083~2083
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 2083~2083
	sw ra, -4(sp)
	lw a0, 4(sp)
	flw fa0, 52(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
	lw t0, 48(sp)
	lw t2, 56(sp)
	sw t2, 4(t0)
# 2083~2083
# 2084~2084
	addi t0, zero, 2
	sw t0, 60(sp)
# 2084~2084
	addi t0, zero, 3
	sw t0, 68(sp)
# 2084~2084
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 72(sp)
# 2084~2084
	sw ra, -4(sp)
	lw a0, 68(sp)
	flw fa0, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
	lw t0, 48(sp)
	lw t2, 24(sp)
	sw t2, 8(t0)
# 2084~2084
# 2085~2085
	addi t0, zero, 3
	sw t0, 12(sp)
# 2085~2085
	addi t0, zero, 3
	sw t0, 20(sp)
# 2085~2085
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 76(sp)
# 2085~2085
	sw ra, -4(sp)
	lw a0, 20(sp)
	flw fa0, 76(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
	lw t0, 48(sp)
	lw t2, 80(sp)
	sw t2, 12(t0)
# 2085~2085
# 2086~2086
	addi t0, zero, 4
	sw t0, 84(sp)
# 2086~2086
	addi t0, zero, 3
	sw t0, 92(sp)
# 2086~2086
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 96(sp)
# 2086~2086
	sw ra, -4(sp)
	lw a0, 92(sp)
	flw fa0, 96(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
	lw t0, 48(sp)
	lw t2, 16(sp)
	sw t2, 16(t0)
# 2086~2086
# 2087~2087
	lw t0, 48(sp)
	sw t0, 48(sp)
	lw a0, 48(sp)
	addi sp, sp, 108
	ret
create_pixel.2814:
	addi sp, sp, -92
	sw a0, 84(sp)
# 2093~2093
	addi t0, zero, 3
	sw t0, 4(sp)
# 2093~2093
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 2093~2093
	sw ra, -4(sp)
	lw a0, 4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 72(sp)
# 0~0
# 2094~2094
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, create_float5x3array.2812
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 2095~2095
	addi t0, zero, 5
	sw t0, 52(sp)
# 2095~2095
	addi t0, zero, 0
	sw t0, 36(sp)
# 2095~2095
	sw ra, -4(sp)
	lw a0, 52(sp)
	lw a1, 36(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 88(sp)
# 2096~2096
	addi t0, zero, 5
	sw t0, 12(sp)
# 2096~2096
	addi t0, zero, 0
	sw t0, 68(sp)
# 2096~2096
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 68(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
# 0~0
# 2097~2097
	sw ra, -4(sp)
	lw a0, 44(sp)
	addi sp, sp, -4
	jal ra, create_float5x3array.2812
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 0~0
# 2098~2098
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, create_float5x3array.2812
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 2099~2099
	addi t0, zero, 1
	sw t0, 76(sp)
# 2099~2099
	addi t0, zero, 0
	sw t0, 56(sp)
# 2099~2099
	sw ra, -4(sp)
	lw a0, 76(sp)
	lw a1, 56(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 0~0
# 2100~2100
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, create_float5x3array.2812
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 2101~2101
	lw t0, 72(sp)
	sw t0, 0(tp)
	lw t0, 8(sp)
	sw t0, 4(tp)
	lw t0, 88(sp)
	sw t0, 8(tp)
	lw t0, 80(sp)
	sw t0, 12(tp)
	lw t0, 16(sp)
	sw t0, 16(tp)
	lw t0, 40(sp)
	sw t0, 20(tp)
	lw t0, 24(sp)
	sw t0, 24(tp)
	lw t0, 28(sp)
	sw t0, 28(tp)
	sw tp, 64(sp)
	addi tp, tp, 32
	lw a0, 64(sp)
	addi sp, sp, 92
	ret
init_line_elements.2816:
	addi sp, sp, -40
	sw a0, 16(sp)
	sw a1, 20(sp)
# 2106~2106
	addi t0, zero, 0
	sw t0, 24(sp)
	lw t0, 20(sp)
	lw t1, 24(sp)
	bge t0, t1, ._189_then
# 2110~2110
	lw t0, 16(sp)
	sw t0, 16(sp)
	lw a0, 16(sp)
	addi sp, sp, 40
	ret
	beq zero, zero, ._189_final
._189_then:
# 0~0
# 2107~2107
	sw ra, -4(sp)
	lw a0, 28(sp)
	addi sp, sp, -4
	jal ra, create_pixel.2814
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
	lw t0, 16(sp)
	lw t2, 12(sp)
	lw t1, 20(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 2107~2107
# 2108~2108
	addi t0, zero, 1
	sw t0, 36(sp)
# 2108~2108
	lw t0, 20(sp)
	addi t2, t0, -1
	sw t2, 4(sp)
# 2108~2108
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 4(sp)
	addi sp, sp, -4
	jal ra, init_line_elements.2816
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 40
	ret
._189_final:
create_pixelline.2819:
	addi sp, sp, -52
	sw a0, 20(sp)
	sw a1, 24(sp)
	lw t0, 24(sp)
	lw t1, 4(t0)
	sw t1, 0(sp)
# 2115~2115
	addi t0, zero, 0
	sw t0, 44(sp)
# 2115~2115
	lw t0, 0(sp)
	lw t2, 0(t0)
	sw t2, 40(sp)
# 0~0
# 2115~2115
	sw ra, -4(sp)
	lw a0, 28(sp)
	addi sp, sp, -4
	jal ra, create_pixel.2814
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 2115~2115
	sw ra, -4(sp)
	lw a0, 40(sp)
	lw a1, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 12(sp)
# 2116~2116
	addi t0, zero, 0
	sw t0, 32(sp)
# 2116~2116
	lw t0, 0(sp)
	lw t2, 0(t0)
	sw t2, 48(sp)
# 2116~2116
	addi t0, zero, 2
	sw t0, 16(sp)
# 2116~2116
	lw t0, 48(sp)
	addi t2, t0, -2
	sw t2, 36(sp)
# 2116~2116
	sw ra, -4(sp)
	lw a0, 12(sp)
	lw a1, 36(sp)
	addi sp, sp, -4
	jal ra, init_line_elements.2816
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 52
	ret
tan.2821:
	addi sp, sp, -20
	fsw fa0, 12(sp)
# 2124~2124
	sw ra, -4(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_sin
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 2124~2124
	sw ra, -4(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_cos
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 2124~2124
	flw ft0, 4(sp)
	flw ft1, 0(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 16(sp)
	flw fa0, 16(sp)
	addi sp, sp, 20
	ret
adjust_position.2823:
	addi sp, sp, -52
	fsw fa0, 8(sp)
	fsw fa1, 28(sp)
# 2129~2129
	flw ft0, 8(sp)
	flw ft1, 8(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 0(sp)
# 2129~2129
	la t0, f0.10000f
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
# 2129~2129
	flw ft0, 0(sp)
	flw ft1, 4(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 48(sp)
# 2129~2129
	sw ra, -4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 36(sp)
# 2130~2130
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 16(sp)
# 2130~2130
	flw ft0, 16(sp)
	flw ft1, 36(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 40(sp)
# 2131~2131
	sw ra, -4(sp)
	flw fa0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_atan
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 20(sp)
# 2132~2132
	flw ft0, 20(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 32(sp)
# 2132~2132
	sw ra, -4(sp)
	flw fa0, 32(sp)
	addi sp, sp, -4
	jal ra, tan.2821
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
# 2133~2133
	flw ft0, 24(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 44(sp)
	flw fa0, 44(sp)
	addi sp, sp, 52
	ret
calc_dirvec.2826:
	addi sp, sp, -248
	sw a0, 244(sp)
	fsw fa0, 120(sp)
	fsw fa1, 168(sp)
	fsw fa2, 172(sp)
	fsw fa3, 236(sp)
	sw a1, 136(sp)
	sw a2, 140(sp)
	sw a3, 32(sp)
	lw t0, 32(sp)
	lw t1, 4(t0)
	sw t1, 176(sp)
# 2138~2138
	addi t0, zero, 5
	sw t0, 192(sp)
	lw t0, 244(sp)
	lw t1, 192(sp)
	bge t0, t1, ._190_then
# 2153~2153
	sw ra, -4(sp)
	flw fa0, 168(sp)
	flw fa1, 172(sp)
	addi sp, sp, -4
	jal ra, adjust_position.2823
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 72(sp)
# 2154~2154
	addi t0, zero, 1
	sw t0, 232(sp)
# 2154~2154
	lw t0, 244(sp)
	addi t2, t0, 1
	sw t2, 196(sp)
# 2154~2154
	sw ra, -4(sp)
	flw fa0, 72(sp)
	flw fa1, 236(sp)
	addi sp, sp, -4
	jal ra, adjust_position.2823
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 2154~2154
	sw ra, -4(sp)
	lw a0, 196(sp)
	flw fa0, 72(sp)
	flw fa1, 28(sp)
	flw fa2, 172(sp)
	flw fa3, 236(sp)
	lw a1, 136(sp)
	lw a2, 140(sp)
	lw a3, 32(sp)
	lw t0, 32(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 248
	ret
	beq zero, zero, ._190_final
._190_then:
# 2139~2139
	sw ra, -4(sp)
	flw fa0, 120(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 2139~2139
	sw ra, -4(sp)
	flw fa0, 168(sp)
	addi sp, sp, -4
	jal ra, min_caml_fsqr
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 2139~2139
	flw ft0, 44(sp)
	flw ft1, 0(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 240(sp)
# 2139~2139
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 2139~2139
	flw ft0, 240(sp)
	flw ft1, 52(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 24(sp)
# 2139~2139
	sw ra, -4(sp)
	flw fa0, 24(sp)
	addi sp, sp, -4
	jal ra, min_caml_sqrt
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 104(sp)
# 2140~2140
	flw ft0, 120(sp)
	flw ft1, 104(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 220(sp)
# 2141~2141
	flw ft0, 168(sp)
	flw ft1, 104(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 188(sp)
# 2142~2142
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 116(sp)
# 2142~2142
	flw ft0, 116(sp)
	flw ft1, 104(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 216(sp)
# 2145~2145
	lw t0, 176(sp)
	lw t1, 136(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 184(sp)
# 2146~2146
	lw t0, 184(sp)
	lw t1, 140(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 84(sp)
# 2146~2146
	sw ra, -4(sp)
	lw a0, 84(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 92(sp)
# 2146~2146
	sw ra, -4(sp)
	lw a0, 92(sp)
	flw fa0, 220(sp)
	flw fa1, 188(sp)
	flw fa2, 216(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 156(sp)
# 2147~2147
	addi t0, zero, 40
	sw t0, 108(sp)
# 2147~2147
	lw t0, 140(sp)
	addi t2, t0, 40
	sw t2, 224(sp)
# 2147~2147
	lw t0, 184(sp)
	lw t1, 224(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 40(sp)
# 2147~2147
	sw ra, -4(sp)
	lw a0, 40(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 2147~2147
	sw ra, -4(sp)
	flw fa0, 188(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 208(sp)
# 2147~2147
	sw ra, -4(sp)
	lw a0, 56(sp)
	flw fa0, 220(sp)
	flw fa1, 216(sp)
	flw fa2, 208(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 2148~2148
	addi t0, zero, 80
	sw t0, 144(sp)
# 2148~2148
	lw t0, 140(sp)
	addi t2, t0, 80
	sw t2, 8(sp)
# 2148~2148
	lw t0, 184(sp)
	lw t1, 8(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 152(sp)
# 2148~2148
	sw ra, -4(sp)
	lw a0, 152(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 2148~2148
	sw ra, -4(sp)
	flw fa0, 220(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 200(sp)
# 2148~2148
	sw ra, -4(sp)
	flw fa0, 188(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 164(sp)
# 2148~2148
	sw ra, -4(sp)
	lw a0, 48(sp)
	flw fa0, 216(sp)
	flw fa1, 200(sp)
	flw fa2, 164(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
# 2149~2149
	addi t0, zero, 1
	sw t0, 36(sp)
# 2149~2149
	lw t0, 140(sp)
	addi t2, t0, 1
	sw t2, 60(sp)
# 2149~2149
	lw t0, 184(sp)
	lw t1, 60(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 212(sp)
# 2149~2149
	sw ra, -4(sp)
	lw a0, 212(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 148(sp)
# 2149~2149
	sw ra, -4(sp)
	flw fa0, 220(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 180(sp)
# 2149~2149
	sw ra, -4(sp)
	flw fa0, 188(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 228(sp)
# 2149~2149
	sw ra, -4(sp)
	flw fa0, 216(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 132(sp)
# 2149~2149
	sw ra, -4(sp)
	lw a0, 148(sp)
	flw fa0, 180(sp)
	flw fa1, 228(sp)
	flw fa2, 132(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 160(sp)
# 2150~2150
	addi t0, zero, 41
	sw t0, 12(sp)
# 2150~2150
	lw t0, 140(sp)
	addi t2, t0, 41
	sw t2, 100(sp)
# 2150~2150
	lw t0, 184(sp)
	lw t1, 100(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 112(sp)
# 2150~2150
	sw ra, -4(sp)
	lw a0, 112(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 124(sp)
# 2150~2150
	sw ra, -4(sp)
	flw fa0, 220(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 88(sp)
# 2150~2150
	sw ra, -4(sp)
	flw fa0, 216(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 68(sp)
# 2150~2150
	sw ra, -4(sp)
	lw a0, 124(sp)
	flw fa0, 88(sp)
	flw fa1, 68(sp)
	flw fa2, 188(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
# 2151~2151
	addi t0, zero, 81
	sw t0, 76(sp)
# 2151~2151
	lw t0, 140(sp)
	addi t2, t0, 81
	sw t2, 4(sp)
# 2151~2151
	lw t0, 184(sp)
	lw t1, 4(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 96(sp)
# 2151~2151
	sw ra, -4(sp)
	lw a0, 96(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 204(sp)
# 2151~2151
	sw ra, -4(sp)
	flw fa0, 216(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 128(sp)
# 2151~2151
	sw ra, -4(sp)
	lw a0, 204(sp)
	flw fa0, 128(sp)
	flw fa1, 220(sp)
	flw fa2, 188(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 248
	ret
._190_final:
calc_dirvecs.2834:
	addi sp, sp, -128
	sw a0, 72(sp)
	fsw fa0, 28(sp)
	sw a1, 20(sp)
	sw a2, 84(sp)
	sw a3, 80(sp)
	lw t0, 80(sp)
	lw t1, 4(t0)
	sw t1, 100(sp)
# 2159~2159
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 72(sp)
	lw t1, 32(sp)
	bge t0, t1, ._191_then
# 0~0
	lw a0, 8(sp)
	addi sp, sp, 128
	ret
	beq zero, zero, ._191_final
._191_then:
# 2161~2161
	sw ra, -4(sp)
	lw a0, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 92(sp)
# 2161~2161
	la t0, f0.20000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 2161~2161
	flw ft0, 92(sp)
	flw ft1, 48(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 88(sp)
# 2161~2161
	la t0, f0.90000f
	flw ft0, 0(t0)
	fsw ft0, 104(sp)
# 2161~2161
	flw ft0, 88(sp)
	flw ft1, 104(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 12(sp)
# 2162~2162
	addi t0, zero, 0
	sw t0, 108(sp)
# 2162~2162
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 2162~2162
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 120(sp)
# 2162~2162
	sw ra, -4(sp)
	lw a0, 108(sp)
	flw fa0, 52(sp)
	flw fa1, 120(sp)
	flw fa2, 12(sp)
	flw fa3, 28(sp)
	lw a1, 20(sp)
	lw a2, 84(sp)
	lw a3, 100(sp)
	lw t0, 100(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 2164~2164
	sw ra, -4(sp)
	lw a0, 72(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 124(sp)
# 2164~2164
	la t0, f0.20000f
	flw ft0, 0(t0)
	fsw ft0, 112(sp)
# 2164~2164
	flw ft0, 124(sp)
	flw ft1, 112(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 0(sp)
# 2164~2164
	la t0, f0.10000f
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
# 2164~2164
	flw ft0, 0(sp)
	flw ft1, 36(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 96(sp)
# 2165~2165
	addi t0, zero, 0
	sw t0, 76(sp)
# 2165~2165
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 64(sp)
# 2165~2165
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 2165~2165
	addi t0, zero, 2
	sw t0, 4(sp)
# 2165~2165
	lw t0, 84(sp)
	addi t2, t0, 2
	sw t2, 40(sp)
# 2165~2165
	sw ra, -4(sp)
	lw a0, 76(sp)
	flw fa0, 64(sp)
	flw fa1, 44(sp)
	flw fa2, 96(sp)
	flw fa3, 28(sp)
	lw a1, 20(sp)
	lw a2, 40(sp)
	lw a3, 100(sp)
	lw t0, 100(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 60(sp)
# 2167~2167
	addi t0, zero, 1
	sw t0, 68(sp)
# 2167~2167
	lw t0, 72(sp)
	addi t2, t0, -1
	sw t2, 116(sp)
# 2167~2167
	addi t0, zero, 1
	sw t0, 16(sp)
# 2167~2167
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 16(sp)
	addi sp, sp, -4
	jal ra, add_mod5.2400
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 2167~2167
	sw ra, -4(sp)
	lw a0, 116(sp)
	flw fa0, 28(sp)
	lw a1, 24(sp)
	lw a2, 84(sp)
	lw a3, 80(sp)
	lw t0, 80(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 128
	ret
._191_final:
calc_dirvec_rows.2839:
	addi sp, sp, -80
	sw a0, 4(sp)
	sw a1, 8(sp)
	sw a2, 32(sp)
	sw a3, 52(sp)
	lw t0, 52(sp)
	lw t1, 4(t0)
	sw t1, 76(sp)
# 2173~2173
	addi t0, zero, 0
	sw t0, 40(sp)
	lw t0, 4(sp)
	lw t1, 40(sp)
	bge t0, t1, ._192_then
# 0~0
	lw a0, 48(sp)
	addi sp, sp, 80
	ret
	beq zero, zero, ._192_final
._192_then:
# 2174~2174
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 2174~2174
	la t0, f0.20000f
	flw ft0, 0(t0)
	fsw ft0, 68(sp)
# 2174~2174
	flw ft0, 12(sp)
	flw ft1, 68(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 2174~2174
	la t0, f0.90000f
	flw ft0, 0(t0)
	fsw ft0, 60(sp)
# 2174~2174
	flw ft0, 28(sp)
	flw ft1, 60(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 56(sp)
# 2175~2175
	addi t0, zero, 4
	sw t0, 64(sp)
# 2175~2175
	sw ra, -4(sp)
	lw a0, 64(sp)
	flw fa0, 56(sp)
	lw a1, 8(sp)
	lw a2, 32(sp)
	lw a3, 76(sp)
	lw t0, 76(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 2176~2176
	addi t0, zero, 1
	sw t0, 20(sp)
# 2176~2176
	lw t0, 4(sp)
	addi t2, t0, -1
	sw t2, 16(sp)
# 2176~2176
	addi t0, zero, 2
	sw t0, 72(sp)
# 2176~2176
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 72(sp)
	addi sp, sp, -4
	jal ra, add_mod5.2400
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 2176~2176
	addi t0, zero, 4
	sw t0, 44(sp)
# 2176~2176
	lw t0, 32(sp)
	addi t2, t0, 4
	sw t2, 0(sp)
# 2176~2176
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 24(sp)
	lw a2, 0(sp)
	lw a3, 52(sp)
	lw t0, 52(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
	lw a0, 48(sp)
	addi sp, sp, 80
	ret
._192_final:
create_dirvec.2843:
	addi sp, sp, -40
	sw a0, 8(sp)
	sw a1, 4(sp)
	lw t0, 4(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
# 2184~2184
	addi t0, zero, 3
	sw t0, 20(sp)
# 2184~2184
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 2184~2184
	sw ra, -4(sp)
	lw a0, 20(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_float_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 2185~2185
	addi t0, zero, 0
	sw t0, 36(sp)
# 2185~2185
	lw t0, 12(sp)
	lw t2, 0(t0)
	sw t2, 24(sp)
# 2185~2185
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 2186~2186
	lw t0, 16(sp)
	sw t0, 0(tp)
	lw t0, 28(sp)
	sw t0, 4(tp)
	sw tp, 32(sp)
	addi tp, tp, 8
	lw a0, 32(sp)
	addi sp, sp, 40
	ret
create_dirvec_elements.2845:
	addi sp, sp, -44
	sw a0, 36(sp)
	sw a1, 8(sp)
	sw a2, 16(sp)
	lw t0, 16(sp)
	lw t1, 4(t0)
	sw t1, 28(sp)
# 2190~2190
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 8(sp)
	lw t1, 12(sp)
	bge t0, t1, ._193_then
# 0~0
	lw a0, 20(sp)
	addi sp, sp, 44
	ret
	beq zero, zero, ._193_final
._193_then:
# 0~0
# 2191~2191
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 28(sp)
	lw t0, 28(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw t0, 36(sp)
	lw t2, 32(sp)
	lw t1, 8(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 2191~2191
# 2192~2192
	addi t0, zero, 1
	sw t0, 4(sp)
# 2192~2192
	lw t0, 8(sp)
	addi t2, t0, -1
	sw t2, 0(sp)
# 2192~2192
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 0(sp)
	lw a2, 16(sp)
	lw t0, 16(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 44
	ret
._193_final:
create_dirvecs.2848:
	addi sp, sp, -68
	sw a0, 36(sp)
	sw a1, 52(sp)
	lw t0, 52(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
	lw t1, 8(t0)
	sw t1, 48(sp)
	lw t1, 12(t0)
	sw t1, 64(sp)
# 2197~2197
	addi t0, zero, 0
	sw t0, 32(sp)
	lw t0, 36(sp)
	lw t1, 32(sp)
	bge t0, t1, ._194_then
# 0~0
	lw a0, 20(sp)
	addi sp, sp, 68
	ret
	beq zero, zero, ._194_final
._194_then:
# 2198~2198
	addi t0, zero, 120
	sw t0, 16(sp)
# 0~0
# 2198~2198
	sw ra, -4(sp)
	lw a0, 44(sp)
	lw a1, 12(sp)
	lw t0, 12(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 2198~2198
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_create_array
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
	lw t0, 64(sp)
	lw t2, 56(sp)
	lw t1, 36(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 2198~2198
# 2199~2199
	lw t0, 64(sp)
	lw t1, 36(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 0(sp)
# 2199~2199
	addi t0, zero, 118
	sw t0, 8(sp)
# 2199~2199
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 8(sp)
	lw a2, 48(sp)
	lw t0, 48(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 2200~2200
	addi t0, zero, 1
	sw t0, 60(sp)
# 2200~2200
	lw t0, 36(sp)
	addi t2, t0, -1
	sw t2, 28(sp)
# 2200~2200
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 52(sp)
	lw t0, 52(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 20(sp)
	lw a0, 20(sp)
	addi sp, sp, 68
	ret
._194_final:
init_dirvec_constants.2850:
	addi sp, sp, -40
	sw a0, 0(sp)
	sw a1, 24(sp)
	sw a2, 12(sp)
	lw t0, 12(sp)
	lw t1, 4(t0)
	sw t1, 28(sp)
# 2207~2207
	addi t0, zero, 0
	sw t0, 20(sp)
	lw t0, 24(sp)
	lw t1, 20(sp)
	bge t0, t1, ._195_then
# 0~0
	lw a0, 4(sp)
	addi sp, sp, 40
	ret
	beq zero, zero, ._195_final
._195_then:
# 2208~2208
	lw t0, 0(sp)
	lw t1, 24(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 32(sp)
# 2208~2208
	sw ra, -4(sp)
	lw a0, 32(sp)
	lw a1, 28(sp)
	lw t0, 28(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 2209~2209
	addi t0, zero, 1
	sw t0, 36(sp)
# 2209~2209
	lw t0, 24(sp)
	addi t2, t0, -1
	sw t2, 16(sp)
# 2209~2209
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 16(sp)
	lw a2, 12(sp)
	lw t0, 12(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
	lw a0, 4(sp)
	addi sp, sp, 40
	ret
._195_final:
init_vecset_constants.2853:
	addi sp, sp, -44
	sw a0, 0(sp)
	sw a1, 32(sp)
	lw t0, 32(sp)
	lw t1, 4(t0)
	sw t1, 4(sp)
	lw t1, 8(t0)
	sw t1, 36(sp)
# 2214~2214
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 0(sp)
	lw t1, 12(sp)
	bge t0, t1, ._196_then
# 0~0
	lw a0, 8(sp)
	addi sp, sp, 44
	ret
	beq zero, zero, ._196_final
._196_then:
# 2215~2215
	lw t0, 4(sp)
	lw t1, 0(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 20(sp)
# 2215~2215
	addi t0, zero, 119
	sw t0, 40(sp)
# 2215~2215
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 40(sp)
	lw a2, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 2216~2216
	addi t0, zero, 1
	sw t0, 28(sp)
# 2216~2216
	lw t0, 0(sp)
	addi t2, t0, -1
	sw t2, 16(sp)
# 2216~2216
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 32(sp)
	lw t0, 32(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
	lw a0, 8(sp)
	addi sp, sp, 44
	ret
._196_final:
init_dirvecs.2855:
	addi sp, sp, -52
	sw a0, 36(sp)
	sw a1, 0(sp)
	lw t0, 0(sp)
	lw t1, 4(t0)
	sw t1, 12(sp)
	lw t1, 8(t0)
	sw t1, 8(sp)
	lw t1, 12(t0)
	sw t1, 4(sp)
# 2221~2221
	addi t0, zero, 4
	sw t0, 16(sp)
# 2221~2221
	sw ra, -4(sp)
	lw a0, 16(sp)
	lw a1, 8(sp)
	lw t0, 8(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 2222~2222
	addi t0, zero, 9
	sw t0, 20(sp)
# 2222~2222
	addi t0, zero, 0
	sw t0, 24(sp)
# 2222~2222
	addi t0, zero, 0
	sw t0, 28(sp)
# 2222~2222
	sw ra, -4(sp)
	lw a0, 20(sp)
	lw a1, 24(sp)
	lw a2, 28(sp)
	lw a3, 12(sp)
	lw t0, 12(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
# 2223~2223
	addi t0, zero, 4
	sw t0, 32(sp)
# 2223~2223
	sw ra, -4(sp)
	lw a0, 32(sp)
	lw a1, 4(sp)
	lw t0, 4(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
	lw a0, 48(sp)
	addi sp, sp, 52
	ret
add_reflection.2857:
	addi sp, sp, -68
	sw a0, 28(sp)
	sw a1, 44(sp)
	fsw fa0, 4(sp)
	fsw fa1, 48(sp)
	fsw fa2, 8(sp)
	fsw fa3, 32(sp)
	sw a2, 40(sp)
	lw t0, 40(sp)
	lw t1, 4(t0)
	sw t1, 20(sp)
	lw t1, 8(t0)
	sw t1, 12(sp)
	lw t1, 12(t0)
	sw t1, 36(sp)
# 0~0
# 2230~2230
	sw ra, -4(sp)
	lw a0, 0(sp)
	lw a1, 20(sp)
	lw t0, 20(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 2231~2231
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 56(sp)
# 2231~2231
	sw ra, -4(sp)
	lw a0, 56(sp)
	flw fa0, 48(sp)
	flw fa1, 8(sp)
	flw fa2, 32(sp)
	addi sp, sp, -4
	jal ra, vecset.2403
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 2232~2232
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 36(sp)
	lw t0, 36(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 60(sp)
# 2234~2234
	lw t0, 44(sp)
	sw t0, 0(tp)
	lw t0, 24(sp)
	sw t0, 4(tp)
	flw ft0, 4(sp)
	fsw ft0, 8(tp)
	sw tp, 64(sp)
	addi tp, tp, 12
	lw t0, 12(sp)
	lw t2, 64(sp)
	lw t1, 28(sp)
	slli t1, t1, 2
	add t1, t1, t0
	sw t2, 0(t1)
# 2234~2234
	lw a0, 52(sp)
	addi sp, sp, 68
	ret
setup_rect_reflection.2864:
	addi sp, sp, -176
	sw a0, 32(sp)
	sw a1, 168(sp)
	sw a2, 52(sp)
	lw t0, 52(sp)
	lw t1, 4(t0)
	sw t1, 40(sp)
	lw t1, 8(t0)
	sw t1, 172(sp)
	lw t1, 12(t0)
	sw t1, 12(sp)
# 2239~2239
	lw t0, 32(sp)
	slli t2, t0, 2
	sw t2, 28(sp)
# 2240~2240
	addi t0, zero, 0
	sw t0, 108(sp)
# 2240~2240
	lw t0, 12(sp)
	lw t2, 0(t0)
	sw t2, 36(sp)
# 2241~2241
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 120(sp)
# 2241~2241
	sw ra, -4(sp)
	lw a0, 168(sp)
	addi sp, sp, -4
	jal ra, o_diffuse.2465
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 156(sp)
# 2241~2241
	flw ft0, 120(sp)
	flw ft1, 156(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 48(sp)
# 2242~2242
	addi t0, zero, 0
	sw t0, 44(sp)
# 2242~2242
	lw t0, 172(sp)
	flw ft0, 0(t0)
	fsw ft0, 60(sp)
# 2242~2242
	sw ra, -4(sp)
	flw fa0, 60(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 112(sp)
# 2243~2243
	addi t0, zero, 1
	sw t0, 152(sp)
# 2243~2243
	lw t0, 172(sp)
	flw ft0, 4(t0)
	fsw ft0, 100(sp)
# 2243~2243
	sw ra, -4(sp)
	flw fa0, 100(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 124(sp)
# 2244~2244
	addi t0, zero, 2
	sw t0, 56(sp)
# 2244~2244
	lw t0, 172(sp)
	flw ft0, 8(t0)
	fsw ft0, 140(sp)
# 2244~2244
	sw ra, -4(sp)
	flw fa0, 140(sp)
	addi sp, sp, -4
	jal ra, min_caml_fneg
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 160(sp)
# 2245~2245
	addi t0, zero, 1
	sw t0, 104(sp)
# 2245~2245
	lw t0, 28(sp)
	addi t2, t0, 1
	sw t2, 80(sp)
# 2245~2245
	addi t0, zero, 0
	sw t0, 136(sp)
# 2245~2245
	lw t0, 172(sp)
	flw ft0, 0(t0)
	fsw ft0, 128(sp)
# 2245~2245
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 80(sp)
	flw fa0, 48(sp)
	flw fa1, 128(sp)
	flw fa2, 124(sp)
	flw fa3, 160(sp)
	lw a2, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 148(sp)
# 2246~2246
	addi t0, zero, 1
	sw t0, 4(sp)
# 2246~2246
	lw t0, 36(sp)
	addi t2, t0, 1
	sw t2, 24(sp)
# 2246~2246
	addi t0, zero, 2
	sw t0, 144(sp)
# 2246~2246
	lw t0, 28(sp)
	addi t2, t0, 2
	sw t2, 0(sp)
# 2246~2246
	addi t0, zero, 1
	sw t0, 164(sp)
# 2246~2246
	lw t0, 172(sp)
	flw ft0, 4(t0)
	fsw ft0, 20(sp)
# 2246~2246
	sw ra, -4(sp)
	lw a0, 24(sp)
	lw a1, 0(sp)
	flw fa0, 48(sp)
	flw fa1, 112(sp)
	flw fa2, 20(sp)
	flw fa3, 160(sp)
	lw a2, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
# 2247~2247
	addi t0, zero, 2
	sw t0, 76(sp)
# 2247~2247
	lw t0, 36(sp)
	addi t2, t0, 2
	sw t2, 68(sp)
# 2247~2247
	addi t0, zero, 3
	sw t0, 96(sp)
# 2247~2247
	lw t0, 28(sp)
	addi t2, t0, 3
	sw t2, 84(sp)
# 2247~2247
	addi t0, zero, 2
	sw t0, 72(sp)
# 2247~2247
	lw t0, 172(sp)
	flw ft0, 8(t0)
	fsw ft0, 132(sp)
# 2247~2247
	sw ra, -4(sp)
	lw a0, 68(sp)
	lw a1, 84(sp)
	flw fa0, 48(sp)
	flw fa1, 112(sp)
	flw fa2, 124(sp)
	flw fa3, 132(sp)
	lw a2, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 116(sp)
# 2248~2248
	addi t0, zero, 0
	sw t0, 88(sp)
# 2248~2248
	addi t0, zero, 3
	sw t0, 92(sp)
# 2248~2248
	lw t0, 36(sp)
	addi t2, t0, 3
	sw t2, 16(sp)
	lw t0, 12(sp)
	lw t2, 16(sp)
	sw t2, 0(t0)
# 2248~2248
	lw a0, 8(sp)
	addi sp, sp, 176
	ret
setup_surface_reflection.2867:
	addi sp, sp, -168
	sw a0, 148(sp)
	sw a1, 100(sp)
	sw a2, 164(sp)
	lw t0, 164(sp)
	lw t1, 4(t0)
	sw t1, 124(sp)
	lw t1, 8(t0)
	sw t1, 8(sp)
	lw t1, 12(t0)
	sw t1, 156(sp)
# 2253~2253
	lw t0, 148(sp)
	slli t2, t0, 2
	sw t2, 72(sp)
# 2253~2253
	addi t0, zero, 1
	sw t0, 152(sp)
# 2253~2253
	lw t0, 72(sp)
	addi t2, t0, 1
	sw t2, 36(sp)
# 2254~2254
	addi t0, zero, 0
	sw t0, 68(sp)
# 2254~2254
	lw t0, 156(sp)
	lw t2, 0(t0)
	sw t2, 132(sp)
# 2255~2255
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 56(sp)
# 2255~2255
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_diffuse.2465
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 16(sp)
# 2255~2255
	flw ft0, 56(sp)
	flw ft1, 16(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 108(sp)
# 2256~2256
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_param_abc.2457
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 84(sp)
# 2256~2256
	sw ra, -4(sp)
	lw a0, 8(sp)
	lw a1, 84(sp)
	addi sp, sp, -4
	jal ra, veciprod.2419
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
# 2259~2259
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 120(sp)
# 2259~2259
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_param_a.2451
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 136(sp)
# 2259~2259
	flw ft0, 120(sp)
	flw ft1, 136(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 12(sp)
# 2259~2259
	flw ft0, 12(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 52(sp)
# 2259~2259
	addi t0, zero, 0
	sw t0, 60(sp)
# 2259~2259
	lw t0, 8(sp)
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 2259~2259
	flw ft0, 52(sp)
	flw ft1, 0(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 64(sp)
# 2260~2260
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 76(sp)
# 2260~2260
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_param_b.2453
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 128(sp)
# 2260~2260
	flw ft0, 76(sp)
	flw ft1, 128(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 48(sp)
# 2260~2260
	flw ft0, 48(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 92(sp)
# 2260~2260
	addi t0, zero, 1
	sw t0, 144(sp)
# 2260~2260
	lw t0, 8(sp)
	flw ft0, 4(t0)
	fsw ft0, 4(sp)
# 2260~2260
	flw ft0, 92(sp)
	flw ft1, 4(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 20(sp)
# 2261~2261
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 140(sp)
# 2261~2261
	sw ra, -4(sp)
	lw a0, 100(sp)
	addi sp, sp, -4
	jal ra, o_param_c.2455
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 2261~2261
	flw ft0, 140(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 160(sp)
# 2261~2261
	flw ft0, 160(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 40(sp)
# 2261~2261
	addi t0, zero, 2
	sw t0, 96(sp)
# 2261~2261
	lw t0, 8(sp)
	flw ft0, 8(t0)
	fsw ft0, 80(sp)
# 2261~2261
	flw ft0, 40(sp)
	flw ft1, 80(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 112(sp)
# 2258~2261
	sw ra, -4(sp)
	lw a0, 132(sp)
	lw a1, 36(sp)
	flw fa0, 108(sp)
	flw fa1, 64(sp)
	flw fa2, 20(sp)
	flw fa3, 112(sp)
	lw a2, 124(sp)
	lw t0, 124(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
# 2262~2262
	addi t0, zero, 0
	sw t0, 88(sp)
# 2262~2262
	addi t0, zero, 1
	sw t0, 104(sp)
# 2262~2262
	lw t0, 132(sp)
	addi t2, t0, 1
	sw t2, 32(sp)
	lw t0, 156(sp)
	lw t2, 32(sp)
	sw t2, 0(t0)
# 2262~2262
	lw a0, 116(sp)
	addi sp, sp, 168
	ret
setup_reflections.2870:
	addi sp, sp, -68
	sw a0, 36(sp)
	sw a1, 0(sp)
	lw t0, 0(sp)
	lw t1, 4(t0)
	sw t1, 24(sp)
	lw t1, 8(t0)
	sw t1, 44(sp)
	lw t1, 12(t0)
	sw t1, 48(sp)
# 2268~2268
	addi t0, zero, 0
	sw t0, 12(sp)
	lw t0, 36(sp)
	lw t1, 12(sp)
	bge t0, t1, ._197_then
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 68
	ret
	beq zero, zero, ._197_final
._197_then:
# 2269~2269
	lw t0, 24(sp)
	lw t1, 36(sp)
	slli t1, t1, 2
	add t1, t1, t0
	lw t2, 0(t1)
	sw t2, 4(sp)
# 2270~2270
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_reflectiontype.2445
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 2270~2270
	addi t0, zero, 2
	sw t0, 56(sp)
	lw t0, 16(sp)
	lw t1, 56(sp)
	beq t0, t1, ._198_then
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 68
	ret
	beq zero, zero, ._198_final
._198_then:
# 2271~2271
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_diffuse.2465
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 28(sp)
# 2271~2271
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 40(sp)
# 2271~2271
	sw ra, -4(sp)
	flw fa0, 28(sp)
	flw fa1, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_fless
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 60(sp)
# 2271~2279
	addi t0, zero, 0
	sw t0, 8(sp)
	lw t0, 60(sp)
	lw t1, 8(sp)
	beq t0, t1, ._199_then
# 2272~2272
	sw ra, -4(sp)
	lw a0, 4(sp)
	addi sp, sp, -4
	jal ra, o_form.2443
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
# 2274~2274
	addi t0, zero, 1
	sw t0, 64(sp)
	lw t0, 52(sp)
	lw t1, 64(sp)
	beq t0, t1, ._200_then
# 2276~2276
	addi t0, zero, 2
	sw t0, 20(sp)
	lw t0, 52(sp)
	lw t1, 20(sp)
	beq t0, t1, ._201_then
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 68
	ret
	beq zero, zero, ._201_final
._201_then:
# 2277~2277
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 4(sp)
	lw a2, 48(sp)
	lw t0, 48(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 68
	ret
._201_final:
	beq zero, zero, ._200_final
._200_then:
# 2275~2275
	sw ra, -4(sp)
	lw a0, 36(sp)
	lw a1, 4(sp)
	lw a2, 44(sp)
	lw t0, 44(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
	lw a0, 32(sp)
	addi sp, sp, 68
	ret
._200_final:
	beq zero, zero, ._199_final
._199_then:
# 0~0
	lw a0, 32(sp)
	addi sp, sp, 68
	ret
._199_final:
._198_final:
._197_final:
rt.2872:
	addi sp, sp, -232
	sw a0, 116(sp)
	sw a1, 12(sp)
	sw a2, 164(sp)
	sw a3, 84(sp)
	lw t0, 84(sp)
	lw t1, 4(t0)
	sw t1, 40(sp)
	lw t1, 8(t0)
	sw t1, 20(sp)
	lw t1, 12(t0)
	sw t1, 64(sp)
	lw t1, 16(t0)
	sw t1, 156(sp)
	lw t1, 20(t0)
	sw t1, 92(sp)
	lw t1, 24(t0)
	sw t1, 108(sp)
	lw t1, 28(t0)
	sw t1, 148(sp)
	lw t1, 32(t0)
	sw t1, 216(sp)
	lw t1, 36(t0)
	sw t1, 204(sp)
	lw t1, 40(t0)
	sw t1, 208(sp)
	lw t1, 44(t0)
	sw t1, 68(sp)
	lw t1, 48(t0)
	sw t1, 220(sp)
	lw t1, 52(t0)
	sw t1, 72(sp)
	lw t1, 56(t0)
	sw t1, 124(sp)
# 2288~2288
	addi t0, zero, 0
	sw t0, 16(sp)
	lw t0, 64(sp)
	lw t2, 116(sp)
	sw t2, 0(t0)
# 2288~2288
# 2289~2289
	addi t0, zero, 1
	sw t0, 200(sp)
	lw t0, 64(sp)
	lw t2, 12(sp)
	sw t2, 4(t0)
# 2289~2289
# 2290~2290
	addi t0, zero, 0
	sw t0, 212(sp)
# 2290~2290
	lw t0, 116(sp)
	srai t2, t0, 1
	sw t2, 128(sp)
	lw t0, 20(sp)
	lw t2, 128(sp)
	sw t2, 0(t0)
# 2290~2290
# 2291~2291
	addi t0, zero, 1
	sw t0, 180(sp)
# 2291~2291
	lw t0, 12(sp)
	srai t2, t0, 1
	sw t2, 0(sp)
	lw t0, 20(sp)
	lw t2, 0(sp)
	sw t2, 4(t0)
# 2291~2291
# 2292~2292
	addi t0, zero, 0
	sw t0, 24(sp)
# 2292~2292
	la t0, f128.00000f
	flw ft0, 0(t0)
	fsw ft0, 224(sp)
# 2292~2292
	sw ra, -4(sp)
	lw a0, 116(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 176(sp)
# 2292~2292
	flw ft0, 224(sp)
	flw ft1, 176(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 44(sp)
	lw t0, 68(sp)
	flw ft0, 44(sp)
	fsw ft0, 0(t0)
# 2292~2292
# 0~0
# 2293~2293
	sw ra, -4(sp)
	lw a0, 120(sp)
	lw a1, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 196(sp)
# 0~0
# 2294~2294
	sw ra, -4(sp)
	lw a0, 192(sp)
	lw a1, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 48(sp)
# 0~0
# 2295~2295
	sw ra, -4(sp)
	lw a0, 132(sp)
	lw a1, 40(sp)
	lw t0, 40(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 36(sp)
# 0~0
# 2296~2296
	sw ra, -4(sp)
	lw a0, 28(sp)
	lw a1, 204(sp)
	lw t0, 204(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 2297~2297
	sw ra, -4(sp)
	lw a0, 164(sp)
	lw a1, 124(sp)
	lw t0, 124(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 184(sp)
# 0~0
# 2298~2298
	sw ra, -4(sp)
	lw a0, 160(sp)
	lw a1, 156(sp)
	lw t0, 156(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 60(sp)
# 2299~2299
	sw ra, -4(sp)
	lw a0, 108(sp)
	addi sp, sp, -4
	jal ra, d_vec.2502
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 80(sp)
# 2299~2299
	sw ra, -4(sp)
	lw a0, 80(sp)
	lw a1, 92(sp)
	addi sp, sp, -4
	jal ra, veccpy.2413
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 8(sp)
# 2300~2300
	sw ra, -4(sp)
	lw a0, 108(sp)
	lw a1, 220(sp)
	lw t0, 220(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 96(sp)
# 2301~2301
	addi t0, zero, 0
	sw t0, 152(sp)
# 2301~2301
	lw t0, 148(sp)
	lw t2, 0(t0)
	sw t2, 88(sp)
# 2301~2301
	addi t0, zero, 1
	sw t0, 140(sp)
# 2301~2301
	lw t0, 88(sp)
	addi t2, t0, -1
	sw t2, 100(sp)
# 2301~2301
	sw ra, -4(sp)
	lw a0, 100(sp)
	lw a1, 72(sp)
	lw t0, 72(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 136(sp)
# 2302~2302
	addi t0, zero, 0
	sw t0, 32(sp)
# 2302~2302
	addi t0, zero, 0
	sw t0, 144(sp)
# 2302~2302
	sw ra, -4(sp)
	lw a0, 48(sp)
	lw a1, 32(sp)
	lw a2, 144(sp)
	lw a3, 216(sp)
	lw t0, 216(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 188(sp)
# 2303~2303
	addi t0, zero, 0
	sw t0, 112(sp)
# 2303~2303
	addi t0, zero, 2
	sw t0, 228(sp)
# 2303~2303
	sw ra, -4(sp)
	lw a0, 112(sp)
	lw a1, 196(sp)
	lw a2, 48(sp)
	lw a3, 36(sp)
	lw a4, 228(sp)
	lw a5, 164(sp)
	lw a6, 208(sp)
	lw t0, 208(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 76(sp)
	lw a0, 76(sp)
	addi sp, sp, 232
	ret
# --- File: /home/mouse/is/cpu-ex/mycompiler/to-riscv/asm/io.riscv ---
read_num.72:
	addi sp, sp, -64
	sw a0, 24(sp)
# 0~0
# 2~2
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_byte
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 44(sp)
# 3~3
	addi t0, zero, 32
	sw t0, 36(sp)
	lw t0, 44(sp)
	lw t1, 36(sp)
	beq t0, t1, ._0_then
# 4~4
	addi t0, zero, 10
	sw t0, 12(sp)
	lw t0, 44(sp)
	lw t1, 12(sp)
	beq t0, t1, ._1_then
# 5~5
	addi t0, zero, 48
	sw t0, 48(sp)
	lw t0, 44(sp)
	lw t1, 48(sp)
	bge t0, t1, ._2_then
# 5~5
	lw t0, 24(sp)
	sw t0, 0(tp)
	lw t0, 44(sp)
	sw t0, 4(tp)
	sw tp, 4(sp)
	addi tp, tp, 8
	lw a0, 4(sp)
	addi sp, sp, 64
	ret
	beq zero, zero, ._2_final
._2_then:
# 6~6
	addi t0, zero, 57
	sw t0, 60(sp)
	lw t0, 60(sp)
	lw t1, 44(sp)
	bge t0, t1, ._3_then
# 6~6
	lw t0, 24(sp)
	sw t0, 0(tp)
	lw t0, 44(sp)
	sw t0, 4(tp)
	sw tp, 4(sp)
	addi tp, tp, 8
	lw a0, 4(sp)
	addi sp, sp, 64
	ret
	beq zero, zero, ._3_final
._3_then:
# 7~7
	lw t0, 24(sp)
	lw t1, 24(sp)
	add t2, t0, t1
	sw t2, 16(sp)
# 8~8
	lw t0, 16(sp)
	lw t1, 16(sp)
	add t2, t0, t1
	sw t2, 20(sp)
# 9~9
	lw t0, 20(sp)
	lw t1, 20(sp)
	add t2, t0, t1
	sw t2, 56(sp)
# 10~10
	lw t0, 56(sp)
	lw t1, 16(sp)
	add t2, t0, t1
	sw t2, 52(sp)
# 10~10
	addi t0, zero, 48
	sw t0, 28(sp)
# 10~10
	lw t0, 44(sp)
	addi t2, t0, -48
	sw t2, 32(sp)
# 10~10
	lw t0, 52(sp)
	lw t1, 32(sp)
	add t2, t0, t1
	sw t2, 40(sp)
# 10~10
	sw ra, -4(sp)
	lw a0, 40(sp)
	addi sp, sp, -4
	jal ra, read_num.72
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
	lw a0, 4(sp)
	addi sp, sp, 64
	ret
._3_final:
._2_final:
	beq zero, zero, ._1_final
._1_then:
# 4~4
	lw t0, 24(sp)
	sw t0, 0(tp)
	lw t0, 44(sp)
	sw t0, 4(tp)
	sw tp, 4(sp)
	addi tp, tp, 8
	lw a0, 4(sp)
	addi sp, sp, 64
	ret
._1_final:
	beq zero, zero, ._0_final
._0_then:
# 3~3
	lw t0, 24(sp)
	sw t0, 0(tp)
	lw t0, 44(sp)
	sw t0, 4(tp)
	sw tp, 4(sp)
	addi tp, tp, 8
	lw a0, 4(sp)
	addi sp, sp, 64
	ret
._0_final:
read_isub.74:
	addi sp, sp, -84
	sw a0, 44(sp)
# 0~0
# 13~13
	sw ra, -4(sp)
	lw a0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_byte
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 32(sp)
# 14~14
	addi t0, zero, 32
	sw t0, 28(sp)
	lw t0, 32(sp)
	lw t1, 28(sp)
	beq t0, t1, ._4_then
# 15~15
	addi t0, zero, 10
	sw t0, 56(sp)
	lw t0, 32(sp)
	lw t1, 56(sp)
	beq t0, t1, ._5_then
# 16~16
	addi t0, zero, 45
	sw t0, 68(sp)
	lw t0, 32(sp)
	lw t1, 68(sp)
	beq t0, t1, ._6_then
# 18~18
	addi t0, zero, 48
	sw t0, 72(sp)
	lw t0, 32(sp)
	lw t1, 72(sp)
	bge t0, t1, ._7_then
# 18~18
	addi t0, zero, 0
	sw t0, 0(sp)
# 18~18
	lw t0, 0(sp)
	sw t0, 0(tp)
	lw t0, 32(sp)
	sw t0, 4(tp)
	sw tp, 64(sp)
	addi tp, tp, 8
	lw a0, 64(sp)
	addi sp, sp, 84
	ret
	beq zero, zero, ._7_final
._7_then:
# 19~19
	addi t0, zero, 57
	sw t0, 76(sp)
	lw t0, 76(sp)
	lw t1, 32(sp)
	bge t0, t1, ._8_then
# 19~19
	addi t0, zero, 0
	sw t0, 52(sp)
# 19~19
	lw t0, 52(sp)
	sw t0, 0(tp)
	lw t0, 32(sp)
	sw t0, 4(tp)
	sw tp, 64(sp)
	addi tp, tp, 8
	lw a0, 64(sp)
	addi sp, sp, 84
	ret
	beq zero, zero, ._8_final
._8_then:
# 20~20
	addi t0, zero, 48
	sw t0, 36(sp)
# 20~20
	lw t0, 32(sp)
	addi t2, t0, -48
	sw t2, 20(sp)
# 20~20
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, read_num.72
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 84
	ret
._8_final:
._7_final:
	beq zero, zero, ._6_final
._6_then:
# 17~17
	addi t0, zero, 0
	sw t0, 24(sp)
# 17~17
	sw ra, -4(sp)
	lw a0, 24(sp)
	addi sp, sp, -4
	jal ra, read_num.72
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 17~17
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 17~17
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 12(sp)
# 17~17
	lw t0, 8(sp)
	sub t2, zero, t0
	sw t2, 40(sp)
# 17~17
	lw t0, 40(sp)
	sw t0, 0(tp)
	lw t0, 12(sp)
	sw t0, 4(tp)
	sw tp, 64(sp)
	addi tp, tp, 8
	lw a0, 64(sp)
	addi sp, sp, 84
	ret
._6_final:
	beq zero, zero, ._5_final
._5_then:
# 0~0
# 15~15
	sw ra, -4(sp)
	lw a0, 80(sp)
	addi sp, sp, -4
	jal ra, read_isub.74
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 84
	ret
._5_final:
	beq zero, zero, ._4_final
._4_then:
# 0~0
# 14~14
	sw ra, -4(sp)
	lw a0, 60(sp)
	addi sp, sp, -4
	jal ra, read_isub.74
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 64(sp)
	lw a0, 64(sp)
	addi sp, sp, 84
	ret
._4_final:
min_caml_read_int:
	addi sp, sp, -24
	sw a0, 20(sp)
# 0~0
# 23~23
	sw ra, -4(sp)
	lw a0, 0(sp)
	addi sp, sp, -4
	jal ra, read_isub.74
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 23~23
	lw t0, 4(sp)
	lw t2, 0(t0)
	sw t2, 12(sp)
# 23~23
	lw t0, 4(sp)
	lw t2, 4(t0)
	sw t2, 16(sp)
# 23~23
	lw t0, 12(sp)
	sw t0, 12(sp)
	lw a0, 12(sp)
	addi sp, sp, 24
	ret
smallen.126:
	addi sp, sp, -28
	fsw fa0, 4(sp)
# 29~29
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
# 29~29
	flw ft0, 12(sp)
	flw ft1, 4(sp)
	fle t2, ft0, ft1
	sw t2, 8(sp)
	lw t0, 8(sp)
	bne t0, zero, ._9_then
# 29~29
	flw ft0, 4(sp)
	fsw ft0, 4(sp)
	flw fa0, 4(sp)
	addi sp, sp, 28
	ret
	beq zero, zero, ._9_final
._9_then:
# 29~29
	la t0, f10.00000f
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
# 29~29
	flw ft0, 4(sp)
	flw ft1, 20(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 0(sp)
# 29~29
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, smallen.126
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
	flw fa0, 24(sp)
	addi sp, sp, 28
	ret
._9_final:
min_caml_read_float:
	addi sp, sp, -52
	sw a0, 32(sp)
# 0~0
# 26~26
	sw ra, -4(sp)
	lw a0, 48(sp)
	addi sp, sp, -4
	jal ra, read_isub.74
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 26~31
	lw t0, 28(sp)
	lw t2, 0(t0)
	sw t2, 8(sp)
# 26~31
	lw t0, 28(sp)
	lw t2, 4(t0)
	sw t2, 12(sp)
# 27~27
	addi t0, zero, 46
	sw t0, 16(sp)
	lw t0, 12(sp)
	lw t1, 16(sp)
	beq t0, t1, ._10_then
# 31~31
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 36(sp)
	flw fa0, 36(sp)
	addi sp, sp, 52
	ret
	beq zero, zero, ._10_final
._10_then:
# 0~0
# 28~28
	sw ra, -4(sp)
	lw a0, 0(sp)
	addi sp, sp, -4
	jal ra, min_caml_read_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 30~30
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 20(sp)
# 30~30
	sw ra, -4(sp)
	lw a0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 4(sp)
# 30~30
	sw ra, -4(sp)
	flw fa0, 4(sp)
	addi sp, sp, -4
	jal ra, smallen.126
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 30~30
	flw ft0, 20(sp)
	flw ft1, 44(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 36(sp)
	flw fa0, 36(sp)
	addi sp, sp, 52
	ret
._10_final:
print_num.80:
	addi sp, sp, -72
	fsw fa0, 4(sp)
# 34~34
	la t0, f9.50000f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 34~34
	flw ft0, 44(sp)
	flw ft1, 4(sp)
	fle t2, ft0, ft1
	sw t2, 16(sp)
	lw t0, 16(sp)
	bne t0, zero, ._11_then
# 34~34
	sw ra, -4(sp)
	flw fa0, 4(sp)
	addi sp, sp, -4
	jal ra, min_caml_int_of_float
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 34~34
	addi t0, zero, 48
	sw t0, 8(sp)
# 34~34
	lw t0, 28(sp)
	addi t2, t0, 48
	sw t2, 12(sp)
# 34~34
	sw ra, -4(sp)
	lw a0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_byte
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 72
	ret
	beq zero, zero, ._11_final
._11_then:
# 35~35
	la t0, f0.10000f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 35~35
	flw ft0, 4(sp)
	flw ft1, 48(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 35~35
	sw ra, -4(sp)
	flw fa0, 56(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 64(sp)
# 36~36
	la t0, f10.00000f
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
# 36~36
	flw ft0, 64(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 36(sp)
# 36~36
	flw ft0, 4(sp)
	flw ft1, 36(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 40(sp)
# 36~36
	sw ra, -4(sp)
	flw fa0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_int_of_float
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 68(sp)
# 37~37
	sw ra, -4(sp)
	flw fa0, 64(sp)
	addi sp, sp, -4
	jal ra, print_num.80
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 24(sp)
# 38~38
	addi t0, zero, 48
	sw t0, 60(sp)
# 38~38
	lw t0, 68(sp)
	addi t2, t0, 48
	sw t2, 32(sp)
# 38~38
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_byte
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 52(sp)
	lw a0, 52(sp)
	addi sp, sp, 72
	ret
._11_final:
min_caml_print_int:
	addi sp, sp, -36
	sw a0, 8(sp)
# 41~41
	addi t0, zero, 0
	sw t0, 24(sp)
	lw t0, 8(sp)
	lw t1, 24(sp)
	bge t0, t1, ._12_then
# 41~41
	addi t0, zero, 45
	sw t0, 16(sp)
# 41~41
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_byte
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 41~41
	lw t0, 8(sp)
	sub t2, zero, t0
	sw t2, 20(sp)
# 41~41
	sw ra, -4(sp)
	lw a0, 20(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 32(sp)
# 41~41
	sw ra, -4(sp)
	flw fa0, 32(sp)
	addi sp, sp, -4
	jal ra, print_num.80
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 36
	ret
	beq zero, zero, ._12_final
._12_then:
# 42~42
	sw ra, -4(sp)
	lw a0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_float_of_int
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
# 42~42
	sw ra, -4(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, print_num.80
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 36
	ret
._12_final:
min_caml_print_float:
	addi sp, sp, -52
	fsw fa0, 12(sp)
# 45~45
	sw ra, -4(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 48(sp)
# 45~45
	sw ra, -4(sp)
	flw fa0, 48(sp)
	addi sp, sp, -4
	jal ra, min_caml_int_of_float
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 16(sp)
# 45~45
	sw ra, -4(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 28(sp)
# 46~46
	addi t0, zero, 46
	sw t0, 32(sp)
# 46~46
	sw ra, -4(sp)
	lw a0, 32(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_byte
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 4(sp)
# 47~47
	sw ra, -4(sp)
	flw fa0, 12(sp)
	addi sp, sp, -4
	jal ra, min_caml_floor
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
# 47~47
	flw ft0, 12(sp)
	flw ft1, 44(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 8(sp)
# 48~48
	la t0, f1000000.00000f
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
# 48~48
	flw ft0, 8(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
# 48~48
	sw ra, -4(sp)
	flw fa0, 24(sp)
	addi sp, sp, -4
	jal ra, min_caml_int_of_float
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 40(sp)
# 49~49
	sw ra, -4(sp)
	lw a0, 40(sp)
	addi sp, sp, -4
	jal ra, min_caml_print_int
	addi sp, sp, 4
	lw ra, -4(sp)
	sw a0, 0(sp)
	lw a0, 0(sp)
	addi sp, sp, 52
	ret
# --- File: /home/mouse/is/cpu-ex/mycompiler/to-riscv/asm/lib.riscv ---
min_caml_read_byte:
# s11: input pointer
# gp: mmio address
	lb a0, 0(s11)
	addi s11, s11, 1
	jalr zero, ra, 0

min_caml_print_byte:
min_caml_print_char:
# s11: input pointer
# gp: mmio address
	sb a0, 0(gp)
	jalr zero, ra, 0

min_caml_create_array:
# a0: length
# a1: value
# tp: heap pointer
	mv a2, tp
	beq a0, zero, .min_caml_create_array_end
.min_caml_create_array_loop:
	sw a1, 0(tp)
	addi tp, tp, 4
	addi a0, a0, -1
	blt zero, a0, .min_caml_create_array_loop
.min_caml_create_array_end:
	mv a0, a2
	ret

min_caml_create_float_array:
# a0: length
# fa0: value
	add a2, zero, tp
	beq a0, zero, .min_caml_create_float_array_end
.min_caml_create_float_array_loop:
	fsw fa0, 0(tp)
	addi tp, tp, 4
	addi a0, a0, -1
	blt zero, a0, .min_caml_create_float_array_loop
.min_caml_create_float_array_end:
	add a0, zero, a2
	ret
# --- File: /home/mouse/is/cpu-ex/mycompiler/to-riscv/asm/mathblt.riscv ---
min_caml_floor:
	floor fa0, fa0
	ret
min_caml_float_of_int:
	itof fa0, a0
	ret
min_caml_int_of_float:
	ftoi a0, fa0
	ret
min_caml_sqrt: 
    fsqrt fa0, fa0
    ret

min_caml_fequal:
	feq a0, fa0, fa1
	ret
min_caml_fless:
	flt a0, fa0, fa1
	ret
min_caml_fispos:
	la t0, .zero
	flw ft0, 0(t0)
	flt a0, ft0, fa0
	ret
min_caml_fisneg:
	la t0, .zero
	flw ft0, 0(t0)
	flt a0, fa0, ft0
	ret
min_caml_fiszero:
	la t0, .zero
	flw ft0, 0(t0)
	feq a0, ft0, fa0
	ret
min_caml_xor:
	beq a0, a1, .ret_0
	addi a0, zero, 1
	ret
.ret_0:
	add a0, zero, zero
	ret
min_caml_not:
	addi t0, zero, 1
	sub a0, t0, a0
	ret
min_caml_fhalf:
	la t0, .half
	flw ft0, 0(t0)
	fmul fa0, fa0, fa1
	ret
min_caml_fsqr:
	fmul fa0, fa0, fa0
	ret
min_caml_fabs:
min_caml_abs_float:
    fabs fa0, fa0
    ret
min_caml_fneg:
    fneg fa0, fa0
    ret
# --- File: /home/mouse/is/cpu-ex/mycompiler/to-riscv/asm/math.riscv ---
loop.234:
	addi sp, sp, -28
	fsw fa0, 8(sp)
	sw a0, 24(sp)
	lw t0, 24(sp)
	flw ft0, 4(t0)
	fsw ft0, 0(sp)
# 5~5
	flw ft0, 8(sp)
	flw ft1, 0(sp)
	fle t2, ft0, ft1
	sw t2, 12(sp)
	lw t0, 12(sp)
	bne t0, zero, ._0_then
# 5~5
	flw ft0, 8(sp)
	fsw ft0, 8(sp)
	flw fa0, 8(sp)
	addi sp, sp, 28
	jalr zero, ra, 0
	beq zero, zero, ._0_final
._0_then:
# 6~6
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
# 6~6
	flw ft0, 8(sp)
	flw ft1, 4(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
# 6~6
	sw ra, -4(sp)
	flw fa0, 16(sp)
	lw a0, 24(sp)
	lw t0, 24(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 20(sp)
	flw fa0, 20(sp)
	addi sp, sp, 28
	jalr zero, ra, 0
._0_final:
loop2.237:
	addi sp, sp, -40
	fsw fa0, 24(sp)
	fsw fa1, 32(sp)
# 9~9
	la t0, f6.28319f
	flw ft0, 0(t0)
	fsw ft0, 28(sp)
# 9~9
	flw ft0, 28(sp)
	flw ft1, 24(sp)
	fle t2, ft0, ft1
	sw t2, 36(sp)
	lw t0, 36(sp)
	bne t0, zero, ._1_then
# 9~9
	flw ft0, 24(sp)
	fsw ft0, 24(sp)
	flw fa0, 24(sp)
	addi sp, sp, 40
	jalr zero, ra, 0
	beq zero, zero, ._1_final
._1_then:
# 11~11
	flw ft0, 32(sp)
	flw ft1, 24(sp)
	fle t2, ft0, ft1
	sw t2, 4(sp)
	lw t0, 4(sp)
	bne t0, zero, ._2_then
# 11~11
	flw ft0, 24(sp)
	fsw ft0, 12(sp)
	beq zero, zero, ._2_final
._2_then:
# 11~11
	flw ft0, 24(sp)
	flw ft1, 32(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 12(sp)
._2_final:
# 12~12
	la t0, f2.00000f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 12~12
	flw ft0, 32(sp)
	flw ft1, 0(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 16(sp)
# 12~12
	sw ra, -4(sp)
	flw fa0, 12(sp)
	flw fa1, 16(sp)
	addi sp, sp, -4
	jal ra, loop2.237
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 8(sp)
	flw fa0, 8(sp)
	addi sp, sp, 40
	jalr zero, ra, 0
._1_final:
red2pi.88:
	addi sp, sp, -24
	fsw fa0, 16(sp)
# 3~3
	la t0, f6.28319f
	flw ft0, 0(t0)
	fsw ft0, 8(sp)
# 4~13
	sw tp, 0(sp)
	la t0, loop.234
	sw t0, 0(tp)
	flw ft0, 16(sp)
	fsw ft0, 4(tp)
	addi tp, tp, 8
# 7~7
	sw ra, -4(sp)
	flw fa0, 8(sp)
	lw a0, 0(sp)
	lw t0, 0(sp)
	lw t0, 0(t0)
	addi sp, sp, -4
	jalr ra, t0, 0
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 20(sp)
# 13~13
	sw ra, -4(sp)
	flw fa0, 16(sp)
	flw fa1, 20(sp)
	addi sp, sp, -4
	jal ra, loop2.237
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 12(sp)
	flw fa0, 12(sp)
	addi sp, sp, 24
	jalr zero, ra, 0
addflag.90:
	addi sp, sp, -20
	fsw fa0, 4(sp)
	sw a0, 12(sp)
# 16~16
	addi t0, zero, 0
	sw t0, 8(sp)
	lw t0, 12(sp)
	lw t1, 8(sp)
	beq t0, t1, ._3_then
# 16~16
	flw ft0, 4(sp)
	fsw ft0, 4(sp)
	flw fa0, 4(sp)
	addi sp, sp, 20
	jalr zero, ra, 0
	beq zero, zero, ._3_final
._3_then:
# 16~16
	flw ft0, 4(sp)
	fneg ft2, ft0
	fsw ft2, 0(sp)
	flw fa0, 0(sp)
	addi sp, sp, 20
	jalr zero, ra, 0
._3_final:
kernel_sin.93:
	addi sp, sp, -60
	fsw fa0, 16(sp)
# 19~19
	la t0, f-0.16666f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 20~20
	la t0, f0.00833f
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 21~21
	la t0, f-0.00020f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 22~22
	flw ft0, 16(sp)
	flw ft1, 16(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 32(sp)
# 23~23
	flw ft0, 16(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 8(sp)
# 24~24
	flw ft0, 8(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 4(sp)
# 25~25
	flw ft0, 4(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 36(sp)
# 26~26
	flw ft0, 44(sp)
	flw ft1, 8(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 26~26
	flw ft0, 16(sp)
	flw ft1, 56(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 24(sp)
# 26~26
	flw ft0, 52(sp)
	flw ft1, 4(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 26~26
	flw ft0, 24(sp)
	flw ft1, 28(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 12(sp)
# 26~26
	flw ft0, 48(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 40(sp)
# 26~26
	flw ft0, 12(sp)
	flw ft1, 40(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 20(sp)
	flw fa0, 20(sp)
	addi sp, sp, 60
	jalr zero, ra, 0
kernel_cos.95:
	addi sp, sp, -60
	fsw fa0, 52(sp)
# 29~29
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 0(sp)
# 30~30
	la t0, f-0.50000f
	flw ft0, 0(t0)
	fsw ft0, 24(sp)
# 31~31
	la t0, f0.04166f
	flw ft0, 0(t0)
	fsw ft0, 32(sp)
# 32~32
	la t0, f-0.00137f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 33~33
	flw ft0, 52(sp)
	flw ft1, 52(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 40(sp)
# 34~34
	flw ft0, 40(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 56(sp)
# 35~35
	flw ft0, 56(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 28(sp)
# 36~36
	flw ft0, 24(sp)
	flw ft1, 40(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 12(sp)
# 36~36
	flw ft0, 0(sp)
	flw ft1, 12(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 8(sp)
# 36~36
	flw ft0, 32(sp)
	flw ft1, 56(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 4(sp)
# 36~36
	flw ft0, 8(sp)
	flw ft1, 4(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 36(sp)
# 36~36
	flw ft0, 44(sp)
	flw ft1, 28(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
# 36~36
	flw ft0, 36(sp)
	flw ft1, 16(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 20(sp)
	flw fa0, 20(sp)
	addi sp, sp, 60
	jalr zero, ra, 0
min_caml_sin:
	addi sp, sp, -112
	fsw fa0, 32(sp)
# 39~39
	la t0, f3.14159f
	flw ft0, 0(t0)
	fsw ft0, 100(sp)
# 40~40
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 68(sp)
# 40~40
	flw ft0, 68(sp)
	flw ft1, 32(sp)
	fle t2, ft0, ft1
	sw t2, 28(sp)
	lw t0, 28(sp)
	bne t0, zero, ._4_then
# 40~40
	addi t0, zero, 0
	sw t0, 4(sp)
# 40~40
	flw ft0, 32(sp)
	fneg ft2, ft0
	fsw ft2, 72(sp)
# 40~40
	lw t0, 4(sp)
	sw t0, 0(tp)
	flw ft0, 72(sp)
	fsw ft0, 4(tp)
	sw tp, 16(sp)
	addi tp, tp, 8
	beq zero, zero, ._4_final
._4_then:
# 40~40
	addi t0, zero, 1
	sw t0, 0(sp)
# 40~40
	lw t0, 0(sp)
	sw t0, 0(tp)
	flw ft0, 32(sp)
	fsw ft0, 4(tp)
	sw tp, 16(sp)
	addi tp, tp, 8
._4_final:
# 40~45
	lw t0, 16(sp)
	lw t2, 0(t0)
	sw t2, 64(sp)
# 40~45
	lw t0, 16(sp)
	flw ft0, 4(t0)
	fsw ft0, 108(sp)
# 41~41
	sw ra, -4(sp)
	flw fa0, 108(sp)
	addi sp, sp, -4
	jal ra, red2pi.88
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 92(sp)
# 42~42
	flw ft0, 100(sp)
	flw ft1, 92(sp)
	fle t2, ft0, ft1
	sw t2, 36(sp)
	lw t0, 36(sp)
	bne t0, zero, ._5_then
# 42~42
	lw t0, 64(sp)
	sw t0, 0(tp)
	flw ft0, 92(sp)
	fsw ft0, 4(tp)
	sw tp, 44(sp)
	addi tp, tp, 8
	beq zero, zero, ._5_final
._5_then:
# 42~42
	addi t0, zero, 0
	sw t0, 56(sp)
	lw t0, 64(sp)
	lw t1, 56(sp)
	beq t0, t1, ._6_then
# 42~42
	addi t0, zero, 0
	sw t0, 20(sp)
	beq zero, zero, ._6_final
._6_then:
# 42~42
	addi t0, zero, 1
	sw t0, 20(sp)
._6_final:
# 42~42
	flw ft0, 92(sp)
	flw ft1, 100(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 8(sp)
# 42~42
	lw t0, 20(sp)
	sw t0, 0(tp)
	flw ft0, 8(sp)
	fsw ft0, 4(tp)
	sw tp, 44(sp)
	addi tp, tp, 8
._5_final:
# 42~45
	lw t0, 44(sp)
	lw t2, 0(t0)
	sw t2, 76(sp)
# 42~45
	lw t0, 44(sp)
	flw ft0, 4(t0)
	fsw ft0, 96(sp)
# 43~43
	la t0, f1.57080f
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 43~43
	flw ft0, 52(sp)
	flw ft1, 96(sp)
	fle t2, ft0, ft1
	sw t2, 24(sp)
	lw t0, 24(sp)
	bne t0, zero, ._7_then
# 43~43
	flw ft0, 96(sp)
	fsw ft0, 104(sp)
	beq zero, zero, ._7_final
._7_then:
# 43~43
	flw ft0, 100(sp)
	flw ft1, 96(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 104(sp)
._7_final:
# 44~44
	la t0, f0.78540f
	flw ft0, 0(t0)
	fsw ft0, 12(sp)
# 44~44
	flw ft0, 104(sp)
	flw ft1, 12(sp)
	fle t2, ft0, ft1
	sw t2, 84(sp)
	lw t0, 84(sp)
	bne t0, zero, ._8_then
# 44~44
	la t0, f1.57080f
	flw ft0, 0(t0)
	fsw ft0, 40(sp)
# 44~44
	flw ft0, 40(sp)
	flw ft1, 104(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 80(sp)
# 44~44
	sw ra, -4(sp)
	flw fa0, 80(sp)
	addi sp, sp, -4
	jal ra, kernel_cos.95
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 60(sp)
	beq zero, zero, ._8_final
._8_then:
# 44~44
	sw ra, -4(sp)
	flw fa0, 104(sp)
	addi sp, sp, -4
	jal ra, kernel_sin.93
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 60(sp)
._8_final:
# 45~45
	sw ra, -4(sp)
	flw fa0, 60(sp)
	lw a0, 76(sp)
	addi sp, sp, -4
	jal ra, addflag.90
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 48(sp)
	flw fa0, 48(sp)
	addi sp, sp, 112
	jalr zero, ra, 0
min_caml_cos:
	addi sp, sp, -104
	fsw fa0, 8(sp)
# 48~48
	la t0, f3.14159f
	flw ft0, 0(t0)
	fsw ft0, 76(sp)
# 49~49
	sw ra, -4(sp)
	flw fa0, 8(sp)
	addi sp, sp, -4
	jal ra, min_caml_abs_float
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 49~49
	sw ra, -4(sp)
	flw fa0, 0(sp)
	addi sp, sp, -4
	jal ra, red2pi.88
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 80(sp)
# 50~50
	flw ft0, 76(sp)
	flw ft1, 80(sp)
	fle t2, ft0, ft1
	sw t2, 64(sp)
	lw t0, 64(sp)
	bne t0, zero, ._9_then
# 50~50
	addi t0, zero, 1
	sw t0, 84(sp)
# 50~50
	lw t0, 84(sp)
	sw t0, 0(tp)
	flw ft0, 80(sp)
	fsw ft0, 4(tp)
	sw tp, 96(sp)
	addi tp, tp, 8
	beq zero, zero, ._9_final
._9_then:
# 50~50
	addi t0, zero, 0
	sw t0, 4(sp)
# 50~50
	flw ft0, 80(sp)
	flw ft1, 76(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 60(sp)
# 50~50
	lw t0, 4(sp)
	sw t0, 0(tp)
	flw ft0, 60(sp)
	fsw ft0, 4(tp)
	sw tp, 96(sp)
	addi tp, tp, 8
._9_final:
# 50~53
	lw t0, 96(sp)
	lw t2, 0(t0)
	sw t2, 28(sp)
# 50~53
	lw t0, 96(sp)
	flw ft0, 4(t0)
	fsw ft0, 88(sp)
# 51~51
	la t0, f1.57080f
	flw ft0, 0(t0)
	fsw ft0, 92(sp)
# 51~51
	flw ft0, 92(sp)
	flw ft1, 88(sp)
	fle t2, ft0, ft1
	sw t2, 52(sp)
	lw t0, 52(sp)
	bne t0, zero, ._10_then
# 51~51
	lw t0, 28(sp)
	sw t0, 0(tp)
	flw ft0, 88(sp)
	fsw ft0, 4(tp)
	sw tp, 72(sp)
	addi tp, tp, 8
	beq zero, zero, ._10_final
._10_then:
# 51~51
	addi t0, zero, 0
	sw t0, 68(sp)
	lw t0, 28(sp)
	lw t1, 68(sp)
	beq t0, t1, ._11_then
# 51~51
	addi t0, zero, 0
	sw t0, 48(sp)
	beq zero, zero, ._11_final
._11_then:
# 51~51
	addi t0, zero, 1
	sw t0, 48(sp)
._11_final:
# 51~51
	flw ft0, 76(sp)
	flw ft1, 88(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 12(sp)
# 51~51
	lw t0, 48(sp)
	sw t0, 0(tp)
	flw ft0, 12(sp)
	fsw ft0, 4(tp)
	sw tp, 72(sp)
	addi tp, tp, 8
._10_final:
# 51~53
	lw t0, 72(sp)
	lw t2, 0(t0)
	sw t2, 16(sp)
# 51~53
	lw t0, 72(sp)
	flw ft0, 4(t0)
	fsw ft0, 56(sp)
# 52~52
	la t0, f0.78540f
	flw ft0, 0(t0)
	fsw ft0, 20(sp)
# 52~52
	flw ft0, 56(sp)
	flw ft1, 20(sp)
	fle t2, ft0, ft1
	sw t2, 32(sp)
	lw t0, 32(sp)
	bne t0, zero, ._12_then
# 52~52
	la t0, f1.57080f
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
# 52~52
	flw ft0, 36(sp)
	flw ft1, 56(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 40(sp)
# 52~52
	sw ra, -4(sp)
	flw fa0, 40(sp)
	addi sp, sp, -4
	jal ra, kernel_sin.93
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
	beq zero, zero, ._12_final
._12_then:
# 52~52
	sw ra, -4(sp)
	flw fa0, 56(sp)
	addi sp, sp, -4
	jal ra, kernel_cos.95
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 24(sp)
._12_final:
# 53~53
	sw ra, -4(sp)
	flw fa0, 24(sp)
	lw a0, 16(sp)
	addi sp, sp, -4
	jal ra, addflag.90
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 44(sp)
	flw fa0, 44(sp)
	addi sp, sp, 104
	jalr zero, ra, 0
kernel_atan.101:
	addi sp, sp, -108
	fsw fa0, 84(sp)
# 56~56
	la t0, f-0.33333f
	flw ft0, 0(t0)
	fsw ft0, 48(sp)
# 57~57
	la t0, f0.20000f
	flw ft0, 0(t0)
	fsw ft0, 52(sp)
# 58~58
	la t0, f-0.14286f
	flw ft0, 0(t0)
	fsw ft0, 44(sp)
# 59~59
	la t0, f0.11111f
	flw ft0, 0(t0)
	fsw ft0, 56(sp)
# 60~60
	la t0, f-0.08976f
	flw ft0, 0(t0)
	fsw ft0, 104(sp)
# 61~61
	la t0, f0.06004f
	flw ft0, 0(t0)
	fsw ft0, 60(sp)
# 62~62
	flw ft0, 84(sp)
	flw ft1, 84(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 24(sp)
# 63~63
	flw ft0, 84(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 32(sp)
# 64~64
	flw ft0, 32(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 36(sp)
# 65~65
	flw ft0, 36(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 12(sp)
# 66~66
	flw ft0, 12(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 76(sp)
# 67~67
	flw ft0, 76(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 64(sp)
# 68~68
	flw ft0, 64(sp)
	flw ft1, 24(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 20(sp)
# 69~69
	flw ft0, 48(sp)
	flw ft1, 32(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 72(sp)
# 69~69
	flw ft0, 84(sp)
	flw ft1, 72(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 80(sp)
# 69~69
	flw ft0, 52(sp)
	flw ft1, 36(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 88(sp)
# 69~69
	flw ft0, 80(sp)
	flw ft1, 88(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 92(sp)
# 69~69
	flw ft0, 44(sp)
	flw ft1, 12(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 16(sp)
# 69~69
	flw ft0, 92(sp)
	flw ft1, 16(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 28(sp)
# 69~69
	flw ft0, 56(sp)
	flw ft1, 76(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 96(sp)
# 69~69
	flw ft0, 28(sp)
	flw ft1, 96(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 100(sp)
# 69~69
	flw ft0, 104(sp)
	flw ft1, 64(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 0(sp)
# 69~69
	flw ft0, 100(sp)
	flw ft1, 0(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 40(sp)
# 69~69
	flw ft0, 60(sp)
	flw ft1, 20(sp)
	fmul ft2, ft0, ft1
	fsw ft2, 4(sp)
# 69~69
	flw ft0, 40(sp)
	flw ft1, 4(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 8(sp)
	flw fa0, 8(sp)
	addi sp, sp, 108
	jalr zero, ra, 0
min_caml_atan:
	addi sp, sp, -108
	fsw fa0, 72(sp)
# 73~73
	la t0, f0.00000f
	flw ft0, 0(t0)
	fsw ft0, 76(sp)
# 73~73
	flw ft0, 76(sp)
	flw ft1, 72(sp)
	fle t2, ft0, ft1
	sw t2, 12(sp)
	lw t0, 12(sp)
	bne t0, zero, ._13_then
# 73~73
	addi t0, zero, 0
	sw t0, 68(sp)
# 73~73
	flw ft0, 72(sp)
	fneg ft2, ft0
	fsw ft2, 52(sp)
# 73~73
	lw t0, 68(sp)
	sw t0, 0(tp)
	flw ft0, 52(sp)
	fsw ft0, 4(tp)
	sw tp, 8(sp)
	addi tp, tp, 8
	beq zero, zero, ._13_final
._13_then:
# 73~73
	addi t0, zero, 1
	sw t0, 48(sp)
# 73~73
	lw t0, 48(sp)
	sw t0, 0(tp)
	flw ft0, 72(sp)
	fsw ft0, 4(tp)
	sw tp, 8(sp)
	addi tp, tp, 8
._13_final:
# 73~77
	lw t0, 8(sp)
	lw t2, 0(t0)
	sw t2, 88(sp)
# 73~77
	lw t0, 8(sp)
	flw ft0, 4(t0)
	fsw ft0, 84(sp)
# 74~74
	la t0, f0.43750f
	flw ft0, 0(t0)
	fsw ft0, 92(sp)
# 74~74
	flw ft0, 92(sp)
	flw ft1, 84(sp)
	fle t2, ft0, ft1
	sw t2, 96(sp)
	lw t0, 96(sp)
	bne t0, zero, ._14_then
# 74~74
	sw ra, -4(sp)
	flw fa0, 84(sp)
	addi sp, sp, -4
	jal ra, kernel_atan.101
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 64(sp)
	beq zero, zero, ._14_final
._14_then:
# 75~75
	la t0, f2.43750f
	flw ft0, 0(t0)
	fsw ft0, 80(sp)
# 75~75
	flw ft0, 80(sp)
	flw ft1, 84(sp)
	fle t2, ft0, ft1
	sw t2, 16(sp)
	lw t0, 16(sp)
	bne t0, zero, ._15_then
# 75~75
	la t0, f0.78540f
	flw ft0, 0(t0)
	fsw ft0, 104(sp)
# 75~75
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 36(sp)
# 75~75
	flw ft0, 84(sp)
	flw ft1, 36(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 20(sp)
# 75~75
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 4(sp)
# 75~75
	flw ft0, 84(sp)
	flw ft1, 4(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 24(sp)
# 75~75
	flw ft0, 20(sp)
	flw ft1, 24(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 100(sp)
# 75~75
	sw ra, -4(sp)
	flw fa0, 100(sp)
	addi sp, sp, -4
	jal ra, kernel_atan.101
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 0(sp)
# 75~75
	flw ft0, 104(sp)
	flw ft1, 0(sp)
	fadd ft2, ft0, ft1
	fsw ft2, 64(sp)
	beq zero, zero, ._15_final
._15_then:
# 76~76
	la t0, f1.57080f
	flw ft0, 0(t0)
	fsw ft0, 28(sp)
# 76~76
	la t0, f1.00000f
	flw ft0, 0(t0)
	fsw ft0, 40(sp)
# 76~76
	flw ft0, 40(sp)
	flw ft1, 84(sp)
	fdiv ft2, ft0, ft1
	fsw ft2, 44(sp)
# 76~76
	sw ra, -4(sp)
	flw fa0, 44(sp)
	addi sp, sp, -4
	jal ra, kernel_atan.101
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 60(sp)
# 76~76
	flw ft0, 28(sp)
	flw ft1, 60(sp)
	fsub ft2, ft0, ft1
	fsw ft2, 64(sp)
._15_final:
._14_final:
# 77~77
	sw ra, -4(sp)
	flw fa0, 64(sp)
	lw a0, 88(sp)
	addi sp, sp, -4
	jal ra, addflag.90
	addi sp, sp, 4
	lw ra, -4(sp)
	fsw fa0, 56(sp)
	flw fa0, 56(sp)
	addi sp, sp, 108
	jalr zero, ra, 0

.data
# --- Data from: /home/mouse/is/cpu-ex/mycompiler/to-riscv/cpuex-v1.6/raytracer/minrt.riscv ---
f15.00000f:
	.word 1097859072
f0.01745f:
	.word 1016002968
f1000000000.00000f:
	.word 1315859240
f20.00000f:
	.word 1101004800
f30.00000f:
	.word 1106247680
f150.00000f:
	.word 1125515264
f255.00000f:
	.word 1132396544
f-1.00000f:
	.word 3212836864
f-0.10000f:
	.word 3184315597
f2.00000f:
	.word 1073741824
f0.01000f:
	.word 1008981770
f0.15000f:
	.word 1041865114
f0.50000f:
	.word 1056964608
f0.05000f:
	.word 1028443341
f-0.20000f:
	.word 3192704205
f0.00000f:
	.word 0
f-200.00000f:
	.word 3276275712
f0.00010f:
	.word 953267991
f0.30000f:
	.word 1050253722
f-2.00000f:
	.word 3221225472
f0.10000f:
	.word 1036831949
f-150.00000f:
	.word 3272998912
f10.00000f:
	.word 1092616192
f100000000.00000f:
	.word 1287568416
f0.25000f:
	.word 1048576000
f0.20000f:
	.word 1045220557
f0.00391f:
	.word 998243278
f200.00000f:
	.word 1128792064
f3.14159f:
	.word 1078530012
f1.00000f:
	.word 1065353216
f128.00000f:
	.word 1124073472
f0.90000f:
	.word 1063675494
# --- Data from: /home/mouse/is/cpu-ex/mycompiler/to-riscv/asm/io.riscv ---
f9.50000f:
	.word 1092091904
f1000000.00000f:
	.word 1232348160
f1.00000f:
	.word 1065353216
f10.00000f:
	.word 1092616192
f0.10000f:
	.word 1036831949
# --- Data from: /home/mouse/is/cpu-ex/mycompiler/to-riscv/asm/mathblt.riscv ---
.zero:
	.word 0
.half:
	.word 0x3f000000# --- Data from: /home/mouse/is/cpu-ex/mycompiler/to-riscv/asm/const.riscv ---
f0.04166f:
	.word 0x3d2aa789
f2.00000f:
	.word 1073741824
f0.06004f:
	.word 0x3d75e7c5
f0.43750f:
	.word 1054867456
f1.00000f:
	.word 1065353216
f-0.08976f:
	.word 0xbdb7d66e
f2.43750f:
	.word 1075576832
f0.00833f:
	.word 0x3c088666
f-0.00020f:
	.word 0xb94d64b6
f1.57080f:
	.word 1070141400
f0.11111f:
	.word 0x3de38e38
f-0.33333f:
	.word 0xbeaaaaaa
f-0.50000f:
	.word 3204448256
f-0.00137f:
	.word 0xbab38106
f3.14159f:
	.word 1078530012
f6.28319f:
	.word 1086918618
f0.20000f:
	.word 0x3e4ccccd
f0.78540f:
	.word 1061752792
f-0.16666f:
	.word 0xbe2aaaac
f0.00000f:
	.word 0
f-0.14286f:
	.word 0xbe124925
