asect 0
memset: ext
main: ext
default_handler: ext    # as external

# Interrupt vector table (IVT)
# Place a vector to program start and map 
# all internal exceptions to default_handler
dc main, 0              # Startup/Reset vector
dc default_handler, 0   # Unaligned SP
dc default_handler, 0   # Unaligned PC
dc default_handler, 0   # Invalid instruction
dc default_handler, 0   # Double fault
align 0x80              # Reserve space for the rest 
                        # of IVT

# Exception handlers section
rsect exc_handlers

# This handler halts processor
default_handler>
    halt

rsect main

macro movens/2
push $1
pop $2
mend

fix_for_straight>                       # -- Begin function fix_for_straight
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-14
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r1, -14                         # 2-byte Folded Spill
	ldi	r1, 0
	ldi	r2, 1
	movens	r1, r4
	movens	r1, r5
	br	__LBB0_2
__LBB0_2:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r3
	ldi	r6, 6
	cmp	r3, r6
	movens	r2, r6
	beq	__LBB0_4
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB0_2 Depth=1
	movens	r4, r6
__LBB0_4:                               # %while.body
                                        #   in Loop: Header=BB0_2 Depth=1
	movens	r2, r4
	cmp	r3, r4
	movens	r4, r3
	beq	__LBB0_6
# %bb.5:                                # %while.body
                                        #   in Loop: Header=BB0_2 Depth=1
	movens	r5, r3
__LBB0_6:                               # %while.body
                                        #   in Loop: Header=BB0_2 Depth=1
	add	r1, 2
	ldi	r4, 10
	cmp	r1, r4
	movens	r6, r4
	movens	r3, r5
	beq	__LBB0_1
	br	__LBB0_2
__LBB0_1:                               # %while.cond6.preheader
	ssw	r3, -12                         # 2-byte Folded Spill
	ssw	r6, -10                         # 2-byte Folded Spill
	ldi	r5, 0
	movens	r0, r3
	lsw	r6, -14                         # 2-byte Folded Reload
	movens	r6, r1
	ssw	r5, -8                          # 2-byte Folded Spill
	movens	r5, r2
	br	__LBB0_7
__LBB0_7:                               # %while.body8
                                        # =>This Inner Loop Header: Depth=1
	lsw	r4, -10                         # 2-byte Folded Reload
	cmp	r4, r5
	beq	__LBB0_9
	br	__LBB0_8
__LBB0_8:                               # %land.lhs.true
                                        #   in Loop: Header=BB0_7 Depth=1
	ldw	r3, r4
	ldi	r6, 6
	movens	r6, r5
	lsw	r6, -14                         # 2-byte Folded Reload
	cmp	r4, r5
	movens	r5, r4
	beq	__LBB0_11
	br	__LBB0_9
__LBB0_9:                               # %if.else
                                        #   in Loop: Header=BB0_7 Depth=1
	lsw	r4, -12                         # 2-byte Folded Reload
	ldi	r5, 0
	cmp	r4, r5
	beq	__LBB0_12
	br	__LBB0_10
__LBB0_10:                              # %land.lhs.true15
                                        #   in Loop: Header=BB0_7 Depth=1
	ldw	r3, r4
	ldi	r5, 1
	cmp	r4, r5
	movens	r5, r4
	bne	__LBB0_12
	br	__LBB0_11
__LBB0_11:                              # %if.end21.sink.split
                                        #   in Loop: Header=BB0_7 Depth=1
	stw	r1, r4
	ldi	r4, 1
	ssw	r4, -8                          # 2-byte Folded Spill
__LBB0_12:                              # %if.end21
                                        #   in Loop: Header=BB0_7 Depth=1
	ldi	r4, 3
	cmp	r2, r4
	ldi	r5, 0
	bhi	__LBB0_14
	br	__LBB0_13
__LBB0_13:                              # %if.end21
                                        #   in Loop: Header=BB0_7 Depth=1
	add	r3, 2
	add	r1, 2
	add	r2, 1
	lsw	r4, -8                          # 2-byte Folded Reload
	cmp	r4, r5
	beq	__LBB0_7
	br	__LBB0_14
__LBB0_14:                              # %while.cond27.preheader.preheader
	ldi	r1, 2
	ldi	r3, 0
	ldi	r2, 10
__LBB0_15:                              # %while.cond27.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_16 Depth 2
	movens	r3, r5
__LBB0_16:                              # %while.body29
                                        #   Parent Loop BB0_15 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r0, r5, r4
	cmp	r4, r1
	bne	__LBB0_19
	br	__LBB0_17
__LBB0_17:                              # %land.lhs.true32
                                        #   in Loop: Header=BB0_16 Depth=2
	ldw	r6, r5, r4
	cmp	r4, r3
	bne	__LBB0_19
	br	__LBB0_18
__LBB0_19:                              # %if.end37
                                        #   in Loop: Header=BB0_16 Depth=2
	add	r5, 2
	cmp	r5, r2
	bne	__LBB0_16
	br	__LBB0_20
__LBB0_18:                              # %if.then35
                                        #   in Loop: Header=BB0_15 Depth=1
	stw	r6, r5, r1
	br	__LBB0_20
__LBB0_20:                              # %while.end39
                                        #   in Loop: Header=BB0_15 Depth=1
	add	r1, 1
	ldi	r4, 6
	cmp	r1, r4
	bne	__LBB0_15
	br	__LBB0_21
__LBB0_21:                              # %while.end41
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	14
	pop	fp
	rts
                                        # -- End function
count_values>                           # -- Begin function count_values
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 0
	ldi	r3, 5
	ldi	r4, 10
__LBB1_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r2, r5
	sub	r5, 1
	cmp	r5, r3
	bhi	__LBB1_3
	br	__LBB1_2
__LBB1_2:                               # %if.then
                                        #   in Loop: Header=BB1_1 Depth=1
	shl	r5, r5, 1
	ldw	r1, r5, r6
	add	r6, 1
	stw	r1, r5, r6
__LBB1_3:                               # %while.end
                                        #   in Loop: Header=BB1_1 Depth=1
	add	r2, 2
	cmp	r2, r4
	bne	__LBB1_1
	br	__LBB1_4
__LBB1_4:                               # %while.end8
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
find_best_value_to_fix>                 # -- Begin function find_best_value_to_fix
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 0
	ldi	r4, 12
	movens	r2, r5
__LBB2_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r2, r3
	cmp	r3, r5
	bgt	__LBB2_3
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movens	r5, r3
__LBB2_3:                               # %while.body
                                        #   in Loop: Header=BB2_1 Depth=1
	add	r2, 2
	cmp	r2, r4
	movens	r3, r5
	bne	__LBB2_1
	br	__LBB2_4
__LBB2_4:                               # %while.end
	ldi	r2, -1
	ldi	r5, 0
	cmp	r3, r5
	beq	__LBB2_12
	br	__LBB2_5
__LBB2_5:                               # %while.body8.preheader
	ldi	r2, 6
	movens	r0, r6
	add	r6, 10
	add	r1, 10
__LBB2_6:                               # %while.body8
                                        # =>This Inner Loop Header: Depth=1
	ldw	r6, r4
	cmp	r4, r3
	bne	__LBB2_8
	br	__LBB2_7
__LBB2_7:                               # %land.lhs.true
                                        #   in Loop: Header=BB2_6 Depth=1
	ldw	r1, r4
	cmp	r4, r5
	beq	__LBB2_12
	br	__LBB2_8
__LBB2_8:                               # %if.end14
                                        #   in Loop: Header=BB2_6 Depth=1
	sub	r6, 2
	sub	r1, 2
	sub	r2, 1
	cmp	r2, r5
	bne	__LBB2_6
	br	__LBB2_9
__LBB2_9:                               # %while.body18.preheader
	ldi	r1, 6
	add	r0, 10
__LBB2_10:                              # %while.body18
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r2
	cmp	r2, r3
	movens	r1, r2
	beq	__LBB2_12
	br	__LBB2_11
__LBB2_11:                              # %if.end23
                                        #   in Loop: Header=BB2_10 Depth=1
	sub	r0, 2
	sub	r1, 1
	cmp	r1, r5
	ldi	r2, -1
	bne	__LBB2_10
	br	__LBB2_12
__LBB2_12:                              # %cleanup
	movens	r2, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
find_max_value>                         # -- Begin function find_max_value
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-2
	ssw	r4, -2                          # 2-byte Folded Spill
	ldi	r2, 0
	ldi	r3, 10
	movens	r2, r4
__LBB3_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r2, r1
	cmp	r1, r4
	bgt	__LBB3_3
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movens	r4, r1
__LBB3_3:                               # %while.body
                                        #   in Loop: Header=BB3_1 Depth=1
	add	r2, 2
	cmp	r2, r3
	movens	r1, r4
	bne	__LBB3_1
	br	__LBB3_4
__LBB3_4:                               # %while.end
	movens	r1, r0
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	2
	pop	fp
	rts
                                        # -- End function
keep_only_value>                        # -- Begin function keep_only_value
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r3, 0
	ldi	r4, 10
	movens	r3, r5
__LBB4_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r5, r6
	cmp	r6, r2
	beq	__LBB4_3
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movens	r3, r6
__LBB4_3:                               # %while.body
                                        #   in Loop: Header=BB4_1 Depth=1
	stw	r1, r5, r6
	add	r5, 2
	cmp	r5, r4
	bne	__LBB4_1
	br	__LBB4_4
__LBB4_4:                               # %while.end
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
calculate_score>                        # -- Begin function calculate_score
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r5, 0
	movens	r5, r6
	movens	r5, r2
__LBB5_1:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldi	r3, 1
	cmp	r1, r3
	movens	r5, r3
	blt	__LBB5_3
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movens	r1, r3
__LBB5_3:                               # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	ldw	r0, r6, r4
	cmp	r4, r1
	movens	r5, r4
	bne	__LBB5_5
# %bb.4:                                # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	movens	r3, r4
__LBB5_5:                               # %while.body
                                        #   in Loop: Header=BB5_1 Depth=1
	add r2, r4, r2
	add	r6, 2
	ldi	r3, 10
	cmp	r6, r3
	bne	__LBB5_1
	br	__LBB5_6
__LBB5_6:                               # %while.end7
	movens	r2, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
calculate_three_of_a_kind>              # -- Begin function calculate_three_of_a_kind
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 1
	ldi	r4, 0
                                        # implicit-def: $r1
                                        # kill: killed $r1
