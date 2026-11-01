.data
SID:
        .word   1240027
alarm_count:
        .space  4
first_alarm_idx:
        .word   -1
arr:
        .space  104

.text
mov_avg:
        addi    sp,sp,-64
        sw      s0,60(sp)
        addi    s0,sp,64
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        sw      a3,-48(s0)
        sw      a4,-52(s0)
        lw      a5,-52(s0)
        bne     a5,zero,.L2
        lw      a5,-48(s0)
        j       .L3
.L2:
        lw      a4,-52(s0)
        li      a5,1
        bne     a4,a5,.L4
        lw      a4,-44(s0)
        lw      a5,-48(s0)
        add     a5,a4,a5
        srli    a4,a5,31
        add     a5,a4,a5
        srai    a5,a5,1
        j       .L3
.L4:
        lw      a4,-52(s0)
        li      a5,2
        bne     a4,a5,.L5
        lw      a4,-40(s0)
        lw      a5,-44(s0)
        add     a4,a4,a5
        lw      a5,-48(s0)
        add     a4,a4,a5
        li      a5,3
        div     a5,a4,a5
        j       .L3
.L5:
        lw      a4,-36(s0)
        lw      a5,-40(s0)
        add     a4,a4,a5
        lw      a5,-44(s0)
        add     a5,a4,a5
        lw      a4,-48(s0)
        add     a5,a4,a5
        sw      a5,-24(s0)
        lw      a5,-24(s0)
        srai    a5,a5,2
        sw      a5,-20(s0)
        lw      a5,-24(s0)
        andi    a5,a5,2
        beq     a5,zero,.L6
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L6:
        lw      a5,-20(s0)
.L3:
        mv      a0,a5
        lw      s0,60(sp)
        addi    sp,sp,64
        jr      ra

.text
check_alarm:
        addi    sp,sp,-32
        sw      s0,28(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        sw      a2,-28(s0)
        lw      a4,-24(s0)
        lw      a5,-28(s0)
        ble     a4,a5,.L9
        la      a5,alarm_count
        lw      a5,0(a5)
        addi    a4,a5,1
        la      a5,alarm_count
        sw      a4,0(a5)
        la      a5,first_alarm_idx
        lw      a4,0(a5)
        li      a5,-1
        bne     a4,a5,.L9
        la      a5,first_alarm_idx
        lw      a4,-20(s0)
        sw      a4,0(a5)
.L9:
        nop
        lw      s0,28(sp)
        addi    sp,sp,32
        jr      ra

.text
.globl main
main:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        li      a5,1241088
        addi    a5,a5,-1061
        sw      a5,-20(s0)
        sw      zero,-24(s0)
        j       .L11
.L12:
        lw      a4,-20(s0)
        li      a5,1662976
        addi    a5,a5,1549
        mul     a4,a4,a5
        li      a5,1013903360
        addi    a5,a5,863
        add     a5,a4,a5
        sw      a5,-20(s0)
        lw      a5,-20(s0)
        srli    a4,a5,16
        li      a5,80
        remu    a5,a4,a5
        addi    a5,a5,50
        mv      a3,a5
        la      a4,arr
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        sw      a3,0(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L11:
        lw      a4,-24(s0)
        li      a5,25
        ble     a4,a5,.L12
        sw      zero,-28(s0)
        sw      zero,-32(s0)
        sw      zero,-36(s0)
        sw      zero,-24(s0)
        j       .L13
.L14:
        la      a4,arr
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        sw      a5,-44(s0)
        lw      a4,-24(s0)
        lw      a3,-44(s0)
        lw      a2,-28(s0)
        lw      a1,-32(s0)
        lw      a0,-36(s0)
        call    mov_avg
        mv      a3,a0
        la      a4,arr
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        sw      a3,0(a5)
        lw      a5,-32(s0)
        sw      a5,-36(s0)
        lw      a5,-28(s0)
        sw      a5,-32(s0)
        lw      a5,-44(s0)
        sw      a5,-28(s0)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L13:
        lw      a4,-24(s0)
        li      a5,25
        ble     a4,a5,.L14
        li      a5,1241088
        addi    a4,a5,-1061
        li      a5,20
        rem     a5,a4,a5
        addi    a5,a5,90
        sw      a5,-40(s0)
        sw      zero,-24(s0)
        j       .L15
.L16:
        la      a4,arr
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a4,a5
        lw      a5,0(a5)
        lw      a2,-40(s0)
        mv      a1,a5
        lw      a0,-24(s0)
        call    check_alarm
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
.L15:
        lw      a4,-24(s0)
        li      a5,25
        ble     a4,a5,.L16
        li      a5,0
        mv      a0,a5
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra