        .file   "example.c"
        .option nopic
        .attribute arch, "rv32i2p1_m2p0"
        .attribute unaligned_access, 0
        .attribute stack_align, 16
        .text
.Ltext0:
        .file 0 "/app" "/app/example.c"
        .align  2
        .globl  mov_avg
        .type   mov_avg, @function
mov_avg:
.LFB0:
        .file 1 "/app/example.c"
        .loc 1 10 55
        .cfi_startproc
.LVL0:
        .loc 1 11 5
        .loc 1 11 8 is_stmt 0
        beq     a4,zero,.L5
        .loc 1 12 5 is_stmt 1
        .loc 1 12 8 is_stmt 0
        li      a5,1
        beq     a4,a5,.L6
        .loc 1 13 5 is_stmt 1
        .loc 1 13 8 is_stmt 0
        li      a5,2
        beq     a4,a5,.L7
        .loc 1 15 5 is_stmt 1
.LVL1:
        .loc 1 16 5
        .loc 1 15 18 is_stmt 0
        add     a0,a0,a1
.LVL2:
        .loc 1 15 23
        add     a0,a0,a2
        .loc 1 15 9
        add     a0,a0,a3
.LVL3:
        .loc 1 16 16
        srai    a0,a0,2
.LVL4:
        ret
.LVL5:
.L6:
        .loc 1 12 19 is_stmt 1 discriminator 1
        .loc 1 12 30 is_stmt 0 discriminator 1
        add     a2,a2,a3
.LVL6:
        .loc 1 12 37 discriminator 1
        srli    a3,a2,31
.LVL7:
        add     a3,a3,a2
        srai    a0,a3,1
.LVL8:
        .loc 1 12 37
        ret
.LVL9:
.L7:
        .loc 1 13 19 is_stmt 1 discriminator 1
        .loc 1 13 30 is_stmt 0 discriminator 1
        add     a1,a1,a2
.LVL10:
        .loc 1 13 35 discriminator 1
        add     a1,a1,a3
        .loc 1 13 42 discriminator 1
        li      a3,3
.LVL11:
        div     a0,a1,a3
.LVL12:
        .loc 1 13 42
        ret
.LVL13:
.L5:
        .loc 1 11 26 discriminator 1
        mv      a0,a3
.LVL14:
        .loc 1 17 1
        ret
        .cfi_endproc
.LFE0:
        .size   mov_avg, .-mov_avg
        .align  2
        .globl  check_alarm
        .type   check_alarm, @function
check_alarm:
.LFB1:
        .loc 1 19 39 is_stmt 1
        .cfi_startproc
        .loc 1 20 5
        .loc 1 20 8 is_stmt 0
        ble     a1,a2,.L8
        .loc 1 21 9 is_stmt 1
        .loc 1 21 20 is_stmt 0
        lui     a4,%hi(alarm_count)
        lw      a5,%lo(alarm_count)(a4)
        addi    a5,a5,1
        sw      a5,%lo(alarm_count)(a4)
        .loc 1 22 9 is_stmt 1
        .loc 1 22 29 is_stmt 0
        lui     a5,%hi(first_alarm_idx)
        .loc 1 22 12
        lw      a4,%lo(first_alarm_idx)(a5)
        li      a5,-1
        beq     a4,a5,.L10
.L8:
        .loc 1 26 1
        ret
.L10:
        .loc 1 23 13 is_stmt 1
        .loc 1 23 29 is_stmt 0
        lui     a5,%hi(first_alarm_idx)
        sw      a0,%lo(first_alarm_idx)(a5)
        .loc 1 26 1
        ret
        .cfi_endproc
.LFE1:
        .size   check_alarm, .-check_alarm
        .align  2
        .globl  main
        .type   main, @function
main:
.LFB2:
        .loc 1 28 12 is_stmt 1
        .cfi_startproc
        addi    sp,sp,-32
        .cfi_def_cfa_offset 32
        sw      ra,28(sp)
        sw      s0,24(sp)
        sw      s1,20(sp)
        sw      s2,16(sp)
        sw      s3,12(sp)
        sw      s4,8(sp)
        sw      s5,4(sp)
        sw      s6,0(sp)
        .cfi_offset 1, -4
        .cfi_offset 8, -8
        .cfi_offset 9, -12
        .cfi_offset 18, -16
        .cfi_offset 19, -20
        .cfi_offset 20, -24
        .cfi_offset 21, -28
        .cfi_offset 22, -32
        .loc 1 29 5
.LVL16:
        .loc 1 30 5
        .loc 1 32 5
        .loc 1 32 19 discriminator 1
        lui     a3,%hi(.LANCHOR0)
        addi    s2,a3,%lo(.LANCHOR0)
        addi    a6,s2,104
        .loc 1 28 12 is_stmt 0
        addi    a3,a3,%lo(.LANCHOR0)
        .loc 1 29 18
        li      a4,1241088
        addi    a4,a4,-1061
        .loc 1 33 22
        li      a1,1662976
        addi    a1,a1,1549
        .loc 1 33 11
        li      a2,1013903360
        addi    a2,a2,863
        .loc 1 34 40
        li      a0,80
.LVL17:
.L12:
        .loc 1 33 9 is_stmt 1
        .loc 1 33 22 is_stmt 0
        mul     a4,a4,a1
.LVL18:
        .loc 1 33 11
        add     a4,a4,a2
.LVL19:
        .loc 1 34 9 is_stmt 1
        .loc 1 34 30 is_stmt 0
        srli    a5,a4,16
        .loc 1 34 40
        remu    a5,a5,a0
        .loc 1 34 45
        addi    a5,a5,50
        .loc 1 34 16
        sw      a5,0(a3)
        .loc 1 32 25 is_stmt 1 discriminator 3
        .loc 1 32 19 discriminator 1
        addi    a3,a3,4
        bne     a3,a6,.L12
        mv      s1,s2
        .loc 1 37 25 is_stmt 0
        li      a0,0
        .loc 1 37 17
        li      s3,0
        .loc 1 37 9
        li      s5,0
        .loc 1 38 12
        li      s0,0
        .loc 1 38 19 discriminator 1
        li      s6,26
        j       .L13
.LVL20:
.L15:
        mv      s3,s5
        mv      s5,s4
.LVL21:
.L13:
.LBB2:
        .loc 1 39 9 is_stmt 1
        .loc 1 39 13 is_stmt 0
        lw      s4,0(s1)
.LVL22:
        .loc 1 40 9 is_stmt 1
        .loc 1 40 18 is_stmt 0
        mv      a4,s0
        mv      a3,s4
        mv      a2,s5
        mv      a1,s3
        call    mov_avg
.LVL23:
        .loc 1 40 16 discriminator 1
        sw      a0,0(s1)
        .loc 1 41 9 is_stmt 1
.LVL24:
        .loc 1 42 9
        .loc 1 43 9
.LBE2:
        .loc 1 38 25 discriminator 3
        addi    s0,s0,1
        .loc 1 38 19 discriminator 1
        addi    s1,s1,4
        mv      a0,s3
        bne     s0,s6,.L15
        .loc 1 47 12 is_stmt 0
        li      s0,0
.LVL26:
        .loc 1 47 19 discriminator 1
        li      s1,26
.LVL27:
.L14:
        .loc 1 48 9 is_stmt 1
        li      a2,97
        lw      a1,0(s2)
        mv      a0,s0
        call    check_alarm
.LVL28:
        .loc 1 47 25 discriminator 3
        addi    s0,s0,1
        .loc 1 47 19 discriminator 1
        addi    s2,s2,4
        bne     s0,s1,.L14
        .loc 1 51 5
        .loc 1 52 1 is_stmt 0
        li      a0,0
        lw      ra,28(sp)
        .cfi_restore 1
        lw      s0,24(sp)
        .cfi_restore 8