__LBB6_1:                               # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB6_3 Depth 2
	ldi	r1, 6
	cmp	r2, r1
	movens	r4, r1
	bhi	__LBB6_11
	br	__LBB6_2
__LBB6_2:                               # %while.body3.preheader
                                        #   in Loop: Header=BB6_1 Depth=1
	movens	r4, r6
	movens	r4, r3
	movens	r4, r1
__LBB6_3:                               # %while.body3
                                        #   Parent Loop BB6_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r0, r6, r5
	cmp	r5, r2
	ldi	r4, 1
	beq	__LBB6_5
# %bb.4:                                # %while.body3
                                        #   in Loop: Header=BB6_3 Depth=2
	ldi	r4, 0
__LBB6_5:                               # %while.body3
                                        #   in Loop: Header=BB6_3 Depth=2
	add r5, r3, r3
	add r1, r4, r1
	add	r6, 2
	ldi	r4, 10
	cmp	r6, r4
	bne	__LBB6_3
	br	__LBB6_6
__LBB6_6:                               # %while.end
                                        #   in Loop: Header=BB6_1 Depth=1
	ldi	r5, 3
	cmp	r1, r5
	blo	__LBB6_8
# %bb.7:                                # %while.end
                                        #   in Loop: Header=BB6_1 Depth=1
	ssw	r3, -8                          # 2-byte Folded Spill
__LBB6_8:                               # %while.end
                                        #   in Loop: Header=BB6_1 Depth=1
	cmp	r1, r5
	ldi	r3, 1
	ldi	r4, 0
	blo	__LBB6_10
# %bb.9:                                # %while.end
                                        #   in Loop: Header=BB6_1 Depth=1
	movens	r4, r3
__LBB6_10:                              # %while.end
                                        #   in Loop: Header=BB6_1 Depth=1
	add r2, r3, r2
	cmp	r1, r5
	lsw	r1, -8                          # 2-byte Folded Reload
	blo	__LBB6_1
	br	__LBB6_11
__LBB6_11:                              # %cleanup14
	movens	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	8
	pop	fp
	rts
                                        # -- End function
calculate_four_of_a_kind>               # -- Begin function calculate_four_of_a_kind
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 1
	ldi	r4, 0
                                        # implicit-def: $r1
                                        # kill: killed $r1
__LBB7_1:                               # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
	ldi	r1, 6
	cmp	r2, r1
	movens	r4, r1
	bhi	__LBB7_11
	br	__LBB7_2
__LBB7_2:                               # %while.body3.preheader
                                        #   in Loop: Header=BB7_1 Depth=1
	movens	r4, r6
	movens	r4, r3
	movens	r4, r1
__LBB7_3:                               # %while.body3
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r0, r6, r5
	cmp	r5, r2
	ldi	r4, 1
	beq	__LBB7_5
# %bb.4:                                # %while.body3
                                        #   in Loop: Header=BB7_3 Depth=2
	ldi	r4, 0
__LBB7_5:                               # %while.body3
                                        #   in Loop: Header=BB7_3 Depth=2
	add r5, r3, r3
	add r1, r4, r1
	add	r6, 2
	ldi	r4, 10
	cmp	r6, r4
	bne	__LBB7_3
	br	__LBB7_6
__LBB7_6:                               # %while.end
                                        #   in Loop: Header=BB7_1 Depth=1
	ldi	r5, 4
	cmp	r1, r5
	blo	__LBB7_8
# %bb.7:                                # %while.end
                                        #   in Loop: Header=BB7_1 Depth=1
	ssw	r3, -8                          # 2-byte Folded Spill
__LBB7_8:                               # %while.end
                                        #   in Loop: Header=BB7_1 Depth=1
	cmp	r1, r5
	ldi	r3, 1
	ldi	r4, 0
	blo	__LBB7_10
# %bb.9:                                # %while.end
                                        #   in Loop: Header=BB7_1 Depth=1
	movens	r4, r3
__LBB7_10:                              # %while.end
                                        #   in Loop: Header=BB7_1 Depth=1
	add r2, r3, r2
	cmp	r1, r5
	lsw	r1, -8                          # 2-byte Folded Reload
	blo	__LBB7_1
	br	__LBB7_11
__LBB7_11:                              # %cleanup14
	movens	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	8
	pop	fp
	rts
                                        # -- End function
calculate_full_house>                   # -- Begin function calculate_full_house
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-18
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r1, -18
	add	r1, fp, r1
	ldi	r3, 10
	ldi	r4, 0
	stw	r1, r3, r4
	ldi	r2, 8
	stw	r1, r2, r4
	ldi	r2, 6
	stw	r1, r2, r4
	ldi	r2, 4
	stw	r1, r2, r4
	ldi	r2, 2
	stw	r1, r2, r4
	ssw	r4, -18
	ldi	r5, 5
__LBB8_1:                               # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r4, r1
	sub	r1, 1
	cmp	r1, r5
	bhi	__LBB8_3
	br	__LBB8_2
__LBB8_2:                               # %if.then.i
                                        #   in Loop: Header=BB8_1 Depth=1
	shl	r1, r1, 1
	ldi	r2, -18
	add	r2, fp, r2
	ldw	r2, r1, r6
	add	r6, 1
	stw	r2, r1, r6
__LBB8_3:                               # %while.end.i
                                        #   in Loop: Header=BB8_1 Depth=1
	add	r4, 2
	cmp	r4, r3
	bne	__LBB8_1
	br	__LBB8_4
__LBB8_4:                               # %while.body.preheader
	ldi	r0, 0
	ldi	r4, 1
	ldi	r5, 12
	movens	r0, r6
	movens	r0, r3
__LBB8_5:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldi	r1, -18
	add	r1, fp, r1
	ldw	r1, r0, r2
	ldi	r1, 2
	cmp	r2, r1
	movens	r4, r1
	beq	__LBB8_7
# %bb.6:                                # %while.body
                                        #   in Loop: Header=BB8_5 Depth=1
	movens	r6, r1
__LBB8_7:                               # %while.body
                                        #   in Loop: Header=BB8_5 Depth=1
	ldi	r6, 3
	cmp	r2, r6
	movens	r4, r2
	beq	__LBB8_9
# %bb.8:                                # %while.body
                                        #   in Loop: Header=BB8_5 Depth=1
	movens	r3, r2
__LBB8_9:                               # %while.body
                                        #   in Loop: Header=BB8_5 Depth=1
	add	r0, 2
	cmp	r0, r5
	movens	r1, r6
	movens	r2, r3
	bne	__LBB8_5
	br	__LBB8_10
__LBB8_10:                              # %while.end
	ldi	r0, 25
	ldi	r3, 0
	cmp	r1, r3
	bne	__LBB8_12
# %bb.11:                               # %while.end
	movens	r3, r0
__LBB8_12:                              # %while.end
	cmp	r2, r3
	bne	__LBB8_14
# %bb.13:                               # %while.end
	movens	r3, r0
__LBB8_14:                              # %while.end
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	18
	pop	fp
	rts
                                        # -- End function
calculate_straight>                     # -- Begin function calculate_straight
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-20
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r1, -18
	add	r1, fp, r5
	ldi	r2, 10
	ldi	r4, 0
	stw	r5, r2, r4
	ldi	r1, 8
	stw	r5, r1, r4
	ldi	r1, 6
	stw	r5, r1, r4
	ldi	r1, 4
	stw	r5, r1, r4
	ldi	r1, 2
	stw	r5, r1, r4
	ssw	r4, -18
	ldi	r6, 5
__LBB9_1:                               # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r4, r5
	sub	r5, 1
	cmp	r5, r6
	bhi	__LBB9_3
	br	__LBB9_2
__LBB9_2:                               # %if.then.i
                                        #   in Loop: Header=BB9_1 Depth=1
	shl	r5, r5, 1
	ldi	r1, -18
	add	r1, fp, r3
	ldw	r3, r5, r1
	add	r1, 1
	stw	r3, r5, r1
__LBB9_3:                               # %while.end.i
                                        #   in Loop: Header=BB9_1 Depth=1
	add	r4, 2
	cmp	r4, r2
	bne	__LBB9_1
	br	__LBB9_4
__LBB9_4:                               # %count_values.exit
	ldi	r0, -18
	add	r0, fp, r0
	ldi	r1, 8
	ldw	r0, r1, r4
	ldi	r1, 6
	ldw	r0, r1, r6
	ldi	r1, 4
	ldw	r0, r1, r1
	ssw	r1, -20                         # 2-byte Folded Spill
	ldi	r1, 2
	ldw	r0, r1, r1
	ldi	r3, 0
	lsw	r0, -18
	cmp	r0, r3
	beq	__LBB9_9
	br	__LBB9_5
__LBB9_5:                               # %count_values.exit
	ldi	r5, 0
	cmp	r1, r5
	beq	__LBB9_9
	br	__LBB9_6
__LBB9_6:                               # %count_values.exit
	lsw	r0, -20                         # 2-byte Folded Reload
	cmp	r0, r5
	beq	__LBB9_9
	br	__LBB9_7
__LBB9_7:                               # %count_values.exit
	cmp	r6, r5
	beq	__LBB9_9
	br	__LBB9_8
__LBB9_8:                               # %count_values.exit
	ldi	r0, 40
	cmp	r4, r5
	bne	__LBB9_19
	br	__LBB9_9
__LBB9_9:                               # %if.end
	movens	r1, r5
	ldi	r0, -18
	add	r0, fp, r0
	ldw	r0, r2, r1
	ldi	r0, 40
	cmp	r1, r3
	bne	__LBB9_11
# %bb.10:                               # %if.end
	movens	r3, r0
__LBB9_11:                              # %if.end
	cmp	r4, r3
	bne	__LBB9_13
# %bb.12:                               # %if.end
	movens	r3, r0
__LBB9_13:                              # %if.end
	cmp	r6, r3
	bne	__LBB9_15
# %bb.14:                               # %if.end
	movens	r3, r0
__LBB9_15:                              # %if.end
	lsw	r1, -20                         # 2-byte Folded Reload
	cmp	r1, r3
	bne	__LBB9_17
# %bb.16:                               # %if.end
	movens	r3, r0
__LBB9_17:                              # %if.end
	cmp	r5, r3
	bne	__LBB9_19
# %bb.18:                               # %if.end
	movens	r3, r0
__LBB9_19:                              # %cleanup
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	20
	pop	fp
	rts
                                        # -- End function
