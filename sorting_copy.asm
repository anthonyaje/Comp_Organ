lui r1, 2
lui r2, 1
lui r3, 3
lui r4, 5
lui r5, 4
sw r1, 0(r0)
sw r2, 4(r0)
sw r3, 8(r0)
sw r4, 12(r0)
sw r5, 16(r0)
lui r6, 0
lui r7, 1
lui r8, 5   OUTERLOOP:
    bgt r7,r8, EXIT
    addi r7, r7, 1
    bgt r4,r5, SWAP1    BACK1:
    bgt r3,r4, SWAP2    BACK2:
    bgt r2,r3, SWAP3    BACK3:
    bgt r1,r2, SWAP4
    jump EXIT           SWAP1:
    addi r6, r5, 0
    addi r5, r4, 0
    addi r4, r6, 0
    jump BACK1          SWAP2:
    addi r6, r4, 0
    addi r4, r3, 0
    addi r3, r6, 0
    jump BACK2          SWAP3:
    addi r6, r3, 0
    addi r3, r2, 0
    addi r3, r6, 0
    jump BACK3          SWAP4:
    addi r6, r2, 0
    addi r2, r1, 0
    addi r2, r6, 0
jump OUTERLOOP          EXIT:
    sw r1, 0(r0)
    sw r2, 4(r0)
    sw r3, 8(r0)
    sw r4, 12(r0)
    sw r5, 16(r0)