.LVL30:
        lw      s1,20(sp)
        .cfi_restore 9
        lw      s2,16(sp)
        .cfi_restore 18
        lw      s3,12(sp)
        .cfi_restore 19
.LVL31:
        lw      s4,8(sp)
        .cfi_restore 20
.LVL32:
        lw      s5,4(sp)
        .cfi_restore 21
.LVL33:
        lw      s6,0(sp)
        .cfi_restore 22
        addi    sp,sp,32
        .cfi_def_cfa_offset 0
        jr      ra
        .cfi_endproc
.LFE2:
        .size   main, .-main
        .globl  arr
        .globl  first_alarm_idx
        .globl  alarm_count
        .globl  SID
        .bss
        .align  2
        .set    .LANCHOR0,. + 0
        .type   arr, @object
        .size   arr, 104
arr:
        .zero   104
        .section        .sbss,"aw",@nobits
        .align  2
        .type   alarm_count, @object
        .size   alarm_count, 4
alarm_count:
        .zero   4
        .section        .sdata,"aw"
        .align  2
        .type   first_alarm_idx, @object
        .size   first_alarm_idx, 4
first_alarm_idx:
        .word   -1
        .section        .srodata,"a"
        .align  2
        .type   SID, @object
        .size   SID, 4
SID:
        .word   1240027
        .text
.Letext0:
        .section        .debug_info,"",@progbits