calculate_yahtzee>                      # -- Begin function calculate_yahtzee
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-6
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ldi	r2, 0
	ldw	r0, r3
	add	r0, 2
	ldi	r4, 50
	ldi	r5, 8
	movens	r2, r6
	br	__LBB10_2
__LBB10_2:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r6, r1
	cmp	r1, r3
	movens	r2, r1
	beq	__LBB10_1
	br	__LBB10_3
__LBB10_1:                              # %while.cond
                                        #   in Loop: Header=BB10_2 Depth=1
	add	r6, 2
	cmp	r6, r5
	movens	r4, r1
	beq	__LBB10_3
	br	__LBB10_2
__LBB10_3:                              # %cleanup
	movens	r1, r0
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	6
	pop	fp
	rts
                                        # -- End function
find_best_pattern2>                     # -- Begin function find_best_pattern2
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-30
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	movens	r0, r2
	ldi	r0, -1
	ssw	r0, -24                         # 2-byte Folded Spill
	ldi	r3, 0
	movens	r3, r5
	ssw	r1, -22                         # 2-byte Folded Spill
__LBB11_1:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_3 Depth 2
	shl	r5, r0, 1
	ldw	r1, r0, r0
	ldi	r4, 0
	cmp	r0, r4
	bne	__LBB11_11
	br	__LBB11_2
__LBB11_2:                              # %if.then
                                        #   in Loop: Header=BB11_1 Depth=1
	ssw	r3, -20                         # 2-byte Folded Spill
	movens	r5, r3
	add	r3, 1
	ldi	r1, 0
	movens	r1, r4
	movens	r1, r0
__LBB11_3:                              # %while.body.i
                                        #   Parent Loop BB11_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r2, r4, r6
	cmp	r6, r3
	movens	r3, r6
	beq	__LBB11_5
# %bb.4:                                # %while.body.i
                                        #   in Loop: Header=BB11_3 Depth=2
	movens	r1, r6
__LBB11_5:                              # %while.body.i
                                        #   in Loop: Header=BB11_3 Depth=2
	add r6, r0, r0
	add	r4, 2
	ldi	r6, 10
	cmp	r4, r6
	bne	__LBB11_3
	br	__LBB11_6
__LBB11_6:                              # %calculate_score.exit
                                        #   in Loop: Header=BB11_1 Depth=1
	lsw	r3, -20                         # 2-byte Folded Reload
	cmp	r0, r3
	blt	__LBB11_8
# %bb.7:                                # %calculate_score.exit
                                        #   in Loop: Header=BB11_1 Depth=1
	ssw	r5, -24                         # 2-byte Folded Spill
__LBB11_8:                              # %calculate_score.exit
                                        #   in Loop: Header=BB11_1 Depth=1
	cmp	r0, r3
	lsw	r1, -22                         # 2-byte Folded Reload
	bgt	__LBB11_10
# %bb.9:                                # %calculate_score.exit
                                        #   in Loop: Header=BB11_1 Depth=1
	movens	r3, r0
__LBB11_10:                             # %calculate_score.exit
                                        #   in Loop: Header=BB11_1 Depth=1
	movens	r0, r3
__LBB11_11:                             # %if.end4
                                        #   in Loop: Header=BB11_1 Depth=1
	add	r5, 1
	ldi	r0, 6
	cmp	r5, r0
	bne	__LBB11_1
	br	__LBB11_12
__LBB11_12:                             # %while.end
	ldi	r0, 12
	ldw	r1, r0, r0
	ldi	r4, 0
	cmp	r0, r4
	bne	__LBB11_28
	br	__LBB11_13
__LBB11_13:                             # %while.cond.i.preheader
	ssw	r3, -20                         # 2-byte Folded Spill
	ldi	r0, 1
	ldi	r6, 0
                                        # implicit-def: $r1
                                        # kill: killed $r1
__LBB11_14:                             # %while.cond.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_16 Depth 2
	ldi	r1, 6
	cmp	r0, r1
	movens	r6, r3
	bhi	__LBB11_24
	br	__LBB11_15
__LBB11_15:                             # %while.body3.i.preheader
                                        #   in Loop: Header=BB11_14 Depth=1
	movens	r6, r3
	movens	r6, r4
	movens	r6, r5
__LBB11_16:                             # %while.body3.i
                                        #   Parent Loop BB11_14 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r2, r3, r6
	cmp	r6, r0
	ldi	r1, 1
	beq	__LBB11_18
# %bb.17:                               # %while.body3.i
                                        #   in Loop: Header=BB11_16 Depth=2
	ldi	r1, 0
__LBB11_18:                             # %while.body3.i
                                        #   in Loop: Header=BB11_16 Depth=2
	add r6, r4, r4
	add r5, r1, r5
	add	r3, 2
	ldi	r1, 10
	cmp	r3, r1
	bne	__LBB11_16
	br	__LBB11_19
__LBB11_19:                             # %while.end.i
                                        #   in Loop: Header=BB11_14 Depth=1
	ldi	r3, 3
	cmp	r5, r3
	blo	__LBB11_21
# %bb.20:                               # %while.end.i
                                        #   in Loop: Header=BB11_14 Depth=1
	ssw	r4, -26                         # 2-byte Folded Spill
__LBB11_21:                             # %while.end.i
                                        #   in Loop: Header=BB11_14 Depth=1
	cmp	r5, r3
	ldi	r1, 1
	ldi	r6, 0
	blo	__LBB11_23
# %bb.22:                               # %while.end.i
                                        #   in Loop: Header=BB11_14 Depth=1
	movens	r6, r1
__LBB11_23:                             # %while.end.i
                                        #   in Loop: Header=BB11_14 Depth=1
	add r0, r1, r0
	cmp	r5, r3
	lsw	r3, -26                         # 2-byte Folded Reload
	blo	__LBB11_14
	br	__LBB11_24
__LBB11_24:                             # %calculate_three_of_a_kind.exit
	lsw	r0, -20                         # 2-byte Folded Reload
	cmp	r3, r0
	blt	__LBB11_26
# %bb.25:                               # %calculate_three_of_a_kind.exit
	ldi	r0, 6
	ssw	r0, -24                         # 2-byte Folded Spill
__LBB11_26:                             # %calculate_three_of_a_kind.exit
	lsw	r0, -20                         # 2-byte Folded Reload
	cmp	r3, r0
	lsw	r1, -22                         # 2-byte Folded Reload
	ldi	r4, 0
	bgt	__LBB11_28
# %bb.27:                               # %calculate_three_of_a_kind.exit
	movens	r0, r3
__LBB11_28:                             # %if.end13
	ldi	r0, 14
	ldw	r1, r0, r0
	cmp	r0, r4
	bne	__LBB11_44
	br	__LBB11_29
__LBB11_29:                             # %while.cond.i87.preheader
	ssw	r3, -20                         # 2-byte Folded Spill
	ldi	r1, 1
	ldi	r6, 0
                                        # implicit-def: $r0
                                        # kill: killed $r0
__LBB11_30:                             # %while.cond.i87
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_32 Depth 2
	ldi	r0, 6
	cmp	r1, r0
	movens	r6, r3
	bhi	__LBB11_40
	br	__LBB11_31
__LBB11_31:                             # %while.body3.i92.preheader
                                        #   in Loop: Header=BB11_30 Depth=1
	movens	r6, r4
	movens	r6, r3
	movens	r6, r5
__LBB11_32:                             # %while.body3.i92
                                        #   Parent Loop BB11_30 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r2, r4, r6
	cmp	r6, r1
	ldi	r0, 1
	beq	__LBB11_34
# %bb.33:                               # %while.body3.i92
                                        #   in Loop: Header=BB11_32 Depth=2
	ldi	r0, 0
__LBB11_34:                             # %while.body3.i92
                                        #   in Loop: Header=BB11_32 Depth=2
	add r6, r3, r3
	add r5, r0, r5
	add	r4, 2
	ldi	r0, 10
	cmp	r4, r0
	bne	__LBB11_32
	br	__LBB11_35
__LBB11_35:                             # %while.end.i103
                                        #   in Loop: Header=BB11_30 Depth=1
	ldi	r4, 4
	cmp	r5, r4
	blo	__LBB11_37
# %bb.36:                               # %while.end.i103
                                        #   in Loop: Header=BB11_30 Depth=1
	ssw	r3, -26                         # 2-byte Folded Spill
__LBB11_37:                             # %while.end.i103
                                        #   in Loop: Header=BB11_30 Depth=1
	cmp	r5, r4
	ldi	r0, 1
	ldi	r6, 0
	blo	__LBB11_39
# %bb.38:                               # %while.end.i103
                                        #   in Loop: Header=BB11_30 Depth=1
	movens	r6, r0
__LBB11_39:                             # %while.end.i103
                                        #   in Loop: Header=BB11_30 Depth=1
	add r1, r0, r1
	cmp	r5, r4
	lsw	r3, -26                         # 2-byte Folded Reload
	blo	__LBB11_30
	br	__LBB11_40
__LBB11_40:                             # %calculate_four_of_a_kind.exit
	lsw	r0, -20                         # 2-byte Folded Reload
	cmp	r3, r0
	blt	__LBB11_42
# %bb.41:                               # %calculate_four_of_a_kind.exit
	ldi	r0, 7
	ssw	r0, -24                         # 2-byte Folded Spill
__LBB11_42:                             # %calculate_four_of_a_kind.exit
	lsw	r0, -20                         # 2-byte Folded Reload
	cmp	r3, r0
	lsw	r1, -22                         # 2-byte Folded Reload
	ldi	r4, 0
	bgt	__LBB11_44
# %bb.43:                               # %calculate_four_of_a_kind.exit
	movens	r0, r3
__LBB11_44:                             # %if.end22
	ldi	r0, 16
	ldw	r1, r0, r0
	cmp	r0, r4
	bne	__LBB11_64
	br	__LBB11_45
__LBB11_45:                             # %if.then25
	ssw	r3, -20                         # 2-byte Folded Spill
	ldi	r0, -18
	add	r0, fp, r0
	ldi	r1, 10
	stw	r0, r1, r4
	ldi	r3, 8
	stw	r0, r3, r4
	ldi	r3, 6
	stw	r0, r3, r4
	ldi	r3, 4
	stw	r0, r3, r4
	ldi	r3, 2
	stw	r0, r3, r4
	ssw	r4, -18
	ldi	r3, 5
__LBB11_46:                             # %while.body.i.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r2, r4, r0
	sub	r0, 1
	cmp	r0, r3
	bhi	__LBB11_48
	br	__LBB11_47