.Ldebug_info0:
        .4byte  0x1ed
        .2byte  0x5
        .byte   0x1
        .byte   0x4
        .4byte  .Ldebug_abbrev0
        .byte   0x9
        .4byte  .LASF9
        .byte   0x1d
        .4byte  .LASF0
        .4byte  .LASF1
        .4byte  .Ltext0
        .4byte  .Letext0-.Ltext0
        .4byte  .Ldebug_line0
        .byte   0x5
        .byte   0x8
        .4byte  .LASF2
        .byte   0x5
        .byte   0x4
        .4byte  .LASF3
        .byte   0x6
        .string "SID"
        .byte   0x5
        .byte   0xb
        .4byte  0x4a
        .byte   0x5
        .byte   0x3
        .4byte  SID
        .byte   0xa
        .byte   0x4
        .byte   0x5
        .string "int"
        .byte   0xb
        .4byte  0x43
        .byte   0x7
        .4byte  .LASF4
        .byte   0x6
        .byte   0xe
        .4byte  0x2c
        .byte   0x5
        .byte   0x3
        .4byte  alarm_count
        .byte   0x7
        .4byte  .LASF5
        .byte   0x7
        .byte   0x5
        .4byte  0x43
        .byte   0x5
        .byte   0x3
        .4byte  first_alarm_idx
        .byte   0xc
        .4byte  0x43
        .4byte  0x81
        .byte   0xd
        .4byte  0x2c
        .byte   0x19
        .byte   0
        .byte   0x6
        .string "arr"
        .byte   0x8
        .byte   0x5
        .4byte  0x71
        .byte   0x5
        .byte   0x3
        .4byte  arr
        .byte   0xe
        .4byte  .LASF6
        .byte   0x1
        .byte   0x1c
        .byte   0x5
        .4byte  0x43
        .4byte  .LFB2
        .4byte  .LFE2-.LFB2
        .byte   0x1
        .byte   0x9c
        .4byte  0x150
        .byte   0x1
        .string "x"
        .byte   0x1d
        .byte   0x12
        .4byte  0x2c
        .4byte  .LLST5
        .byte   0x1
        .string "i"
        .byte   0x1e
        .byte   0x9
        .4byte  0x43
        .4byte  .LLST6
        .byte   0x1
        .string "p1"
        .byte   0x25
        .byte   0x9
        .4byte  0x43
        .4byte  .LLST7
        .byte   0x1
        .string "p2"
        .byte   0x25
        .byte   0x11
        .4byte  0x43
        .4byte  .LLST8
        .byte   0x1
        .string "p3"
        .byte   0x25
        .byte   0x19
        .4byte  0x43
        .4byte  .LLST9
        .byte   0xf
        .string "T"
        .byte   0x1
        .byte   0x2e
        .byte   0x9
        .4byte  0x43
        .byte   0x10
        .4byte  .LBB2
        .4byte  .LBE2-.LBB2
        .4byte  0x139
        .byte   0x1
        .string "cur"
        .byte   0x27
        .byte   0xd
        .4byte  0x43
        .4byte  .LLST10
        .byte   0x8
        .4byte  .LVL23
        .4byte  0x188
        .byte   0x2
        .byte   0x1
        .byte   0x5b
        .byte   0x2
        .byte   0x83
        .byte   0
        .byte   0x2
        .byte   0x1
        .byte   0x5c
        .byte   0x2
        .byte   0x85
        .byte   0
        .byte   0x2
        .byte   0x1
        .byte   0x5d
        .byte   0x2
        .byte   0x84
        .byte   0
        .byte   0x2
        .byte   0x1
        .byte   0x5e
        .byte   0x2
        .byte   0x78
        .byte   0
        .byte   0
        .byte   0
        .byte   0x8
        .4byte  .LVL28
        .4byte  0x150
        .byte   0x2
        .byte   0x1
        .byte   0x5a
        .byte   0x2
        .byte   0x78
        .byte   0
        .byte   0x2
        .byte   0x1
        .byte   0x5c
        .byte   0x2
        .byte   0x8
        .byte   0x61
        .byte   0
        .byte   0
        .byte   0x11
        .4byte  .LASF7
        .byte   0x1
        .byte   0x13
        .byte   0x6
        .4byte  .LFB1
        .4byte  .LFE1-.LFB1
        .byte   0x1
        .byte   0x9c
        .4byte  0x188
        .byte   0x3
        .string "i"
        .byte   0x13
        .byte   0x16
        .4byte  0x43
        .byte   0x1
        .byte   0x5a
        .byte   0x3
        .string "s"
        .byte   0x13
        .byte   0x1d
        .4byte  0x43
        .byte   0x1
        .byte   0x5b
        .byte   0x3
        .string "T"
        .byte   0x13
        .byte   0x24
        .4byte  0x43
        .byte   0x1
        .byte   0x5c
        .byte   0
        .byte   0x12
        .4byte  .LASF8
        .byte   0x1
        .byte   0xa
        .byte   0x5
        .4byte  0x43
        .4byte  .LFB0
        .4byte  .LFE0-.LFB0
        .byte   0x1
        .byte   0x9c
        .byte   0x4
        .string "p3"
        .byte   0x11
        .4byte  0x43
        .4byte  .LLST0
        .byte   0x4
        .string "p2"
        .byte   0x19
        .4byte  0x43
        .4byte  .LLST1
        .byte   0x4
        .string "p1"
        .byte   0x21
        .4byte  0x43
        .4byte  .LLST2
        .byte   0x4
        .string "cur"
        .byte   0x29
        .4byte  0x43
        .4byte  .LLST3
        .byte   0x3
        .string "idx"
        .byte   0xa
        .byte   0x32
        .4byte  0x43
        .byte   0x1
        .byte   0x5e
        .byte   0x1
        .string "sum"
        .byte   0xf
        .byte   0x9
        .4byte  0x43
        .4byte  .LLST4
        .byte   0
        .byte   0
        .section        .debug_abbrev,"",@progbits
.Ldebug_abbrev0:
        .byte   0x1
        .byte   0x34
        .byte   0
        .byte   0x3
        .byte   0x8
        .byte   0x3a
        .byte   0x21
        .byte   0x1
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x49
        .byte   0x13
        .byte   0x2
        .byte   0x17
        .byte   0
        .byte   0
        .byte   0x2
        .byte   0x49
        .byte   0
        .byte   0x2
        .byte   0x18
        .byte   0x7e
        .byte   0x18
        .byte   0
        .byte   0
        .byte   0x3
        .byte   0x5
        .byte   0
        .byte   0x3
        .byte   0x8
        .byte   0x3a
        .byte   0x21
        .byte   0x1
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x49
        .byte   0x13
        .byte   0x2
        .byte   0x18
        .byte   0
        .byte   0
        .byte   0x4
        .byte   0x5
        .byte   0
        .byte   0x3
        .byte   0x8
        .byte   0x3a
        .byte   0x21
        .byte   0x1
        .byte   0x3b
        .byte   0x21
        .byte   0xa
        .byte   0x39
        .byte   0xb
        .byte   0x49
        .byte   0x13
        .byte   0x2
        .byte   0x17
        .byte   0
        .byte   0
        .byte   0x5
        .byte   0x24
        .byte   0
        .byte   0xb
        .byte   0xb
        .byte   0x3e
        .byte   0x21
        .byte   0x7
        .byte   0x3
        .byte   0xe
        .byte   0
        .byte   0
        .byte   0x6
        .byte   0x34
        .byte   0
        .byte   0x3
        .byte   0x8
        .byte   0x3a
        .byte   0x21
        .byte   0x1
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x49
        .byte   0x13
        .byte   0x3f
        .byte   0x19
        .byte   0x2
        .byte   0x18
        .byte   0
        .byte   0
        .byte   0x7
        .byte   0x34
        .byte   0
        .byte   0x3
        .byte   0xe
        .byte   0x3a
        .byte   0x21
        .byte   0x1
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x49
        .byte   0x13
        .byte   0x3f
        .byte   0x19
        .byte   0x2
        .byte   0x18
        .byte   0
        .byte   0
        .byte   0x8
        .byte   0x48
        .byte   0x1
        .byte   0x7d
        .byte   0x1
        .byte   0x7f
        .byte   0x13
        .byte   0
        .byte   0
        .byte   0x9
        .byte   0x11
        .byte   0x1
        .byte   0x25
        .byte   0xe
        .byte   0x13
        .byte   0xb
        .byte   0x3
        .byte   0x1f
        .byte   0x1b
        .byte   0x1f
        .byte   0x11
        .byte   0x1
        .byte   0x12
        .byte   0x6
        .byte   0x10
        .byte   0x17
        .byte   0
        .byte   0
        .byte   0xa
        .byte   0x24
        .byte   0
        .byte   0xb
        .byte   0xb
        .byte   0x3e
        .byte   0xb
        .byte   0x3
        .byte   0x8
        .byte   0
        .byte   0
        .byte   0xb
        .byte   0x26
        .byte   0
        .byte   0x49
        .byte   0x13
        .byte   0
        .byte   0
        .byte   0xc
        .byte   0x1
        .byte   0x1
        .byte   0x49
        .byte   0x13
        .byte   0x1
        .byte   0x13
        .byte   0
        .byte   0
        .byte   0xd
        .byte   0x21
        .byte   0
        .byte   0x49
        .byte   0x13
        .byte   0x2f
        .byte   0xb
        .byte   0
        .byte   0
        .byte   0xe
        .byte   0x2e
        .byte   0x1
        .byte   0x3f
        .byte   0x19
        .byte   0x3
        .byte   0xe
        .byte   0x3a
        .byte   0xb
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x49
        .byte   0x13
        .byte   0x11
        .byte   0x1
        .byte   0x12
        .byte   0x6
        .byte   0x40
        .byte   0x18
        .byte   0x7a
        .byte   0x19
        .byte   0x1
        .byte   0x13
        .byte   0
        .byte   0
        .byte   0xf
        .byte   0x34
        .byte   0
        .byte   0x3
        .byte   0x8
        .byte   0x3a
        .byte   0xb
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x49
        .byte   0x13
        .byte   0
        .byte   0
        .byte   0x10
        .byte   0xb
        .byte   0x1
        .byte   0x11
        .byte   0x1
        .byte   0x12
        .byte   0x6
        .byte   0x1
        .byte   0x13
        .byte   0
        .byte   0
        .byte   0x11
        .byte   0x2e
        .byte   0x1
        .byte   0x3f
        .byte   0x19
        .byte   0x3
        .byte   0xe
        .byte   0x3a
        .byte   0xb
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x27
        .byte   0x19
        .byte   0x11
        .byte   0x1
        .byte   0x12
        .byte   0x6
        .byte   0x40
        .byte   0x18
        .byte   0x7a
        .byte   0x19
        .byte   0x1
        .byte   0x13
        .byte   0
        .byte   0
        .byte   0x12
        .byte   0x2e
        .byte   0x1
        .byte   0x3f
        .byte   0x19
        .byte   0x3
        .byte   0xe
        .byte   0x3a
        .byte   0xb
        .byte   0x3b
        .byte   0xb
        .byte   0x39
        .byte   0xb
        .byte   0x27
        .byte   0x19
        .byte   0x49
        .byte   0x13
        .byte   0x11
        .byte   0x1
        .byte   0x12
        .byte   0x6
        .byte   0x40
        .byte   0x18
        .byte   0x7a
        .byte   0x19
        .byte   0
        .byte   0
        .byte   0
        .section        .debug_loclists,"",@progbits
        .4byte  .Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
        .2byte  0x5
        .byte   0x4
        .byte   0
        .4byte  0