__LBB11_47:                             # %if.then.i.i
                                        #   in Loop: Header=BB11_46 Depth=1
	shl	r0, r0, 1
	ldi	r5, -18
	add	r5, fp, r5
	ldw	r5, r0, r6
	add	r6, 1
	stw	r5, r0, r6
__LBB11_48:                             # %while.end.i.i
                                        #   in Loop: Header=BB11_46 Depth=1
	add	r4, 2
	cmp	r4, r1
	bne	__LBB11_46
	br	__LBB11_49
__LBB11_49:                             # %while.body.i108.preheader
	ldi	r1, 0
	ldi	r6, 1
	movens	r1, r3
	movens	r1, r4
__LBB11_50:                             # %while.body.i108
                                        # =>This Inner Loop Header: Depth=1
	ldi	r0, -18
	add	r0, fp, r0
	ldw	r0, r1, r0
	ldi	r5, 2
	cmp	r0, r5
	movens	r6, r5
	beq	__LBB11_52
# %bb.51:                               # %while.body.i108
                                        #   in Loop: Header=BB11_50 Depth=1
	movens	r3, r5
__LBB11_52:                             # %while.body.i108
                                        #   in Loop: Header=BB11_50 Depth=1
	ldi	r3, 3
	cmp	r0, r3
	movens	r6, r0
	beq	__LBB11_54
# %bb.53:                               # %while.body.i108
                                        #   in Loop: Header=BB11_50 Depth=1
	movens	r4, r0
__LBB11_54:                             # %while.body.i108
                                        #   in Loop: Header=BB11_50 Depth=1
	add	r1, 2
	ldi	r3, 12
	cmp	r1, r3
	movens	r5, r3
	movens	r0, r4
	bne	__LBB11_50
	br	__LBB11_55
__LBB11_55:                             # %calculate_full_house.exit
	ldi	r4, 25
	ldi	r3, 0
	cmp	r5, r3
	bne	__LBB11_57
# %bb.56:                               # %calculate_full_house.exit
	movens	r3, r4
__LBB11_57:                             # %calculate_full_house.exit
	cmp	r0, r3
	lsw	r1, -22                         # 2-byte Folded Reload
	bne	__LBB11_59
# %bb.58:                               # %calculate_full_house.exit
	movens	r3, r4
__LBB11_59:                             # %calculate_full_house.exit
	lsw	r0, -20                         # 2-byte Folded Reload
	cmp	r4, r0
	blt	__LBB11_61
# %bb.60:                               # %calculate_full_house.exit
	ldi	r3, 8
	ssw	r3, -24                         # 2-byte Folded Spill
__LBB11_61:                             # %calculate_full_house.exit
	cmp	r4, r0
	bgt	__LBB11_63
# %bb.62:                               # %calculate_full_house.exit
	movens	r0, r4
__LBB11_63:                             # %calculate_full_house.exit
	movens	r4, r3
	ldi	r4, 0
__LBB11_64:                             # %if.end31
	ldi	r0, 18
	ldw	r1, r0, r0
	cmp	r0, r4
	bne	__LBB11_89
	br	__LBB11_65
__LBB11_65:                             # %if.then34
	ssw	r3, -20                         # 2-byte Folded Spill
	ldi	r0, -18
	add	r0, fp, r3
	ldi	r5, 10
	stw	r3, r5, r4
	ldi	r0, 8
	stw	r3, r0, r4
	ldi	r0, 6
	stw	r3, r0, r4
	ldi	r0, 4
	stw	r3, r0, r4
	ldi	r0, 2
	stw	r3, r0, r4
	ssw	r4, -18
	ldi	r3, 5
__LBB11_66:                             # %while.body.i.i116
                                        # =>This Inner Loop Header: Depth=1
	ldw	r2, r4, r6
	sub	r6, 1
	cmp	r6, r3
	bhi	__LBB11_68
	br	__LBB11_67
__LBB11_67:                             # %if.then.i.i126
                                        #   in Loop: Header=BB11_66 Depth=1
	shl	r6, r6, 1
	ldi	r0, -18
	add	r0, fp, r1
	ldw	r1, r6, r0
	add	r0, 1
	stw	r1, r6, r0
__LBB11_68:                             # %while.end.i.i119
                                        #   in Loop: Header=BB11_66 Depth=1
	add	r4, 2
	cmp	r4, r5
	bne	__LBB11_66
	br	__LBB11_69
__LBB11_69:                             # %count_values.exit.i
	ldi	r0, -18
	add	r0, fp, r0
	ldi	r1, 8
	ldw	r0, r1, r4
	ldi	r1, 6
	ldw	r0, r1, r1
	ssw	r1, -30                         # 2-byte Folded Spill
	ldi	r1, 4
	ldw	r0, r1, r1
	ssw	r1, -28                         # 2-byte Folded Spill
	ldi	r1, 2
	ldw	r0, r1, r0
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r1, 0
	lsw	r0, -18
	cmp	r0, r1
	beq	__LBB11_74
	br	__LBB11_70
__LBB11_70:                             # %count_values.exit.i
	ldi	r3, 0
	lsw	r0, -26                         # 2-byte Folded Reload
	cmp	r0, r3
	beq	__LBB11_74
	br	__LBB11_71
__LBB11_71:                             # %count_values.exit.i
	lsw	r0, -28                         # 2-byte Folded Reload
	cmp	r0, r3
	beq	__LBB11_74
	br	__LBB11_72
__LBB11_72:                             # %count_values.exit.i
	lsw	r0, -30                         # 2-byte Folded Reload
	cmp	r0, r3
	beq	__LBB11_74
	br	__LBB11_73
__LBB11_73:                             # %count_values.exit.i
	ldi	r6, 40
	cmp	r4, r3
	bne	__LBB11_84
	br	__LBB11_74
__LBB11_74:                             # %if.end.i
	ldi	r0, -18
	add	r0, fp, r0
	ldw	r0, r5, r0
	ldi	r6, 40
	cmp	r0, r1
	bne	__LBB11_76
# %bb.75:                               # %if.end.i
	movens	r1, r6
__LBB11_76:                             # %if.end.i
	cmp	r4, r1
	bne	__LBB11_78
# %bb.77:                               # %if.end.i
	movens	r1, r6
__LBB11_78:                             # %if.end.i
	lsw	r0, -30                         # 2-byte Folded Reload
	cmp	r0, r1
	bne	__LBB11_80
# %bb.79:                               # %if.end.i
	movens	r1, r6
__LBB11_80:                             # %if.end.i
	lsw	r0, -28                         # 2-byte Folded Reload
	cmp	r0, r1
	bne	__LBB11_82
# %bb.81:                               # %if.end.i
	movens	r1, r6
__LBB11_82:                             # %if.end.i
	lsw	r0, -26                         # 2-byte Folded Reload
	cmp	r0, r1
	bne	__LBB11_84
# %bb.83:                               # %if.end.i
	movens	r1, r6
__LBB11_84:                             # %calculate_straight.exit
	lsw	r3, -20                         # 2-byte Folded Reload
	cmp	r6, r3
	blt	__LBB11_86
# %bb.85:                               # %calculate_straight.exit
	ldi	r0, 9
	ssw	r0, -24                         # 2-byte Folded Spill
__LBB11_86:                             # %calculate_straight.exit
	cmp	r6, r3
	lsw	r1, -22                         # 2-byte Folded Reload
	ldi	r4, 0
	bgt	__LBB11_88
# %bb.87:                               # %calculate_straight.exit
	movens	r3, r6
__LBB11_88:                             # %calculate_straight.exit
	movens	r6, r3
__LBB11_89:                             # %if.end40
	ldi	r0, 20
	ldw	r1, r0, r0
	cmp	r0, r4
	bne	__LBB11_95
	br	__LBB11_90
__LBB11_90:                             # %if.then43
	movens	r3, r6
	ldw	r2, r0
	add	r2, 2
	ldi	r1, 50
	ldi	r3, 8
	br	__LBB11_92
__LBB11_92:                             # %while.body.i129
                                        # =>This Inner Loop Header: Depth=1
	ldw	r2, r4, r5
	cmp	r5, r0
	ldi	r5, 0
	beq	__LBB11_91
	br	__LBB11_93
__LBB11_91:                             # %while.cond.i132
                                        #   in Loop: Header=BB11_92 Depth=1
	add	r4, 2
	cmp	r4, r3
	movens	r1, r5
	beq	__LBB11_93
	br	__LBB11_92
__LBB11_93:                             # %calculate_yahtzee.exit
	cmp	r5, r6
	blt	__LBB11_95
# %bb.94:                               # %calculate_yahtzee.exit
	ldi	r0, 10
	ssw	r0, -24                         # 2-byte Folded Spill
__LBB11_95:                             # %if.end49
	lsw	r0, -24                         # 2-byte Folded Reload
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	30
	pop	fp
	rts
                                        # -- End function
fix_for_multiple>                       # -- Begin function fix_for_multiple
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-20
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r1, -20                         # 2-byte Folded Spill
	ldi	r1, -18
	add	r1, fp, r3
	ldi	r5, 10
	ldi	r1, 0
	stw	r3, r5, r1
	ldi	r4, 8
	stw	r3, r4, r1
	ldi	r4, 6
	stw	r3, r4, r1
	ldi	r4, 4
	stw	r3, r4, r1
	ldi	r4, 2
	stw	r3, r4, r1
	ssw	r1, -18
	ldi	r4, 5
__LBB12_1:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r3
	sub	r3, 1
	cmp	r3, r4
	bhi	__LBB12_3
	br	__LBB12_2
__LBB12_2:                              # %if.then.i
                                        #   in Loop: Header=BB12_1 Depth=1
	shl	r3, r3, 1
	ldi	r5, -18
	add	r5, fp, r6
	ldw	r6, r3, r5
	add	r5, 1
	stw	r6, r3, r5
	ldi	r5, 10
__LBB12_3:                              # %while.end.i
                                        #   in Loop: Header=BB12_1 Depth=1
	add	r1, 2
	cmp	r1, r5
	bne	__LBB12_1
	br	__LBB12_4
__LBB12_4:                              # %while.body.i6.preheader
	ldi	r1, 0
	ldi	r4, 12
	movens	r1, r6
	ldi	r5, -18
__LBB12_5:                              # %while.body.i6
                                        # =>This Inner Loop Header: Depth=1
	add	r5, fp, r3
	ldw	r3, r1, r3
	cmp	r3, r6
	bgt	__LBB12_7