.LLST5:
        .byte   0x7
        .4byte  .LVL16
        .4byte  .LVL17
        .byte   0x6
        .byte   0xc
        .4byte  0x12ebdb
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL17
        .4byte  .LVL18
        .byte   0x1
        .byte   0x5e
        .byte   0x7
        .4byte  .LVL19
        .4byte  .LVL20
        .byte   0x1
        .byte   0x5e
        .byte   0
.LLST6:
        .byte   0x7
        .4byte  .LVL16
        .4byte  .LVL17
        .byte   0x2
        .byte   0x30
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL20
        .4byte  .LVL26
        .byte   0x1
        .byte   0x58
        .byte   0x7
        .4byte  .LVL27
        .4byte  .LVL30
        .byte   0x1
        .byte   0x58
        .byte   0
.LLST7:
        .byte   0x7
        .4byte  .LVL20
        .4byte  .LVL21
        .byte   0x1
        .byte   0x64
        .byte   0x7
        .4byte  .LVL21
        .4byte  .LVL24
        .byte   0x1
        .byte   0x65
        .byte   0x7
        .4byte  .LVL24
        .4byte  .LVL32
        .byte   0x1
        .byte   0x64
        .byte   0
.LLST8:
        .byte   0x7
        .4byte  .LVL20
        .4byte  .LVL21
        .byte   0x1
        .byte   0x65
        .byte   0x7
        .4byte  .LVL21
        .4byte  .LVL24
        .byte   0x1
        .byte   0x63
        .byte   0x7
        .4byte  .LVL24
        .4byte  .LVL33
        .byte   0x1
        .byte   0x65
        .byte   0
.LLST9:
        .byte   0x7
        .4byte  .LVL20
        .4byte  .LVL23-1
        .byte   0x1
        .byte   0x5a
        .byte   0x7
        .4byte  .LVL24
        .4byte  .LVL31
        .byte   0x1
        .byte   0x63
        .byte   0
.LLST10:
        .byte   0x7
        .4byte  .LVL20
        .4byte  .LVL21
        .byte   0x1
        .byte   0x64
        .byte   0x7
        .4byte  .LVL22
        .4byte  .LVL32
        .byte   0x1
        .byte   0x64
        .byte   0
.LLST0:
        .byte   0x7
        .4byte  .LVL0
        .4byte  .LVL2
        .byte   0x1
        .byte   0x5a
        .byte   0x7
        .4byte  .LVL2
        .4byte  .LVL5
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xa
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL5
        .4byte  .LVL8
        .byte   0x1
        .byte   0x5a
        .byte   0x7
        .4byte  .LVL8
        .4byte  .LVL9
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xa
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL9
        .4byte  .LVL12
        .byte   0x1
        .byte   0x5a
        .byte   0x7
        .4byte  .LVL12
        .4byte  .LVL13
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xa
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL13
        .4byte  .LVL14
        .byte   0x1
        .byte   0x5a
        .byte   0x7
        .4byte  .LVL14
        .4byte  .LFE0
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xa
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0
.LLST1:
        .byte   0x7
        .4byte  .LVL0
        .4byte  .LVL10
        .byte   0x1
        .byte   0x5b
        .byte   0x7
        .4byte  .LVL10
        .4byte  .LVL13
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xb
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL13
        .4byte  .LFE0
        .byte   0x1
        .byte   0x5b
        .byte   0
.LLST2:
        .byte   0x7
        .4byte  .LVL0
        .4byte  .LVL6
        .byte   0x1
        .byte   0x5c
        .byte   0x7
        .4byte  .LVL6
        .4byte  .LVL9
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xc
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL9
        .4byte  .LFE0
        .byte   0x1
        .byte   0x5c
        .byte   0
.LLST3:
        .byte   0x7
        .4byte  .LVL0
        .4byte  .LVL7
        .byte   0x1
        .byte   0x5d
        .byte   0x7
        .4byte  .LVL7
        .4byte  .LVL9
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xd
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL9
        .4byte  .LVL11
        .byte   0x1
        .byte   0x5d
        .byte   0x7
        .4byte  .LVL11
        .4byte  .LVL13
        .byte   0xa
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xd
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL13
        .4byte  .LFE0
        .byte   0x1
        .byte   0x5d
        .byte   0
.LLST4:
        .byte   0x7
        .4byte  .LVL1
        .4byte  .LVL2
        .byte   0xc
        .byte   0x7a
        .byte   0
        .byte   0x7b
        .byte   0
        .byte   0x22
        .byte   0x7c
        .byte   0
        .byte   0x22
        .byte   0x7d
        .byte   0
        .byte   0x22
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL2
        .4byte  .LVL3
        .byte   0x13
        .byte   0x7b
        .byte   0
        .byte   0x7c
        .byte   0
        .byte   0x22
        .byte   0x7d
        .byte   0
        .byte   0x22
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xa
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x22
        .byte   0x9f
        .byte   0x7
        .4byte  .LVL3
        .4byte  .LVL4
        .byte   0x1
        .byte   0x5a
        .byte   0x7
        .4byte  .LVL4
        .4byte  .LVL5
        .byte   0x13
        .byte   0x7b
        .byte   0
        .byte   0x7c
        .byte   0
        .byte   0x22
        .byte   0x7d
        .byte   0
        .byte   0x22
        .byte   0xa3
        .byte   0x3
        .byte   0xa5
        .byte   0xa
        .byte   0x26
        .byte   0xa8
        .byte   0x2c
        .byte   0xa8
        .byte   0
        .byte   0x22
        .byte   0x9f
        .byte   0
.Ldebug_loc3:
        .section        .debug_aranges,"",@progbits
        .4byte  0x1c
        .2byte  0x2
        .4byte  .Ldebug_info0
        .byte   0x4
        .byte   0
        .2byte  0
        .2byte  0
        .4byte  .Ltext0
        .4byte  .Letext0-.Ltext0
        .4byte  0
        .4byte  0
        .section        .debug_line,"",@progbits
.Ldebug_line0:
        .section        .debug_str,"MS",@progbits,1
.LASF3:
        .string "unsigned int"
.LASF5:
        .string "first_alarm_idx"
.LASF7:
        .string "check_alarm"
.LASF9:
        .string "GNU C17 13.2.0 -mabi=ilp32 -misa-spec=20191213 -march=rv32im -g -O1"
.LASF8:
        .string "mov_avg"
.LASF4:
        .string "alarm_count"
.LASF6:
        .string "main"
.LASF2:
        .string "long long unsigned int"
        .section        .debug_line_str,"MS",@progbits,1
.LASF0:
        .string "/app/example.c"
.LASF1:
        .string "/app"
        .ident  "GCC: (crosstool-NG UNKNOWN) 13.2.0"
        .section        .note.GNU-stack,"",@progbits