# %bb.6:                                # %while.body.i6
                                        #   in Loop: Header=BB12_5 Depth=1
	movens	r6, r3
__LBB12_7:                              # %while.body.i6
                                        #   in Loop: Header=BB12_5 Depth=1
	add	r1, 2
	cmp	r1, r4
	movens	r3, r6
	bne	__LBB12_5
	br	__LBB12_8
__LBB12_8:                              # %while.end.i10
	ldi	r4, -1
	ldi	r6, 0
	cmp	r3, r6
	beq	__LBB12_16
	br	__LBB12_9
__LBB12_9:                              # %while.body8.i.preheader
	add	r2, 10
	ldi	r1, -18
	add	r1, fp, r1
	add	r1, 10
	ldi	r4, 6
__LBB12_10:                             # %while.body8.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r1, r5
	cmp	r5, r3
	bne	__LBB12_12
	br	__LBB12_11
__LBB12_11:                             # %land.lhs.true.i
                                        #   in Loop: Header=BB12_10 Depth=1
	ldw	r2, r5
	cmp	r5, r6
	beq	__LBB12_16
	br	__LBB12_12
__LBB12_12:                             # %if.end14.i
                                        #   in Loop: Header=BB12_10 Depth=1
	sub	r1, 2
	sub	r2, 2
	sub	r4, 1
	cmp	r4, r6
	bne	__LBB12_10
	br	__LBB12_13
__LBB12_13:                             # %while.body18.i.preheader
	ldi	r1, 6
	ldi	r2, -18
	add	r2, fp, r2
	add	r2, 10
__LBB12_14:                             # %while.body18.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r2, r4
	cmp	r4, r3
	movens	r1, r4
	beq	__LBB12_16
	br	__LBB12_15
__LBB12_15:                             # %if.end23.i
                                        #   in Loop: Header=BB12_14 Depth=1
	sub	r2, 2
	sub	r1, 1
	cmp	r1, r6
	ldi	r4, -1
	bne	__LBB12_14
	br	__LBB12_16
__LBB12_16:                             # %find_best_value_to_fix.exit
	cmp	r4, r6
	lsw	r3, -20                         # 2-byte Folded Reload
	ldi	r5, 10
	bgt	__LBB12_21
	br	__LBB12_17
__LBB12_17:                             # %while.body.i11.preheader
	ldi	r1, 0
	movens	r1, r2
__LBB12_18:                             # %while.body.i11
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r4
	cmp	r4, r2
	bgt	__LBB12_20
# %bb.19:                               # %while.body.i11
                                        #   in Loop: Header=BB12_18 Depth=1
	movens	r2, r4
__LBB12_20:                             # %while.body.i11
                                        #   in Loop: Header=BB12_18 Depth=1
	add	r1, 2
	cmp	r1, r5
	movens	r4, r2
	bne	__LBB12_18
	br	__LBB12_21
__LBB12_21:                             # %if.end
	movens	r6, r1
__LBB12_22:                             # %while.body.i17
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r2
	cmp	r2, r4
	beq	__LBB12_24
# %bb.23:                               # %while.body.i17
                                        #   in Loop: Header=BB12_22 Depth=1
	movens	r6, r2
__LBB12_24:                             # %while.body.i17
                                        #   in Loop: Header=BB12_22 Depth=1
	stw	r3, r1, r2
	add	r1, 2
	cmp	r1, r5
	bne	__LBB12_22
	br	__LBB12_25
__LBB12_25:                             # %keep_only_value.exit
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	20
	pop	fp
	rts
                                        # -- End function
fix_for_yahtzee>                        # -- Begin function fix_for_yahtzee
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	jsr	fix_for_multiple
	addsp	0
	pop	fp
	rts
                                        # -- End function
fix_for_four_of_a_kind>                 # -- Begin function fix_for_four_of_a_kind
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	jsr	fix_for_multiple
	addsp	0
	pop	fp
	rts
                                        # -- End function
fix_for_three_of_a_kind>                # -- Begin function fix_for_three_of_a_kind
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	0
	jsr	fix_for_multiple
	addsp	0
	pop	fp
	rts
                                        # -- End function
fix_for_full_house>                     # -- Begin function fix_for_full_house
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-26
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r1, -26                         # 2-byte Folded Spill
	ldi	r1, -18
	add	r1, fp, r3
	ldi	r6, 10
	ldi	r2, 0
	stw	r3, r6, r2
	ldi	r4, 8
	stw	r3, r4, r2
	ldi	r4, 6
	stw	r3, r4, r2
	ldi	r4, 4
	stw	r3, r4, r2
	ldi	r4, 2
	stw	r3, r4, r2
	ssw	r2, -18
	ldi	r3, 5
__LBB16_1:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r2, r5
	sub	r5, 1
	cmp	r5, r3
	bhi	__LBB16_3
	br	__LBB16_2
__LBB16_2:                              # %if.then.i
                                        #   in Loop: Header=BB16_1 Depth=1
	shl	r5, r4, 1
	add	r1, fp, r5
	ldw	r5, r4, r6
	add	r6, 1
	stw	r5, r4, r6
	ldi	r6, 10
__LBB16_3:                              # %while.end.i
                                        #   in Loop: Header=BB16_1 Depth=1
	add	r2, 2
	cmp	r2, r6
	bne	__LBB16_1
	br	__LBB16_4
__LBB16_4:                              # %while.body.preheader
	ldi	r5, 0
	ldi	r3, 1
	add	r1, fp, r1
	ldi	r6, 7
	ssw	r5, -22                         # 2-byte Folded Spill
	ssw	r5, -20                         # 2-byte Folded Spill
	ssw	r5, -24                         # 2-byte Folded Spill
__LBB16_5:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	ldw	r1, r4
	ldi	r2, 2
	cmp	r4, r2
	beq	__LBB16_8
	br	__LBB16_6
__LBB16_6:                              # %while.body
                                        #   in Loop: Header=BB16_5 Depth=1
	ldi	r2, 3
	cmp	r4, r2
	bne	__LBB16_9
	br	__LBB16_7
__LBB16_7:                              # %if.then
                                        #   in Loop: Header=BB16_5 Depth=1
	ldi	r2, 1
	ssw	r2, -20                         # 2-byte Folded Spill
	movens	r3, r5
	br	__LBB16_9
__LBB16_8:                              # %if.then4
                                        #   in Loop: Header=BB16_5 Depth=1
	ssw	r3, -24                         # 2-byte Folded Spill
	ldi	r2, 1
	ssw	r2, -22                         # 2-byte Folded Spill
__LBB16_9:                              # %if.end6
                                        #   in Loop: Header=BB16_5 Depth=1
	add	r1, 2
	add	r3, 1
	cmp	r3, r6
	bne	__LBB16_5
	br	__LBB16_10
__LBB16_10:                             # %while.end
	ldi	r1, 0
	lsw	r4, -20                         # 2-byte Folded Reload
	cmp	r4, r1
	beq	__LBB16_14
	br	__LBB16_11
__LBB16_11:                             # %while.end
	ldi	r3, 0
	lsw	r2, -22                         # 2-byte Folded Reload
	cmp	r2, r3
	beq	__LBB16_14
	br	__LBB16_12
__LBB16_12:                             # %while.body11.preheader
	lsw	r2, -26                         # 2-byte Folded Reload
	ldi	r4, 10
__LBB16_13:                             # %while.body11
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r3, r1
	stw	r2, r3, r1
	add	r3, 2
	cmp	r3, r4
	beq	__LBB16_32
	br	__LBB16_13
__LBB16_14:                             # %if.else16
	cmp	r4, r1
	lsw	r4, -26                         # 2-byte Folded Reload
	ldi	r6, 10
	beq	__LBB16_19
	br	__LBB16_15
__LBB16_15:                             # %while.body.i45.preheader
	movens	r1, r2
__LBB16_16:                             # %while.body.i45
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r2, r3
	cmp	r3, r5
	beq	__LBB16_18
# %bb.17:                               # %while.body.i45
                                        #   in Loop: Header=BB16_16 Depth=1
	movens	r1, r3
__LBB16_18:                             # %while.body.i45
                                        #   in Loop: Header=BB16_16 Depth=1
	stw	r4, r2, r3
	add	r2, 2
	cmp	r2, r6
	beq	__LBB16_32
	br	__LBB16_16
__LBB16_19:                             # %if.else19
	lsw	r2, -22                         # 2-byte Folded Reload
	cmp	r2, r1
	bne	__LBB16_21
	br	__LBB16_20
__LBB16_21:                             # %while.body.i51.preheader
	movens	r1, r2
	lsw	r5, -24                         # 2-byte Folded Reload
__LBB16_22:                             # %while.body.i51
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r2, r3
	cmp	r3, r5
	beq	__LBB16_24
# %bb.23:                               # %while.body.i51
                                        #   in Loop: Header=BB16_22 Depth=1
	movens	r1, r3
__LBB16_24:                             # %while.body.i51
                                        #   in Loop: Header=BB16_22 Depth=1
	stw	r4, r2, r3
	add	r2, 2
	cmp	r2, r6
	beq	__LBB16_32
	br	__LBB16_22
__LBB16_20:                             # %while.body.i64.preheader
	movens	r1, r3
	br	__LBB16_25
__LBB16_25:                             # %while.body.i64
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r2
	cmp	r2, r3
	bgt	__LBB16_27
# %bb.26:                               # %while.body.i64
                                        #   in Loop: Header=BB16_25 Depth=1
	movens	r3, r2
__LBB16_27:                             # %while.body.i64
                                        #   in Loop: Header=BB16_25 Depth=1
	add	r1, 2
	cmp	r1, r6
	movens	r2, r3
	bne	__LBB16_25
	br	__LBB16_28
__LBB16_28:                             # %while.body.i69.preheader
	ldi	r1, 0
	movens	r1, r3
__LBB16_29:                             # %while.body.i69
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r3, r4
	cmp	r4, r2
	beq	__LBB16_31
# %bb.30:                               # %while.body.i69
                                        #   in Loop: Header=BB16_29 Depth=1
	movens	r1, r4
__LBB16_31:                             # %while.body.i69
                                        #   in Loop: Header=BB16_29 Depth=1
	lsw	r5, -26                         # 2-byte Folded Reload
	stw	r5, r3, r4
	add	r3, 2
	cmp	r3, r6
	bne	__LBB16_29
	br	__LBB16_32
__LBB16_32:                             # %if.end25
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	26
	pop	fp
	rts
                                        # -- End function
fix_num>                                # -- Begin function fix_num
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-20
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r1, -20                         # 2-byte Folded Spill
	ldi	r1, -18
	add	r1, fp, r3
	ldi	r5, 10
	ldi	r1, 0
	stw	r3, r5, r1
	ldi	r4, 8
	stw	r3, r4, r1
	ldi	r4, 6
	stw	r3, r4, r1
	ldi	r4, 4
	stw	r3, r4, r1
	ldi	r4, 2
	stw	r3, r4, r1
	ssw	r1, -18
	ldi	r4, 5
__LBB17_1:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r3
	sub	r3, 1
	cmp	r3, r4
	bhi	__LBB17_3
	br	__LBB17_2
__LBB17_2:                              # %if.then.i
                                        #   in Loop: Header=BB17_1 Depth=1
	shl	r3, r3, 1
	ldi	r5, -18
	add	r5, fp, r6
	ldw	r6, r3, r5
	add	r5, 1
	stw	r6, r3, r5
	ldi	r5, 10
__LBB17_3:                              # %while.end.i
                                        #   in Loop: Header=BB17_1 Depth=1
	add	r1, 2
	cmp	r1, r5
	bne	__LBB17_1
	br	__LBB17_4
__LBB17_4:                              # %while.body.i6.preheader
	ldi	r1, 0
	ldi	r4, 12
	movens	r1, r6
	ldi	r5, -18
__LBB17_5:                              # %while.body.i6
                                        # =>This Inner Loop Header: Depth=1
	add	r5, fp, r3
	ldw	r3, r1, r3
	cmp	r3, r6
	bgt	__LBB17_7
# %bb.6:                                # %while.body.i6
                                        #   in Loop: Header=BB17_5 Depth=1
	movens	r6, r3
__LBB17_7:                              # %while.body.i6
                                        #   in Loop: Header=BB17_5 Depth=1
	add	r1, 2
	cmp	r1, r4
	movens	r3, r6
	bne	__LBB17_5
	br	__LBB17_8
__LBB17_8:                              # %while.end.i10
	ldi	r4, -1
	ldi	r6, 0
	cmp	r3, r6
	beq	__LBB17_16
	br	__LBB17_9
__LBB17_9:                              # %while.body8.i.preheader
	add	r2, 10
	ldi	r1, -18
	add	r1, fp, r1
	add	r1, 10
	ldi	r4, 6
__LBB17_10:                             # %while.body8.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r1, r5
	cmp	r5, r3
	bne	__LBB17_12
	br	__LBB17_11
__LBB17_11:                             # %land.lhs.true.i
                                        #   in Loop: Header=BB17_10 Depth=1
	ldw	r2, r5
	cmp	r5, r6
	beq	__LBB17_16
	br	__LBB17_12
__LBB17_12:                             # %if.end14.i
                                        #   in Loop: Header=BB17_10 Depth=1
	sub	r1, 2
	sub	r2, 2
	sub	r4, 1
	cmp	r4, r6
	bne	__LBB17_10
	br	__LBB17_13
__LBB17_13:                             # %while.body18.i.preheader
	ldi	r1, 6
	ldi	r2, -18
	add	r2, fp, r2
	add	r2, 10
__LBB17_14:                             # %while.body18.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r2, r4
	cmp	r4, r3
	movens	r1, r4
	beq	__LBB17_16
	br	__LBB17_15
__LBB17_15:                             # %if.end23.i
                                        #   in Loop: Header=BB17_14 Depth=1
	sub	r2, 2
	sub	r1, 1
	cmp	r1, r6
	ldi	r4, -1
	bne	__LBB17_14
	br	__LBB17_16
__LBB17_16:                             # %find_best_value_to_fix.exit
	cmp	r4, r6
	lsw	r3, -20                         # 2-byte Folded Reload
	ldi	r5, 10
	bgt	__LBB17_21
	br	__LBB17_17
__LBB17_17:                             # %while.body.i11.preheader
	ldi	r1, 0
	movens	r1, r2
__LBB17_18:                             # %while.body.i11
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r4
	cmp	r4, r2
	bgt	__LBB17_20
# %bb.19:                               # %while.body.i11
                                        #   in Loop: Header=BB17_18 Depth=1
	movens	r2, r4
__LBB17_20:                             # %while.body.i11
                                        #   in Loop: Header=BB17_18 Depth=1
	add	r1, 2
	cmp	r1, r5
	movens	r4, r2
	bne	__LBB17_18
	br	__LBB17_21
__LBB17_21:                             # %if.end
	movens	r6, r1
__LBB17_22:                             # %while.body.i17
                                        # =>This Inner Loop Header: Depth=1
	ldw	r0, r1, r2
	cmp	r2, r4
	beq	__LBB17_24
# %bb.23:                               # %while.body.i17
                                        #   in Loop: Header=BB17_22 Depth=1
	movens	r6, r2
__LBB17_24:                             # %while.body.i17
                                        #   in Loop: Header=BB17_22 Depth=1
	stw	r3, r1, r2
	add	r1, 2
	cmp	r1, r5
	bne	__LBB17_22
	br	__LBB17_25
__LBB17_25:                             # %keep_only_value.exit
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	20
	pop	fp
	rts
                                        # -- End function
decision>                               # -- Begin function decision
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-26
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r0, -26                         # 2-byte Folded Spill
	ldi	r0, global_pattern+20
	ldw	r0, r0
	ldi	r1, 0
	ssw	r0, -22                         # 2-byte Folded Spill
	cmp	r0, r1
	bne	__LBB18_6
	br	__LBB18_1
__LBB18_1:                              # %land.lhs.true
	ldi	r2, 2
	ldi	r1, global_cubes
	ldw	r1, r0
	ldi	r3, 8
__LBB18_2:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r2, r1, r4
	cmp	r4, r0
	bne	__LBB18_4
	br	__LBB18_3
__LBB18_3:                              # %while.body.i
                                        #   in Loop: Header=BB18_2 Depth=1
	movens	r2, r5
	add	r5, 2
	cmp	r2, r3
	movens	r5, r2
	bne	__LBB18_2
	br	__LBB18_4
__LBB18_4:                              # %calculate_yahtzee.exit
	cmp	r4, r0
	ldi	r1, 0
	bne	__LBB18_6
	br	__LBB18_5
__LBB18_6:                              # %if.else
	ldi	r0, global_pattern+18
	ldw	r0, r0
	cmp	r0, r1
	bne	__LBB18_44
	br	__LBB18_7
__LBB18_44:                             # %if.else7
	ldi	r0, global_pattern+16
	ldw	r0, r0
	ldi	r2, 0
	cmp	r0, r2
	bne	__LBB18_58
	br	__LBB18_45
__LBB18_58:                             # %if.else13
	ldi	r0, global_pattern+14
	ldw	r0, r1
	lsw	r0, -22                         # 2-byte Folded Reload
	cmp	r0, r2
	beq	__LBB18_73
	br	__LBB18_59
__LBB18_59:                             # %if.else13
	cmp	r1, r2
	bne	__LBB18_73
	br	__LBB18_60
__LBB18_60:                             # %while.cond.i67.preheader
	ssw	r1, -24                         # 2-byte Folded Spill
	ldi	r6, 1
                                        # implicit-def: $r0
                                        # kill: killed $r0
	movens	r6, r3
__LBB18_61:                             # %while.cond.i67
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_63 Depth 2
	ldi	r0, 6
	cmp	r3, r0
	movens	r2, r0
	bhi	__LBB18_71
	br	__LBB18_62
__LBB18_62:                             # %while.body3.i.preheader
                                        #   in Loop: Header=BB18_61 Depth=1
	movens	r2, r4
	movens	r2, r0
	movens	r2, r1
__LBB18_63:                             # %while.body3.i
                                        #   Parent Loop BB18_61 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldi	r2, global_cubes
	ldw	r4, r2, r5
	cmp	r5, r3
	movens	r6, r2
	beq	__LBB18_65
# %bb.64:                               # %while.body3.i
                                        #   in Loop: Header=BB18_63 Depth=2
	ldi	r2, 0
__LBB18_65:                             # %while.body3.i
                                        #   in Loop: Header=BB18_63 Depth=2
	add r5, r0, r0
	add r1, r2, r1
	add	r4, 2
	ldi	r2, 10
	cmp	r4, r2
	bne	__LBB18_63
	br	__LBB18_66
__LBB18_66:                             # %while.end.i
                                        #   in Loop: Header=BB18_61 Depth=1
	ldi	r4, 4
	cmp	r1, r4
	blo	__LBB18_68
# %bb.67:                               # %while.end.i
                                        #   in Loop: Header=BB18_61 Depth=1
	ssw	r0, -20                         # 2-byte Folded Spill
__LBB18_68:                             # %while.end.i
                                        #   in Loop: Header=BB18_61 Depth=1
	cmp	r1, r4
	movens	r6, r0
	ldi	r2, 0
	blo	__LBB18_70
# %bb.69:                               # %while.end.i
                                        #   in Loop: Header=BB18_61 Depth=1
	movens	r2, r0
__LBB18_70:                             # %while.end.i
                                        #   in Loop: Header=BB18_61 Depth=1
	add r3, r0, r3
	cmp	r1, r4
	lsw	r0, -20                         # 2-byte Folded Reload
	blo	__LBB18_61
	br	__LBB18_71
__LBB18_71:                             # %calculate_four_of_a_kind.exit
	cmp	r0, r2
	lsw	r1, -24                         # 2-byte Folded Reload
	beq	__LBB18_73
	br	__LBB18_72
__LBB18_72:                             # %if.then20
	ldi	r0, global_cubes
	ldi	r1, global_fixed
	ldi	r2, global_pattern
	jsr	fix_for_multiple
	ldi	r0, global_end
	ldi	r1, 1
	stw	r0, r1
	br	__LBB18_90
__LBB18_73:                             # %if.else21
	ldi	r3, 0
	lsw	r0, -22                         # 2-byte Folded Reload
	cmp	r0, r3
	beq	__LBB18_89
	br	__LBB18_74
__LBB18_74:                             # %if.else21
	cmp	r1, r3
	beq	__LBB18_89
	br	__LBB18_75
__LBB18_75:                             # %if.else21
	ldi	r0, global_pattern+12
	ldw	r0, r0
	cmp	r0, r3
	bne	__LBB18_89
	br	__LBB18_76
__LBB18_76:                             # %while.cond.i74.preheader
	ldi	r6, 1
                                        # implicit-def: $r0
                                        # kill: killed $r0
__LBB18_77:                             # %while.cond.i74
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_79 Depth 2
	ldi	r0, 6
	cmp	r6, r0
	movens	r3, r1
	bhi	__LBB18_87
	br	__LBB18_78
__LBB18_78:                             # %while.body3.i79.preheader
                                        #   in Loop: Header=BB18_77 Depth=1
	movens	r3, r2
	movens	r3, r5
	movens	r3, r4
	movens	r3, r1
__LBB18_79:                             # %while.body3.i79
                                        #   Parent Loop BB18_77 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldi	r0, global_cubes
	ldw	r2, r0, r3
	cmp	r3, r6
	ldi	r0, 1
	beq	__LBB18_81
# %bb.80:                               # %while.body3.i79
                                        #   in Loop: Header=BB18_79 Depth=2
	movens	r4, r0
__LBB18_81:                             # %while.body3.i79
                                        #   in Loop: Header=BB18_79 Depth=2
	add r3, r5, r5
	add r1, r0, r1
	add	r2, 2
	ldi	r0, 10
	cmp	r2, r0
	bne	__LBB18_79
	br	__LBB18_82
__LBB18_82:                             # %while.end.i90
                                        #   in Loop: Header=BB18_77 Depth=1
	ldi	r2, 3
	cmp	r1, r2
	blo	__LBB18_84
# %bb.83:                               # %while.end.i90
                                        #   in Loop: Header=BB18_77 Depth=1
	ssw	r5, -20                         # 2-byte Folded Spill
__LBB18_84:                             # %while.end.i90
                                        #   in Loop: Header=BB18_77 Depth=1
	cmp	r1, r2
	ldi	r0, 1
	movens	r4, r3
	blo	__LBB18_86
# %bb.85:                               # %while.end.i90
                                        #   in Loop: Header=BB18_77 Depth=1
	movens	r3, r0
__LBB18_86:                             # %while.end.i90
                                        #   in Loop: Header=BB18_77 Depth=1
	add r6, r0, r6
	cmp	r1, r2
	lsw	r1, -20                         # 2-byte Folded Reload
	blo	__LBB18_77
	br	__LBB18_87
__LBB18_87:                             # %calculate_three_of_a_kind.exit
	cmp	r1, r3
	beq	__LBB18_89
	br	__LBB18_88
__LBB18_88:                             # %if.then30
	ldi	r0, global_cubes
	ldi	r1, global_fixed
	ldi	r2, global_pattern
	jsr	fix_for_multiple
	ldi	r0, global_end
	ldi	r1, 1
	stw	r0, r1
	br	__LBB18_90
__LBB18_7:                              # %land.lhs.true3
	ldi	r0, -18
	add	r0, fp, r0
	ldi	r2, 10
	ldi	r3, 0
	stw	r0, r2, r3
	ldi	r1, 8
	stw	r0, r1, r3
	ldi	r1, 6
	stw	r0, r1, r3
	ldi	r1, 4
	stw	r0, r1, r3
	ldi	r1, 2
	stw	r0, r1, r3
	ssw	r3, -18
	ldi	r6, global_cubes
	ldi	r0, 5
__LBB18_8:                              # %while.body.i.i
                                        # =>This Inner Loop Header: Depth=1
	ldw	r3, r6, r1
	sub	r1, 1
	cmp	r1, r0
	bhi	__LBB18_10
	br	__LBB18_9
__LBB18_9:                              # %if.then.i.i
                                        #   in Loop: Header=BB18_8 Depth=1
	shl	r1, r1, 1
	ldi	r4, -18
	add	r4, fp, r4
	ldw	r4, r1, r5
	add	r5, 1
	stw	r4, r1, r5
__LBB18_10:                             # %while.end.i.i
                                        #   in Loop: Header=BB18_8 Depth=1
	add	r3, 2
	cmp	r3, r2
	bne	__LBB18_8
	br	__LBB18_11
__LBB18_11:                             # %count_values.exit.i
	ldi	r0, -18
	add	r0, fp, r0
	ldi	r1, 8
	ldw	r0, r1, r1
	ssw	r1, -24                         # 2-byte Folded Spill
	ldi	r1, 6
	ldw	r0, r1, r1
	ssw	r1, -20                         # 2-byte Folded Spill
	ldi	r1, 4
	ldw	r0, r1, r1
	ldi	r3, 2
	ldw	r0, r3, r5
	ldi	r4, 0
	lsw	r3, -18
	cmp	r3, r4
	beq	__LBB18_16
	br	__LBB18_12
__LBB18_12:                             # %count_values.exit.i
	ldi	r3, 0
	cmp	r5, r3
	beq	__LBB18_16
	br	__LBB18_13
__LBB18_13:                             # %count_values.exit.i
	cmp	r1, r3
	beq	__LBB18_16
	br	__LBB18_14
__LBB18_14:                             # %count_values.exit.i
	movens	r1, r0
	lsw	r1, -20                         # 2-byte Folded Reload
	cmp	r1, r3
	movens	r0, r1
	beq	__LBB18_16
	br	__LBB18_15
__LBB18_15:                             # %count_values.exit.i
	lsw	r0, -24                         # 2-byte Folded Reload
	cmp	r0, r3
	bne	__LBB18_22
	br	__LBB18_16
__LBB18_22:                             # %while.body.i42.preheader.critedge
	br	__LBB18_21
__LBB18_45:                             # %land.lhs.true9
	ldi	r0, -18
	add	r0, fp, r0
	ldi	r1, 10
	ldi	r3, 0
	stw	r0, r1, r3
	ldi	r2, 8
	stw	r0, r2, r3
	ldi	r2, 6
	stw	r0, r2, r3
	ldi	r2, 4
	stw	r0, r2, r3
	ldi	r2, 2
	stw	r0, r2, r3
	ssw	r3, -18
	ldi	r0, global_cubes
	ldi	r4, 5
__LBB18_46:                             # %while.body.i.i48
                                        # =>This Inner Loop Header: Depth=1
	ldw	r3, r0, r2
	sub	r2, 1
	cmp	r2, r4
	bhi	__LBB18_48
	br	__LBB18_47
__LBB18_47:                             # %if.then.i.i64
                                        #   in Loop: Header=BB18_46 Depth=1
	shl	r2, r2, 1
	ldi	r5, -18
	add	r5, fp, r5
	ldw	r5, r2, r6
	add	r6, 1
	stw	r5, r2, r6
__LBB18_48:                             # %while.end.i.i51
                                        #   in Loop: Header=BB18_46 Depth=1
	add	r3, 2
	cmp	r3, r1
	bne	__LBB18_46
	br	__LBB18_49
__LBB18_49:                             # %while.body.i54.preheader
	ldi	r1, 0
	ldi	r4, 1
	ldi	r5, 12
	movens	r1, r0
	movens	r1, r6
__LBB18_50:                             # %while.body.i54
                                        # =>This Inner Loop Header: Depth=1
	ldi	r2, -18
	add	r2, fp, r2
	ldw	r2, r1, r2
	ldi	r3, 2
	cmp	r2, r3
	movens	r4, r3
	beq	__LBB18_52
# %bb.51:                               # %while.body.i54
                                        #   in Loop: Header=BB18_50 Depth=1
	movens	r0, r3
__LBB18_52:                             # %while.body.i54
                                        #   in Loop: Header=BB18_50 Depth=1
	ldi	r0, 3
	cmp	r2, r0
	movens	r4, r2
	beq	__LBB18_54
# %bb.53:                               # %while.body.i54
                                        #   in Loop: Header=BB18_50 Depth=1
	movens	r6, r2
__LBB18_54:                             # %while.body.i54
                                        #   in Loop: Header=BB18_50 Depth=1
	add	r1, 2
	cmp	r1, r5
	movens	r3, r0
	movens	r2, r6
	bne	__LBB18_50
	br	__LBB18_55
__LBB18_55:                             # %calculate_full_house.exit
	ldi	r0, 0
	cmp	r2, r0
	ldi	r2, 0
	beq	__LBB18_58
	br	__LBB18_56
__LBB18_56:                             # %calculate_full_house.exit
	cmp	r3, r0
	beq	__LBB18_58
	br	__LBB18_57
__LBB18_57:                             # %if.then12
	ldi	r0, global_cubes
	ldi	r1, global_fixed
	jsr	fix_for_full_house
	ldi	r0, global_end
	ldi	r1, 1
	stw	r0, r1
	br	__LBB18_90
__LBB18_5:                              # %if.then
	ldi	r0, global_cubes
	ldi	r1, global_fixed
	ldi	r2, global_pattern
	jsr	fix_for_multiple
	ldi	r0, global_end
	ldi	r1, 1
	stw	r0, r1
	br	__LBB18_90
__LBB18_16:                             # %if.end.i
	ldi	r3, -18
	add	r3, fp, r3
	cmp	r5, r4
	beq	__LBB18_44
	br	__LBB18_17
__LBB18_17:                             # %if.end.i
	cmp	r1, r4
	beq	__LBB18_44
	br	__LBB18_18
__LBB18_18:                             # %if.end.i
	lsw	r0, -20                         # 2-byte Folded Reload
	cmp	r0, r4
	beq	__LBB18_44
	br	__LBB18_19
__LBB18_19:                             # %if.end.i
	lsw	r0, -24                         # 2-byte Folded Reload
	cmp	r0, r4
	beq	__LBB18_44
	br	__LBB18_20
__LBB18_20:                             # %if.end.i
	ldw	r3, r2, r0
	cmp	r0, r4
	beq	__LBB18_44
	br	__LBB18_21
__LBB18_21:                             # %while.body.i42.preheader
	movens	r4, r0
	movens	r4, r5
	br	__LBB18_24
__LBB18_24:                             # %while.body.i42
                                        # =>This Inner Loop Header: Depth=1
	ldw	r4, r6, r1
	ldi	r3, 6
	cmp	r1, r3
	ldi	r3, 1
	beq	__LBB18_26
# %bb.25:                               # %while.body.i42
                                        #   in Loop: Header=BB18_24 Depth=1
	movens	r0, r3
__LBB18_26:                             # %while.body.i42
                                        #   in Loop: Header=BB18_24 Depth=1
	ldi	r0, 1
	cmp	r1, r0
	ssw	r0, -20                         # 2-byte Folded Spill
	beq	__LBB18_28
# %bb.27:                               # %while.body.i42
                                        #   in Loop: Header=BB18_24 Depth=1
	ssw	r5, -20                         # 2-byte Folded Spill
__LBB18_28:                             # %while.body.i42
                                        #   in Loop: Header=BB18_24 Depth=1
	add	r4, 2
	cmp	r4, r2
	movens	r3, r0
	lsw	r5, -20                         # 2-byte Folded Reload
	beq	__LBB18_23
	br	__LBB18_24
__LBB18_23:                             # %while.cond6.preheader.i
	ldi	r0, 0
	ldi	r5, global_fixed
	ssw	r0, -22                         # 2-byte Folded Spill
	movens	r0, r4
	br	__LBB18_29
__LBB18_29:                             # %while.body8.i
                                        # =>This Inner Loop Header: Depth=1
	cmp	r3, r0
	beq	__LBB18_31
	br	__LBB18_30
__LBB18_30:                             # %land.lhs.true.i
                                        #   in Loop: Header=BB18_29 Depth=1
	ldw	r6, r0
	ssw	r3, -24                         # 2-byte Folded Spill
	ldi	r1, 6
	cmp	r0, r1
	lsw	r3, -24                         # 2-byte Folded Reload
	beq	__LBB18_33
	br	__LBB18_31
__LBB18_31:                             # %if.else.i
                                        #   in Loop: Header=BB18_29 Depth=1
	ldi	r0, 0
	lsw	r1, -20                         # 2-byte Folded Reload
	cmp	r1, r0
	beq	__LBB18_34
	br	__LBB18_32
__LBB18_32:                             # %land.lhs.true15.i
                                        #   in Loop: Header=BB18_29 Depth=1
	ldw	r6, r0
	ldi	r1, 1
	cmp	r0, r1
	bne	__LBB18_34
	br	__LBB18_33
__LBB18_33:                             # %if.end21.i.sink.split
                                        #   in Loop: Header=BB18_29 Depth=1
	stw	r5, r1
	ldi	r0, 1
	ssw	r0, -22                         # 2-byte Folded Spill
__LBB18_34:                             # %if.end21.i
                                        #   in Loop: Header=BB18_29 Depth=1
	ldi	r0, 3
	cmp	r4, r0
	ldi	r0, 0
	bhi	__LBB18_36
	br	__LBB18_35
__LBB18_35:                             # %if.end21.i
                                        #   in Loop: Header=BB18_29 Depth=1
	add	r6, 2
	add	r5, 2
	add	r4, 1
	lsw	r1, -22                         # 2-byte Folded Reload
	cmp	r1, r0
	beq	__LBB18_29
	br	__LBB18_36
__LBB18_36:                             # %while.cond27.preheader.i.preheader
	ldi	r1, global_cubes
	ldi	r3, global_fixed
	ldi	r5, 2
__LBB18_37:                             # %while.cond27.preheader.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_38 Depth 2
	movens	r0, r6
__LBB18_38:                             # %while.body29.i
                                        #   Parent Loop BB18_37 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	ldw	r6, r1, r4
	cmp	r4, r5
	bne	__LBB18_41
	br	__LBB18_39
__LBB18_39:                             # %land.lhs.true32.i
                                        #   in Loop: Header=BB18_38 Depth=2
	ldw	r6, r3, r4
	cmp	r4, r0
	bne	__LBB18_41
	br	__LBB18_40
__LBB18_41:                             # %if.end37.i
                                        #   in Loop: Header=BB18_38 Depth=2
	add	r6, 2
	cmp	r6, r2
	bne	__LBB18_38
	br	__LBB18_42
__LBB18_40:                             # %if.then35.i
                                        #   in Loop: Header=BB18_37 Depth=1
	stw	r6, r3, r5
	br	__LBB18_42
__LBB18_42:                             # %while.end39.i
                                        #   in Loop: Header=BB18_37 Depth=1
	add	r5, 1
	ldi	r4, 6
	cmp	r5, r4
	bne	__LBB18_37
	br	__LBB18_43
__LBB18_43:                             # %fix_for_straight.exit
	ldi	r0, global_end
	ldi	r1, 1
	stw	r0, r1
	br	__LBB18_90
__LBB18_89:                             # %if.else31
	ldi	r0, global_cubes
	ldi	r1, global_fixed
	ldi	r2, global_pattern
	jsr	fix_num
__LBB18_90:                             # %if.end35
	lsw	r0, -26                         # 2-byte Folded Reload
	ldi	r1, 2
	cmp	r0, r1
	bne	__LBB18_92
	br	__LBB18_91
__LBB18_91:                             # %if.then36
	ldi	r0, global_end
	ldi	r1, 1
	stw	r0, r1
__LBB18_92:                             # %if.end37
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	26
	pop	fp
	rts
                                        # -- End function
play>                                   # -- Begin function play
# %bb.0:                                # %entry
	push	fp
	ldsp	fp
	addsp	-8
	ssw	r4, -2                          # 2-byte Folded Spill
	ssw	r5, -4                          # 2-byte Folded Spill
	ssw	r6, -6                          # 2-byte Folded Spill
	ssw	r2, -8                          # 2-byte Folded Spill
	ldi	r3, 0
	ldi	r4, 1
	ldi	r2, global_pattern
	ldi	r6, 22
__LBB19_1:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	and r1, r4, r5
	stw	r3, r2, r5
	shr	r1, r1, 1
	add	r3, 2
	cmp	r3, r6
	bne	__LBB19_1
	br	__LBB19_2
__LBB19_2:                              # %while.body3.preheader
	ldi	r1, 0
	ldi	r3, 7
	ldi	r4, global_cubes
	ldi	r6, 10
__LBB19_3:                              # %while.body3
                                        # =>This Inner Loop Header: Depth=1
	and r0, r3, r5
	stw	r1, r4, r5
	shr	r0, r0, 3
	add	r1, 2
	cmp	r1, r6
	bne	__LBB19_3
	br	__LBB19_4
__LBB19_4:                              # %for.body.preheader
	ldi	r0, global_fixed+8
	ldi	r4, 0
	stw	r0, r4
	ldi	r0, global_fixed+6
	stw	r0, r4
	ldi	r0, global_fixed+4
	stw	r0, r4
	ldi	r0, global_fixed+2
	stw	r0, r4
	ldi	r0, global_fixed
	stw	r0, r4
	ldi	r5, global_end
	lsw	r0, -8                          # 2-byte Folded Reload
	stw	r5, r0
	movens	r4, r0
	jsr	decision
	ldw	r5, r0
	cmp	r0, r4
	beq	__LBB19_10
	br	__LBB19_5
__LBB19_5:                              # %if.then
	ldi	r0, global_cubes
	ldi	r1, global_pattern
	jsr	find_best_pattern2
	ldi	r1, -1
	cmp	r0, r1
	bne	__LBB19_9
	br	__LBB19_6
__LBB19_6:                              # %while.body16.preheader
	ldi	r2, global_pattern+20
__LBB19_7:                              # %while.body16
                                        # =>This Inner Loop Header: Depth=1
	ldw	r2, r0
	cmp	r0, r4
	movens	r6, r0
	beq	__LBB19_9
	br	__LBB19_8
__LBB19_8:                              # %if.end
                                        #   in Loop: Header=BB19_7 Depth=1
	sub	r2, 2
	sub	r6, 1
	cmp	r6, r1
	movens	r1, r0
	bne	__LBB19_7
	br	__LBB19_9
__LBB19_9:                              # %if.end21
	ldi	r1, 15
	and r0, r1, r0
	ldi	r1, -32768
	or r0, r1, r0
	br	__LBB19_21
__LBB19_10:                             # %if.else
	ldi	r2, global_fixed+4
	ldi	r3, global_fixed
	ldi	r5, global_fixed+2
	ldi	r0, global_fixed+6
	ldw	r0, r1
	ldi	r0, global_fixed+8
	ldw	r0, r0
	cmp	r0, r4
	ldi	r6, 1
	movens	r6, r0
	bne	__LBB19_12
# %bb.11:                               # %if.else
	movens	r4, r0
__LBB19_12:                             # %if.else
	ldw	r2, r2
	cmp	r1, r4
	movens	r6, r1
	bne	__LBB19_14
# %bb.13:                               # %if.else
	movens	r4, r1
__LBB19_14:                             # %if.else
	cmp	r2, r4
	movens	r6, r2
	bne	__LBB19_16
# %bb.15:                               # %if.else
	movens	r4, r2
__LBB19_16:                             # %if.else
	ldw	r3, r3
	cmp	r3, r4
	movens	r6, r3
	bne	__LBB19_18
# %bb.17:                               # %if.else
	movens	r4, r3
__LBB19_18:                             # %if.else
	ldw	r5, r5
	cmp	r5, r4
	bne	__LBB19_20
# %bb.19:                               # %if.else
	movens	r4, r6
__LBB19_20:                             # %if.else
	shl	r6, r4, 1
	or r4, r3, r3
	shl	r2, r2, 2
	or r3, r2, r2
	shl	r1, r1, 3
	or r2, r1, r1
	shl	r0, r0, 4
	or r1, r0, r0
__LBB19_21:                             # %if.end39
	lsw	r6, -6                          # 2-byte Folded Reload
	lsw	r5, -4                          # 2-byte Folded Reload
	lsw	r4, -2                          # 2-byte Folded Reload
	addsp	8
	pop	fp
	rts

main>
	ldi r6, 1
	while
	tst r6
	stays nz
	ldi r3, cubes_inp
	ld r3, r3

	while
	tst r3
	stays z
	ldi r3, cubes_inp
	ld r3, r3
	wend
	
	ldi r0, cubes_inp
	ld r0, r0
	ldi r1, patterns_inp
	ld r1, r1
	ldi r2, end_inp
	ld r2, r2

	jsr play

	ldi r6, 0
	ldi r5, cubes_inp
	st r5, r6
	ldi r5, patterns_inp
	st r5, r6
	ldi r5, end_inp
	st r5, r6
	
	ldi r6, 1
	wend

	halt
                                        # -- End function
### SECTION: .bss
global_pattern>                         # @global_pattern
	ds	22

global_cubes>                           # @global_cubes
	ds	10

global_fixed>                           # @global_fixed
	ds	10

global_end>                             # @global_end
	dc	0                               # 0x0

begin_play>
	dc 69

cubes_inp>
	ds 2
patterns_inp>
	ds 2
end_inp>
	ds 2

end.
