	.text
	.file	"qurt_allocator.cpp"
	.section	.text._ZN6Halide7Runtime8Internal14aligned_mallocEjj,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal14aligned_mallocEjj // -- Begin function _ZN6Halide7Runtime8Internal14aligned_mallocEjj
	.falign
	.type	_ZN6Halide7Runtime8Internal14aligned_mallocEjj,@function
_ZN6Halide7Runtime8Internal14aligned_mallocEjj: // @_ZN6Halide7Runtime8Internal14aligned_mallocEjj
// %bb.0:                               // %entry
	{
		r2 = add(r0,add(r1,#-1))
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r19 = sub(#0,r0)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r17 = and(r2,r19)
	}
	{
		r18 = add(r17,r0)
	}
	{
		call ##malloc
		r0 = r18
	}
	.falign
// %bb.1:                               // %entry
	{
		r2 = add(r16,add(r0,#3))
		if (p0.new) r16 = #0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB0_5
	}
// %bb.2:                               // %if.end6
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r16 = and(r2,r19)
	}
	{
		memw(r16+#-4) = r0
	}
	{
		r0 = memw(r3+##malloc_tracing@GOT)
	}
	{
		r2 = memw(r0+#0)
		if (!cmp.gt(r2.new,#0)) jump:nt .LBB0_4
	}
// %bb.3:                               // %if.then14
	{
		call ##halide_hexagon_malloc_tracing_alloc
		r1:0 = combine(r17,r16)
	}
	.falign
.LBB0_4:                                // %cleanup
	{
		r0 = r16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB0_5:                                // %if.then
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##malloc_tracing@GOT)
	}
	{
		r2 = memw(r2+#0)
		if (!cmp.gt(r2.new,#0)) jump:nt .LBB0_4
	}
// %bb.6:                               // %if.then4
	{
		call ##halide_hexagon_malloc_tracing_failed_alloc
		r0 = r18
	}
	.falign
// %bb.7:                               // %if.then4
	{
		r0 = r16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end0:
	.size	_ZN6Halide7Runtime8Internal14aligned_mallocEjj, .Lfunc_end0-_ZN6Halide7Runtime8Internal14aligned_mallocEjj
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal12aligned_freeEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal12aligned_freeEPv // -- Begin function _ZN6Halide7Runtime8Internal12aligned_freeEPv
	.falign
	.type	_ZN6Halide7Runtime8Internal12aligned_freeEPv,@function
_ZN6Halide7Runtime8Internal12aligned_freeEPv: // @_ZN6Halide7Runtime8Internal12aligned_freeEPv
// %bb.0:                               // %entry
	{
		p0 = cmp.eq(r0,#0)
		if (p0.new) jumpr:nt r31
	}
.LBB1_1:                                // %if.then
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
	}
	{
		r2 = memw(r2+##malloc_tracing@GOT)
	}
	{
		r2 = memw(r2+#0)
		if (!cmp.gt(r2.new,#0)) jump:nt .LBB1_3
	}
// %bb.2:                               // %if.then1
	{
		call ##halide_hexagon_malloc_tracing_free
		r0 = r16
	}
	.falign
.LBB1_3:                                // %if.end
	{
		r0 = memw(r16+#-4)
		r17:16 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##free
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end1:
	.size	_ZN6Halide7Runtime8Internal12aligned_freeEPv, .Lfunc_end1-_ZN6Halide7Runtime8Internal12aligned_freeEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv // -- Begin function _ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
	.falign
	.type	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv,@function
_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv: // @_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#4)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#8)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#12)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#16)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#20)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#24)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#28)
	}
	{
		call ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r0 = memw(r16+#32)
	}
	{
		r0 = memw(r16+#36)
		r17:16 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end2:
	.size	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv, .Lfunc_end2-_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
                                        // -- End function
	.section	.text.halide_default_malloc,"ax",@progbits
	.weak	halide_default_malloc           // -- Begin function halide_default_malloc
	.falign
	.type	halide_default_malloc,@function
halide_default_malloc:                  // @halide_default_malloc
// %bb.0:                               // %entry
	{
		p0 = cmp.gtu(r1,##65536)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		if (!p0) r3 = #1
		if (p0) jump:nt .LBB3_37
	}
// %bb.1:
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	.falign
.LBB3_2:                                // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p1.new) r3 = #1
		p1 = cmp.eq(r4,#0); if (!p1.new) jump:nt .LBB3_5
	}
// %bb.3:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB3_2 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		memw_locked(r4,p0) = r3
	}
	{
		r16 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		if (!p0) jump:nt .LBB3_2
	}
	{
		jump .LBB3_35
	}
	.falign
.LBB3_5:                                // %cmpxchg.start9
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#4)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_9
	}
// %bb.6:                               // %cmpxchg.trystore7
                                        //   in Loop: Header=BB3_5 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#4)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		if (!p1) jump:nt .LBB3_5
	}
// %bb.7:
	{
		r16 = add(r4,#4)
		jump .LBB3_35
	}
	.falign
.LBB3_9:                                // %cmpxchg.start26
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#8)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_13
	}
// %bb.10:                              // %cmpxchg.trystore24
                                        //   in Loop: Header=BB3_9 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#8)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		if (!p1) jump:nt .LBB3_9
	}
// %bb.11:
	{
		r16 = add(r4,#8)
		jump .LBB3_35
	}
	.falign
.LBB3_13:                               // %cmpxchg.start43
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#12)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_17
	}
// %bb.14:                              // %cmpxchg.trystore41
                                        //   in Loop: Header=BB3_13 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#12)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		if (!p1) jump:nt .LBB3_13
	}
// %bb.15:
	{
		r16 = add(r4,#12)
		jump .LBB3_35
	}
	.falign
.LBB3_17:                               // %cmpxchg.start60
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#16)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_21
	}
// %bb.18:                              // %cmpxchg.trystore58
                                        //   in Loop: Header=BB3_17 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#16)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		if (!p1) jump:nt .LBB3_17
	}
// %bb.19:
	{
		r16 = add(r4,#16)
		jump .LBB3_35
	}
	.falign
.LBB3_21:                               // %cmpxchg.start77
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#20)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_24
	}
// %bb.22:                              // %cmpxchg.trystore75
                                        //   in Loop: Header=BB3_21 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#20)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r16 = add(r4,#20)
		if (!p1) jump:nt .LBB3_21
	}
	{
		jump .LBB3_35
	}
	.falign
.LBB3_24:                               // %cmpxchg.start94
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#24)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_27
	}
// %bb.25:                              // %cmpxchg.trystore92
                                        //   in Loop: Header=BB3_24 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#24)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r16 = add(r4,#24)
		if (!p1) jump:nt .LBB3_24
	}
	{
		jump .LBB3_35
	}
	.falign
.LBB3_27:                               // %cmpxchg.start111
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#28)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_30
	}
// %bb.28:                              // %cmpxchg.trystore109
                                        //   in Loop: Header=BB3_27 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#28)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r16 = add(r4,#28)
		if (!p1) jump:nt .LBB3_27
	}
	{
		jump .LBB3_35
	}
	.falign
.LBB3_30:                               // %cmpxchg.start128
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#32)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		if (!p0.new) r3 = #1
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_33
	}
// %bb.31:                              // %cmpxchg.trystore126
                                        //   in Loop: Header=BB3_30 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#32)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r16 = add(r4,#32)
		if (!p1) jump:nt .LBB3_30
	}
	{
		jump .LBB3_35
	}
	.falign
.LBB3_33:                               // %cmpxchg.start145
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#36)
	}
	{
		r4 = memw_locked(r4)
	}
	{
		p0 = cmp.eq(r4,#0); if (!p0.new) jump:nt .LBB3_37
	}
// %bb.34:                              // %cmpxchg.trystore143
                                        //   in Loop: Header=BB3_33 Depth=1
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r4 = add(r4,#36)
	}
	{
		memw_locked(r4,p1) = r3
	}
	{
		r4 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r16 = add(r4,#36)
		if (!p1) jump:nt .LBB3_33
	}
	.falign
.LBB3_35:                               // %if.then3
	{
		r0 = memw(r16+#0)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB3_38
	}
// %bb.36:                              // %cleanup11
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB3_37:                               // %if.end9
	{
		r0 = #128
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##_ZN6Halide7Runtime8Internal14aligned_mallocEjj
	}
	.falign
.LBB3_38:                               // %if.then5
	{
		r0 = #128
		r1 = ##65536
	}
	{
		call ##_ZN6Halide7Runtime8Internal14aligned_mallocEjj
	}
	.falign
// %bb.39:                              // %if.then5
	{
		r17:16 = memd(r29+#0)
		memw(r16+#0) = r0
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end3:
	.size	halide_default_malloc, .Lfunc_end3-halide_default_malloc
                                        // -- End function
	.section	.text.halide_default_free,"ax",@progbits
	.weak	halide_default_free             // -- Begin function halide_default_free
	.falign
	.type	halide_default_free,@function
halide_default_free:                    // @halide_default_free
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#0)
	}
	{
		p0 = cmp.eq(r3,r1); if (p0.new) jump:nt .LBB4_12
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.1:                               // %for.inc
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#4)
	}
	{
		p1 = cmp.eq(r3,r1); if (p1.new) jump:nt .LBB4_11
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.2:                               // %for.inc.1
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#8)
	}
	{
		p0 = cmp.eq(r3,r1); if (p0.new) jump:nt .LBB4_13
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.3:                               // %for.inc.2
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#12)
	}
	{
		p1 = cmp.eq(r3,r1); if (p1.new) jump:nt .LBB4_14
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.4:                               // %for.inc.3
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#16)
	}
	{
		p0 = cmp.eq(r3,r1); if (p0.new) jump:nt .LBB4_15
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.5:                               // %for.inc.4
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#20)
	}
	{
		p1 = cmp.eq(r3,r1); if (p1.new) jump:nt .LBB4_16
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.6:                               // %for.inc.5
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#24)
	}
	{
		p0 = cmp.eq(r3,r1); if (p0.new) jump:nt .LBB4_17
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.7:                               // %for.inc.6
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#28)
	}
	{
		p1 = cmp.eq(r3,r1); if (p1.new) jump:nt .LBB4_18
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.8:                               // %for.inc.7
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
	}
	{
		r3 = memw(r3+#32)
	}
	{
		p0 = cmp.eq(r3,r1); if (p0.new) jump:nt .LBB4_19
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
// %bb.9:                               // %for.inc.8
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal7mem_bufE@GOT)
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal11buf_is_usedE@GOT)
	}
	{
		r3 = memw(r3+#36)
		if (cmp.eq(r3.new,r1)) jump:nt .LBB4_20
	}
// %bb.10:                              // %for.inc.9
	{
		r0 = r1 ; jump ##_ZN6Halide7Runtime8Internal12aligned_freeEPv
	}
	.falign
.LBB4_11:
	{
		r3 = add(r3,#4)
	}
	.falign
.LBB4_12:                               // %cleanup
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_13:
	{
		r3 = add(r3,#8)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_14:
	{
		r3 = add(r3,#12)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_15:
	{
		r3 = add(r3,#16)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_16:
	{
		r3 = add(r3,#20)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_17:
	{
		r3 = add(r3,#24)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_18:
	{
		r3 = add(r3,#28)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_19:
	{
		r3 = add(r3,#32)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
	.falign
.LBB4_20:
	{
		r3 = add(r2,#36)
	}
	{
		jumpr r31
		memw(r3+#0) = #0
	}
.Lfunc_end4:
	.size	halide_default_free, .Lfunc_end4-halide_default_free
                                        // -- End function
	.section	.text.halide_set_custom_malloc,"ax",@progbits
	.weak	halide_set_custom_malloc        // -- Begin function halide_set_custom_malloc
	.balign 32
	.type	halide_set_custom_malloc,@function
halide_set_custom_malloc:               // @halide_set_custom_malloc
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r1 = add(pc,##.L.str@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal13custom_mallocE@GOT)
	}
	{
		r0 = memw(r2+#0)
		memw(r2+#0) = r16

	} :mem_noshuf
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end5:
	.size	halide_set_custom_malloc, .Lfunc_end5-halide_set_custom_malloc
                                        // -- End function
	.section	.text.halide_set_custom_free,"ax",@progbits
	.weak	halide_set_custom_free          // -- Begin function halide_set_custom_free
	.balign 32
	.type	halide_set_custom_free,@function
halide_set_custom_free:                 // @halide_set_custom_free
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r1 = add(pc,##.L.str@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal11custom_freeE@GOT)
	}
	{
		r0 = memw(r2+#0)
		memw(r2+#0) = r16

	} :mem_noshuf
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end6:
	.size	halide_set_custom_free, .Lfunc_end6-halide_set_custom_free
                                        // -- End function
	.section	.text.halide_malloc,"ax",@progbits
	.weak	halide_malloc                   // -- Begin function halide_malloc
	.balign 32
	.type	halide_malloc,@function
halide_malloc:                          // @halide_malloc
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r17:16 = combine(r0,r1)
	}
	{
		r2 = memw(r2+##malloc_tracing@GOT)
	}
	{
		r2 = memw(r2+#0)
		if (!cmp.gt(r2.new,#1)) jump:t .LBB7_2
	}
// %bb.1:                               // %if.then
	{
		call ##halide_hexagon_malloc_tracing_log_request
		r0 = r16
	}
	.falign
.LBB7_2:                                // %if.end
	{
		r1:0 = combine(r16,r17)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_default_malloc
	}
.Lfunc_end7:
	.size	halide_malloc, .Lfunc_end7-halide_malloc
                                        // -- End function
	.section	.text.halide_free,"ax",@progbits
	.weak	halide_free                     // -- Begin function halide_free
	.balign 32
	.type	halide_free,@function
halide_free:                            // @halide_free
// %bb.0:                               // %entry
	{
		jump ##halide_default_free
	}
.Lfunc_end8:
	.size	halide_free, .Lfunc_end8-halide_free
                                        // -- End function
	.section	.text.hexagon_default_malloc_tracing_alloc,"ax",@progbits
	.weak	hexagon_default_malloc_tracing_alloc // -- Begin function hexagon_default_malloc_tracing_alloc
	.balign 32
	.type	hexagon_default_malloc_tracing_alloc,@function
hexagon_default_malloc_tracing_alloc:   // @hexagon_default_malloc_tracing_alloc
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end9:
	.size	hexagon_default_malloc_tracing_alloc, .Lfunc_end9-hexagon_default_malloc_tracing_alloc
                                        // -- End function
	.section	.text.hexagon_default_malloc_tracing_failed_alloc,"ax",@progbits
	.weak	hexagon_default_malloc_tracing_failed_alloc // -- Begin function hexagon_default_malloc_tracing_failed_alloc
	.balign 32
	.type	hexagon_default_malloc_tracing_failed_alloc,@function
hexagon_default_malloc_tracing_failed_alloc: // @hexagon_default_malloc_tracing_failed_alloc
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end10:
	.size	hexagon_default_malloc_tracing_failed_alloc, .Lfunc_end10-hexagon_default_malloc_tracing_failed_alloc
                                        // -- End function
	.section	.text.hexagon_default_malloc_tracing_log_request,"ax",@progbits
	.weak	hexagon_default_malloc_tracing_log_request // -- Begin function hexagon_default_malloc_tracing_log_request
	.balign 32
	.type	hexagon_default_malloc_tracing_log_request,@function
hexagon_default_malloc_tracing_log_request: // @hexagon_default_malloc_tracing_log_request
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end11:
	.size	hexagon_default_malloc_tracing_log_request, .Lfunc_end11-hexagon_default_malloc_tracing_log_request
                                        // -- End function
	.section	.text.hexagon_default_malloc_tracing_free,"ax",@progbits
	.weak	hexagon_default_malloc_tracing_free // -- Begin function hexagon_default_malloc_tracing_free
	.balign 32
	.type	hexagon_default_malloc_tracing_free,@function
hexagon_default_malloc_tracing_free:    // @hexagon_default_malloc_tracing_free
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end12:
	.size	hexagon_default_malloc_tracing_free, .Lfunc_end12-hexagon_default_malloc_tracing_free
                                        // -- End function
	.section	.text.halide_set_custom_malloc_tracing_alloc,"ax",@progbits
	.weak	halide_set_custom_malloc_tracing_alloc // -- Begin function halide_set_custom_malloc_tracing_alloc
	.balign 32
	.type	halide_set_custom_malloc_tracing_alloc,@function
halide_set_custom_malloc_tracing_alloc: // @halide_set_custom_malloc_tracing_alloc
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal27custom_malloc_tracing_allocE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end13:
	.size	halide_set_custom_malloc_tracing_alloc, .Lfunc_end13-halide_set_custom_malloc_tracing_alloc
                                        // -- End function
	.section	.text.halide_set_custom_malloc_tracing_failed_alloc,"ax",@progbits
	.weak	halide_set_custom_malloc_tracing_failed_alloc // -- Begin function halide_set_custom_malloc_tracing_failed_alloc
	.balign 32
	.type	halide_set_custom_malloc_tracing_failed_alloc,@function
halide_set_custom_malloc_tracing_failed_alloc: // @halide_set_custom_malloc_tracing_failed_alloc
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal34custom_malloc_tracing_failed_allocE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end14:
	.size	halide_set_custom_malloc_tracing_failed_alloc, .Lfunc_end14-halide_set_custom_malloc_tracing_failed_alloc
                                        // -- End function
	.section	.text.halide_set_custom_malloc_tracing_log_request,"ax",@progbits
	.weak	halide_set_custom_malloc_tracing_log_request // -- Begin function halide_set_custom_malloc_tracing_log_request
	.balign 32
	.type	halide_set_custom_malloc_tracing_log_request,@function
halide_set_custom_malloc_tracing_log_request: // @halide_set_custom_malloc_tracing_log_request
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal33custom_malloc_tracing_log_requestE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end15:
	.size	halide_set_custom_malloc_tracing_log_request, .Lfunc_end15-halide_set_custom_malloc_tracing_log_request
                                        // -- End function
	.section	.text.halide_set_custom_malloc_tracing_free,"ax",@progbits
	.weak	halide_set_custom_malloc_tracing_free // -- Begin function halide_set_custom_malloc_tracing_free
	.balign 32
	.type	halide_set_custom_malloc_tracing_free,@function
halide_set_custom_malloc_tracing_free:  // @halide_set_custom_malloc_tracing_free
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal26custom_malloc_tracing_freeE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end16:
	.size	halide_set_custom_malloc_tracing_free, .Lfunc_end16-halide_set_custom_malloc_tracing_free
                                        // -- End function
	.section	.text.halide_hexagon_malloc_tracing_alloc,"ax",@progbits
	.weak	halide_hexagon_malloc_tracing_alloc // -- Begin function halide_hexagon_malloc_tracing_alloc
	.balign 32
	.type	halide_hexagon_malloc_tracing_alloc,@function
halide_hexagon_malloc_tracing_alloc:    // @halide_hexagon_malloc_tracing_alloc
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal27custom_malloc_tracing_allocE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end17:
	.size	halide_hexagon_malloc_tracing_alloc, .Lfunc_end17-halide_hexagon_malloc_tracing_alloc
                                        // -- End function
	.section	.text.halide_hexagon_malloc_tracing_failed_alloc,"ax",@progbits
	.weak	halide_hexagon_malloc_tracing_failed_alloc // -- Begin function halide_hexagon_malloc_tracing_failed_alloc
	.balign 32
	.type	halide_hexagon_malloc_tracing_failed_alloc,@function
halide_hexagon_malloc_tracing_failed_alloc: // @halide_hexagon_malloc_tracing_failed_alloc
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal34custom_malloc_tracing_failed_allocE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end18:
	.size	halide_hexagon_malloc_tracing_failed_alloc, .Lfunc_end18-halide_hexagon_malloc_tracing_failed_alloc
                                        // -- End function
	.section	.text.halide_hexagon_malloc_tracing_free,"ax",@progbits
	.weak	halide_hexagon_malloc_tracing_free // -- Begin function halide_hexagon_malloc_tracing_free
	.balign 32
	.type	halide_hexagon_malloc_tracing_free,@function
halide_hexagon_malloc_tracing_free:     // @halide_hexagon_malloc_tracing_free
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal26custom_malloc_tracing_freeE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end19:
	.size	halide_hexagon_malloc_tracing_free, .Lfunc_end19-halide_hexagon_malloc_tracing_free
                                        // -- End function
	.section	.text.halide_hexagon_malloc_tracing_log_request,"ax",@progbits
	.weak	halide_hexagon_malloc_tracing_log_request // -- Begin function halide_hexagon_malloc_tracing_log_request
	.balign 32
	.type	halide_hexagon_malloc_tracing_log_request,@function
halide_hexagon_malloc_tracing_log_request: // @halide_hexagon_malloc_tracing_log_request
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal33custom_malloc_tracing_log_requestE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end20:
	.size	halide_hexagon_malloc_tracing_log_request, .Lfunc_end20-halide_hexagon_malloc_tracing_log_request
                                        // -- End function
	.section	.text.halide_thread_yield,"ax",@progbits
	.weak	halide_thread_yield             // -- Begin function halide_thread_yield
	.balign 32
	.type	halide_thread_yield,@function
halide_thread_yield:                    // @halide_thread_yield
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end21:
	.size	halide_thread_yield, .Lfunc_end21-halide_thread_yield
                                        // -- End function
	.section	.text.halide_default_do_task,"ax",@progbits
	.weak	halide_default_do_task          // -- Begin function halide_default_do_task
	.balign 32
	.type	halide_default_do_task,@function
halide_default_do_task:                 // @halide_default_do_task
// %bb.0:                               // %entry
	{
		r1 = r2
		r7 = r1
		r2 = r3
	}
	{
		jumpr r7
	}
.Lfunc_end22:
	.size	halide_default_do_task, .Lfunc_end22-halide_default_do_task
                                        // -- End function
	.section	.text.halide_default_do_loop_task,"ax",@progbits
	.weak	halide_default_do_loop_task     // -- Begin function halide_default_do_loop_task
	.balign 32
	.type	halide_default_do_loop_task,@function
halide_default_do_loop_task:            // @halide_default_do_loop_task
// %bb.0:                               // %entry
	{
		r1 = r2
		r2 = r3
		r7 = r1
		r3 = r4
	}
	{
		r4 = r5
		jumpr r7
	}
.Lfunc_end23:
	.size	halide_default_do_loop_task, .Lfunc_end23-halide_default_do_loop_task
                                        // -- End function
	.section	.text.halide_default_do_par_for,"ax",@progbits
	.weak	halide_default_do_par_for       // -- Begin function halide_default_do_par_for
	.falign
	.type	halide_default_do_par_for,@function
halide_default_do_par_for:              // @halide_default_do_par_for
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r3,#0); if (!p0.new) jump:nt .LBB24_6
	}
// %bb.1:                               // %if.end
	{
		memd(r29+#-16) = r17:16
		allocframe(#88)
	}                                       // 8-byte Folded Spill
	{
		r16 = add(r29,#0)
	}
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memw(r29+#24) = r3
		memw(r29+#20) = r2
	}
	{
		r2 = #0
		memw(r29+#0) = #0
		memw(r29+#4) = r4
	}
	{
		memb(r29+#32) = r2
		memw(r29+#12) = #0
	}
	{
		memw(r29+#16) = #0
		memw(r29+#28) = #0
	}
	{
		memw(r29+#8) = #0
		memw(r29+#68) = #0
	}
	{
		memw(r29+#36) = r1
		memw(r29+#60) = r0
	}
	{
		memw(r29+#64) = #0
		memw(r29+#72) = #0
	}
	{
		memb(r29+#76) = r2
		memw(r29+#52) = #0
	}
	{
		memw(r29+#44) = r16
		memw(r29+#48) = #0
	}
	{
		r17 = memw(r3+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	.falign
// %bb.2:                               // %if.end
	{
		call ##_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
		r1:0 = combine(r16,#1)
		r2 = #0
	}
	.falign
// %bb.3:                               // %if.end
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
		r0 = r16
	}
	.falign
// %bb.4:                               // %if.end
	{
		call ##halide_mutex_unlock
		r0 = r17
	}
	.falign
// %bb.5:                               // %if.end
	{
		r0 = memw(r29+#68)
		r17:16 = memd(r29+#80)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = deallocframe(r30):raw
	}
	{
		jumpr r31
	}
	.falign
.LBB24_6:
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end24:
	.size	halide_default_do_par_for, .Lfunc_end24-halide_default_do_par_for
                                        // -- End function
	.section	.text.halide_mutex_lock,"ax",@progbits
	.weak	halide_mutex_lock               // -- Begin function halide_mutex_lock
	.falign
	.type	halide_mutex_lock,@function
halide_mutex_lock:                      // @halide_mutex_lock
// %bb.0:                               // %entry
	{
		r16 = r0
		r2 = #1
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#24) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
.LBB25_1:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r16)
	}
	{
		p0 = cmp.eq(r3,#0); if (!p0.new) jump:nt .LBB25_4
	}
// %bb.2:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB25_1 Depth=1
	{
		memw_locked(r16,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB25_1
	}
	.falign
.LBB25_3:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit
	{
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB25_4:                               // %if.then.i
	{
		r17 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r18 = #40
		r3 = memw(r16+#0)
	}
	.falign
.LBB25_5:                               // %while.cond.outer.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB25_6 Depth 2
                                        //       Child Loop BB25_8 Depth 3
                                        //     Child Loop BB25_15 Depth 2
	{
		r2 = r3
	}
	.falign
.LBB25_6:                               // %while.cond.i.i
                                        //   Parent Loop BB25_5 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB25_8 Depth 3
	{
		r3 = setbit(r2,#0)
		if (p0.new) r4 = add(r18,#0)
		p0 = tstbit(r2,#0); if (p0.new) jump:nt .LBB25_11
	}
	.falign
.LBB25_8:                               // %cmpxchg.start9
                                        //   Parent Loop BB25_5 Depth=1
                                        //     Parent Loop BB25_6 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r4 = memw_locked(r16)
	}
	{
		p1 = cmp.eq(r4,r2); if (!p1.new) jump:nt .LBB25_10
	}
// %bb.9:                               // %cmpxchg.trystore7
                                        //   in Loop: Header=BB25_8 Depth=3
	{
		memw_locked(r16,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB25_8
	}
	.falign
.LBB25_10:                              // %cmpxchg.end2
                                        //   in Loop: Header=BB25_6 Depth=2
	{
		r2 = r4
		if (!p1) jump:nt .LBB25_6
	}
	{
		jump .LBB25_3
	}
	.falign
.LBB25_11:                              // %if.end4.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		p1 = cmp.gt(r18,#0); if (p1.new) jump:nt .LBB25_21
	}
	.falign
.LBB25_13:                              // %if.end8.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		r5 = setbit(r2,#1)
		p1 = tstbit(r2,#1)
		if (p1.new) jump:t .LBB25_18
	}
	.falign
.LBB25_15:                              // %cmpxchg.start26
                                        //   Parent Loop BB25_5 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3 = memw_locked(r16)
	}
	{
		p0 = cmp.eq(r3,r2); if (!p0.new) jump:nt .LBB25_17
	}
// %bb.16:                              // %cmpxchg.trystore24
                                        //   in Loop: Header=BB25_15 Depth=2
	{
		memw_locked(r16,p1) = r5
	}
	{
		if (!p1) jump:nt .LBB25_15
	}
	.falign
.LBB25_17:                              // %cmpxchg.end19
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		r18 = r4
		if (!p0) jump:nt .LBB25_5
	}
	.falign
.LBB25_18:                              // %if.end19.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		r1 = add(r29,#4)
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOT)
		memw(r29+#8) = r2.new
	}
	{
		r0 = r16
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOT)
		memw(r29+#16) = r2.new
	}
	{
		memw(r29+#20) = r16
	}
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOT)
		memw(r29+#4) = r2.new
	}
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOT)
		memw(r29+#12) = r2.new
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE
	}
	.falign
// %bb.19:                              // %if.end19.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		r18 = #40
		p0 = cmp.eq(r0,r16); if (p0.new) jump:nt .LBB25_3
		if (!p0.new) r3 = memw(r16+#0)
	}
// %bb.20:                              // %cleanup26.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		jump .LBB25_5
	}
	.falign
.LBB25_21:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		if (!p0.new) r18 = add(r18,#-1)
		r4 = #0
		p0 = cmp.eq(r18,#1); if (p0.new) jump:t .LBB25_13
	}
// %bb.22:                              // %if.then6.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		call ##halide_thread_yield
	}
	.falign
// %bb.23:                              // %if.then6.i.i
                                        //   in Loop: Header=BB25_5 Depth=1
	{
		jump .LBB25_5
		r3 = memw(r16+#0)
	}
.Lfunc_end25:
	.size	halide_mutex_lock, .Lfunc_end25-halide_mutex_lock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_ // -- Begin function _ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	.falign
	.type	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,@function
_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_: // @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		memd(r29+#-16) = r17:16
		allocframe(#56)
	}                                       // 8-byte Folded Spill
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#40) = r19:18
		memd(r29+#32) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		memd(r29+#24) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r3 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = add(r3,#8)
		r4 = memb(r3+##1073)
		if (cmp.eq(r4.new,#0)) jump:nt .LBB26_7
	}
// %bb.1:                               // %if.end4
	{
		p3 = cmp.gt(r18,#0)
	}
	{
		r2 = p3
		if (!p3) jump:nt .LBB26_17
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	.falign
.LBB26_2:                               // %for.body.preheader
	{
		r6 = lsr(r18,#1)
		p2 = and(p2,!p2)
		r3 = add(r17,#32)
		r20 = #-1
	}
	{
		p0 = cmp.gtu(r6,#0); if (!p0.new) jump:t .LBB26_18
		r2 = #0
		r4 = and(r18,#1)
	}
// %bb.3:
	{
		r8 = add(r6,#-1)
		r9 = memw(r3+#-16)
		r5 = memw(r3+#-4)
	}
	{
		p0 = cmp.eq(r9,#0)
		r12 = memb(r3+#80)
		r7 = memb(r3+#0)
	}
	{
		p3 = cmp.eq(r12,#0)
		r2 = add(r5,r2)
		p1 = cmp.eq(r5,#0)
		r13 = memw(r3+#76)
	}
	{
		loop0(.LBB26_4,r8)
		r5 = p0
		r2 = add(r13,r2)
		p0 = cmp.eq(r7,#0)
	}
	{
		r5 = p3
		r0 = r5
		if (p0) r7 = memw(r3+##-8)
	}
	{
		r14 = r0
		r1 = r5
		r8 = memw(r3+#64)
		if (p3) r5 = memw(r3+#72)
	}
	{
		p3 = r14
		r0 = r1
		memw(r29+#0) = r1
	}                                       // 4-byte Folded Spill
	{
		p3 = or(p2,!p3)
		p0 = r0
		if (!p0) r7 = #1
		r3 = add(r3,#160)
	}
	{
		r10 = p3
		p3 = or(p2,p2)
		if (!p0) r5 = #1
		memw(r29+#8) = r10.new
	}                                       // 4-byte Folded Spill
	{
		p2 = or(p2,p1)
		r1 = r10
	}
	{
		r11 = p2
		p2 = or(p3,!p1)
		p3 = cmp.eq(r8,#0)
		p1 = cmp.gtu(r6,#1)
	}
	{
		p0 = r1
		r6 = add(r7,r20)
		memw(r29+#12) = r11
	}                                       // 4-byte Folded Spill
	{
		p0 = or(p0,!p3)
		p3 = cmp.eq(r13,#0)
	}
	{
		p2 = or(p2,!p3)
		if (!p1) jump:nt .LBB26_5
	}
	.falign
.LBB26_4:                               // =>This Inner Loop Header: Depth=1
	{
		r6 = add(r5,r6)
		r9 = memw(r29+#12)
		r7 = memw(r3+#-4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r9
		r8 = memb(r3+#0)
		r12 = memb(r3+#80)
	}
	{
		p3 = or(p1,p3)
		r2 = add(r7,r2)
		r13 = memw(r3+#-16)
		r0 = memw(r3+#76)
	}
	{
		r15 = p3
		r2 = add(r0,r2)
		p1 = cmp.eq(r8,#0)
		r14 = memw(r3+#64)
	}
	{
		r15 = r15
		p3 = cmp.eq(r7,#0)
		if (p1) r8 = memw(r3+##-8)
	}
	{
		p2 = or(p2,!p3)
		r21 = r15
		if (!p1) r8 = #1
		p1 = cmp.eq(r13,#0)
	}
	{
		r20 = p2
		r6 = add(r8,r6)
	}
	{
		p0 = or(p0,!p1)
		p2 = r21
		r7 = r20
		memw(r29+#8) = r20
	}                                       // 4-byte Folded Spill
	{
		p3 = or(p2,p3)
		p1 = r7
	}
	{
		r1 = p3
		p3 = cmp.eq(r12,#0)
		if (p3.new) r5 = memw(r3+#72)
		memw(r29+#12) = r1.new
	}                                       // 4-byte Folded Spill
	{
		r3 = add(r3,#160)
		if (!p3) r5 = #1
		p3 = cmp.eq(r14,#0)
	}
	{
		p0 = or(p0,!p3)
		p3 = cmp.eq(r0,#0)
	}
	{
		p2 = or(p1,!p3)
		nop
	} :endloop0
	.falign
.LBB26_5:
	{
		r20 = add(r5,r6)
		r7 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p1 = r7
	}
	{
		p3 = or(p1,p3)
		p1 = cmp.gtu(r4,#0)
	}
	{
		r0 = p3
		if (!p1) jump:nt .LBB26_21
		memw(r29+#8) = r0.new
	}                                       // 4-byte Folded Spill
	{
		jump .LBB26_19
	}
	.falign
.LBB26_7:                               // %land.rhs.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memb(r2+#0)
		if (!cmp.eq(r3.new,#0)) jump:nt .LBB26_9
	}
// %bb.8:                               // %while.body.i
                                        //   in Loop: Header=BB26_7 Depth=1
	{
		r2 = add(r2,#1)
		r3 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r3 = add(r3,#1080)
		if (cmp.gtu(r3.new,r2)) jump:t .LBB26_7
	}
	.falign
.LBB26_9:                               // %do.body.i
	{
		r3 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r3 = add(r3,#1080)
		if (cmp.eq(r3.new,r2)) jump:nt .LBB26_12
	}
// %bb.10:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7@PCREL)
		r0 = #0
	}
	{
		call ##halide_print
	}
	.falign
// %bb.11:                              // %if.then.i
	{
		call ##abort
	}
	.falign
.LBB26_12:                              // %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r0 = memw(r2+#4)
		if (!cmp.eq(r0.new,#0)) jump:t .LBB26_15
	}
// %bb.13:                              // %if.then2
	{
		call ##_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	}
	.falign
// %bb.14:                              // %if.then2
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		memw(r2+#4) = r0
	}
	.falign
.LBB26_15:                              // %if.end
	{
		call ##_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	}
	.falign
// %bb.16:                              // %if.end
	{
		r3 = #1
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		p3 = cmp.gt(r18,#0)
		memw(r2+#4) = r0
		memb(r2+##1073) = r3
	}
	{
		r2 = p3
		if (p3) jump:nt .LBB26_2
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	.falign
.LBB26_17:
	{
		p2 = and(p2,!p2)
		r2 = #0
		r20 = #-1
	}
	{
		p0 = or(p2,p2)
		r3 = p2
		jump .LBB26_21
		memw(r29+#8) = r3.new
	}                                       // 4-byte Folded Spill
	.falign
.LBB26_18:
	{
		r5 = p2
		p0 = or(p2,p2)
		p1 = cmp.gtu(r4,#0)
		memw(r29+#8) = r5.new
	}                                       // 4-byte Folded Spill
	{
		if (!p1) jump:nt .LBB26_21
	}
	.falign
.LBB26_19:
	{
		r4 = p0
		memw(r29+#12) = r4.new
	}                                       // 4-byte Folded Spill
	.falign
.Ltmp0:                                 // Block address taken
.LBB26_20:                              // %for.body
	{
		r4 = memb(r3+#0)
		r5 = memw(r3+#-4)
	}
	{
		p0 = cmp.eq(r4,#0)
		r7 = memw(r29+#8)
		r6 = memw(r3+#-16)
	}                                       // 4-byte Folded Reload
	{
		p1 = r7
		p3 = cmp.eq(r5,#0)
		r2 = add(r5,r2)
	}
	{
		p2 = or(p2,!p3)
		r3 = add(r3,#80)
		if (p0) r4 = memw(r3+##-8)
	}
	{
		p1 = or(p1,p3)
		if (!p0) r4 = #1
		r3 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		r0 = p1
		p1 = cmp.eq(r6,#0)
		r20 = add(r4,r20)
		memw(r29+#8) = r0.new
	}                                       // 4-byte Folded Spill
	{
		p0 = r3
	}
	{
		p0 = or(p0,!p1)
	}
	.falign
.LBB26_21:                              // %for.cond.cleanup
	{
		p0 = or(p0,p2)
		p1 = cmp.eq(r16,#0)
	}
	{
		r3 = p0
		memw(r29+#12) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = p1
		if (p1) jump:nt .LBB26_27
		memw(r29+#0) = r3.new
	}                                       // 4-byte Folded Spill
// %bb.22:                              // %do.body
	{
		r0 = #0
		r3 = memw(r16+#28)
		r4 = memw(r16+#64)
	}
	{
		r5 = memw(r16+#56)
	}
	{
		r3 = mpyi(r4,r3)
	}
	{
		r3 = sub(r3,r5)
		if (!cmp.gt(r2,r3.new)) jump:t .LBB26_25
	}
// %bb.23:                              // %if.then54
	{
		r1 = add(pc,##.L.str.3@PCREL)
		call ##halide_print
	}
	.falign
// %bb.24:                              // %if.then54
	{
		call ##abort
	}
	.falign
.LBB26_25:                              // %do.end
	{
		r2 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p3 = r2
		if (!p3.new) jump:t .LBB26_35
	}
// %bb.26:                              // %if.then59
	{
		jump .LBB26_35
		memw(r16+#56) += #1
	}
	.falign
.LBB26_27:                              // %if.then28
	{
		r4 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r3 = memw(r4+#16)
	}
	{
		p2 = cmp.gt(r3,#255)
		if (!p2.new) r22 = add(r4,#48)
		if (p2.new) jump:t .LBB26_33
		if (!p2.new) r5 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
// %bb.28:
	{
		p3 = r5
		if (p3.new) r21 = add(r2,#1)
		if (!p3.new) r21 = add(r2,#0)
	}
	.falign
.LBB26_29:                              // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		r2 = add(r2,#-1)
		if (cmp.gt(r2.new,r3)) jump:t .LBB26_31
	}
// %bb.30:                              // %lor.rhs
                                        //   in Loop: Header=BB26_29 Depth=1
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = memw(r2+#1076)
	}
	{
		r2 = add(r3,sub(#1,r2))
		if (!cmp.gt(r21,r2.new)) jump:nt .LBB26_33
	}
	.falign
.LBB26_31:                              // %while.body
                                        //   in Loop: Header=BB26_29 Depth=1
	{
		r1 = #0
		r23 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		memw(r23+#20) += #1
	}
	{
		call ##halide_spawn_thread
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal13worker_threadEPv@GOT)
	}
	.falign
// %bb.32:                              // %while.body
                                        //   in Loop: Header=BB26_29 Depth=1
	{
		r2 = memw(r23+#16)
	}
	{
		r3 = add(r2,#1)
		p1 = cmp.gt(r2,#254)
		memw(r23+#16) = r3.new
	}
	{
		if (!p1) jump:nt .LBB26_29
		memw(r22+r2<<#2) = r0
	}
	.falign
.LBB26_33:                              // %while.end
	{
		r2 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p2 = r2
		if (!p2.new) jump:t .LBB26_35
	}
// %bb.34:                              // %if.then46
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = add(r2,#1076)
	}
	{
		memw(r2+#0) += #1
	}
	.falign
.LBB26_35:                              // %if.end63
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) r3 = add(r18,#0)
		if (!p0.new) jump:nt .LBB26_39
	}
// %bb.36:                              // %for.body69.lr.ph
	{
		r2 = +mpyi(r18,#80)
		r4 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		loop0(.LBB26_37,r18)
		r2 = add(r17,add(r2,##-40))
		r4 = memw(r4+#12)
	}
	.falign
.Ltmp1:                                 // Block address taken
.LBB26_37:                              // %for.body69
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = add(r3,#-1)
		r4 = r17
		memw(r2+#0) = r4
		memw(r2+#4) = r17
	}
	{
		r2 = add(r2,#-80)
		memw(r2+#8) = r18
		memw(r2+#16) = #0
	}
	{
		r4 += mpyi(r3,#80)
		nop
	} :endloop0
// %bb.38:                              // %for.cond66.for.cond.cleanup68_crit_edge
	{
		r2 = add(r2,#40)
		r3 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		memw(r3+#12) = r2
	}
	.falign
.LBB26_39:                              // %for.cond.cleanup68
	{
		r17 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r0 = add(r17,#28)
		r4 = memw(r17+#44)
	}
	{
		r2 = memw(r17+#40)
		r3 = memw(r17+#16)
	}
	{
		p0 = cmp.gt(r3,r2)
		p3 = cmp.gt(r20,r2)
		p1 = cmp.eq(r4,#0)
	}
	{
		if (p0) r20 = add(r3,#0)
	}
	{
		if (!p1) r20 = add(r3,#0)
	}
	{
		if (p3) r20 = add(r3,#0)
	}
	{
		call ##halide_cond_broadcast
		memw(r17+#24) = r20
	}
	.falign
// %bb.40:                              // %for.cond.cleanup68
	{
		r2 = memw(r17+#24)
	}
	{
		r3 = memw(r17+#20)
		if (!cmp.gt(r2,r3.new)) jump:t .LBB26_44
	}
// %bb.41:                              // %if.then89
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r2,#32)
	}
	.falign
// %bb.42:                              // %if.then89
	{
		r2 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (!p0.new) jump:t .LBB26_44
	}
// %bb.43:                              // %if.then91
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r2,#36)
	}
	.falign
.LBB26_44:                              // %if.end93
	{
		r2 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (!p1.new) jump:t .LBB26_46
		if (p1.new) r3 = memw(r29+#0)
	}                                       // 4-byte Folded Reload
// %bb.45:                              // %if.then97
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		p2 = r3
		if (p2.new) r2 = add(r2,##1076)
		if (!p2.new) r2 = add(r16,#56)
	}
	{
		memw(r2+#0) -= #1
	}
	.falign
.LBB26_46:                              // %if.end105
	{
		r17:16 = memd(r29+#48)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#32)
		r23:22 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end26:
	.size	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_, .Lfunc_end26-_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE // -- Begin function _ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	.falign
	.type	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,@function
_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE: // @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
// %bb.0:                               // %entry
	{
		r16 = r0
		p2 = cmp.eq(r0,#0)
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r2 = p2
	}
	{
		r24 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#24) = r25:24
		memd(r29+#48) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r25 = #1
		r18 = #0
		r23 = #0
		memd(r29+#32) = r23:22
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#40) = r21:20
		memd(r29+#16) = r27:26
	}                                       // 8-byte Folded Spill
	{
		memw(r29+#4) = r2
	}                                       // 4-byte Folded Spill
	.falign
.LBB27_1:                               // %while.cond
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB27_12 Depth 2
                                        //       Child Loop BB27_20 Depth 3
                                        //     Child Loop BB27_7 Depth 2
                                        //     Child Loop BB27_30 Depth 2
                                        //       Child Loop BB27_39 Depth 3
                                        //     Child Loop BB27_52 Depth 2
                                        //       Child Loop BB27_54 Depth 3
                                        //         Child Loop BB27_55 Depth 4
                                        //     Child Loop BB27_89 Depth 2
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) jump:nt .LBB27_9
	}
// %bb.2:                               // %cond.true
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r16+#24)
		if (!cmp.eq(r2.new,#0)) jump:t .LBB27_4
	}
// %bb.3:                               // %lor.rhs.i
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r16+#64)
		if (cmp.eq(r2.new,#0)) jump:nt ##.LBB27_102
	}
	.falign
.LBB27_4:                               // %if.then
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r17 = memw(r2+#12)
	}
	{
		r3 = memw(r16+#68)
		if (cmp.eq(r3.new,#0)) jump:nt .LBB27_24
	}
// %bb.5:                               // %if.then3
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r16+#64)
	}
	{
		p1 = cmp.eq(r2,#0); if (!p1.new) jump:t .LBB27_28
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
// %bb.6:                               //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = add(r2,#12)
	}
	.falign
.LBB27_7:                               // %while.cond6
                                        //   Parent Loop BB27_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		p0 = cmp.eq(r17,r16)
		r2 = add(r17,#40)
		r3 = r2
		r17 = memw(r17+#40)
	}
	{
		if (!p0) jump:nt .LBB27_7
	}
// %bb.8:                               // %while.end
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		jump .LBB27_1
		memw(r3+#0) = r17
		memw(r16+#24) = #0
	}
	.falign
.LBB27_9:                               // %cond.end
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = memb(r2+##1072)
		if (!cmp.eq(r2.new,#0)) jump:nt ##.LBB27_102
	}
// %bb.10:                              // %if.end21.thread
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r26 = add(r2,#12)
		r17 = memw(r2+#12)
		if (cmp.eq(r17.new,#0)) jump:nt ##.LBB27_73
	}
	.falign
.LBB27_12:                              // %while.body24
                                        //   Parent Loop BB27_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB27_20 Depth 3
	{
		r2 = memw(r17+#52)
	}
	{
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB27_14
		if (!p0.new) r4 = memw(r2+#28)
		if (!p0.new) r3 = memw(r2+#64)
	}
// %bb.13:                              // %if.else29
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		p2 = cmp.eq(r3,#0)
		r2 = memw(r2+#56)
	}
	{
		r5 = mux(p2,#1,r3)
	}
	{
		r3 = mpyi(r5,r4)
	}
	{
		r2 = sub(r3,r2)
		jump .LBB27_15
	}
	.falign
.LBB27_14:                              // %if.then28
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r3 = memw(r2+#16)
		r2 = memw(r2+#1076)
	}
	{
		r2 = add(r3,sub(#1,r2))
	}
	.falign
.LBB27_15:                              // %if.end42
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		p0 = and(p0,!p0)
		r4 = memw(r17+#64)
		r3 = memb(r17+#32)
	}
	{
		p1 = cmp.eq(r3,#0); if (p1.new) jump:nt .LBB27_17
		r3 = memw(r17+#28)
	}
// %bb.16:                              // %lor.rhs61
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		p0 = cmp.eq(r4,#0)
	}
	{
		p0 = not(p0)
	}
	.falign
.LBB27_17:                              // %lor.end64
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		p2 = cmp.gt(r3,r2)
		if (p2.new) jump:nt .LBB27_23
	}
// %bb.18:                              // %lor.end64
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		if (!p0) r21 = add(r17,#16)
		if (!p0) r20 = add(r17,#72)
		if (!p0) r3 = memw(r17+#16)
		if (!p0) r2 = memw(r17+#72)
	}
	{
		if (p0) jump:nt .LBB27_23
	}
// %bb.19:                              // %if.then74
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		p1 = cmp.gt(r3,r2); if (!p1.new) jump:nt .LBB27_49
	}
	.falign
.LBB27_20:                              // %for.body.i
                                        //   Parent Loop BB27_1 Depth=1
                                        //     Parent Loop BB27_12 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r3 = memw(r17+#12)
	}
	{
		r4 = addasl(r3,r2,#3)
		r0 = memw(r3+r2<<#3)
	}
	{
		call ##halide_default_semaphore_try_acquire
		r1 = memw(r4+#4)
	}
	.falign
// %bb.21:                              // %for.body.i
                                        //   in Loop: Header=BB27_20 Depth=3
	{
		p0 = r0
		if (!p0.new) jump:nt .LBB27_23
		if (p0.new) r3 = memw(r17+#16)
		if (p0.new) r2 = memw(r17+#72)
	}
// %bb.22:                              // %for.inc.i
                                        //   in Loop: Header=BB27_20 Depth=3
	{
		r2 = add(r2,#1)
		memw(r17+#72) = r2.new
	}
	{
		p2 = cmp.gt(r3,r2)
		if (p2.new) jump:t .LBB27_20
	}
	{
		jump .LBB27_49
	}
	.falign
.LBB27_23:                              // %cleanup
                                        //   in Loop: Header=BB27_12 Depth=2
	{
		r26 = add(r17,#40)
		r17 = memw(r17+#40)
		if (!cmp.eq(r17.new,#0)) jump:t .LBB27_12
	}
	{
		jump .LBB27_43
	}
	.falign
.LBB27_24:                              // %if.else
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r16+#52)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB27_28
	}
// %bb.25:                              // %land.lhs.true
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r2+#68)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB27_28
	}
// %bb.26:                              // %if.then15
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		memw(r16+#68) = r2
	}
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r2,#36)
	}
	.falign
// %bb.27:                              // %if.then15
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		jump .LBB27_1
	}
	.falign
.LBB27_28:                              // %if.end21
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p1 = cmp.eq(r17,#0); if (p1.new) jump:nt .LBB27_44
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
// %bb.29:                              //   in Loop: Header=BB27_1 Depth=1
	{
		r26 = add(r2,#12)
	}
	.falign
.LBB27_30:                              // %while.body24.us
                                        //   Parent Loop BB27_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB27_39 Depth 3
	{
		r2 = memw(r17+#52)
	}
	{
		p1 = cmp.eq(r2,#0); if (p1.new) jump:nt .LBB27_32
		if (!p1.new) r4 = memw(r2+#28)
		if (!p1.new) r3 = memw(r2+#64)
	}
// %bb.31:                              // %if.else29.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		p0 = cmp.eq(r3,#0)
		r2 = memw(r2+#56)
	}
	{
		r5 = mux(p0,#1,r3)
	}
	{
		r3 = mpyi(r5,r4)
	}
	{
		r2 = sub(r3,r2)
		jump .LBB27_33
	}
	.falign
.LBB27_32:                              // %if.then28.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r3 = memw(r2+#16)
		r2 = memw(r2+#1076)
	}
	{
		r2 = add(r3,sub(#1,r2))
	}
	.falign
.LBB27_33:                              // %if.end42.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		p1 = and(p1,!p1)
		r4 = memb(r17+#32)
		r3 = memw(r17+#28)
	}
	{
		r5 = memw(r16+#44)
	}
	{
		p0 = cmp.eq(r4,#0); if (p0.new) jump:nt .LBB27_35
		if (!p0.new) r6 = memw(r17+#64)
		r4 = memw(r17+#44)
	}
// %bb.34:                              // %lor.rhs61.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		p1 = cmp.eq(r6,#0)
	}
	{
		p1 = not(p1)
	}
	.falign
.LBB27_35:                              // %lor.end64.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		p2 = cmp.eq(r3,#0)
		p0 = cmp.gt(r3,r2); if (p0.new) jump:nt .LBB27_42
	}
// %bb.36:                              // %lor.end64.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		p0 = cmp.eq(r4,r5)
	}
	{
		p0 = not(p0)
	}
	{
		p2 = and(p0,!p2)
		if (p2.new) jump:nt .LBB27_42
	}
// %bb.37:                              // %lor.end64.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		if (!p1) r21 = add(r17,#16)
		if (!p1) r20 = add(r17,#72)
		if (!p1) r3 = memw(r17+#16)
		if (!p1) r2 = memw(r17+#72)
	}
	{
		if (p1) jump:nt .LBB27_42
	}
// %bb.38:                              // %if.then74.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		p1 = cmp.gt(r3,r2); if (!p1.new) jump:nt .LBB27_49
	}
	.falign
.LBB27_39:                              // %for.body.i.us
                                        //   Parent Loop BB27_1 Depth=1
                                        //     Parent Loop BB27_30 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r3 = memw(r17+#12)
	}
	{
		r4 = addasl(r3,r2,#3)
		r0 = memw(r3+r2<<#3)
	}
	{
		call ##halide_default_semaphore_try_acquire
		r1 = memw(r4+#4)
	}
	.falign
// %bb.40:                              // %for.body.i.us
                                        //   in Loop: Header=BB27_39 Depth=3
	{
		p0 = r0
		if (!p0.new) jump:nt .LBB27_42
		if (p0.new) r3 = memw(r17+#16)
		if (p0.new) r2 = memw(r17+#72)
	}
// %bb.41:                              // %for.inc.i.us
                                        //   in Loop: Header=BB27_39 Depth=3
	{
		r2 = add(r2,#1)
		memw(r17+#72) = r2.new
	}
	{
		p2 = cmp.gt(r3,r2)
		if (p2.new) jump:t .LBB27_39
	}
	{
		jump .LBB27_49
	}
	.falign
.LBB27_42:                              // %cleanup.us
                                        //   in Loop: Header=BB27_30 Depth=2
	{
		r26 = add(r17,#40)
		r17 = memw(r17+#40)
		if (!cmp.eq(r17.new,#0)) jump:t .LBB27_30
	}
	.falign
.LBB27_43:                              // %if.then88
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) jump:nt .LBB27_73
	}
	.falign
.LBB27_44:                              // %if.then90
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p1 = cmp.gt(r18,#39)
		r18 = add(r18,#1)
		if (p1.new) jump:t .LBB27_76
	}
// %bb.45:                              // %if.then92
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r17 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_unlock
		r0 = r17
	}
	.falign
// %bb.46:                              // %if.then92
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		call ##halide_thread_yield
	}
	.falign
// %bb.47:                              // %if.then92
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	.falign
// %bb.48:                              // %if.then92
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		jump .LBB27_1
	}
	.falign
.LBB27_49:                              // %for.end.i
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r17+#52)
		memw(r20+#0) = #0
	}
	{
		r3 = memw(r17+#28)
		memw(r17+#64) += #1
	}
	{
		p1 = cmp.eq(r2,#0)
		r4 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		if (p1) r4 = add(r4,##1076)
		if (!p1) r4 = add(r2,#56)
	}
	{
		memw(r4+#0) += r3
	}
	{
		r0 = memb(r17+#32)
		if (cmp.eq(r0.new,#0)) jump:nt .LBB27_69
	}
// %bb.50:                              // %if.then132
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r17+#40)
		memw(r26+#0) = r2.new
	}
	{
		call ##halide_mutex_unlock
		r0 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
// %bb.51:                              // %if.then132
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r22 = #0
		r18 = #1
	}
	.falign
.LBB27_52:                              // %while.cond137.preheader
                                        //   Parent Loop BB27_1 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB27_54 Depth 3
                                        //         Child Loop BB27_55 Depth 4
	{
		r2 = memw(r17+#24)
	}
	{
		r3 = sub(r2,r22)
	}
	{
		p1 = cmp.gt(r3,r18); if (!p1.new) jump:t .LBB27_60
		if (p1.new) r3 = memw(r21+#0)
		if (p1.new) r4 = memw(r20+#0)
	}
	.falign
.LBB27_54:                              // %land.end
                                        //   Parent Loop BB27_1 Depth=1
                                        //     Parent Loop BB27_52 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB27_55 Depth 4
	{
		p0 = cmp.gt(r3,r4); if (!p0.new) jump:t .LBB27_59
	}
	.falign
.LBB27_55:                              // %for.body.i444
                                        //   Parent Loop BB27_1 Depth=1
                                        //     Parent Loop BB27_52 Depth=2
                                        //       Parent Loop BB27_54 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	{
		r2 = memw(r17+#12)
	}
	{
		r3 = addasl(r2,r4,#3)
		r0 = memw(r2+r4<<#3)
	}
	{
		call ##halide_default_semaphore_try_acquire
		r1 = memw(r3+#4)
	}
	.falign
// %bb.56:                              // %for.body.i444
                                        //   in Loop: Header=BB27_55 Depth=4
	{
		p2 = r0
		if (!p2.new) jump:nt .LBB27_60
		if (p2.new) r3 = memw(r21+#0)
		if (p2.new) r2 = memw(r20+#0)
	}
// %bb.57:                              // %for.inc.i447
                                        //   in Loop: Header=BB27_55 Depth=4
	{
		r4 = add(r2,#1)
		memw(r20+#0) = r4.new
	}
	{
		p1 = cmp.gt(r3,r4); if (p1.new) jump:t .LBB27_55
		if (!p1.new) r2 = memw(r17+#24)
	}
	.falign
.LBB27_59:                              // %for.end.i448
                                        //   in Loop: Header=BB27_54 Depth=3
	{
		r4 = sub(r2,r22)
		r18 = add(r18,#1)
		memw(r20+#0) = #0
	}
	{
		r4 = #0
		p0 = cmp.gt(r4,r18); if (p0.new) jump:t .LBB27_54
	}
	{
		jump .LBB27_61
	}
	.falign
.LBB27_60:                              // %while.end145
                                        //   in Loop: Header=BB27_52 Depth=2
	{
		p2 = cmp.eq(r18,#0)
		if (p2.new) r19 = #0
		if (p2.new) jump:nt .LBB27_64
	}
	.falign
.LBB27_61:                              // %if.end148
                                        //   in Loop: Header=BB27_52 Depth=2
	{
		r3 = r18
		r5 = r17
		r2 = memw(r17+#20)
		r1 = memw(r17+#0)
	}
	{
		r0 = memw(r17+#60)
		r4 = memw(r17+#4)
	}
	{
		call ##halide_do_loop_task
		r2 = add(r2,r22)
	}
	.falign
// %bb.62:                              // %if.end148
                                        //   in Loop: Header=BB27_52 Depth=2
	{
		r22 = add(r18,r22)
		r18 = #0
		p1 = cmp.eq(r0,#0); if (p1.new) jump:t .LBB27_52
	}
// %bb.63:                              //   in Loop: Header=BB27_1 Depth=1
	{
		p2 = and(p2,!p2)
		r19 = r0
	}
	{
		r2 = p2
		jump .LBB27_65
		memw(r29+#0) = r2.new
	}                                       // 4-byte Folded Spill
	.falign
.LBB27_64:                              //   in Loop: Header=BB27_1 Depth=1
	{
		p1 = or(p1,!p1)
	}
	{
		r2 = p1
		memw(r29+#0) = r2.new
	}                                       // 4-byte Folded Spill
	.falign
.LBB27_65:                              // %while.end155
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		call ##halide_mutex_lock
		r0 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
// %bb.66:                              // %while.end155
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r17+#24)
		memw(r17+#20) += r22
	}
	{
		r3 = memw(r29+#0)
	}                                       // 4-byte Folded Reload
	{
		r2 = sub(r2,r22)
		memw(r17+#24) = r2.new
	}
	{
		p0 = r3
		if (!p0.new) jump:t .LBB27_87
		if (!p0.new) memw(r17+#24) = #0
	}
// %bb.67:                              // %if.else166
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p0 = and(p0,!p0)
		p2 = cmp.gt(r2,#0)
		if (!p2.new) jump:nt .LBB27_93
	}
// %bb.68:                              // %if.then170
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p0 = and(p0,!p0)
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r3 = memw(r2+#12)
		memw(r17+#40) = r3.new
	}
	{
		jump .LBB27_93
		memw(r2+#12) = r17
	}
	.falign
.LBB27_69:                              // %if.else174
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r17+#24)
		r18 = memw(r17+#20)
	}
	{
		r19 = memw(r17+#0)
		r22 = memw(r17+#60)
	}
	{
		r2 = add(r2,#-1)
		r20 = memw(r17+#4)
		memw(r17+#24) = r2.new
	}
	{
		p0 = cmp.eq(r2,#0)
		r2 = add(r18,#1)
		r21 = memw(r17+#36)
		memw(r17+#20) = r2.new
	}
	{
		if (p0) r2 = memw(r17+#40)
		if (p0) memw(r26+#0) = r2.new
	}
	{
		call ##halide_mutex_unlock
		r0 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
// %bb.70:                              // %if.else174
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p1 = cmp.eq(r21,#0); if (p1.new) jump:nt .LBB27_83
		r1 = r19
		r0 = r22
	}
// %bb.71:                              // %if.then188
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		call ##halide_do_task
		r1 = r21
		r3:2 = combine(r20,r18)
	}
	.falign
// %bb.72:                              // %if.then188
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r19 = r0 ; jump .LBB27_85
	}
	.falign
.LBB27_73:                              // %if.else97
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r3 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = memw(r3+#20)
		r4 = memw(r3+#24)
	}
	{
		memw(r3+#40) += #1
	}
	{
		if (p0.new) r2 = add(r2,#-1)
		p0 = cmp.gt(r2,r4); if (!p0.new) jump:t .LBB27_78
	}
// %bb.74:                              // %if.then100
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r17 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r0 = add(r17,#32)
		r1 = r17
		memw(r17+#20) = r2
	}
	{
		call ##halide_cond_wait
	}
	.falign
// %bb.75:                              // %if.then100
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		jump .LBB27_101
		memw(r17+#20) += #1
	}
	.falign
.LBB27_76:                              // %if.else93
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r17 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r1 = r17
		r0 = add(r17,#36)
		memw(r17+#44) += #1
	}
	{
		call ##halide_cond_wait
		memb(r16+#76) = r25
	}
	.falign
// %bb.77:                              // %if.else93
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		memb(r16+#76) = r23
	}
	{
		jump .LBB27_1
		memw(r17+#44) -= #1
	}
	.falign
.LBB27_78:                              // %if.else103
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p2 = cmp.gt(r18,#39)
		r18 = add(r18,#1)
		if (p2.new) jump:t .LBB27_100
	}
// %bb.79:                              // %if.then106
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r17 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_unlock
		r0 = r17
	}
	.falign
// %bb.80:                              // %if.then106
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		call ##halide_thread_yield
	}
	.falign
// %bb.81:                              // %if.then106
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	.falign
// %bb.82:                              // %if.then106
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		jump .LBB27_101
	}
	.falign
.LBB27_83:                              // %if.else196
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r3:2 = combine(#1,r18)
		r5:4 = combine(r17,r20)
	}
	{
		call ##halide_do_loop_task
	}
	.falign
// %bb.84:                              // %if.else196
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r19 = r0
	}
	.falign
.LBB27_85:                              // %if.end206
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		call ##halide_mutex_lock
		r0 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
// %bb.86:                              // %if.end206
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p0 = and(p0,!p0)
		p2 = cmp.eq(r19,#0)
		if (p2.new) jump:nt .LBB27_93
	}
	.falign
.LBB27_87:                              // %if.then211
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p0 = and(p0,!p0)
		r3 = memw(r17+#48)
		memw(r17+#68) = r19
	}
	{
		p1 = cmp.gt(r3,#0); if (!p1.new) jump:nt .LBB27_93
		r2 = #0
		r5 = memw(r17+#44)
	}
// %bb.88:                              // %for.body.lr.ph
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		loop0(.LBB27_89,r3)
		r4 = #0
	}
	{
		r3 = add(r5,#68)
	}
	.falign
.Ltmp2:                                 // Block address taken
.LBB27_89:                              // %for.body
                                        //   Parent Loop BB27_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r5 = memw(r3+#0)
		if (cmp.eq(r5.new,#0)) jump:nt .LBB27_91
	}
// %bb.90:                              // %for.inc
                                        //   in Loop: Header=BB27_89 Depth=2
	{
		r2 = and(r4,#1)
		r3 = add(r3,#80)
	} :endloop0
	{
		jump .LBB27_92
	}
	.falign
.LBB27_91:                              // %if.then217
                                        //   in Loop: Header=BB27_89 Depth=2
	{
		r4 = memw(r17+#64)
		memw(r3+#0) = r19
	}
	{
		p2 = cmp.eq(r4,#0)
		r4 = #0
	}
	{
		if (p2) r4 = memub(r3+#8)
	}
	{
		r4 = or(r2,r4)
	}
	{
		r2 = and(r4,#1)
		r3 = add(r3,#80)
	} :endloop0
	.falign
.LBB27_92:                              // %for.cond.if.end236.loopexit_crit_edge
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		p1 = cmp.eq(r2,#0)
	}
	{
		p0 = not(p1)
	}
	.falign
.LBB27_93:                              // %if.end236
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r17+#52)
		r3 = memw(r17+#28)
	}
	{
		r4 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		p2 = cmp.eq(r2,#0)
	}
	{
		if (p2) r4 = add(r4,##1076)
		if (!p2) r4 = add(r2,#56)
	}
	{
		memw(r4+#0) -= r3
	}
	{
		r2 = memw(r17+#64)
	}
	{
		r2 = add(r2,#-1)
		if (!p0) jump:nt .LBB27_96
		memw(r17+#64) = r2.new
	}
	.falign
.LBB27_94:                              // %if.then266
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_cond_broadcast
		r0 = add(r2,#36)
	}
	.falign
// %bb.95:                              // %if.then266
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r18 = #0 ; jump .LBB27_1
	}
	.falign
.LBB27_96:                              // %lor.lhs.false253
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r18 = #0
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:t .LBB27_1
	}
// %bb.97:                              // %land.lhs.true256
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r18 = #0
		r2 = memw(r17+#24)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB27_99
	}
// %bb.98:                              // %lor.lhs.false260
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r17+#68)
		if (cmp.eq(r2.new,#0)) jump:t ##.LBB27_1
	}
	.falign
.LBB27_99:                              // %land.lhs.true263
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r18 = #0
		r2 = memb(r17+#76)
		if (cmp.eq(r2.new,#0)) jump:t ##.LBB27_1
	}
	{
		jump .LBB27_94
	}
	.falign
.LBB27_100:                             // %if.else107
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r1 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_cond_wait
		r0 = add(r1,#28)
	}
	.falign
.LBB27_101:                             // %if.end109
                                        //   in Loop: Header=BB27_1 Depth=1
	{
		r2 = memw(r24+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		jump .LBB27_1
		memw(r2+#40) -= #1
	}
	.falign
.LBB27_102:                             // %while.end272
	{
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#40)
		r23:22 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#24)
		r27:26 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end27:
	.size	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE, .Lfunc_end27-_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
                                        // -- End function
	.section	.text.halide_mutex_unlock,"ax",@progbits
	.weak	halide_mutex_unlock             // -- Begin function halide_mutex_unlock
	.falign
	.type	halide_mutex_unlock,@function
halide_mutex_unlock:                    // @halide_mutex_unlock
// %bb.0:                               // %entry
	{
		r2 = #0
		allocframe(#24)
	}
	.falign
.LBB28_1:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		if (!p0.new) r2 = #0
		p0 = cmp.eq(r3,#1); if (!p0.new) jump:nt .LBB28_5
	}
// %bb.2:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB28_1 Depth=1
	{
		memw_locked(r0,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB28_1
	}
	.falign
.LBB28_3:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB28_5:                               // %cmpxchg.start9
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		if (!p0.new) r1 = add(r29,#4)
		p0 = cmp.eq(r3,#1); if (!p0.new) jump:nt .LBB28_7
	}
// %bb.6:                               // %cmpxchg.trystore7
                                        //   in Loop: Header=BB28_5 Depth=1
	{
		memw_locked(r0,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB28_5
	}
	{
		jump .LBB28_3
	}
	.falign
.LBB28_7:                               // %if.end.i.i
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOT)
		memw(r29+#8) = r3.new
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOT)
		memw(r29+#16) = r3.new
	}
	{
		memw(r29+#20) = r0
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOT)
		memw(r29+#4) = r3.new
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOT)
		memw(r29+#12) = r2.new
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE
	}
	.falign
// %bb.8:                               // %if.end.i.i
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end28:
	.size	halide_mutex_unlock, .Lfunc_end28-halide_mutex_unlock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv: // @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end29:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, .Lfunc_end29-_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end30:
	.size	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end30-_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		r2 = memw(r0+#16)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		r0 = cmp.eq(r2,#3)
		jumpr r31
	}
.Lfunc_end31:
	.size	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end31-_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
// %bb.0:                               // %entry
	{
		p0 = tstbit(r2,#0)
		r0 = #0
		r3 = memw(r0+#16)
	}
	{
		r2 = mux(p0,#2,#0)
		memw(r3+#0) = r2.new
	}
	{
		barrier
	}
	{
		jumpr r31
	}
.Lfunc_end32:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, .Lfunc_end32-_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE: // @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj
		r19:18 = combine(r0,r1)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r5 = add(r0,#4)
		r6 = #0
		r16 = r0
		r2 = memw(r0+#4)
	}
	.falign
.LBB33_2:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = r6
		r17 = r2
		p1 = cmp.eq(r2,#0); if (p1.new) jump:nt .LBB33_8
		if (!p1.new) r2 = memw(r2+#40)
	}
// %bb.3:                               // %while.body
                                        //   in Loop: Header=BB33_2 Depth=1
	{
		r4 = r5
		r6 = r17
	}
	{
		r5 = add(r17,#44)
	}
	{
		p0 = cmp.eq(r2,r19); if (!p0.new) jump:t .LBB33_2
		r2 = memw(r17+#44)
	}
// %bb.4:                               // %if.then
	{
		memw(r4+#0) = r2
	}
	{
		p0 = and(p0,!p0)
		r4 = memw(r16+#8)
		if (cmp.eq(r4.new,r17)) jump:nt .LBB33_14
	}
// %bb.5:                               // %while.cond6.preheader
	{
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB33_15
	}
	.falign
.LBB33_6:                               // %while.body8
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw(r2+#40)
	}
	{
		p0 = cmp.eq(r3,r19)
		r2 = memw(r2+#44)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB33_16
	}
// %bb.7:                               // %while.body8
                                        //   in Loop: Header=BB33_6 Depth=1
	{
		p1 = cmp.eq(r3,r19); if (!p1.new) jump:t .LBB33_6
	}
	{
		jump .LBB33_16
	}
	.falign
.LBB33_8:                               // %while.end21
	{
		r2 = #0
		r1:0 = combine(#0,r18)
		r3 = memw(r18+#8)
	}
	{
		callr r3
	}
	.falign
.LBB33_9:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r16)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r16,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB33_9
	}
// %bb.10:                              // %atomicrmw.end1
	{
		r19 = #0
		p0 = cmp.gtu(r3,#3); if (!p0.new) jump:nt .LBB33_13
	}
// %bb.11:                              // %atomicrmw.end1
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB33_13
	}
// %bb.12:                              // %if.then.i
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r16
	}
	.falign
.LBB33_13:                              // %cleanup25
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB33_14:                              // %if.then4
	{
		jump .LBB33_16
		memw(r16+#8) = r3
	}
	.falign
.LBB33_15:
	{
		p0 = and(p0,!p0)
	}
	.falign
.LBB33_16:                              // %cleanup.thread
	{
		r1:0 = combine(#1,r18)
		r19 = mux(p0,#1,#0)
		r3 = memw(r18+#8)
	}
	{
		r2 = r19
		callr r3
	}
	.falign
// %bb.17:                              // %cleanup.thread
	{
		call ##qurt_mutex_lock
		r0 = r17
		memw(r17+#48) = r0
	}
	.falign
.LBB33_18:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r16)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r16,p0) = r2
	}
	{
		if (!p0) jump:nt .LBB33_18
	}
// %bb.19:                              // %atomicrmw.end
	{
		p1 = cmp.gtu(r3,#3); if (!p1.new) jump:nt .LBB33_22
	}
// %bb.20:                              // %atomicrmw.end
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB33_22
	}
// %bb.21:                              // %if.then.i73
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r16
	}
	.falign
.LBB33_22:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit74
	{
		call ##qurt_cond_signal
		r0 = add(r17,#16)
		memb(r17+#32) = #0
	}
	.falign
// %bb.23:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit74
	{
		call ##qurt_mutex_unlock
		r0 = r17
	}
	.falign
// %bb.24:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit74
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end33:
	.size	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE, .Lfunc_end33-_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj,@function
_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj: // @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj
// %bb.0:                               // %entry
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r4 = +mpyi(r0,##-1640531527)
	}
	{
		r2 = #1
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r4 = lsr(r4,#22)
		r16 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOT)
	}
	{
		r16 += mpyi(r4,#12)
	}
	.falign
.LBB34_1:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r16)
	}
	{
		if (!p0.new) r0 = add(r16,#0)
		p0 = cmp.eq(r3,#0); if (!p0.new) jump:nt .LBB34_4
	}
// %bb.2:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB34_1 Depth=1
	{
		memw_locked(r16,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB34_1
	}
// %bb.3:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB34_4:                               // %if.then.i
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
	.falign
// %bb.5:                               // %if.then.i
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end34:
	.size	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj, .Lfunc_end34-_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		r2 = memw(r0+#0)
	}
	{
		memd(r29+#16) = r19:18
		memd(r29+#8) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#0) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
.LBB35_1:                               // %while.cond
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB35_4 Depth 2
	{
		r19 = r2
		r0 = and(r2,#2)
		p1 = cmp.gtu(r2,#3); if (!p1.new) jump:nt .LBB35_25
	}
// %bb.2:                               // %while.cond
                                        //   in Loop: Header=BB35_1 Depth=1
	{
		r3 = setbit(r19,#1)
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:nt .LBB35_25
	}
	.falign
.LBB35_4:                               // %cmpxchg.start
                                        //   Parent Loop BB35_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r2 = memw_locked(r16)
	}
	{
		p0 = cmp.eq(r2,r19); if (!p0.new) jump:nt .LBB35_6
	}
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB35_4 Depth=2
	{
		memw_locked(r16,p1) = r3
	}
	{
		if (!p1) jump:nt .LBB35_4
	}
	.falign
.LBB35_6:                               // %cmpxchg.end
                                        //   in Loop: Header=BB35_1 Depth=1
	{
		if (!p0) jump:nt .LBB35_1
	}
// %bb.7:
	{
		r17 = add(pc,##.L.str.9@PCREL)
	}
	.falign
.LBB35_8:                               // %while.cond11
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB35_9 Depth 2
                                        //     Child Loop BB35_21 Depth 2
                                        //     Child Loop BB35_15 Depth 2
                                        //       Child Loop BB35_16 Depth 3
	{
		r20 = and(r19,#-4)
	}
	{
		r21 = r20
	}
	{
		r18 = memw(r20+#48)
		if (!cmp.eq(r18.new,#0)) jump:t .LBB35_13
	}
	.falign
.LBB35_9:                               // %while.body17
                                        //   Parent Loop BB35_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r22 = memw(r21+#40)
		if (!cmp.eq(r22.new,#0)) jump:t .LBB35_12
	}
// %bb.10:                              // %if.then20
                                        //   in Loop: Header=BB35_9 Depth=2
	{
		call ##halide_print
		r1:0 = combine(r17,#0)
	}
	.falign
// %bb.11:                              // %if.then20
                                        //   in Loop: Header=BB35_9 Depth=2
	{
		call ##abort
	}
	.falign
.LBB35_12:                              // %do.end
                                        //   in Loop: Header=BB35_9 Depth=2
	{
		r21 = r22
		r18 = memw(r22+#48)
		memw(r22+#44) = r21
	}
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:t .LBB35_9
	}
	.falign
.LBB35_13:                              // %while.end23
                                        //   in Loop: Header=BB35_8 Depth=1
	{
		p1 = tstbit(r19,#0); if (p1.new) jump:t .LBB35_20
		memw(r20+#48) = r18
	}
// %bb.14:                              // %if.end35
                                        //   in Loop: Header=BB35_8 Depth=1
	{
		r2 = memw(r18+#44)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB35_26
	}
	.falign
.LBB35_15:                              // %while.body41
                                        //   Parent Loop BB35_8 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB35_16 Depth 3
	{
		r3 = and(r19,#1)
	}
	.falign
.LBB35_16:                              // %cmpxchg.start27
                                        //   Parent Loop BB35_8 Depth=1
                                        //     Parent Loop BB35_15 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = memw_locked(r16)
	}
	{
		p0 = cmp.eq(r2,r19); if (!p0.new) jump:nt .LBB35_18
	}
// %bb.17:                              // %cmpxchg.trystore25
                                        //   in Loop: Header=BB35_16 Depth=3
	{
		memw_locked(r16,p1) = r3
	}
	{
		if (!p1) jump:nt .LBB35_16
	}
	.falign
.LBB35_18:                              // %cmpxchg.end20
                                        //   in Loop: Header=BB35_15 Depth=2
	{
		if (!p0) r19 = add(r2,#0)
		if (p0) jump:nt .LBB35_28
	}
// %bb.19:                              // %if.end47
                                        //   in Loop: Header=BB35_15 Depth=2
	{
		p0 = cmp.gtu(r2,#3); if (!p0.new) jump:t .LBB35_15
	}
	{
		jump .LBB35_24
	}
	.falign
.LBB35_20:                              // %if.then27
                                        //   in Loop: Header=BB35_8 Depth=1
	{
		r3 = clrbit(r19,#1)
	}
	.falign
.LBB35_21:                              // %cmpxchg.start10
                                        //   Parent Loop BB35_8 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r2 = memw_locked(r16)
	}
	{
		p1 = cmp.eq(r2,r19); if (!p1.new) jump:nt .LBB35_23
	}
// %bb.22:                              // %cmpxchg.trystore8
                                        //   in Loop: Header=BB35_21 Depth=2
	{
		memw_locked(r16,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB35_21
	}
	.falign
.LBB35_23:                              // %cmpxchg.end3
                                        //   in Loop: Header=BB35_8 Depth=1
	{
		if (p1) jump:nt .LBB35_25
	}
	.falign
.LBB35_24:                              // %cleanup70
                                        //   in Loop: Header=BB35_8 Depth=1
	{
		barrier
	}
	{
		r19 = r2 ; jump .LBB35_8
	}
	.falign
.LBB35_25:                              // %cleanup76
	{
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#8)
		r23:22 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB35_26:                              // %if.else62
	{
		memw(r20+#48) = r2
	}
	.falign
.LBB35_27:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r16)
	}
	{
		r2 = clrbit(r2,#1)
	}
	{
		memw_locked(r16,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB35_27
	}
	.falign
.LBB35_28:                              // %cleanup70.thread
	{
		call ##qurt_mutex_lock
		r0 = r18
	}
	.falign
// %bb.29:                              // %cleanup70.thread
	{
		call ##qurt_cond_signal
		r0 = add(r18,#16)
		memb(r18+#32) = #0
	}
	.falign
// %bb.30:                              // %cleanup70.thread
	{
		r0 = r18
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#8)
		r23:22 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##qurt_mutex_unlock
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end35:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv, .Lfunc_end35-_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
// %bb.0:                               // %entry
	{
		r17:16 = combine(#40,r0)
		memd(r29+#-16) = r17:16
		allocframe(#88)
	}                                       // 8-byte Folded Spill
	{
		r20 = #-4
		r21 = memw(r0+#0)
		memd(r29+#64) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(#0,#0)
		memd(r29+#72) = r19:18
		memd(r29+#56) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
.LBB36_1:                               // %while.cond
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB36_16 Depth 2
                                        //     Child Loop BB36_21 Depth 2
                                        //     Child Loop BB36_3 Depth 2
	{
		r2 = setbit(r21,#0)
		if (p0.new) r22 = add(r17,#0)
		p0 = tstbit(r21,#0); if (p0.new) jump:nt .LBB36_6
	}
	.falign
.LBB36_3:                               // %cmpxchg.start
                                        //   Parent Loop BB36_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3 = memw_locked(r16)
	}
	{
		p1 = cmp.eq(r3,r21); if (!p1.new) jump:nt .LBB36_5
	}
// %bb.4:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB36_3 Depth=2
	{
		memw_locked(r16,p0) = r2
	}
	{
		if (!p0) jump:nt .LBB36_3
	}
	.falign
.LBB36_5:                               // %cmpxchg.end
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		r21 = r3
		if (!p1) jump:nt .LBB36_1
	}
	{
		jump .LBB36_28
	}
	.falign
.LBB36_6:                               // %if.end4
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		if (p1.new) r22 = #0
		p1 = cmp.gt(r17,#0); if (!p1.new) jump:nt .LBB36_13
	}
// %bb.7:                               // %if.end4
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		if (!p0.new) r22 = add(r17,#0)
		p0 = cmp.gtu(r21,#3); if (!p0.new) jump:nt .LBB36_13
	}
// %bb.8:                               // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		if (p1.new) r17 = add(r17,#-1)
		p1 = cmp.gt(r17,#1); if (!p1.new) jump:t .LBB36_13
	}
// %bb.9:                               // %if.then7
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		call ##halide_thread_yield
	}
	.falign
// %bb.10:                              // %if.then7
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		jump .LBB36_1
		r21 = memw(r16+#0)
	}
	.falign
.LBB36_13:                              // %if.end9
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		r17 = add(r29,#0)
		memb(r29+#32) = #0
	}
	{
		call ##qurt_mutex_init
		r0 = r17
	}
	.falign
// %bb.14:                              // %if.end9
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		r17 = add(r17,#16)
	}
	{
		call ##qurt_cond_init
		r0 = r17
	}
	.falign
// %bb.15:                              // %if.end9
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		p0 = !bitsclr(r21,r20)
		r3 = and(r21,#-4)
		r2 = r21
		memd(r29+#40) = r19:18
	}
	{
		r3 = add(r29,#0)
		if (p0) memw(r29+#40) = r3
		memw(r29+#48) = #0
	}
	{
		r2 = or(r3,and(r2,#3))
		memb(r29+#32) = #1
		if (!p0) memw(r29+#48) = r3
	}
	.falign
.LBB36_16:                              // %cmpxchg.start9
                                        //   Parent Loop BB36_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r23 = memw_locked(r16)
	}
	{
		p0 = cmp.eq(r23,r21); if (!p0.new) jump:nt .LBB36_18
	}
// %bb.17:                              // %cmpxchg.trystore7
                                        //   in Loop: Header=BB36_16 Depth=2
	{
		memw_locked(r16,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB36_16
	}
	.falign
.LBB36_18:                              // %cmpxchg.end2
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		if (p0) r0 = add(r29,#0)
		if (!p0) jump:nt .LBB36_25
	}
// %bb.19:                              // %if.then19
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		call ##qurt_mutex_lock
	}
	.falign
// %bb.20:                              // %if.then19
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		r2 = memb(r29+#32)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB36_23
	}
	.falign
.LBB36_21:                              // %while.body.i
                                        //   Parent Loop BB36_1 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		call ##qurt_cond_wait
		r1 = add(r29,#0)
		r0 = r17
	}
	.falign
// %bb.22:                              // %while.body.i
                                        //   in Loop: Header=BB36_21 Depth=2
	{
		r2 = memb(r29+#32)
		if (!cmp.eq(r2.new,#0)) jump:t .LBB36_21
	}
	.falign
.LBB36_23:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		call ##qurt_mutex_unlock
		r0 = add(r29,#0)
	}
	.falign
// %bb.24:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		r22 = #40
		r23 = memw(r16+#0)
	}
	.falign
.LBB36_25:                              // %if.end22
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		call ##qurt_cond_destroy
		r0 = r17
	}
	.falign
// %bb.26:                              // %if.end22
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		call ##qurt_mutex_destroy
		r0 = add(r29,#0)
	}
	.falign
// %bb.27:                              // %if.end22
                                        //   in Loop: Header=BB36_1 Depth=1
	{
		r17 = r22 ; jump .LBB36_1
		r21 = r23
	}
	.falign
.LBB36_28:                              // %cleanup23
	{
		r17:16 = memd(r29+#80)
		r19:18 = memd(r29+#72)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#64)
		r23:22 = memd(r29+#56)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end36:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv, .Lfunc_end36-_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
                                        // -- End function
	.section	.text.halide_cond_broadcast,"ax",@progbits
	.weak	halide_cond_broadcast           // -- Begin function halide_cond_broadcast
	.falign
	.type	halide_cond_broadcast,@function
halide_cond_broadcast:                  // @halide_cond_broadcast
// %bb.0:                               // %entry
	{
		r1 = memw(r0+#0)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB37_3
	}
// %bb.1:                               // %if.end.i
	{
		r4 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#24):raw
	}
	{
		r2 = add(r29,#0)
	}
	{
		r3 = memw(r4+##_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOT)
		memw(r29+#4) = r3.new
	}
	{
		r3 = memw(r4+##_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib@GOT)
		memw(r29+#8) = r3.new
	}
	{
		r3 = #0
		memw(r29+#16) = r0
		memw(r29+#20) = r1
	}
	{
		r5 = memw(r4+##_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE@GOT)
		memw(r29+#0) = r5.new
	}
	{
		r4 = memw(r4+##_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOT)
		memw(r29+#12) = r4.new
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj
	}
	.falign
// %bb.2:                               // %if.end.i
	{
		r31:30 = deallocframe(r30):raw
	}
	.falign
.LBB37_3:                               // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit
	{
		jumpr r31
	}
.Lfunc_end37:
	.size	halide_cond_broadcast, .Lfunc_end37-halide_cond_broadcast
                                        // -- End function
	.section	.text.halide_default_semaphore_try_acquire,"ax",@progbits
	.weak	halide_default_semaphore_try_acquire // -- Begin function halide_default_semaphore_try_acquire
	.falign
	.type	halide_default_semaphore_try_acquire,@function
halide_default_semaphore_try_acquire:   // @halide_default_semaphore_try_acquire
// %bb.0:                               // %entry
	{
		p0 = or(p0,!p0)
		p1 = cmp.eq(r1,#0); if (p1.new) jump:nt .LBB38_6
	}
// %bb.1:                               // %if.end
	{
		barrier
	}
	{
		p1 = and(p1,!p1)
		r2 = memw(r0+#0)
	}
	.falign
.LBB38_2:                               // %do.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB38_3 Depth 2
	{
		r3 = sub(r2,r1)
		if (!cmp.gt(r3.new,#-1)) jump:nt .LBB38_7
	}
	.falign
.LBB38_3:                               // %cmpxchg.start
                                        //   Parent Loop BB38_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r4 = memw_locked(r0)
	}
	{
		p2 = cmp.eq(r4,r2)
		if (!p2.new) jump:nt .LBB38_5
	}
// %bb.4:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB38_3 Depth=2
	{
		memw_locked(r0,p3) = r3
	}
	{
		if (!p3) jump:nt .LBB38_3
	}
	.falign
.LBB38_5:                               // %cmpxchg.end
                                        //   in Loop: Header=BB38_2 Depth=1
	{
		r2 = r4
		if (!p2) jump:nt .LBB38_2
	}
	.falign
.LBB38_6:                               // %return
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
	.falign
.LBB38_7:
	{
		p0 = or(p1,p1)
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
.Lfunc_end38:
	.size	halide_default_semaphore_try_acquire, .Lfunc_end38-halide_default_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_cond_wait,"ax",@progbits
	.weak	halide_cond_wait                // -- Begin function halide_cond_wait
	.falign
	.type	halide_cond_wait,@function
halide_cond_wait:                       // @halide_cond_wait
// %bb.0:                               // %entry
	{
		r17 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#64)
	}                                       // 8-byte Folded Spill
	{
		r16 = r1
	}
	{
		memd(r29+#48) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r1 = add(r29,#4)
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOT)
		memw(r29+#24) = r1

	} :mem_noshuf
	{
		memw(r29+#16) = r2
		memw(r29+#20) = r0
	}
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE@GOT)
		memw(r29+#4) = r2.new
	}
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv@GOT)
		memw(r29+#8) = r2.new
	}
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib@GOT)
		memw(r29+#12) = r2.new
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE
	}
	.falign
// %bb.1:                               // %entry
	{
		r2 = #1
		p0 = cmp.eq(r0,r16); if (!p0.new) jump:t .LBB39_7
	}
// %bb.2:                               // %if.else.i
	{
		r2 = memw(r16+#0)
	}
	{
		if (!p1.new) r0 = #0
		p1 = tstbit(r2,#0); if (p1.new) jump:t .LBB39_9
	}
// %bb.3:                               // %if.then2.i
	{
		r1 = add(pc,##.L.str.6@PCREL)
		call ##halide_print
	}
	.falign
// %bb.4:                               // %if.then2.i
	{
		call ##abort
	}
	.falign
// %bb.5:                               // %if.then2.i
	{
		jump .LBB39_9
	}
	.falign
.LBB39_7:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r16)
	}
	{
		p1 = cmp.eq(r3,#0); if (!p1.new) jump:nt .LBB39_10
	}
// %bb.8:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB39_7 Depth=1
	{
		memw_locked(r16,p0) = r2
	}
	{
		if (!p0) jump:nt .LBB39_7
	}
	.falign
.LBB39_9:                               // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit
	{
		r17:16 = memd(r29+#56)
		r19:18 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB39_10:                              // %if.then.i.i
	{
		r18 = #40
		r3 = memw(r16+#0)
	}
	.falign
.LBB39_11:                              // %while.cond.outer.i.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB39_12 Depth 2
                                        //       Child Loop BB39_14 Depth 3
                                        //     Child Loop BB39_21 Depth 2
	{
		r2 = r3
	}
	.falign
.LBB39_12:                              // %while.cond.i.i.i
                                        //   Parent Loop BB39_11 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB39_14 Depth 3
	{
		r3 = setbit(r2,#0)
		if (p1.new) r4 = add(r18,#0)
		p1 = tstbit(r2,#0); if (p1.new) jump:nt .LBB39_17
	}
	.falign
.LBB39_14:                              // %cmpxchg.start9
                                        //   Parent Loop BB39_11 Depth=1
                                        //     Parent Loop BB39_12 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r4 = memw_locked(r16)
	}
	{
		p1 = cmp.eq(r4,r2); if (!p1.new) jump:nt .LBB39_16
	}
// %bb.15:                              // %cmpxchg.trystore7
                                        //   in Loop: Header=BB39_14 Depth=3
	{
		memw_locked(r16,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB39_14
	}
	.falign
.LBB39_16:                              // %cmpxchg.end2
                                        //   in Loop: Header=BB39_12 Depth=2
	{
		r2 = r4
		if (!p1) jump:nt .LBB39_12
	}
	{
		jump .LBB39_9
	}
	.falign
.LBB39_17:                              // %if.end4.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		p1 = cmp.gt(r18,#0); if (p1.new) jump:nt .LBB39_27
	}
	.falign
.LBB39_19:                              // %if.end8.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		r5 = setbit(r2,#1)
		p1 = tstbit(r2,#1)
		if (p1.new) jump:t .LBB39_24
	}
	.falign
.LBB39_21:                              // %cmpxchg.start26
                                        //   Parent Loop BB39_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r3 = memw_locked(r16)
	}
	{
		p0 = cmp.eq(r3,r2); if (!p0.new) jump:nt .LBB39_23
	}
// %bb.22:                              // %cmpxchg.trystore24
                                        //   in Loop: Header=BB39_21 Depth=2
	{
		memw_locked(r16,p1) = r5
	}
	{
		if (!p1) jump:nt .LBB39_21
	}
	.falign
.LBB39_23:                              // %cmpxchg.end19
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		r18 = r4
		if (!p0) jump:nt .LBB39_11
	}
	.falign
.LBB39_24:                              // %if.end19.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		r1 = add(r29,#28)
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOT)
		memw(r29+#32) = r2.new
	}
	{
		r0 = r16
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOT)
		memw(r29+#40) = r2.new
	}
	{
		memw(r29+#44) = r16
	}
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOT)
		memw(r29+#28) = r2.new
	}
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOT)
		memw(r29+#36) = r2.new
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE
	}
	.falign
// %bb.25:                              // %if.end19.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		r18 = #40
		p0 = cmp.eq(r0,r16); if (p0.new) jump:nt .LBB39_9
		if (!p0.new) r3 = memw(r16+#0)
	}
// %bb.26:                              // %cleanup26.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		jump .LBB39_11
	}
	.falign
.LBB39_27:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		if (!p0.new) r18 = add(r18,#-1)
		r4 = #0
		p0 = cmp.eq(r18,#1); if (p0.new) jump:t .LBB39_19
	}
// %bb.28:                              // %if.then6.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		call ##halide_thread_yield
	}
	.falign
// %bb.29:                              // %if.then6.i.i.i
                                        //   in Loop: Header=BB39_11 Depth=1
	{
		jump .LBB39_11
		r3 = memw(r16+#0)
	}
.Lfunc_end39:
	.size	halide_cond_wait, .Lfunc_end39-halide_cond_wait
                                        // -- End function
	.section	.text.halide_do_loop_task,"ax",@progbits
	.weak	halide_do_loop_task             // -- Begin function halide_do_loop_task
	.balign 32
	.type	halide_do_loop_task,@function
halide_do_loop_task:                    // @halide_do_loop_task
// %bb.0:                               // %entry
	{
		r6 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r6 = memw(r6+##_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOT)
	}
	{
		r7 = memw(r6+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end40:
	.size	halide_do_loop_task, .Lfunc_end40-halide_do_loop_task
                                        // -- End function
	.section	.text.halide_do_task,"ax",@progbits
	.weak	halide_do_task                  // -- Begin function halide_do_task
	.balign 32
	.type	halide_do_task,@function
halide_do_task:                         // @halide_do_task
// %bb.0:                               // %entry
	{
		r4 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r4 = memw(r4+##_ZN6Halide7Runtime8Internal14custom_do_taskE@GOT)
	}
	{
		r7 = memw(r4+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end41:
	.size	halide_do_task, .Lfunc_end41-halide_do_task
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		p0 = or(p0,!p0)
		r2 = memw(r0+#16)
		r3 = memw(r0+#20)
	}
	{
		r4 = memw(r2+#0)
		if (cmp.eq(r4.new,#0)) jump:nt .LBB42_3
	}
// %bb.1:                               // %if.else
	{
		r2 = add(r1,#4)
		p0 = cmp.eq(r4,r3); if (!p0.new) jump:t .LBB42_4
	}
// %bb.2:
	{
		p0 = or(p0,!p0)
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
	.falign
.LBB42_3:
	{
		memw(r2+#0) = r3
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
	}
	.falign
.LBB42_4:                               // %if.then4
	{
		p0 = and(p0,!p0)
	}
	{
		r0 = mux(p0,#1,#0)
		jumpr r31
		memw(r2+#0) = r3
	}
.Lfunc_end42:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end42-_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv: // @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
// %bb.0:                               // %entry
	{
		r2 = #0
		allocframe(#24)
	}
	{
		r0 = memw(r0+#20)
	}
	.falign
.LBB43_1:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		if (!p0.new) r2 = #0
		p0 = cmp.eq(r3,#1); if (!p0.new) jump:nt .LBB43_5
	}
// %bb.2:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB43_1 Depth=1
	{
		memw_locked(r0,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB43_1
	}
	.falign
.LBB43_3:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB43_5:                               // %cmpxchg.start9
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		if (!p0.new) r1 = add(r29,#4)
		p0 = cmp.eq(r3,#1); if (!p0.new) jump:nt .LBB43_7
	}
// %bb.6:                               // %cmpxchg.trystore7
                                        //   in Loop: Header=BB43_5 Depth=1
	{
		memw_locked(r0,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB43_5
	}
	{
		jump .LBB43_3
	}
	.falign
.LBB43_7:                               // %if.end.i.i
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOT)
		memw(r29+#8) = r3.new
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOT)
		memw(r29+#16) = r3.new
	}
	{
		memw(r29+#20) = r0
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOT)
		memw(r29+#4) = r3.new
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOT)
		memw(r29+#12) = r2.new
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE
	}
	.falign
// %bb.8:                               // %if.end.i.i
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end43:
	.size	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv, .Lfunc_end43-_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
// %bb.0:                               // %entry
	{
		p0 = tstbit(r2,#0)
		r0 = #0
		if (!p0.new) r2 = memw(r0+#16)
	}
	{
		jumpr r31
		if (!p0) memw(r2+#0) = #0
	}
.Lfunc_end44:
	.size	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib, .Lfunc_end44-_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE: // @_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE
// %bb.0:                               // %entry
	{
		r17 = r1
		memd(r29+#-16) = r17:16
		allocframe(#88)
	}                                       // 8-byte Folded Spill
	{
		r16 = add(r29,#8)
	}
	{
		r19 = r0
		r0 = r16
		memd(r29+#72) = r19:18
		memd(r29+#64) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##qurt_mutex_init
		r20 = #0
		memb(r29+#40) = r20.new
	}
	.falign
// %bb.1:                               // %entry
	{
		r16 = add(r16,#16)
	}
	{
		call ##qurt_cond_init
		r0 = r16
	}
	.falign
// %bb.2:                               // %entry
	{
		r1:0 = combine(#0,#0)
		memb(r29+#40) = r20
		memw(r29+#56) = #0
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEj
		r0 = r19
		memd(r29+#48) = r1:0
	}
	.falign
// %bb.3:                               // %entry
	{
		r1 = add(r29,#0)
		r0 = r17
		r18 = r0
		r2 = memw(r17+#0)
	}
	{
		memb(r29+#0) = r20
		memw(r29+#4) = #0
	}
	{
		callr r2
	}
	.falign
// %bb.4:                               // %entry
	{
		p0 = r0
		if (!p0.new) jump:t .LBB45_17
		if (p0.new) memw(r29+#52) = #0
	}
// %bb.5:                               // %if.end
	{
		r2 = #1
		memb(r29+#40) = r2.new
	}
	{
		r0 = add(r29,#8)
		memw(r29+#48) = r19
	}
	{
		r2 = memw(r18+#4)
		r3 = memw(r18+#8)
	}
	{
		p0 = cmp.eq(r2,#0)
		if (p0.new) r2 = add(r18,#4)
		if (!p0.new) r2 = add(r3,#44)
	}
	{
		memw(r2+#0) = r0
		memw(r18+#8) = r0
	}
	.falign
.LBB45_6:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r18)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r18,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB45_6
	}
// %bb.7:                               // %atomicrmw.end1
	{
		p0 = cmp.gtu(r3,#3); if (!p0.new) jump:nt .LBB45_10
	}
// %bb.8:                               // %atomicrmw.end1
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB45_10
	}
// %bb.9:                               // %if.then.i26
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r18
	}
	.falign
.LBB45_10:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit27
	{
		r0 = r17
		r2 = memw(r17+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit27
	{
		call ##qurt_mutex_lock
		r0 = add(r29,#8)
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit27
	{
		r2 = memb(r29+#40)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB45_15
	}
	.falign
.LBB45_13:                              // %while.body.i
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##qurt_cond_wait
		r1 = add(r29,#8)
		r0 = r16
	}
	.falign
// %bb.14:                              // %while.body.i
                                        //   in Loop: Header=BB45_13 Depth=1
	{
		r2 = memb(r29+#40)
		if (!cmp.eq(r2.new,#0)) jump:t .LBB45_13
	}
	.falign
.LBB45_15:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	{
		call ##qurt_mutex_unlock
		r0 = add(r29,#8)
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	{
		jump .LBB45_22
		r17 = memw(r29+#56)
	}
	.falign
.LBB45_17:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r18)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r18,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB45_17
	}
// %bb.18:                              // %atomicrmw.end
	{
		p0 = cmp.gtu(r3,#3); if (!p0.new) jump:nt .LBB45_21
	}
// %bb.19:                              // %atomicrmw.end
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB45_21
	}
// %bb.20:                              // %if.then.i
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r18
	}
	.falign
.LBB45_21:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit
	{
		r17 = memw(r29+#4)
	}
	.falign
.LBB45_22:                              // %cleanup
	{
		call ##qurt_cond_destroy
		r0 = r16
	}
	.falign
// %bb.23:                              // %cleanup
	{
		call ##qurt_mutex_destroy
		r0 = add(r29,#8)
	}
	.falign
// %bb.24:                              // %cleanup
	{
		r0 = r17
		r17:16 = memd(r29+#80)
		r19:18 = memd(r29+#72)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#64)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end45:
	.size	_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE, .Lfunc_end45-_ZN6Halide7Runtime8Internal15Synchronization4parkEjRNS2_15parking_controlE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end46:
	.size	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib, .Lfunc_end46-_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		p1 = and(p1,!p1)
		r3 = memw(r0+#16)
		r4 = memw(r0+#20)
	}
	{
		r2 = memw(r3+#0)
		if (!cmp.eq(r2.new,r4)) jump:t .LBB47_8
	}
// %bb.1:                               // %if.end
	{
		memw(r3+#0) = #0
		r3 = memw(r2+#0)

	} :mem_noshuf
	.falign
.LBB47_2:                               // %while.cond.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB47_4 Depth 2
	{
		r5 = setbit(r3,#1)
		if (!p1.new) r2 = #1
		p1 = tstbit(r3,#0); if (!p1.new) jump:nt .LBB47_10
	}
	.falign
.LBB47_4:                               // %cmpxchg.start
                                        //   Parent Loop BB47_2 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r4 = memw_locked(r2)
	}
	{
		p0 = cmp.eq(r4,r3); if (!p0.new) jump:nt .LBB47_6
	}
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB47_4 Depth=2
	{
		memw_locked(r2,p1) = r5
	}
	{
		if (!p1) jump:nt .LBB47_4
	}
	.falign
.LBB47_6:                               // %cmpxchg.end
                                        //   in Loop: Header=BB47_2 Depth=1
	{
		if (!p0) jump:nt .LBB47_2
		r3 = r4 ; jump .LBB47_10
		if (p0) r2 = #0
	}
// %bb.7:
	.falign
.LBB47_8:
	{
		r0 = mux(p1,#1,#0)
		jumpr r31
	}
	.falign
.LBB47_10:                              // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit
	{
		p1 = or(p1,!p1)
		memb(r1+#0) = r2
	}
	{
		r0 = mux(p1,#1,#0)
		jumpr r31
	}
.Lfunc_end47:
	.size	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end47-_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	{
		r2 = memb(r1+#0)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB48_4
	}
// %bb.1:                               // %entry
	{
		p1 = tstbit(r3,#0); if (!p1.new) jump:nt .LBB48_4
		if (p1.new) r2 = memw(r0+#20)
	}
	.falign
.LBB48_3:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r2)
	}
	{
		r3 = setbit(r3,#1)
	}
	{
		memw_locked(r2,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB48_3
	}
	.falign
.LBB48_4:                               // %if.end
	{
		jumpr r31
	}
.Lfunc_end48:
	.size	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end48-_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj,@function
_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj: // @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r3)
		memd(r29+#-16) = r17:16
		allocframe(#56)
	}                                       // 8-byte Folded Spill
	{
		r19 = r1
		r20 = r0
		memd(r29+#40) = r19:18
		memd(r29+#32) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r1 = r20
		r0 = add(r29,#16)
		r2 = r19
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj
	}
	.falign
// %bb.1:                               // %entry
	{
		r0 = r17
		r1 = add(r29,#8)
		r2 = memw(r17+#0)
		memb(r29+#8) = #0
	}
	{
		memw(r29+#12) = #0
	}
	{
		callr r2
	}
	.falign
// %bb.2:                               // %entry
	{
		p0 = r0
		if (!p0.new) jump:t .LBB49_11
		r6 = #0
		r5 = #0
	}
// %bb.3:                               // %if.end
	{
		p0 = and(p0,!p0)
		r18 = #0
		r2 = memw(r29+#16)
	}
	{
		r4 = memw(r2+#4)
		if (cmp.eq(r4.new,#0)) jump:nt .LBB49_13
	}
// %bb.4:                               // %while.body.lr.ph
	{
		r3 = memb(r29+#8)
	}
	{
		r3 = add(r2,#4)
		if (!p1.new) r2 = #0
		p1 = cmp.eq(r3,#0); if (p1.new) jump:nt .LBB49_14
	}
	.falign
.LBB49_6:                               // %while.body.us
                                        // =>This Inner Loop Header: Depth=1
	{
		r7 = r4
		r4 = memw(r4+#40)
	}
	{
		if (!p1.new) r3 = add(r7,#44)
		p1 = cmp.eq(r4,r20); if (!p1.new) jump:t .LBB49_9
		r4 = memw(r7+#44)
	}
// %bb.7:                               // %if.then3.us
                                        //   in Loop: Header=BB49_6 Depth=1
	{
		p1 = cmp.eq(r18,#0)
		if (p1.new) r18 = add(r7,#0)
		memw(r3+#0) = r4
		r8 = memw(r29+#16)

	} :mem_noshuf
	{
		r9 = memw(r8+#8)
	}
	{
		p2 = cmp.eq(r9,r7)
		if (p1) jump:nt .LBB49_10
		if (p2.new) memw(r8+#8) = r6
	}
// %bb.8:                               // %if.else.us
                                        //   in Loop: Header=BB49_6 Depth=1
	{
		p1 = cmp.eq(r2,#0)
		r5 = r7
		if (p1.new) r2 = add(r7,#0)
		if (!p1.new) memw(r5+#44) = r7
	}
	{
		p1 = cmp.eq(r4,#0); if (!p1.new) jump:t .LBB49_6
		memw(r7+#40) = r19
	}
	{
		jump .LBB49_19
	}
	.falign
.LBB49_9:                               //   in Loop: Header=BB49_6 Depth=1
	{
		r6 = r7
		p1 = cmp.eq(r4,#0); if (!p1.new) jump:t .LBB49_6
	}
	{
		jump .LBB49_19
	}
	.falign
.LBB49_10:                              //   in Loop: Header=BB49_6 Depth=1
	{
		p1 = cmp.eq(r4,#0); if (!p1.new) jump:t .LBB49_6
	}
	{
		jump .LBB49_19
	}
	.falign
.LBB49_11:                              // %if.then
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
		r0 = add(r29,#16)
	}
	.falign
// %bb.12:                              // %if.then
	{
		r0 = #0
		r17:16 = memd(r29+#48)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#32)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB49_13:
	{
		r18 = #0 ; jump .LBB49_21
	}
	.falign
.LBB49_14:
	{
		r2 = #0
		r5 = #0
	}
	.falign
.LBB49_15:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r6 = memw(r4+#40)
	}
	{
		p2 = cmp.eq(r6,r20)
		if (!p2.new) r3 = add(r4,#44)
		if (!p2.new) jump:t .LBB49_17
		r6 = memw(r4+#44)
	}
// %bb.16:                              // %if.then3
                                        //   in Loop: Header=BB49_15 Depth=1
	{
		p1 = cmp.eq(r2,#0)
		if (p1.new) r2 = add(r4,#0)
		memw(r3+#0) = r6
		r7 = memw(r29+#16)

	} :mem_noshuf
	{
		r8 = memw(r7+#8)
	}
	{
		p2 = cmp.eq(r8,r4)
		r18 = r4
		if (p2.new) memw(r7+#8) = r5
		if (!p1) memw(r18+#44) = r4
	}
	{
		p1 = cmp.eq(r6,#0); if (!p1.new) jump:t .LBB49_15
		r4 = r6
		memw(r4+#40) = r19
	}
	{
		jump .LBB49_18
	}
	.falign
.LBB49_17:                              //   in Loop: Header=BB49_15 Depth=1
	{
		p1 = cmp.eq(r6,#0)
		r5 = r4
		r4 = r6
	}
	{
		if (!p1) jump:nt .LBB49_15
	}
	.falign
.LBB49_18:
	{
		r18 = #0
		r5 = r18
	}
	.falign
.LBB49_19:                              // %while.end
	{
		p2 = cmp.eq(r2,#0)
		if (p2.new) jump:nt .LBB49_21
		if (!p2.new) r3 = memw(r29+#20)
	}
// %bb.20:                              // %if.then23
	{
		memw(r5+#44) = #0
		r4 = memw(r3+#4)

	} :mem_noshuf
	{
		p0 = cmp.eq(r4,#0)
		if (!p0.new) r4 = memw(r3+#8)
	}
	{
		p0 = or(p0,!p0)
		if (!p0) r4 = add(r4,#44)
		if (p0) r4 = add(r3,#4)
	}
	{
		memw(r4+#0) = r2
		memw(r3+#8) = r5
	}
	.falign
.LBB49_21:                              // %if.end37
	{
		p2 = cmp.eq(r18,#0)
		r2 = !cmp.eq(r18,#0)
		r1 = add(r29,#8)
		r4 = memw(r17+#12)
	}
	{
		r5 = p2
		r0 = r17
		r3 = mux(p0,#1,#0)
	}
	{
		r17 = r5
		callr r4
		memw(r29+#4) = r17.new
	}                                       // 4-byte Folded Spill
	.falign
// %bb.22:                              // %if.end37
	{
		r2 = r17
	}
	{
		p0 = r2
		if (p0.new) r0 = add(r29,#16)
		if (p0.new) jump:nt .LBB49_28
	}
// %bb.23:                              // %if.then41
	{
		call ##qurt_mutex_lock
		r0 = r18
		memw(r18+#48) = r16
	}
	.falign
// %bb.24:                              // %if.then41
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
		r0 = add(r29,#16)
	}
	.falign
// %bb.25:                              // %if.then41
	{
		call ##qurt_cond_signal
		r0 = add(r18,#16)
		memb(r18+#32) = #0
	}
	.falign
// %bb.26:                              // %if.then41
	{
		call ##qurt_mutex_unlock
		r0 = r18
	}
	.falign
// %bb.27:                              // %if.then41
	{
		jump .LBB49_29
	}
	.falign
.LBB49_28:                              // %if.else45
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	}
	.falign
.LBB49_29:                              // %if.end46
	{
		r2 = memub(r29+#8)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		p1 = tstbit(r2,#0)
		r2 = memw(r29+#4)
		r17:16 = memd(r29+#48)
	}                                       // 8-byte Folded Reload
	{
		p0 = r2
	}
	{
		p2 = and(p1,!p0)
	}
	{
		r0 = mux(p2,#1,#0)
	}
	{
		r21:20 = memd(r29+#32)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end49:
	.size	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj, .Lfunc_end49-_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEjjRNS2_15parking_controlEj
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj,@function
_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj: // @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj
// %bb.0:                               // %entry
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r4 = +mpyi(r1,##-1640531527)
		r5 = +mpyi(r2,##-1640531527)
	}
	{
		r16 = r0
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r2 = lsr(r4,#22)
		r19 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOT)
	}
	{
		r18 = r19
	}
	{
		r18 += mpyi(r2,#12)
		r4 = lsr(r5,#22)
		if (!cmp.eq(r4.new,r2)) jump:t .LBB50_5
	}
// %bb.1:                               // %if.then
	{
		r3 = #1
		r0 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOT)
	}
	{
		r0 += mpyi(r2,#12)
	}
	.falign
.LBB50_2:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r0)
	}
	{
		p1 = cmp.eq(r2,#0); if (!p1.new) jump:nt .LBB50_9
	}
// %bb.3:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB50_2 Depth=1
	{
		memw_locked(r0,p0) = r3
	}
	{
		if (!p0) jump:nt .LBB50_2
		jump .LBB50_25
		if (p0) r19 = add(r18,#0)
	}
// %bb.4:
	.falign
.LBB50_5:                               // %if.else
	{
		r19 += mpyi(r4,#12)
		p1 = cmp.gtu(r4,r2); if (!p1.new) jump:t .LBB50_11
	}
// %bb.6:                               // %if.then3
	{
		r3 = #1
		r17 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOT)
	}
	{
		r17 += mpyi(r4,#12)
		r0 = r17
	}
	{
		r0 += mpyi(r2,#12)
	}
	.falign
.LBB50_7:                               // %cmpxchg.start9
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB50_14
	}
// %bb.8:                               // %cmpxchg.trystore7
                                        //   in Loop: Header=BB50_7 Depth=1
	{
		memw_locked(r0,p1) = r3
	}
	{
		if (!p1) jump:nt .LBB50_7
	}
	{
		jump .LBB50_15
	}
	.falign
.LBB50_9:                               // %if.then.i57
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
	.falign
// %bb.10:                              // %if.then.i57
	{
		r19 = r18 ; jump .LBB50_25
	}
	.falign
.LBB50_11:                              // %if.else9
	{
		r3 = #1
		r17 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOT)
	}
	{
		r17 += mpyi(r2,#12)
		r0 = r17
	}
	{
		r0 += mpyi(r4,#12)
	}
	.falign
.LBB50_12:                              // %cmpxchg.start43
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB50_18
	}
// %bb.13:                              // %cmpxchg.trystore41
                                        //   in Loop: Header=BB50_12 Depth=1
	{
		memw_locked(r0,p1) = r3
	}
	{
		if (!p1) jump:nt .LBB50_12
	}
	{
		jump .LBB50_19
	}
	.falign
.LBB50_14:                              // %if.then.i53
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
	.falign
.LBB50_15:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit54
	{
		r2 = #1
	}
	.falign
.LBB50_16:                              // %cmpxchg.start26
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r17)
	}
	{
		if (!p0.new) r0 = add(r17,#0)
		p0 = cmp.eq(r3,#0); if (!p0.new) jump:nt .LBB50_22
	}
// %bb.17:                              // %cmpxchg.trystore24
                                        //   in Loop: Header=BB50_16 Depth=1
	{
		memw_locked(r17,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB50_16
	}
	{
		jump .LBB50_25
	}
	.falign
.LBB50_18:                              // %if.then.i43
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
	.falign
.LBB50_19:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit44
	{
		r2 = #1
	}
	.falign
.LBB50_20:                              // %cmpxchg.start60
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r17)
	}
	{
		if (!p0.new) r0 = add(r17,#0)
		p0 = cmp.eq(r3,#0); if (!p0.new) jump:nt .LBB50_24
	}
// %bb.21:                              // %cmpxchg.trystore58
                                        //   in Loop: Header=BB50_20 Depth=1
	{
		memw_locked(r17,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB50_20
	}
	{
		jump .LBB50_25
	}
	.falign
.LBB50_22:                              // %if.then.i49
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
	.falign
// %bb.23:                              // %if.then.i49
	{
		jump .LBB50_25
	}
	.falign
.LBB50_24:                              // %if.then.i
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	}
	.falign
.LBB50_25:                              // %cleanup
	{
		memw(r16+#0) = r18
		memw(r16+#4) = r19
	}
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end50:
	.size	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj, .Lfunc_end50-_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEjj
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	.falign
	.type	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,@function
_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE: // @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r0 = memw(r0+#0)
	}
	{
		r2 = memw(r16+#4)
		if (cmp.eq(r2.new,r0)) jump:nt .LBB51_11
	}
// %bb.1:                               // %if.else
	{
		p0 = cmp.gtu(r0,r2); if (!p0.new) jump:t .LBB51_15
	}
	.falign
.LBB51_2:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r0,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB51_2
	}
// %bb.3:                               // %atomicrmw.end1
	{
		p0 = cmp.gtu(r3,#3); if (!p0.new) jump:nt .LBB51_6
	}
// %bb.4:                               // %atomicrmw.end1
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB51_6
	}
// %bb.5:                               // %if.then.i28
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	}
	.falign
.LBB51_6:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit29
	{
		r0 = memw(r16+#4)
	}
	.falign
.LBB51_7:                               // %atomicrmw.start8
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r0,p0) = r2
	}
	{
		if (!p0) jump:nt .LBB51_7
	}
// %bb.8:                               // %atomicrmw.end7
	{
		p1 = cmp.gtu(r3,#3); if (!p1.new) jump:nt .LBB51_24
	}
// %bb.9:                               // %atomicrmw.end7
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB51_24
	}
// %bb.10:                              // %if.then.i35
	{
		jump ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	.falign
.LBB51_11:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r0,p1) = r2
	}
	{
		if (!p1) jump:nt .LBB51_11
	}
// %bb.12:                              // %atomicrmw.end
	{
		p0 = cmp.gtu(r3,#3); if (!p0.new) jump:nt .LBB51_24
	}
// %bb.13:                              // %atomicrmw.end
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB51_24
	}
// %bb.14:                              // %if.then.i
	{
		jump ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	.falign
.LBB51_15:                              // %atomicrmw.start14
                                        // =>This Inner Loop Header: Depth=1
	{
		r4 = memw_locked(r2)
	}
	{
		r3 = clrbit(r4,#0)
	}
	{
		memw_locked(r2,p1) = r3
	}
	{
		if (!p1) jump:nt .LBB51_15
	}
// %bb.16:                              // %atomicrmw.end13
	{
		p0 = cmp.gtu(r4,#3); if (!p0.new) jump:nt .LBB51_19
	}
// %bb.17:                              // %atomicrmw.end13
	{
		r3 = and(r3,#3)
		if (!cmp.eq(r3.new,#0)) jump:nt .LBB51_19
	}
// %bb.18:                              // %if.then.i42
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r0 = r2
	}
	.falign
.LBB51_19:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit43
	{
		r0 = memw(r16+#0)
	}
	.falign
.LBB51_20:                              // %atomicrmw.start20
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw_locked(r0)
	}
	{
		r2 = clrbit(r3,#0)
	}
	{
		memw_locked(r0,p0) = r2
	}
	{
		if (!p0) jump:nt .LBB51_20
	}
// %bb.21:                              // %atomicrmw.end19
	{
		p1 = cmp.gtu(r3,#3); if (!p1.new) jump:nt .LBB51_24
	}
// %bb.22:                              // %atomicrmw.end19
	{
		r2 = and(r2,#3)
		if (!cmp.eq(r2.new,#0)) jump:nt .LBB51_24
	}
// %bb.23:                              // %if.then.i49
	{
		jump ##_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	.falign
.LBB51_24:                              // %if.end15
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end51:
	.size	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE, .Lfunc_end51-_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv // -- Begin function _ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	.falign
	.type	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,@function
_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv: // @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
// %bb.0:                               // %entry
	{
		r0 = add(pc,##.L.str.1@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##getenv
	}
	.falign
// %bb.1:                               // %entry
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB52_4
	}
// %bb.2:                               // %if.end
	{
		r0 = add(pc,##.L.str.2@PCREL)
		call ##getenv
	}
	.falign
// %bb.3:                               // %if.end
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB52_5
	}
	.falign
.LBB52_4:                               // %if.then3
	{
		jump ##atoi
		r31:30 = deallocframe(r30):raw
	}
	.falign
.LBB52_5:                               // %if.else
	{
		jump ##halide_host_cpu_count
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end52:
	.size	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv, .Lfunc_end52-_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal17clamp_num_threadsEi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi // -- Begin function _ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	.balign 32
	.type	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi,@function
_ZN6Halide7Runtime8Internal17clamp_num_threadsEi: // @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
// %bb.0:                               // %entry
	{
		r2 = #1
		p0 = cmp.gt(r0,#256)
		if (!p0.new) jump:t .LBB53_2
	}
// %bb.1:                               // %if.end3
	{
		r0 = #256
		jumpr r31
	}
	.falign
.LBB53_2:                               // %if.else
	{
		r0 = max(r0,r2)
		jumpr r31
	}
.Lfunc_end53:
	.size	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi, .Lfunc_end53-_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal13worker_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal13worker_threadEPv // -- Begin function _ZN6Halide7Runtime8Internal13worker_threadEPv
	.balign 32
	.type	_ZN6Halide7Runtime8Internal13worker_threadEPv,@function
_ZN6Halide7Runtime8Internal13worker_threadEPv: // @_ZN6Halide7Runtime8Internal13worker_threadEPv
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
	}
	{
		r17 = memw(r2+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
		r0 = r16
	}
	{
		r0 = r17
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_mutex_unlock
	}
.Lfunc_end54:
	.size	_ZN6Halide7Runtime8Internal13worker_threadEPv, .Lfunc_end54-_ZN6Halide7Runtime8Internal13worker_threadEPv
                                        // -- End function
	.section	.text.halide_spawn_thread,"ax",@progbits
	.weak	halide_spawn_thread             // -- Begin function halide_spawn_thread
	.falign
	.type	halide_spawn_thread,@function
halide_spawn_thread:                    // @halide_spawn_thread
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_get_default_thread_priority
		memd(r29+#32) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r0 = #16
		r18 = r0
	}
	{
		r0 = #128
		r19 = r0
		memw(r0+#4) = r16
	}
	{
		r1 = ##262144
	}
	{
		call ##memalign
		r16 = add(r19,#12)
		memw(r19+#0) = r17
	}
	{
		r1:0 = combine(#0,r16)
		r2 = #4
		memw(r19+#8) = r0
	}
	{
		call ##memset
	}
	{
		memh(r29+#16) = ##-256
		memw(r29+#20) = ##-65792
	}
	{
		r2 = add(pc,##_ZN12_GLOBAL__N_119spawn_thread_helperEPv@PCREL)
		r1 = add(r29,#0)
		r3 = memw(r19+#8)
	}
	{
		r0 = r16
		r3 = r19
		memw(r29+#28) = r3
		memh(r29+#18) = r18
	}
	{
		memb(r29+#0) = #0
		memw(r29+#24) = ##262144
	}
	{
		call ##qurt_thread_create
	}
	{
		r0 = r19
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end55:
	.size	halide_spawn_thread, .Lfunc_end55-halide_spawn_thread
                                        // -- End function
	.section	.text.halide_get_default_thread_priority,"ax",@progbits
	.weak	halide_get_default_thread_priority // -- Begin function halide_get_default_thread_priority
	.balign 32
	.type	halide_get_default_thread_priority,@function
halide_get_default_thread_priority:     // @halide_get_default_thread_priority
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##halide_qurt_default_thread_priority@GOT)
	}
	{
		r0 = memuh(r2+#0)
		jumpr r31
	}
.Lfunc_end56:
	.size	halide_get_default_thread_priority, .Lfunc_end56-halide_get_default_thread_priority
                                        // -- End function
	.section	.text._ZN12_GLOBAL__N_119spawn_thread_helperEPv,"ax",@progbits
	.balign 32                              // -- Begin function _ZN12_GLOBAL__N_119spawn_thread_helperEPv
	.type	_ZN12_GLOBAL__N_119spawn_thread_helperEPv,@function
_ZN12_GLOBAL__N_119spawn_thread_helperEPv: // @_ZN12_GLOBAL__N_119spawn_thread_helperEPv
// %bb.0:                               // %entry
	{
		r7 = memw(r0+#0)
		r0 = memw(r0+#4)
	}
	{
		jumpr r7
	}
.Lfunc_end57:
	.size	_ZN12_GLOBAL__N_119spawn_thread_helperEPv, .Lfunc_end57-_ZN12_GLOBAL__N_119spawn_thread_helperEPv
                                        // -- End function
	.section	.text.halide_host_cpu_count,"ax",@progbits
	.weak	halide_host_cpu_count           // -- Begin function halide_host_cpu_count
	.balign 32
	.type	halide_host_cpu_count,@function
halide_host_cpu_count:                  // @halide_host_cpu_count
// %bb.0:                               // %entry
	{
		r0 = #4
		jumpr r31
	}
.Lfunc_end58:
	.size	halide_host_cpu_count, .Lfunc_end58-halide_host_cpu_count
                                        // -- End function
	.section	.text.halide_default_do_parallel_tasks,"ax",@progbits
	.weak	halide_default_do_parallel_tasks // -- Begin function halide_default_do_parallel_tasks
	.falign
	.type	halide_default_do_parallel_tasks,@function
halide_default_do_parallel_tasks:       // @halide_default_do_parallel_tasks
// %bb.0:                               // %entry
	{
		r4 = +mpyi(r1,#80)
		p1 = cmp.gt(r1,#0)
		allocframe(r29,#40):raw
	}
	{
		r16 = r1
		r18 = r3
		memd(r30+#-8) = r17:16
		memd(r30+#-16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r17 = sub(r29,r4)
		r29 = sub(r29,r4)
		memd(r30+#-24) = r21:20
		memd(r30+#-32) = r23:22
	}                                       // 8-byte Folded Spill
	{
		if (p1) r21 = add(r17,#52)
		if (!p1) jump:nt .LBB59_7
		memd(r30+#-40) = r25:24
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %for.body.preheader
	{
		r20 = r0
		r25:24 = combine(#0,#0)
		r19 = r2
		r23:22 = combine(#0,#0)
	}
	.falign
.LBB59_2:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r1 = r19
		r0 = add(r21,#-52)
		r2 = memw(r19+#24)
		if (!cmp.gt(r2.new,#0)) jump:nt .LBB59_5
	}
// %bb.3:                               // %if.end
                                        //   in Loop: Header=BB59_2 Depth=1
	{
		call ##memcpy
		r2 = #36
	}
	.falign
// %bb.4:                               // %if.end
                                        //   in Loop: Header=BB59_2 Depth=1
	{
		r19 = add(r19,#36)
		r2 = add(r21,#4)
		memw(r21+#-16) = r22
		memw(r21+#8) = r20
	}
	{
		memw(r21+#20) = #0
		memb(r21+#24) = #0
	}
	{
		jump .LBB59_6
		memw(r21+#0) = r18
		memd(r2+#8) = r25:24
	}
	.falign
.LBB59_5:                               // %if.then
                                        //   in Loop: Header=BB59_2 Depth=1
	{
		r16 = add(r16,#-1)
	}
	.falign
.LBB59_6:                               // %for.inc
                                        //   in Loop: Header=BB59_2 Depth=1
	{
		r21 = add(r21,#80)
		r23 = add(r23,#1)
		if (cmp.gt(r16,r23.new)) jump:t .LBB59_2
	}
	.falign
.LBB59_7:                               // %for.cond.cleanup
	{
		if (p0.new) r18 = #0
		p0 = cmp.eq(r16,#0); if (p0.new) jump:nt .LBB59_16
	}
// %bb.8:                               // %if.end12
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
// %bb.9:                               // %if.end12
	{
		call ##_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
		r1:0 = combine(r17,r16)
		r2 = r18
	}
	.falign
// %bb.10:                              // %if.end12
	{
		r18 = #0
		p1 = cmp.gt(r16,#0); if (!p1.new) jump:nt .LBB59_13
	}
	.falign
.LBB59_11:                              // %for.body18
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
		r0 = r17
	}
	.falign
// %bb.12:                              // %for.body18
                                        //   in Loop: Header=BB59_11 Depth=1
	{
		r17 = add(r17,#80)
		r2 = memw(r17+#68)
	}
	{
		p1 = cmp.eq(r2,#0)
		if (!p1.new) r18 = add(r2,#0)
		r16 = add(r16,#-1)
		if (!cmp.eq(r16.new,#0)) jump:t .LBB59_11
	}
	.falign
.LBB59_13:                              // %for.cond.cleanup17
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
// %bb.14:                              // %for.cond.cleanup17
	.falign
.LBB59_16:                              // %cleanup
	{
		r0 = r18
		r17:16 = memd(r30+#-8)
		r19:18 = memd(r30+#-16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r30+#-24)
		r23:22 = memd(r30+#-32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r30+#-40)
		r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end59:
	.size	halide_default_do_parallel_tasks, .Lfunc_end59-halide_default_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_default_semaphore_init,"ax",@progbits
	.weak	halide_default_semaphore_init   // -- Begin function halide_default_semaphore_init
	.balign 32
	.type	halide_default_semaphore_init,@function
halide_default_semaphore_init:          // @halide_default_semaphore_init
// %bb.0:                               // %entry
	{
		r0 = r1
		memw(r0+#0) = r1
	}
	{
		barrier
	}
	{
		jumpr r31
	}
.Lfunc_end60:
	.size	halide_default_semaphore_init, .Lfunc_end60-halide_default_semaphore_init
                                        // -- End function
	.section	.text.halide_default_semaphore_release,"ax",@progbits
	.weak	halide_default_semaphore_release // -- Begin function halide_default_semaphore_release
	.falign
	.type	halide_default_semaphore_release,@function
halide_default_semaphore_release:       // @halide_default_semaphore_release
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	.falign
.LBB61_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r2 = memw_locked(r0)
	}
	{
		r16 = add(r2,r1)
	}
	{
		memw_locked(r0,p0) = r16
	}
	{
		if (!p0) jump:nt .LBB61_1
	}
// %bb.2:                               // %atomicrmw.end
	{
		p1 = cmp.eq(r1,#0); if (p1.new) jump:nt .LBB61_8
	}
// %bb.3:                               // %atomicrmw.end
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB61_8
	}
// %bb.4:                               // %if.then
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r17 = memw(r2+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	.falign
// %bb.5:                               // %if.then
	{
		call ##halide_cond_broadcast
		r0 = add(r17,#28)
	}
	.falign
// %bb.6:                               // %if.then
	{
		call ##halide_cond_broadcast
		r0 = add(r17,#36)
	}
	.falign
// %bb.7:                               // %if.then
	{
		call ##halide_mutex_unlock
		r0 = r17
	}
	.falign
.LBB61_8:                               // %if.end
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end61:
	.size	halide_default_semaphore_release, .Lfunc_end61-halide_default_semaphore_release
                                        // -- End function
	.section	.text.halide_thread_pool_cleanup,"ax",@progbits
	.weak	halide_thread_pool_cleanup      // -- Begin function halide_thread_pool_cleanup
	.balign 32
	.type	halide_thread_pool_cleanup,@function
halide_thread_pool_cleanup:             // @halide_thread_pool_cleanup
// %bb.0:                               // %entry
	{
		jump ##halide_shutdown_thread_pool
	}
.Lfunc_end62:
	.size	halide_thread_pool_cleanup, .Lfunc_end62-halide_thread_pool_cleanup
                                        // -- End function
	.section	.text.halide_shutdown_thread_pool,"ax",@progbits
	.weak	halide_shutdown_thread_pool     // -- Begin function halide_shutdown_thread_pool
	.falign
	.type	halide_shutdown_thread_pool,@function
halide_shutdown_thread_pool:            // @halide_shutdown_thread_pool
// %bb.0:                               // %entry
	{
		r17 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = memb(r2+##1073)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB63_11
	}
// %bb.1:                               // %if.then
	{
		r16 = memw(r17+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r16
	}
	.falign
// %bb.2:                               // %if.then
	{
		r0 = add(r16,#36)
		r2 = #1
		memb(r16+##1072) = r2.new
	}
	{
		call ##halide_cond_broadcast
	}
	.falign
// %bb.3:                               // %if.then
	{
		call ##halide_cond_broadcast
		r0 = add(r16,#28)
	}
	.falign
// %bb.4:                               // %if.then
	{
		call ##halide_cond_broadcast
		r0 = add(r16,#32)
	}
	.falign
// %bb.5:                               // %if.then
	{
		call ##halide_mutex_unlock
		r0 = r16
	}
	.falign
// %bb.6:                               // %if.then
	{
		r18 = #0
		r2 = memw(r16+#16)
		if (!cmp.gt(r2.new,#0)) jump:nt .LBB63_10
	}
// %bb.7:
	{
		r16 = add(r16,#48)
	}
	.falign
.LBB63_8:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##halide_join_thread
		r0 = memw(r16++#4)
	}
	.falign
// %bb.9:                               // %for.body
                                        //   in Loop: Header=BB63_8 Depth=1
	{
		r18 = add(r18,#1)
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		r2 = memw(r2+#16)
		if (cmp.gt(r2.new,r18)) jump:t .LBB63_8
	}
	.falign
.LBB63_10:                              // %for.cond.cleanup
	{
		r1 = #0
		r2 = memw(r17+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
		r17:16 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		r0 = add(r2,#8)
		r2 = #1072
		jump ##memset
	}
	.falign
.LBB63_11:                              // %if.end
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end63:
	.size	halide_shutdown_thread_pool, .Lfunc_end63-halide_shutdown_thread_pool
                                        // -- End function
	.section	.text.halide_join_thread,"ax",@progbits
	.weak	halide_join_thread              // -- Begin function halide_join_thread
	.balign 32
	.type	halide_join_thread,@function
halide_join_thread:                     // @halide_join_thread
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r1 = add(r29,#4)
		r0 = memw(r0+#12)
	}
	{
		call ##qurt_thread_join
		memw(r29+#4) = #0
	}
	{
		call ##free
		r0 = memw(r16+#8)
	}
	{
		call ##free
		r0 = r16
	}
	{
		r17:16 = memd(r29+#8)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end64:
	.size	halide_join_thread, .Lfunc_end64-halide_join_thread
                                        // -- End function
	.section	.text.halide_set_default_thread_priority,"ax",@progbits
	.weak	halide_set_default_thread_priority // -- Begin function halide_set_default_thread_priority
	.falign
	.type	halide_set_default_thread_priority,@function
halide_set_default_thread_priority:     // @halide_set_default_thread_priority
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r0,#255)
		r2 = #255
		if (p0.new) jump:t .LBB65_2
	}
// %bb.1:                               // %if.else
	{
		r2 = r0
		p1 = cmp.gt(r0,#0); if (!p1.new) jump:nt .LBB65_3
	}
	.falign
.LBB65_2:                               // %if.end3
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r3+##halide_qurt_default_thread_priority@GOT)
	}
	{
		jumpr r31
		memh(r3+#0) = r2
	}
	.falign
.LBB65_3:                               // %return
	{
		jumpr r31
	}
.Lfunc_end65:
	.size	halide_set_default_thread_priority, .Lfunc_end65-halide_set_default_thread_priority
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	{
		r0 = #1
		jumpr r31
	}
.Lfunc_end66:
	.size	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end66-_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
	.balign 32
	.type	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
// %bb.0:                               // %entry
	{
		p0 = tstbit(r2,#0)
		r0 = #0
		if (!p0.new) r2 = memw(r0+#16)
	}
	{
		jumpr r31
		if (!p0) memw(r2+#0) = #0
	}
.Lfunc_end67:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib, .Lfunc_end67-_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
                                        // -- End function
	.section	.text.halide_cond_signal,"ax",@progbits
	.weak	halide_cond_signal              // -- Begin function halide_cond_signal
	.falign
	.type	halide_cond_signal,@function
halide_cond_signal:                     // @halide_cond_signal
// %bb.0:                               // %entry
	{
		r2 = memw(r0+#0)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB68_3
	}
// %bb.1:                               // %if.end.i
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		allocframe(r29,#24):raw
	}
	{
		r1 = add(r29,#0)
	}
	{
		r4 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE@GOT)
		memw(r29+#0) = r4.new
	}
	{
		r4 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOT)
		memw(r29+#4) = r4.new
	}
	{
		r4 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOT)
		memw(r29+#16) = r0

	} :mem_noshuf
	{
		memw(r29+#20) = r2
		memw(r29+#12) = r4
	}
	{
		r2 = memw(r3+##_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib@GOT)
		memw(r29+#8) = r2.new
	}
	{
		call ##_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEjRNS2_15parking_controlE
	}
	.falign
// %bb.2:                               // %if.end.i
	{
		r31:30 = deallocframe(r30):raw
	}
	.falign
.LBB68_3:                               // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit
	{
		jumpr r31
	}
.Lfunc_end68:
	.size	halide_cond_signal, .Lfunc_end68-halide_cond_signal
                                        // -- End function
	.section	.text.halide_mutex_array_create,"ax",@progbits
	.weak	halide_mutex_array_create       // -- Begin function halide_mutex_array_create
	.falign
	.type	halide_mutex_array_create,@function
halide_mutex_array_create:              // @halide_mutex_array_create
// %bb.0:                               // %entry
	{
		r17 = #0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r1:0 = combine(#4,#0)
		r18 = r0
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		r18 = asl(r18,#2)
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB69_6
	}
// %bb.2:                               // %if.end
	{
		r17:16 = combine(#0,r0)
	}
	{
		call ##halide_malloc
		r1:0 = combine(r18,#0)
	}
	.falign
// %bb.3:                               // %if.end
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB69_7
		memw(r16+#0) = r0
	}
// %bb.4:                               // %if.end6
	{
		call ##memset
		r1 = #0
		r2 = r18
	}
	.falign
// %bb.5:                               // %if.end6
	{
		r17 = r16
	}
	.falign
.LBB69_6:                               // %cleanup
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB69_7:                               // %if.then5
	{
		call ##halide_free
		r1:0 = combine(r16,#0)
	}
	.falign
// %bb.8:                               // %if.then5
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end69:
	.size	halide_mutex_array_create, .Lfunc_end69-halide_mutex_array_create
                                        // -- End function
	.section	.text.halide_mutex_array_destroy,"ax",@progbits
	.weak	halide_mutex_array_destroy      // -- Begin function halide_mutex_array_destroy
	.balign 32
	.type	halide_mutex_array_destroy,@function
halide_mutex_array_destroy:             // @halide_mutex_array_destroy
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_free
		r1 = memw(r1+#0)
	}
	{
		r1:0 = combine(r17,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_free
	}
.Lfunc_end70:
	.size	halide_mutex_array_destroy, .Lfunc_end70-halide_mutex_array_destroy
                                        // -- End function
	.section	.text.halide_mutex_array_lock,"ax",@progbits
	.weak	halide_mutex_array_lock         // -- Begin function halide_mutex_array_lock
	.balign 32
	.type	halide_mutex_array_lock,@function
halide_mutex_array_lock:                // @halide_mutex_array_lock
// %bb.0:                               // %entry
	{
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r0+#0)
	}
	{
		r0 = addasl(r2,r1,#2)
		call ##halide_mutex_lock
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end71:
	.size	halide_mutex_array_lock, .Lfunc_end71-halide_mutex_array_lock
                                        // -- End function
	.section	.text.halide_mutex_array_unlock,"ax",@progbits
	.weak	halide_mutex_array_unlock       // -- Begin function halide_mutex_array_unlock
	.balign 32
	.type	halide_mutex_array_unlock,@function
halide_mutex_array_unlock:              // @halide_mutex_array_unlock
// %bb.0:                               // %entry
	{
		allocframe(r29,#0):raw
	}
	{
		r2 = memw(r0+#0)
	}
	{
		r0 = addasl(r2,r1,#2)
		call ##halide_mutex_unlock
	}
	{
		r0 = #0
		dealloc_return
	}
.Lfunc_end72:
	.size	halide_mutex_array_unlock, .Lfunc_end72-halide_mutex_array_unlock
                                        // -- End function
	.section	.text.halide_set_num_threads,"ax",@progbits
	.weak	halide_set_num_threads          // -- Begin function halide_set_num_threads
	.falign
	.type	halide_set_num_threads,@function
halide_set_num_threads:                 // @halide_set_num_threads
// %bb.0:                               // %entry
	{
		r16 = r0
		p0 = cmp.gt(r0,#-1)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r17 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r0 = #0
		if (!p0) jump:nt .LBB73_5
	}
// %bb.1:                               // %if.end
	{
		call ##halide_mutex_lock
		r0 = memw(r17+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
// %bb.2:                               // %if.end
	{
		p1 = cmp.eq(r16,#0); if (!p1.new) jump:t .LBB73_7
	}
// %bb.3:                               // %if.then2
	{
		call ##_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	}
	.falign
// %bb.4:                               // %if.then2
	{
		r16 = r0 ; jump .LBB73_7
	}
	.falign
.LBB73_5:                               // %if.end.thread
	{
		r1 = add(pc,##.L.str.4@PCREL)
		call ##halide_error
	}
	.falign
// %bb.6:                               // %if.end.thread
	{
		call ##halide_mutex_lock
		r0 = memw(r17+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	.falign
.LBB73_7:                               // %if.end3
	{
		r0 = r16
		r17 = memw(r17+##_ZN6Halide7Runtime8Internal10work_queueE@GOT)
	}
	{
		call ##_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
		r16 = memw(r17+#4)
	}
	.falign
// %bb.8:                               // %if.end3
	{
		call ##halide_mutex_unlock
		r0 = r17
		memw(r17+#4) = r0
	}
	.falign
// %bb.9:                               // %if.end3
	{
		r0 = r16
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end73:
	.size	halide_set_num_threads, .Lfunc_end73-halide_set_num_threads
                                        // -- End function
	.section	.text.halide_set_custom_do_task,"ax",@progbits
	.weak	halide_set_custom_do_task       // -- Begin function halide_set_custom_do_task
	.balign 32
	.type	halide_set_custom_do_task,@function
halide_set_custom_do_task:              // @halide_set_custom_do_task
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal14custom_do_taskE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end74:
	.size	halide_set_custom_do_task, .Lfunc_end74-halide_set_custom_do_task
                                        // -- End function
	.section	.text.halide_set_custom_do_loop_task,"ax",@progbits
	.weak	halide_set_custom_do_loop_task  // -- Begin function halide_set_custom_do_loop_task
	.balign 32
	.type	halide_set_custom_do_loop_task,@function
halide_set_custom_do_loop_task:         // @halide_set_custom_do_loop_task
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end75:
	.size	halide_set_custom_do_loop_task, .Lfunc_end75-halide_set_custom_do_loop_task
                                        // -- End function
	.section	.text.halide_set_custom_do_par_for,"ax",@progbits
	.weak	halide_set_custom_do_par_for    // -- Begin function halide_set_custom_do_par_for
	.balign 32
	.type	halide_set_custom_do_par_for,@function
halide_set_custom_do_par_for:           // @halide_set_custom_do_par_for
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end76:
	.size	halide_set_custom_do_par_for, .Lfunc_end76-halide_set_custom_do_par_for
                                        // -- End function
	.section	.text.halide_set_custom_parallel_runtime,"ax",@progbits
	.weak	halide_set_custom_parallel_runtime // -- Begin function halide_set_custom_parallel_runtime
	.balign 32
	.type	halide_set_custom_parallel_runtime,@function
halide_set_custom_parallel_runtime:     // @halide_set_custom_parallel_runtime
// %bb.0:                               // %entry
	{
		r6 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r7 = memw(r6+##_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOT)
	}
	{
		r0 = memw(r29+#0)
		memw(r7+#0) = r0
	}
	{
		r7 = memw(r6+##_ZN6Halide7Runtime8Internal14custom_do_taskE@GOT)
	}
	{
		memw(r7+#0) = r1
	}
	{
		r7 = memw(r6+##_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOT)
	}
	{
		memw(r7+#0) = r2
	}
	{
		r2 = memw(r6+##_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOT)
	}
	{
		memw(r2+#0) = r3
	}
	{
		r2 = memw(r6+##_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOT)
	}
	{
		memw(r2+#0) = r4
	}
	{
		r2 = memw(r6+##_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOT)
	}
	{
		memw(r2+#0) = r5
	}
	{
		r2 = memw(r6+##_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOT)
	}
	{
		jumpr r31
		memw(r2+#0) = r0
	}
.Lfunc_end77:
	.size	halide_set_custom_parallel_runtime, .Lfunc_end77-halide_set_custom_parallel_runtime
                                        // -- End function
	.section	.text.halide_do_par_for,"ax",@progbits
	.weak	halide_do_par_for               // -- Begin function halide_do_par_for
	.balign 32
	.type	halide_do_par_for,@function
halide_do_par_for:                      // @halide_do_par_for
// %bb.0:                               // %entry
	{
		r5 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r5 = memw(r5+##_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOT)
	}
	{
		r7 = memw(r5+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end78:
	.size	halide_do_par_for, .Lfunc_end78-halide_do_par_for
                                        // -- End function
	.section	.text.halide_do_parallel_tasks,"ax",@progbits
	.weak	halide_do_parallel_tasks        // -- Begin function halide_do_parallel_tasks
	.balign 32
	.type	halide_do_parallel_tasks,@function
halide_do_parallel_tasks:               // @halide_do_parallel_tasks
// %bb.0:                               // %entry
	{
		r4 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r4 = memw(r4+##_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOT)
	}
	{
		r7 = memw(r4+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end79:
	.size	halide_do_parallel_tasks, .Lfunc_end79-halide_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_semaphore_init,"ax",@progbits
	.weak	halide_semaphore_init           // -- Begin function halide_semaphore_init
	.balign 32
	.type	halide_semaphore_init,@function
halide_semaphore_init:                  // @halide_semaphore_init
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end80:
	.size	halide_semaphore_init, .Lfunc_end80-halide_semaphore_init
                                        // -- End function
	.section	.text.halide_semaphore_release,"ax",@progbits
	.weak	halide_semaphore_release        // -- Begin function halide_semaphore_release
	.balign 32
	.type	halide_semaphore_release,@function
halide_semaphore_release:               // @halide_semaphore_release
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end81:
	.size	halide_semaphore_release, .Lfunc_end81-halide_semaphore_release
                                        // -- End function
	.section	.text.halide_semaphore_try_acquire,"ax",@progbits
	.weak	halide_semaphore_try_acquire    // -- Begin function halide_semaphore_try_acquire
	.balign 32
	.type	halide_semaphore_try_acquire,@function
halide_semaphore_try_acquire:           // @halide_semaphore_try_acquire
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end82:
	.size	halide_semaphore_try_acquire, .Lfunc_end82-halide_semaphore_try_acquire
                                        // -- End function
	.section	.fini.halide,"ax",@progbits,unique,1
	.globl	run_dtors                       // -- Begin function run_dtors
	.falign
	.type	run_dtors,@function
run_dtors:                              // @run_dtors
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r16 = memw(r2+##__DTOR_LIST__@GOT)
	}
	{
		r2 = memw(r16++#4)
	}
	{
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB83_3
	}
	.falign
.LBB83_1:                               // %cleanup
                                        // =>This Inner Loop Header: Depth=1
	{
		callr r2
	}
	.falign
// %bb.2:                               // %cleanup
                                        //   in Loop: Header=BB83_1 Depth=1
	{
		r2 = memw(r16++#4)
	}
	{
		p1 = cmp.eq(r2,#0); if (!p1.new) jump:t .LBB83_1
	}
	.falign
.LBB83_3:                               // %while.end
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end83:
	.size	run_dtors, .Lfunc_end83-run_dtors
                                        // -- End function
	.section	.text.halide_set_gpu_device,"ax",@progbits
	.weak	halide_set_gpu_device           // -- Begin function halide_set_gpu_device
	.balign 32
	.type	halide_set_gpu_device,@function
halide_set_gpu_device:                  // @halide_set_gpu_device
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOT)
	}
	{
		memw(r3+#0) = r0
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)
	}
	{
		jumpr r31
		memb(r2+#0) = #1
	}
.Lfunc_end84:
	.size	halide_set_gpu_device, .Lfunc_end84-halide_set_gpu_device
                                        // -- End function
	.section	.text.halide_get_gpu_device,"ax",@progbits
	.weak	halide_get_gpu_device           // -- Begin function halide_get_gpu_device
	.falign
	.type	halide_get_gpu_device,@function
halide_get_gpu_device:                  // @halide_get_gpu_device
// %bb.0:                               // %entry
	{
		r16 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		r2 = #255
	}
	.falign
.LBB85_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = memw(r16+##_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE@GOT)
	}
	{
		r5 = and(r3,#-4)
		r3 = and(r3,#3)
	}
	{
		r3 = asl(r3,#3)
	}
	{
		r4 = memw_locked(r5)
	}
	{
		r6 = lsl(#1,r3)
		r7 = asl(r2,r3)
	}
	{
		r6 |= and(r4,~r7)
	}
	{
		memw_locked(r5,p0) = r6
	}
	{
		if (!p0) jump:nt .LBB85_1
		if (p0) r5 = memw(r16+##_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE@GOT)
	}
// %bb.2:                               // %atomicrmw.end
                                        //   in Loop: Header=BB85_1 Depth=1
	{
		r3 = insert(r5,#2,#3)
	}
	{
		r3 = lsr(r4,r3)
	}
	{
		p1 = !bitsclr(r3,r2)
		if (p1.new) jump:t .LBB85_1
	}
// %bb.3:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit
	{
		r2 = memw(r16+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)
	}
	{
		r2 = memb(r2+#0)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB85_5
	}
// %bb.4:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVc.exit.if.end4_crit_edge
	{
		r2 = memw(r16+##_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOT)
	}
	{
		r0 = memw(r2+#0)
		r2 = memw(r16+##_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE@GOT)
	}
	{
		memb(r2+#0) = #0
	}
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB85_5:                               // %if.then
	{
		r0 = add(pc,##.L.str.12@PCREL)
		call ##getenv
	}
	.falign
// %bb.6:                               // %if.then
	{
		if (p1.new) r0 = #-1
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB85_10
	}
// %bb.7:                               // %if.then2
	{
		call ##atoi
	}
	.falign
// %bb.8:                               // %if.then2
	.falign
.LBB85_10:                              // %if.end
	{
		r2 = memw(r16+##_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOT)
	}
	{
		memw(r2+#0) = r0
	}
	{
		r2 = memw(r16+##_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOT)
	}
	{
		memb(r2+#0) = #1
	}
	{
		r2 = memw(r16+##_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE@GOT)
	}
	{
		memb(r2+#0) = #0
	}
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end85:
	.size	halide_get_gpu_device, .Lfunc_end85-halide_get_gpu_device
                                        // -- End function
	.section	.text.halide_string_to_string,"ax",@progbits
	.weak	halide_string_to_string         // -- Begin function halide_string_to_string
	.falign
	.type	halide_string_to_string,@function
halide_string_to_string:                // @halide_string_to_string
// %bb.0:                               // %entry
	{
		r3 = sub(r1,r0)
		p0 = cmp.gtu(r1,r0); if (!p0.new) jump:t .LBB86_5
	}
// %bb.1:
	{
		loop0(.LBB86_2,r3)
	}
	.falign
.Ltmp3:                                 // Block address taken
.LBB86_2:                               // %if.end3
                                        // =>This Inner Loop Header: Depth=1
	{
		r3 = r0
		r4 = memb(r2+#0)
		memb(r0+#0) = r4.new
	}
	{
		p1 = cmp.eq(r4,#0); if (p1.new) jump:nt .LBB86_6
		r2 = add(r2,#1)
		r0 = add(r0,#1)
	}
// %bb.3:                               // %if.end6
                                        //   in Loop: Header=BB86_2 Depth=1
	{
		nop
		nop
	} :endloop0
// %bb.4:                               // %if.then2
	{
		jumpr r31
		r0 = r1
		memb(r3+#0) = #0
	}
	.falign
.LBB86_5:
	{
		jumpr r31
	}
	.falign
.LBB86_6:
	{
		r0 = r3
		jumpr r31
	}
.Lfunc_end86:
	.size	halide_string_to_string, .Lfunc_end86-halide_string_to_string
                                        // -- End function
	.section	.text.halide_uint64_to_string,"ax",@progbits
	.weak	halide_uint64_to_string         // -- Begin function halide_uint64_to_string
	.falign
	.type	halide_uint64_to_string,@function
halide_uint64_to_string:                // @halide_uint64_to_string
// %bb.0:                               // %entry
	{
		r7:6 = combine(#0,#0)
		memd(r29+#-16) = r17:16
		allocframe(#56)
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r3:2,r7:6)
		r5 = add(r29,#0)
	}
	{
		memd(r29+#40) = r19:18
		memd(r29+#32) = r21:20
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB87_5
		memb(r29+#31) = #0
	}
// %bb.1:                               // %entry
	{
		if (!p1.new) r3 = add(r5,#30)
		p1 = cmp.gt(r4,#0); if (p1.new) jump:nt .LBB87_5
	}
	.falign
.LBB87_3:                               // %for.cond.cleanup
	{
		call ##halide_string_to_string
		r2 = add(r3,#1)
	}
	.falign
// %bb.4:                               // %for.cond.cleanup
	{
		r17:16 = memd(r29+#48)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#32)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB87_5:                               // %entry.for.body_crit_edge
	{
		r9 = #0
		r8 = add(r29,#0)
		r5 = #1
		r16 = r3
	}
	{
		r6 = ##-858993459
		r7 = ##-858993460
	}
	{
		r12 = #-10
		r15:14 = combine(#0,#9)
		r3 = add(r8,#29)
		r21 = r9
	}
	.falign
.LBB87_6:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r19:18 = mpyu(r2,r6)
		r11:10 = combine(r16,r2)
	}
	{
		p0 = cmp.gtu(r11:10,r15:14)
	}
	{
		r19:18 = mpyu(r2,r7)
		r8 = r19
	}
	{
		r17:16 = combine(r9,r8)
	}
	{
		r17:16 += mpyu(r11,r6)
		r20 = r19
		r19 = r9
	}
	{
		r17:16 = add(r17:16,r19:18)
	}
	{
		r16 = r17
		r17 = r9
	}
	{
		r17:16 += mpyu(r11,r7)
	}
	{
		r19:18 = add(r17:16,r21:20)
	}
	{
		r17:16 = combine(r18,r19)
	}
	{
		r17:16 = vlsrw(r17:16,#3)
	}
	{
		r2 = r17
	}
	{
		r2 = insert(r19,#3,#29)
	}
	{
		r19:18 = mpyu(r2,r12)
	}
	{
		r19 -= mpyi(r2,#1)
	}
	{
		r19 -= mpyi(r16,#10)
	}
	{
		r11:10 = add(r19:18,r11:10)
	}
	{
		r8 = add(r10,#48)
		if (p0) jump:nt .LBB87_8
		memb(r3+#1) = r8.new
	}
// %bb.7:                               // %for.body
                                        //   in Loop: Header=BB87_6 Depth=1
	{
		p1 = cmp.gt(r4,r5); if (!p1.new) jump:nt .LBB87_3
	}
	.falign
.LBB87_8:                               // %for.body.for.body_crit_edge
                                        //   in Loop: Header=BB87_6 Depth=1
	{
		jump .LBB87_6
		r5 = add(r5,#1)
		r3 = add(r3,#-1)
	}
.Lfunc_end87:
	.size	halide_uint64_to_string, .Lfunc_end87-halide_uint64_to_string
                                        // -- End function
	.section	.text.halide_int64_to_string,"ax",@progbits
	.weak	halide_int64_to_string          // -- Begin function halide_int64_to_string
	.falign
	.type	halide_int64_to_string,@function
halide_int64_to_string:                 // @halide_int64_to_string
// %bb.0:                               // %entry
	{
		r7:6 = combine(#-1,#-1)
		p0 = cmp.gtu(r1,r0); if (!p0.new) jump:nt .LBB88_3
	}
// %bb.1:                               // %entry
	{
		p1 = cmp.gt(r3:2,r7:6)
		if (p1.new) jump:nt .LBB88_3
	}
// %bb.2:                               // %if.then
	{
		r3:2 = neg(r3:2)
		r5 = #45
		memb(r0++#1) = r5.new
	}
	.falign
.LBB88_3:                               // %if.end
	{
		jump ##halide_uint64_to_string
	}
.Lfunc_end88:
	.size	halide_int64_to_string, .Lfunc_end88-halide_int64_to_string
                                        // -- End function
	.section	.text.halide_double_to_string,"ax",@progbits
	.weak	halide_double_to_string         // -- Begin function halide_double_to_string
	.falign
	.type	halide_double_to_string,@function
halide_double_to_string:                // @halide_double_to_string
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		memd(r29+#-16) = r17:16
		allocframe(r29,#584):raw
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r29,#512)
		r1 = add(r29,#520)
	}
	{
		r27:26 = combine(#0,#0)
		r2 = #8
		memd(r29+#536) = r27:26
		memd(r29+#520) = r3:2
	}                                       // 8-byte Folded Spill
	{
		r18 = r4
		memd(r29+#568) = r19:18
		memd(r29+#560) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#552) = r23:22
		memd(r29+#544) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##memcpy
		memd(r29+#512) = r27:26
	}
	.falign
// %bb.1:                               // %entry
	{
		r21:20 = memd(r29+#512)
	}
	{
		r23 = extractu(r21,#11,#20)
		r25 = extractu(r21,#20,#0)
		r24 = r20
	}
	{
		p1 = cmp.eq(r23,##2047)
		if (!p1.new) jump:t .LBB89_6
	}
// %bb.2:                               // %if.then
	{
		p0 = cmp.eq(r25:24,r27:26)
		r1:0 = combine(#-1,#-1)
		if (p0.new) jump:nt .LBB89_19
	}
// %bb.3:                               // %if.then4
	{
		p1 = cmp.gt(r21:20,r1:0)
		if (p1.new) r1:0 = combine(r16,r17)
		if (!p1.new) jump:nt .LBB89_22
	}
// %bb.4:                               // %if.else
	{
		r2 = add(pc,##.L.str.1.14@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.5:                               // %if.else
	{
		jump .LBB89_78
	}
	.falign
.LBB89_6:                               // %if.else15
	{
		p1 = cmp.eq(r25:24,r27:26)
		if (!p1.new) jump:nt .LBB89_12
	}
// %bb.7:                               // %if.else15
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:nt .LBB89_12
	}
// %bb.8:                               // %if.then18
	{
		r1:0 = combine(#-1,#-1)
		p1 = cmp.eq(r18,#0); if (p1.new) jump:nt .LBB89_24
	}
// %bb.9:                               // %if.then20
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (p0.new) r1:0 = combine(r16,r17)
		if (!p0.new) jump:nt .LBB89_48
	}
// %bb.10:                              // %if.else24
	{
		r2 = add(pc,##.L.str.5@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.11:                              // %if.else24
	{
		jump .LBB89_78
	}
	.falign
.LBB89_12:                              // %if.end32
	{
		r1:0 = combine(#-1,#-1)
	}
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (!p0.new) r1:0 = combine(r16,r17)
		if (!p0.new) jump:nt .LBB89_27
	}
// %bb.13:                              // %if.end36
	{
		p1 = cmp.eq(r18,#0); if (p1.new) jump:nt .LBB89_29
	}
	.falign
.LBB89_14:                              // %if.then38
	{
		r22 = #0
		r23 = ##1072693248
		r1:0 = memd(r29+#520)
	}
	{
		r18 = #0
	}
	{
		p0 = dfcmp.uo(r23:22,r1:0)
		p1 = dfcmp.gt(r23:22,r1:0)
	}
	{
		p0 = and(p1,!p0)
		if (p0.new) r20 = #0
		if (p0.new) r18 = #-1
		if (!p0.new) jump:t .LBB89_34
	}
// %bb.15:
	{
		r21 = ##1076101120
	}
	.falign
.LBB89_16:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##__hexagon_muldf3
		r3:2 = combine(r21,r20)
	}
	.falign
// %bb.17:                              // %while.body
                                        //   in Loop: Header=BB89_16 Depth=1
	{
		p0 = dfcmp.uo(r23:22,r1:0)
		p1 = dfcmp.gt(r23:22,r1:0)
	}
	{
		if (!p0.new) jump:nt .LBB89_33
		p0 = and(p1,!p0)
		jump .LBB89_16
		if (p0.new) r18 = add(r18,#-1)
	}
// %bb.18:                              // %while.body.while.body_crit_edge
	.falign
.LBB89_19:                              // %if.else9
	{
		p0 = cmp.gt(r21:20,r1:0)
		if (p0.new) r1:0 = combine(r16,r17)
		if (!p0.new) jump:nt .LBB89_46
	}
// %bb.20:                              // %if.else13
	{
		r2 = add(pc,##.L.str.3.16@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.21:                              // %if.else13
	{
		jump .LBB89_78
	}
	.falign
.LBB89_22:                              // %if.then6
	{
		r2 = add(pc,##.L.str.13@PCREL)
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.23:                              // %if.then6
	{
		jump .LBB89_78
	}
	.falign
.LBB89_24:                              // %if.else26
	{
		p1 = cmp.gt(r21:20,r1:0)
		if (p1.new) r1:0 = combine(r16,r17)
		if (!p1.new) jump:nt .LBB89_54
	}
// %bb.25:                              // %if.else30
	{
		r2 = add(pc,##.L.str.7.19@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.26:                              // %if.else30
	{
		jump .LBB89_78
	}
	.falign
.LBB89_27:                              // %if.then34
	{
		r2 = add(pc,##.L.str.8@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.28:                              // %if.then34
	{
		r17 = r0
		p1 = cmp.eq(r18,#0)
		r3:2 = memd(r29+#520)
	}
	{
		r3 = togglebit(r3,#31)
	}
	{
		if (!p1) jump:nt .LBB89_14
		memd(r29+#520) = r3:2
	}
	.falign
.LBB89_29:                              // %if.else61
	{
		r21 = setbit(r25,#20)
		r19:18 = combine(#0,#0)
		p1 = cmp.eq(r23,#0); if (p1.new) jump:nt .LBB89_56
	}
// %bb.30:                              // %if.end65
	{
		p0 = cmp.gtu(r23,##1074)
		r22 = add(r23,#-1075)
	}
	{
		if (!p0) r24 = #0
		if (p0) r23 = add(r22,#0)
		if (p0) jump:nt .LBB89_63
	}
// %bb.31:                              // %if.then71
	{
		p1 = cmp.gtu(r23,##1022)
		r23 = #0
	}
	{
		if (p1) jump:nt .LBB89_59
		jump .LBB89_60
		if (!p1) r25 = #0
	}
// %bb.32:
	.falign
.LBB89_33:                              // %while.cond.while.cond40.preheader_crit_edge
	{
		memd(r29+#520) = r1:0
	}
	.falign
.LBB89_34:                              // %while.cond40.preheader
	{
		r21 = ##1076101120
		r20 = #0
	}
	{
		p1 = dfcmp.gt(r21:20,r1:0)
		p0 = dfcmp.uo(r21:20,r1:0)
	}
	{
		p1 = or(p0,p1)
		if (p1.new) jump:t .LBB89_38
	}
	.falign
.LBB89_35:                              // %while.body42
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##__hexagon_divdf3
		r3:2 = combine(r21,r20)
	}
	.falign
// %bb.36:                              // %while.body42
                                        //   in Loop: Header=BB89_35 Depth=1
	{
		p1 = dfcmp.uo(r1:0,r21:20)
		p0 = dfcmp.ge(r1:0,r21:20)
		r18 = add(r18,#1)
	}
	{
		p1 = and(p0,!p1)
		if (p1.new) jump:t .LBB89_35
		if (!p1.new) memd(r29+##520) = r1:0
	}
	.falign
.LBB89_38:                              // %while.end43
	{
		r3 = ##1093567616
		r2 = #0
	}
	{
		call ##__hexagon_muldf3
	}
	.falign
// %bb.39:                              // %while.end43
	{
		r3 = ##1071644672
		r2 = #0
	}
	{
		call ##__hexagon_adddf3
	}
	.falign
// %bb.40:                              // %while.end43
	{
		r7:6 = convert_df2ud(r1:0):chop
		r2 = ##-675924773
	}
	{
		r3 = ##1125899906
	}
	{
		r5:4 = mpyu(r6,r2)
	}
	{
		r9:8 = mpyu(r6,r3)
	}
	{
		r1:0 = combine(#0,r5)
	}
	{
		r5:4 = combine(r1,r0)
		r0 = r8
	}
	{
		r5:4 += mpyu(r7,r2)
	}
	{
		r5:4 = add(r5:4,r1:0)
	}
	{
		r0 = r5
	}
	{
		r5:4 = combine(r1,r0)
		r0 = r9
	}
	{
		r5:4 += mpyu(r7,r3)
	}
	{
		r1:0 = add(r5:4,r1:0)
	}
	{
		r3:2 = combine(r0,r1)
	}
	{
		r5:4 = vlsrw(r3:2,#18)
		r2 = ##-1000000
	}
	{
		r5 = insert(r1,#18,#14)
		r1:0 = combine(r16,r17)
	}
	{
		r11:10 = mpyu(r5,r2)
	}
	{
		r11 -= mpyi(r5,#1)
	}
	{
		r11 += mpyi(r2,r4)
		r3:2 = combine(r4,r5)
		r4 = #1
	}
	{
		call ##halide_int64_to_string
		r21:20 = add(r11:10,r7:6)
	}
	.falign
// %bb.41:                              // %while.end43
	{
		r2 = add(pc,##.L.str.30.67@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.42:                              // %while.end43
	{
		r3:2 = combine(r21,r20)
		r4 = #6
		r1 = r16
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.43:                              // %while.end43
	{
		r1 = r16
		p0 = cmp.gt(r18,#-1); if (!p0.new) jump:nt .LBB89_50
	}
// %bb.44:                              // %if.then53
	{
		r2 = add(pc,##.L.str.10@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.45:                              // %if.then53
	{
		jump .LBB89_52
	}
	.falign
.LBB89_46:                              // %if.then11
	{
		r2 = add(pc,##.L.str.2.15@PCREL)
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.47:                              // %if.then11
	{
		jump .LBB89_78
	}
	.falign
.LBB89_48:                              // %if.then22
	{
		r2 = add(pc,##.L.str.4.17@PCREL)
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.49:                              // %if.then22
	{
		jump .LBB89_78
	}
	.falign
.LBB89_50:                              // %if.else55
	{
		r2 = add(pc,##.L.str.11@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.51:                              // %if.else55
	{
		r18 = sub(#0,r18)
	}
	.falign
.LBB89_52:                              // %if.end58
	{
		r1 = r16
		r19 = #0
		r4 = #2
	}
	{
		call ##halide_int64_to_string
		r3:2 = combine(r19,r18)
	}
	.falign
// %bb.53:                              // %if.end58
	{
		jump .LBB89_78
	}
	.falign
.LBB89_54:                              // %if.then28
	{
		r2 = add(pc,##.L.str.6.18@PCREL)
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.55:                              // %if.then28
	{
		jump .LBB89_78
	}
	.falign
.LBB89_56:                              // %if.then63
	{
		r1:0 = combine(r16,r17)
		r4 = #0
		r3:2 = combine(#0,#0)
	}
	{
		call ##halide_double_to_string
	}
	.falign
// %bb.57:                              // %if.then63
	{
		jump .LBB89_78
	}
	.falign
.LBB89_59:                              // %if.else75
	{
		r2 = sub(#0,r22)
	}
	{
		r25:24 = lsr(r21:20,r2)
	}
	{
		r21:20 -= asl(r25:24,r2)
	}
	.falign
.LBB89_60:                              // %if.end83
	{
		r3:2 = convert_ud2df(r21:20)
		r1 = ##1093567616
		r0 = #0
	}
	{
		r1:0 += asl(r23:22,#52)
		call ##__hexagon_muldf3
	}
	.falign
// %bb.61:                              // %if.end83
	{
		r3 = ##1071644672
		r2 = #0
	}
	{
		call ##__hexagon_adddf3
	}
	.falign
// %bb.62:                              // %if.end83
	{
		r3:2 = convert_df2ud(r1:0):chop
		r5:4 = combine(#0,#1)
	}
	{
		r5:4 = add(r25:24,r5:4)
	}
	{
		p0 = tstbit(r2,#0)
		r7:6 = convert_ud2df(r3:2)
	}
	{
		p1 = dfcmp.uo(r1:0,r7:6)
		p2 = dfcmp.eq(r1:0,r7:6)
	}
	{
		p1 = and(p2,!p1)
	}
	{
		p0 = and(p1,p0)
	}
	{
		r6 = mux(p0,#-1,#0)
	}
	{
		r1:0 = add(r7:6,r3:2):raw:lo
		r2 = ##1000000
		r3 = #0
	}
	{
		p2 = cmp.eq(r1:0,r3:2)
	}
	{
		r20 = mux(p2,r4,r24)
		r18 = mux(p2,r23,r0)
		r21 = mux(p2,r5,r25)
		r19 = mux(p2,r23,r1)
	}
	.falign
.LBB89_63:                              // %if.end104
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r5 = add(r29,#0)
	}
	{
		r20 = add(r5,#480)
		r1 = add(r5,#512)
	}
	{
		call ##halide_int64_to_string
		r0 = r20
	}
	.falign
// %bb.64:                              // %if.end104
	{
		loop1(.LBB89_66,r23)
		r3 = #49
		p1 = cmp.gt(r23,#0); if (!p1.new) jump:nt .LBB89_74
	}
	.falign
.Ltmp4:                                 // Block address taken
.LBB89_66:                              // %for.cond111.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB89_69 Depth 2
	{
		p0 = cmp.eq(r0,r20); if (p0.new) jump:nt .LBB89_73
		r4 = #0
		r2 = r0
	}
// %bb.67:                              //   in Loop: Header=BB89_66 Depth=1
	{
		r6 = sub(r0,r20)
		r2 = add(r0,#-1)
		r5 = memub(r0+#-1)
	}
	{
		p2 = cmp.gtu(r6,#1)
	}
	{
		r5 = add(##-96,asl(r5,#1))
		if (!p2) r2 = add(r0,#0)
		if (!p2) jump:nt .LBB89_72
	}
// %bb.68:                              // %for.body115
                                        //   in Loop: Header=BB89_66 Depth=1
	{
		r9 = or(r5,r4)
		r8 = add(r6,#-2)
		p1 = cmp.gtu(r6,#2)
		r5 = memub(r2+#-1)
	}
	{
		r12 = sxtb(r9)
		r7 = add(r2,#-1)
	}
	{
		loop0(.LBB89_69,r8)
		p0 = cmp.gt(r12,#9)
		r8 = r0
	}
	{
		r5 = add(##-96,asl(r5,#1))
		if (p0) r6 = add(r9,#-10)
		r4 = mux(p0,#1,#0)
	}
	{
		if (!p0) r6 = add(r9,#0)
		if (!p1) jump:nt .LBB89_70
	}
	.falign
.LBB89_69:                              // %for.body115
                                        //   Parent Loop BB89_66 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r9 = or(r5,r4)
		r5 = add(r6,#48)
		r8 = r2
		memb(r8+#-1) = r5.new
	}
	{
		r2 = r7
		r7 = sxtb(r9)
		r5 = memub(r7+#-1)
	}
	{
		p1 = cmp.gt(r7,#9)
		r7 = add(r2,#-1)
		if (p1.new) r6 = add(r9,#-10)
	}
	{
		r5 = add(##-96,asl(r5,#1))
		r4 = mux(p1,#1,#0)
		if (!p1) r6 = add(r9,#0)
	} :endloop0
	.falign
.LBB89_70:                              //   in Loop: Header=BB89_66 Depth=1
	{
		r6 = add(r6,#48)
		memb(r8+#-1) = r6.new
	}
	.falign
.LBB89_72:                              //   in Loop: Header=BB89_66 Depth=1
	{
		r4 = or(r5,r4)
	}
	{
		r5 = sxtb(r4)
	}
	{
		p0 = cmp.gt(r5,#9)
		if (p0.new) r5 = add(r4,#-10)
		if (!p0.new) r5 = add(r4,#0)
	}
	{
		r4 = add(r5,#48)
		if (p0) r2 = add(r20,#-1)
		memb(r2+#-1) = r4.new
	}
	{
		if (!p0) r2 = add(r20,#0)
		if (p0) memb(r20+##-1) = r3
	}
	.falign
.LBB89_73:                              // %if.end137
                                        //   in Loop: Header=BB89_66 Depth=1
	{
		r20 = r2
		nop
		nop
	} :endloop1
	{
		jump .LBB89_75
	}
	.falign
.LBB89_74:
	{
		r2 = r20
	}
	.falign
.LBB89_75:                              // %for.cond.cleanup
	{
		call ##halide_string_to_string
		r1:0 = combine(r16,r17)
	}
	.falign
// %bb.76:                              // %for.cond.cleanup
	{
		r2 = add(pc,##.L.str.30.67@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.77:                              // %for.cond.cleanup
	{
		r3:2 = combine(r19,r18)
		r4 = #6
		r1 = r16
	}
	{
		call ##halide_int64_to_string
	}
	.falign
.LBB89_78:                              // %cleanup147
	{
		r17:16 = memd(r29+#576)
		r19:18 = memd(r29+#568)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#560)
		r23:22 = memd(r29+#552)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#544)
		r27:26 = memd(r29+#536)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Ltmp5:                                 // Address of block that was removed by CodeGen
.Lfunc_end89:
	.size	halide_double_to_string, .Lfunc_end89-halide_double_to_string
                                        // -- End function
	.section	.text.halide_pointer_to_string,"ax",@progbits
	.weak	halide_pointer_to_string        // -- Begin function halide_pointer_to_string
	.falign
	.type	halide_pointer_to_string,@function
halide_pointer_to_string:               // @halide_pointer_to_string
// %bb.0:                               // %entry
	{
		r4 = add(pc,##.L.str.12.21@PCREL)
		r7:6 = bitsplit(r2,#4)
		allocframe(r29,#24):raw
	}
	{
		r9:8 = combine(#0,#0)
		r5 = add(r29,#0)
		memw(r29+#16) = #0
	}
	{
		p0 = cmp.eq(r7,#0)
		r3 = add(r5,#17)
		memd(r29+#8) = r9:8
		memd(r29+#0) = r9:8
	}
	{
		if (!p0) r7 = add(r29,#0)
		if (p0) jump:nt .LBB90_8
		r6 = memub(r4+r6<<#0)
		memb(r29+#18) = r6.new
	}
// %bb.1:                               // %for.cond
	{
		r5 = lsr(r2,#4)
		r6 = lsr(r2,#8)
	}
	{
		r8 = and(r5,#15)
		p1 = cmp.eq(r6,#0)
	}
	{
		if (p1) r5 = add(r3,#0)
		r6 = memub(r4+r8<<#0)
		memb(r29+#17) = r6.new
	}
	{
		r6 = add(r7,#16)
		if (p1) jump:nt .LBB90_9
	}
// %bb.2:                               // %for.cond.1
	{
		r3 = extractu(r5,#4,#4)
		r7 = lsr(r2,#12)
	}
	{
		r7 = add(r29,#0)
		p0 = cmp.eq(r7,#0)
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#16) = r3.new
	}
	{
		if (p0) r5 = add(r6,#0)
		r3 = add(r7,#15)
		if (p0) jump:nt .LBB90_15
	}
// %bb.3:                               // %for.cond.2
	{
		r6 = extractu(r5,#4,#8)
		r7 = lsr(r2,#16)
	}
	{
		p1 = cmp.eq(r7,#0)
		r7 = add(r29,#0)
	}
	{
		r6 = memub(r4+r6<<#0)
		memb(r29+#15) = r6.new
	}
	{
		if (p1) r5 = add(r3,#0)
		r6 = add(r7,#14)
		if (p1) jump:nt .LBB90_11
	}
// %bb.4:                               // %for.cond.3
	{
		r3 = extractu(r5,#4,#12)
		r7 = lsr(r2,#20)
	}
	{
		r7 = add(r29,#0)
		p0 = cmp.eq(r7,#0)
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#14) = r3.new
	}
	{
		if (p0) r5 = add(r6,#0)
		r3 = add(r7,#13)
		if (p0) jump:nt .LBB90_15
	}
// %bb.5:                               // %for.cond.4
	{
		r6 = extractu(r5,#4,#16)
		r7 = lsr(r2,#24)
	}
	{
		p1 = cmp.eq(r7,#0)
		r7 = add(r29,#0)
	}
	{
		r6 = memub(r4+r6<<#0)
		memb(r29+#13) = r6.new
	}
	{
		r2 = lsr(r2,#28)
		if (p1) r5 = add(r3,#0)
		r6 = add(r7,#12)
		if (p1) jump:nt .LBB90_13
	}
// %bb.6:                               // %for.cond.5
	{
		r3 = extractu(r5,#4,#20)
		r5 = add(r29,#0)
		p0 = cmp.eq(r2,#0)
	}
	{
		r3 = memub(r4+r3<<#0)
		memb(r29+#12) = r3.new
	}
	{
		if (!p0) r6 = add(r29,#0)
		r3 = add(r5,#11)
		if (p0) jump:nt .LBB90_14
	}
// %bb.7:                               // %for.cond.6
	{
		r5 = r3
		r2 = memub(r4+r2<<#0)
		memb(r29+#11) = r2.new
	}
	{
		r3 = add(r6,#10)
		jump .LBB90_15
	}
	.falign
.LBB90_8:
	{
		r5 = add(r5,#18)
		jump .LBB90_15
	}
	.falign
.LBB90_9:
	{
		r3 = r6 ; jump .LBB90_15
	}
	.falign
.LBB90_11:
	{
		r3 = r6 ; jump .LBB90_15
	}
	.falign
.LBB90_13:
	{
		r3 = r6 ; jump .LBB90_15
	}
	.falign
.LBB90_14:
	{
		r5 = r6
	}
	.falign
.LBB90_15:                              // %cleanup
	{
		r2 = add(r5,#-2)
		r3 = #48
		memb(r3+#0) = #120
	}
	{
		call ##halide_string_to_string
		memb(r5+#-2) = r3
	}
	.falign
// %bb.16:                              // %cleanup
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end90:
	.size	halide_pointer_to_string, .Lfunc_end90-halide_pointer_to_string
                                        // -- End function
	.section	.text.halide_type_to_string,"ax",@progbits
	.weak	halide_type_to_string           // -- Begin function halide_type_to_string
	.falign
	.type	halide_type_to_string,@function
halide_type_to_string:                  // @halide_type_to_string
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r2 = memb(r2+#0)
	}
	{
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.gtu(r2,#3); if (p0.new) jump:t .LBB91_2
	}
// %bb.1:                               // %switch.lookup
	{
		r3 = add(pc,##.Lswitch.table.halide_type_to_string@PCREL)
	}
	{
		jump .LBB91_3
		r2 = memw(r3+r2<<#2)
	}
	.falign
.LBB91_2:
	{
		r2 = add(pc,##.L.str.17@PCREL)
	}
	.falign
.LBB91_3:                               // %sw.epilog
	{
		call ##halide_string_to_string
		r1 = r17
	}
	.falign
// %bb.4:                               // %sw.epilog
	{
		r1 = r17
		r4 = #1
		r19 = #0
		r18 = memub(r16+#1)
	}
	{
		call ##halide_uint64_to_string
		r3:2 = combine(r19,r18)
	}
	.falign
// %bb.5:                               // %sw.epilog
	{
		r1 = r17
		r2 = memh(r16+#2)
		if (!cmp.eq(r2.new,#1)) jump:t .LBB91_7
	}
// %bb.6:                               // %if.end
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB91_7:                               // %if.then
	{
		r2 = add(pc,##.L.str.18@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.8:                               // %if.then
	{
		r1 = r17
		r4 = #1
		r18 = memuh(r16+#2)
		r17:16 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r3:2 = combine(r19,r18)
		r19:18 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_uint64_to_string
	}
.Lfunc_end91:
	.size	halide_type_to_string, .Lfunc_end91-halide_type_to_string
                                        // -- End function
	.section	.text.halide_buffer_to_string,"ax",@progbits
	.weak	halide_buffer_to_string         // -- Begin function halide_buffer_to_string
	.falign
	.type	halide_buffer_to_string,@function
halide_buffer_to_string:                // @halide_buffer_to_string
// %bb.0:                               // %entry
	{
		p0 = cmp.eq(r2,#0)
		r16 = r1
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#16) = r19:18
		memd(r29+#8) = r21:20
	}                                       // 8-byte Folded Spill
	{
		if (p0) jump:nt .LBB92_22
		memd(r29+#0) = r23:22
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end
	{
		r2 = add(pc,##.L.str.20@PCREL)
		r17 = r2
		r1 = r16
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.2:                               // %if.end
	{
		r1 = r16
		r4 = #1
		r3:2 = memd(r17+#0)
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.3:                               // %if.end
	{
		r18 = add(pc,##.L.str.58.76@PCREL)
		r1 = r16
	}
	{
		call ##halide_string_to_string
		r2 = r18
	}
	.falign
// %bb.4:                               // %if.end
	{
		call ##halide_pointer_to_string
		r1 = r16
		r2 = memw(r17+#8)
	}
	.falign
// %bb.5:                               // %if.end
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	.falign
// %bb.6:                               // %if.end
	{
		call ##halide_pointer_to_string
		r1 = r16
		r2 = memw(r17+#12)
	}
	.falign
// %bb.7:                               // %if.end
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	.falign
// %bb.8:                               // %if.end
	{
		r1 = r16
		r4 = #1
		r3:2 = memd(r17+#16)
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.9:                               // %if.end
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	.falign
// %bb.10:                              // %if.end
	{
		call ##halide_type_to_string
		r2 = add(r17,#24)
		r1 = r16
	}
	.falign
// %bb.11:                              // %if.end
	{
		r22 = #0
		r21 = #0
		r2 = memw(r17+#28)
		if (!cmp.gt(r2.new,#0)) jump:nt .LBB92_21
	}
// %bb.12:                              // %for.body.lr.ph
	{
		r18 = add(pc,##.L.str.22@PCREL)
	}
	{
		r19 = add(pc,##.L.str.58.76@PCREL)
	}
	{
		r20 = add(pc,##.L.str.23@PCREL)
	}
	.falign
.LBB92_13:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r18
	}
	.falign
// %bb.14:                              // %for.body
                                        //   in Loop: Header=BB92_13 Depth=1
	{
		r4 = #1
		r1 = r16
		r2 = memw(r17+#32)
	}
	{
		r2 = memw(r2+r21<<#0)
	}
	{
		call ##halide_int64_to_string
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %for.body
                                        //   in Loop: Header=BB92_13 Depth=1
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r19
	}
	.falign
// %bb.16:                              // %for.body
                                        //   in Loop: Header=BB92_13 Depth=1
	{
		r4 = #1
		r1 = r16
		r2 = memw(r17+#32)
	}
	{
		r2 = add(r2,r21)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		call ##halide_int64_to_string
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.17:                              // %for.body
                                        //   in Loop: Header=BB92_13 Depth=1
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r19
	}
	.falign
// %bb.18:                              // %for.body
                                        //   in Loop: Header=BB92_13 Depth=1
	{
		r4 = #1
		r1 = r16
		r2 = memw(r17+#32)
	}
	{
		r2 = add(r2,r21)
	}
	{
		r2 = memw(r2+#8)
	}
	{
		call ##halide_int64_to_string
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.19:                              // %for.body
                                        //   in Loop: Header=BB92_13 Depth=1
	{
		call ##halide_string_to_string
		r1 = r16
		r2 = r20
	}
	.falign
// %bb.20:                              // %for.body
                                        //   in Loop: Header=BB92_13 Depth=1
	{
		r21 = add(r21,#16)
		r2 = memw(r17+#28)
	}
	{
		r22 = add(r22,#1)
		if (cmp.gt(r2,r22.new)) jump:t .LBB92_13
	}
	.falign
.LBB92_21:                              // %for.cond.cleanup
	{
		r2 = add(pc,##.L.str.8.45@PCREL)
		r1 = r16
		r17:16 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#16)
		r21:20 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_string_to_string
		r23:22 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	.falign
.LBB92_22:                              // %if.then
	{
		r2 = add(pc,##.L.str.19@PCREL)
		r1 = r16
		r17:16 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#16)
		r21:20 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_string_to_string
		r23:22 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
.Lfunc_end92:
	.size	halide_buffer_to_string, .Lfunc_end92-halide_buffer_to_string
                                        // -- End function
	.section	.text.halide_malloc_alignment,"ax",@progbits
	.weak	halide_malloc_alignment         // -- Begin function halide_malloc_alignment
	.balign 32
	.type	halide_malloc_alignment,@function
halide_malloc_alignment:                // @halide_malloc_alignment
// %bb.0:                               // %entry
	{
		r0 = #128
		jumpr r31
	}
.Lfunc_end93:
	.size	halide_malloc_alignment, .Lfunc_end93-halide_malloc_alignment
                                        // -- End function
	.section	.text.halide_reuse_device_allocations,"ax",@progbits
	.weak	halide_reuse_device_allocations // -- Begin function halide_reuse_device_allocations
	.falign
	.type	halide_reuse_device_allocations,@function
halide_reuse_device_allocations:        // @halide_reuse_device_allocations
// %bb.0:                               // %entry
	{
		p0 = tstbit(r1,#0)
		r17 = #0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r18 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r2 = memw(r18+##_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOT)
	}
	{
		if (p0) jump:nt .LBB94_6
		memb(r2+#0) = r1
	}
// %bb.1:                               // %if.then
	{
		r16 = r0
		r0 = memw(r18+##_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOT)
	}
	{
		call ##halide_mutex_lock
	}
	.falign
// %bb.2:                               // %if.then
	{
		r17 = #0
		r2 = memw(r18+##_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOT)
	}
	{
		r19 = memw(r2+#0)
		if (cmp.eq(r19.new,#0)) jump:nt .LBB94_5
	}
	.falign
.LBB94_3:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r0 = r16
		r2 = memw(r19+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.4:                               // %for.body
                                        //   in Loop: Header=BB94_3 Depth=1
	{
		p0 = cmp.eq(r0,#0)
		if (!p0.new) r17 = add(r0,#0)
		r19 = memw(r19+#4)
		if (!cmp.eq(r19.new,#0)) jump:t .LBB94_3
	}
	.falign
.LBB94_5:                               // %for.cond.cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r18+##_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOT)
	}
	.falign
.LBB94_6:                               // %if.end5
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end94:
	.size	halide_reuse_device_allocations, .Lfunc_end94-halide_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_can_reuse_device_allocations,"ax",@progbits
	.weak	halide_can_reuse_device_allocations // -- Begin function halide_can_reuse_device_allocations
	.balign 32
	.type	halide_can_reuse_device_allocations,@function
halide_can_reuse_device_allocations:    // @halide_can_reuse_device_allocations
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOT)
	}
	{
		r0 = memub(r2+#0)
		jumpr r31
	}
.Lfunc_end95:
	.size	halide_can_reuse_device_allocations, .Lfunc_end95-halide_can_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_register_device_allocation_pool,"ax",@progbits
	.weak	halide_register_device_allocation_pool // -- Begin function halide_register_device_allocation_pool
	.balign 32
	.type	halide_register_device_allocation_pool,@function
halide_register_device_allocation_pool: // @halide_register_device_allocation_pool
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r18 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r17 = memw(r18+##_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		r0 = r17
		r2 = memw(r18+##_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOT)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r3 = memw(r2+#0)
		memw(r16+#4) = r3.new
	}
	{
		r17:16 = memd(r29+#8)
		memw(r2+#0) = r16
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_mutex_unlock
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end96:
	.size	halide_register_device_allocation_pool, .Lfunc_end96-halide_register_device_allocation_pool
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx // -- Begin function _ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	.falign
	.type	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,@function
_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx: // @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
// %bb.0:                               // %entry
	{
		r17:16 = combine(r3,r2)
		p0 = cmp.gt(r1,#-1)
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r2 = add(r0,#24)
		if (p0) r6 = add(r1,#1)
	}
	{
		r19:18 = combine(r5,r4)
		r20 = r0
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#16) = r23:22
		memd(r29+#8) = r25:24
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB97_4
		memd(r29+#0) = r27:26
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %land.end.preheader
	{
		loop0(.LBB97_2,r6)
		r3 = asl(r1,#3)
		r5:4 = combine(#0,#1)
	}
	{
		r3 = add(r3,add(r20,#24))
	}
	.falign
.Ltmp6:                                 // Block address taken
.LBB97_2:                               // %land.end
                                        // =>This Inner Loop Header: Depth=1
	{
		r7:6 = memd(r3+#0)
	}
	{
		p1 = cmp.eq(r7:6,r5:4)
		r3 = add(r3,#-8)
		if (p1.new) r1 = add(r1,#-1)
		if (!p1.new) jump:nt .LBB97_6
	}
// %bb.3:                               // %while.body
                                        //   in Loop: Header=BB97_2 Depth=1
	{
		nop
		nop
	} :endloop0
	{
		jump .LBB97_12
	}
	.falign
.LBB97_4:                               // %while.end
	{
		p0 = cmp.eq(r1,#-1); if (p0.new) jump:nt .LBB97_12
		if (!p0.new) r7:6 = memd(r2+r1<<#3)
	}
	.falign
.LBB97_6:                               // %if.else
	{
		r5:4 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r7:6,r5:4)
		if (!p1.new) r21 = add(r1,#-1)
		if (p1.new) jump:nt .LBB97_11
	}
// %bb.7:                               // %for.body.lr.ph
	{
		r3 = addasl(r20,r1,#3)
		r22 = addasl(r2,r1,#3)
		r27:26 = combine(#0,#1)
	}
	{
		r23 = add(r3,#152)
		r24 = add(r3,#280)
	}
	.falign
.LBB97_8:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	{
		r1:0 = combine(r21,r20)
		r3:2 = combine(r17,r16)
		r5:4 = combine(r19,r18)
	}
	{
		call ##_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	}
	.falign
// %bb.9:                               // %for.body
                                        //   in Loop: Header=BB97_8 Depth=1
	{
		r1:0 = memd(r22+#0)
	}
	{
		p0 = cmp.gtu(r1:0,r27:26)
		if (!p0.new) jump:nt .LBB97_11
		if (p0.new) r3:2 = memd(r24+#0)
		if (p0.new) r1:0 = memd(r23+#0)
	}
// %bb.10:                              // %for.body.for.body_crit_edge
                                        //   in Loop: Header=BB97_8 Depth=1
	{
		r17:16 = add(r1:0,r17:16)
		r19:18 = add(r3:2,r19:18)
		r1:0 = combine(#0,#1)
	}
	{
		r27:26 = add(r27:26,r1:0)
		jump .LBB97_8
	}
	.falign
.LBB97_11:                              // %if.end
	{
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#8)
		r27:26 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB97_12:                              // %if.then
	{
		r1:0 = memd(r20+#8)
		r5:4 = memd(r20+#0)
	}
	{
		r1:0 = add(r1:0,r19:18)
		r2 = memw(r20+#408)
		r21:20 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r5:4 = add(r5:4,r17:16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r1 = r4
		r23:22 = memd(r29+#16)
		r25:24 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		jump ##memcpy
		r27:26 = memd(r29+#0)
		r31:30 = deallocframe(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end97:
	.size	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx, .Lfunc_end97-_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv // -- Begin function _ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	.balign 32
	.type	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,@function
_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv: // @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
// %bb.0:                               // %entry
	{
		r1 = #15
		r3:2 = memd(r0+#0)
		r5:4 = memd(r0+#8)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (!p0.new) jump:t .LBB98_2
		if (!p0.new) r3:2 = memd(r0+#16)
	}
// %bb.1:                               // %if.end
	{
		jumpr r31
	}
	.falign
.LBB98_2:                               // %if.then
	{
		r5:4 = combine(#0,#0)
		jump ##_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	}
.Lfunc_end98:
	.size	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv, .Lfunc_end98-_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b // -- Begin function _ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	.falign
	.type	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,@function
_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b: // @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
// %bb.0:                               // %entry
	{
		p1 = tstbit(r2,#0)
		p0 = tstbit(r4,#0)
		r9:8 = combine(#0,#0)
		allocframe(r29,#456):raw
	}
	{
		r13:12 = combine(#0,#1)
		r15:14 = combine(#0,#0)
		if (!p1) r5:4 = memd(r1+#0)
		r2 = memub(r1+#25)
	}
	{
		if (p1) r5 = #0
		r7 = add(r29,#0)
		if (p1) r4 = memw(r1+#12)
		r6 = memw(r1+#28)
	}
	{
		r2 = add(r2,#7)
		memd(r29+#448) = r17:16
		memd(r29+#440) = r19:18
	}                                       // 8-byte Folded Spill
	{
		if (!p0) r5:4 = memd(r3+#0)
		memd(r29+#0) = r5:4
	}
	{
		if (p0) r5 = #0
		p0 = cmp.gt(r6,#0)
		if (p0) r4 = memw(r3+#12)
		memd(r29+#432) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#424) = r23:22
		memd(r29+#24) = r13:12
	}                                       // 8-byte Folded Spill
	{
		r4 = lsr(r2,#3)
		r5 = #0
		memd(r29+#8) = r5:4
		memd(r29+#152) = r9:8
	}
	{
		memd(r29+#280) = r9:8
		memd(r29+#160) = r9:8
	}
	{
		memd(r29+#288) = r9:8
		memd(r29+#32) = r13:12
	}
	{
		memd(r29+#40) = r13:12
		memd(r29+#168) = r9:8
	}
	{
		memd(r29+#296) = r9:8
		memd(r29+#48) = r13:12
	}
	{
		memd(r29+#176) = r9:8
		memd(r29+#304) = r9:8
	}
	{
		memd(r29+#56) = r13:12
		memd(r29+#184) = r9:8
	}
	{
		memd(r29+#312) = r9:8
		memd(r29+#64) = r13:12
	}
	{
		memd(r29+#192) = r9:8
		memd(r29+#320) = r9:8
	}
	{
		memd(r29+#72) = r13:12
		memd(r29+#200) = r9:8
	}
	{
		memd(r29+#328) = r9:8
		memd(r29+#80) = r13:12
	}
	{
		memd(r29+#208) = r9:8
		memd(r29+#336) = r9:8
	}
	{
		memd(r29+#88) = r13:12
		memd(r29+#408) = r5:4
	}
	{
		memd(r29+#216) = r9:8
		memd(r29+#344) = r9:8
	}
	{
		memd(r29+#96) = r13:12
		memd(r29+#224) = r9:8
	}
	{
		memd(r29+#352) = r9:8
		memd(r29+#104) = r13:12
	}
	{
		memd(r29+#232) = r9:8
		memd(r29+#360) = r9:8
	}
	{
		memd(r29+#112) = r13:12
		memd(r29+#240) = r9:8
	}
	{
		memd(r29+#368) = r9:8
		memd(r29+#120) = r13:12
	}
	{
		memd(r29+#248) = r9:8
		memd(r29+#376) = r9:8
	}
	{
		memd(r29+#128) = r13:12
		memd(r29+#256) = r9:8
	}
	{
		memd(r29+#384) = r9:8
		memd(r29+#136) = r13:12
	}
	{
		memd(r29+#264) = r9:8
		memd(r29+#392) = r9:8
	}
	{
		memd(r29+#144) = r13:12
		memd(r29+#272) = r9:8
	}
	{
		if (!p0) jump:nt .LBB99_8
		memd(r29+#400) = r9:8
		memd(r29+#16) = r9:8
	}
// %bb.1:                               // %for.body17.lr.ph
	{
		r16 = lsr(r6,#1)
		r12 = and(r6,#1)
		r13 = memw(r1+#32)
		r5 = memw(r3+#32)
	}
	{
		p1 = cmp.gtu(r16,#0)
	}
	{
		r13 = add(r13,#8)
		if (!p1) jump:nt .LBB99_27
		if (p1) r10 = memw(r5+#0)
	}
// %bb.2:
	{
		p1 = cmp.gtu(r16,#1)
		r28 = add(r13,#32)
		r11 = memw(r13+#-8)
		r14 = memw(r13+#0)
	}
	{
		r11 = sub(r10,r11)
		r15 = memw(r13+#8)
	}
	{
		r5 = add(r5,#32)
		if (!p1) jump:nt .LBB99_6
		r10 = memw(r5+#16)
	}
// %bb.3:
	{
		r14 = mpyi(r11,r14)
		r17 = sub(r10,r15)
		r10 = add(r16,#-2)
		r13 = memw(r13+#16)
	}
	{
		p1 = cmp.gtu(r16,#2)
		r16 = add(r28,#32)
		r11 = memw(r5+#0)
		r18 = memw(r28+#-8)
	}
	{
		loop0(.LBB99_4,r10)
		r9:8 = add(r15:14,r9:8):raw:lo
		r5 = add(r5,#32)
		r10 = memw(r5+#16)
	}
	{
		r17 = mpyi(r17,r13)
		r11 = sub(r11,r18)
		r14 = memw(r28+#0)
		r15 = memw(r28+#8)
	}
	{
		r13 = r28
		if (!p1) jump:nt .LBB99_5
	}
	.falign
.LBB99_4:                               // =>This Inner Loop Header: Depth=1
	{
		r28 = mpyi(r11,r14)
		r18 = sub(r10,r15)
		r13 = r16
		r19 = memw(r28+#16)
	}
	{
		r9:8 = add(r17:16,r9:8):raw:hi
		r16 = add(r16,#32)
		r20 = memw(r16+#-8)
		r11 = memw(r5+#0)
	}
	{
		r9:8 = add(r29:28,r9:8):raw:lo
		r5 = add(r5,#32)
		r10 = memw(r5+#16)
		r14 = memw(r13+#0)
	}
	{
		r17 = mpyi(r18,r19)
		r28 = r13
		r15 = memw(r13+#8)
	}
	{
		r11 = sub(r11,r20)
		nop
	} :endloop0
	.falign
.LBB99_5:
	{
		r9:8 = add(r17:16,r9:8):raw:hi
		r28 = r16
	}
	.falign
.LBB99_6:
	{
		r14 = mpyi(r11,r14)
		r15 = sub(r10,r15)
		p1 = cmp.gtu(r12,#0)
		r13 = memw(r13+#16)
	}
	{
		r9:8 = add(r15:14,r9:8):raw:lo
	}
	{
		r14 = mpyi(r15,r13)
		r13 = r28
	}
	{
		r9:8 = add(r15:14,r9:8):raw:lo
	}
	{
		r15:14 = combine(r9,r8)
		if (p1) jump:nt .LBB99_28
	}
	.falign
.LBB99_7:                               // %for.cond14.for.cond.cleanup16_crit_edge
	{
		memd(r29+#16) = r15:14
	}
	.falign
.LBB99_8:                               // %for.cond.cleanup16
	{
		r9:8 = memd(r29+#408)
		r5 = memw(r3+#28)
	}
	{
		p1 = cmp.eq(r6,r5)
	}
	{
		r13:12 = mpyu(r8,r14)
	}
	{
		r13 += mpyi(r8,r15)
	}
	{
		r13 += mpyi(r14,r9)
	}
	{
		if (!p1) jump:nt .LBB99_25
		memd(r29+#16) = r13:12
	}
// %bb.9:                               // %lor.lhs.false
	{
		p1 = cmp.gt(r6,#16); if (p1.new) jump:nt .LBB99_25
		if (!p1.new) r5 = memub(r3+#25)
	}
// %bb.10:                              // %lor.lhs.false
	{
		r12 = add(r5,#7)
	}
	{
		r2 = xor(r12,r2)
		if (cmp.gtu(r2.new,#7)) jump:nt .LBB99_25
	}
// %bb.11:                              // %if.end
	{
		r15:14 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r9:8,r15:14)
		if (p1.new) jump:nt .LBB99_29
	}
// %bb.12:                              // %for.cond48.preheader
	{
		if (p0) r2 = add(r7,#24)
		if (p0) r13 = #0
		if (!p0) jump:nt .LBB99_35
		if (p0) r3 = memw(r3+#32)
	}
// %bb.13:                              // %for.body52.lr.ph
	{
		r9 = lsr(r12,#3)
		r5 = add(r7,#152)
		r12 = memw(r1+#32)
	}
	{
		r8 = add(r7,#280)
		r7 = add(r7,#144)
	}
	{
		loop1(.LBB99_14,r6)
	}
	.falign
.Ltmp7:                                 // Block address taken
.LBB99_14:                              // %for.body52
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB99_17 Depth 2
                                        //     Child Loop BB99_22 Depth 2
	{
		r6 = addasl(r3,r13,#4)
		r14 = addasl(r12,r13,#4)
		p1 = cmp.eq(r13,#0)
		r28 = #0
	}
	{
		if (!p1) r28 = add(r13,#0)
		if (!p1) r10 = #0
		r15 = memw(r6+#8)
		r1 = memw(r14+#8)
	}
	{
		r14 = mpyi(r15,r9)
		r1 = mpyi(r1,r4)
	}
	{
		r15 = asr(r14,#31)
		if (p1) jump:nt .LBB99_20
	}
// %bb.15:                              // %for.body71.lr.ph
                                        //   in Loop: Header=BB99_14 Depth=1
	{
		p0 = cmp.eq(r14,#0)
		if (!p0.new) r28 = add(r8,#0)
		if (p0.new) jump:nt .LBB99_20
	}
// %bb.16:                              //   in Loop: Header=BB99_14 Depth=1
	{
		loop0(.LBB99_17,r13)
	}
	.falign
.Ltmp8:                                 // Block address taken
.LBB99_17:                              // %for.body71.us
                                        //   Parent Loop BB99_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r17:16 = memd(r28+#0)
	}
	{
		p1 = cmp.gtu(r17:16,r15:14)
		r28 = add(r28,#8)
		if (!p1.new) r10 = add(r10,#1)
		if (p1.new) jump:nt .LBB99_24
	}
// %bb.18:                              // %for.inc78.us
                                        //   in Loop: Header=BB99_17 Depth=2
	{
		nop
		nop
	} :endloop0
// %bb.19:                              //   in Loop: Header=BB99_14 Depth=1
	{
		r28 = r13
	}
	.falign
.LBB99_20:                              // %for.end80
                                        //   in Loop: Header=BB99_14 Depth=1
	{
		r11:10 = sxtw(r1)
		p0 = cmp.gtu(r13,r28)
		if (!p0.new) jump:t .LBB99_23
	}
	.falign
.LBB99_21:                              //   in Loop: Header=BB99_14 Depth=1
	{
		r1 = r7
		r16 = sub(r13,r28)
	}
	{
		loop0(.LBB99_22,r16)
	}
	.falign
.Ltmp9:                                 // Block address taken
.LBB99_22:                              // %for.body84
                                        //   Parent Loop BB99_14 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		r17:16 = memd(r1+#-128)
		r19:18 = memd(r1+#128)
	}
	{
		memd(r1+#-120) = r17:16
		memd(r1+#136) = r19:18
	}
	{
		r17:16 = memd(r1++#-8)
	}
	{
		nop
		memd(r1+#16) = r17:16
	} :endloop0
	.falign
.LBB99_23:                              // %for.cond.cleanup83
                                        //   in Loop: Header=BB99_14 Depth=1
	{
		r13 = add(r13,#1)
		r7 = add(r7,#8)
		r6 = memw(r6+#4)
		memd(r8+r28<<#3) = r15:14

	} :mem_noshuf
	{
		memd(r5+r28<<#3) = r11:10
	}
	{
		r15:14 = sxtw(r6)
	}
	{
		nop
		nop
		memd(r2+r28<<#3) = r15:14
	} :endloop1
	{
		jump .LBB99_31
	}
	.falign
.LBB99_24:                              //   in Loop: Header=BB99_14 Depth=1
	{
		r28 = r10
	}
	{
		r11:10 = sxtw(r1)
		p0 = cmp.gtu(r13,r28)
		if (p0.new) jump:t .LBB99_21
	}
	{
		jump .LBB99_23
	}
	.falign
.LBB99_25:                              // %if.then
	{
		call ##memset
		r1 = #0
		r2 = #416
	}
	.falign
.LBB99_26:                              // %cleanup
	{
		r17:16 = memd(r29+#448)
		r19:18 = memd(r29+#440)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#432)
		r23:22 = memd(r29+#424)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB99_27:
	{
		p1 = cmp.gtu(r12,#0)
		if (!p1.new) jump:t .LBB99_7
	}
	.falign
.Ltmp10:                                // Block address taken
.LBB99_28:                              // %for.body17
	{
		r12 = memw(r13+#-8)
		r14 = memw(r5+#0)
	}
	{
		r5 = memw(r13++#16)
	}
	{
		r12 = sub(r14,r12)
	}
	{
		r5 = mpyi(r12,r5)
	}
	{
		r15:14 = add(r5:4,r9:8):raw:hi
		jump .LBB99_7
	}
	.falign
.LBB99_29:                              // %if.then45
	{
		call ##memset
		r1 = #0
		r2 = #416
	}
	.falign
// %bb.30:                              // %if.then45
	{
		jump .LBB99_26
	}
	.falign
.LBB99_31:                              // %while.cond.preheader
	{
		r7:6 = combine(#0,#0)
		r5:4 = combine(#0,#1)
		r15:14 = memd(r29+#408)
		r3:2 = memd(r29+#152)
	}
	{
		p0 = cmp.eq(r15:14,r3:2)
		if (!p0.new) jump:t .LBB99_35
		if (p0.new) r3:2 = memd(r29+#280)
	}
	.falign
.LBB99_33:                              // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	{
		p1 = cmp.eq(r15:14,r3:2)
		if (!p1.new) jump:nt .LBB99_35
		if (p1.new) r15:14 = memd(r29+#32)
		if (p1.new) r21:20 = memd(r29+#48)
	}
// %bb.34:                              // %while.body
                                        //   in Loop: Header=BB99_33 Depth=1
	{
		r13:12 = memd(r29+#24)
		r17:16 = memd(r29+#40)
	}
	{
		r21:20 = memd(r29+#56)
		memd(r29+#40) = r21:20
	}
	{
		r9:8 = memd(r29+#160)
		memd(r29+#24) = r15:14
	}
	{
		r19:18 = memd(r29+#168)
		memd(r29+#48) = r21:20
	}
	{
		r15:14 = memd(r29+#176)
		memd(r29+#32) = r17:16
	}
	{
		r23:22 = memd(r29+#184)
		memd(r29+#160) = r19:18
	}
	{
		r21:20 = memd(r29+#64)
		memd(r29+#168) = r15:14
	}
	{
		r19:18 = memd(r29+#192)
		memd(r29+#176) = r23:22
	}
	{
		r15:14 = memd(r29+#312)
		memd(r29+#56) = r21:20
	}
	{
		r23:22 = memd(r29+#320)
		memd(r29+#184) = r19:18
	}
	{
		r11:10 = memd(r29+#296)
		memd(r29+#152) = r9:8
	}
	{
		r17:16 = memd(r29+#304)
		memd(r29+#304) = r15:14

	} :mem_noshuf
	{
		r15:14 = memd(r29+#72)
		memd(r29+#312) = r23:22
	}
	{
		r21:20 = memd(r29+#200)
		memd(r29+#296) = r17:16
	}
	{
		r23:22 = memd(r29+#80)
		memd(r29+#64) = r15:14
	}
	{
		r19:18 = memd(r29+#328)
		memd(r29+#192) = r21:20
	}
	{
		r15:14 = memd(r29+#208)
		memd(r29+#72) = r23:22
	}
	{
		r21:20 = memd(r29+#336)
		memd(r29+#320) = r19:18
	}
	{
		r15:14 = mpyu(r12,r2)
		r19:18 = memd(r29+#88)
		memd(r29+#200) = r15:14
	}
	{
		r17:16 = memd(r29+#216)
		memd(r29+#328) = r21:20
	}
	{
		r15 += mpyi(r12,r3)
		r21:20 = memd(r29+#96)
		r23:22 = memd(r29+#344)
	}
	{
		r19:18 = memd(r29+#224)
		memd(r29+#80) = r19:18
	}
	{
		r15 += mpyi(r2,r13)
		r17:16 = memd(r29+#352)
		memd(r29+#208) = r17:16
	}
	{
		r21:20 = memd(r29+#104)
		memd(r29+#88) = r21:20
	}
	{
		p0 = cmp.eq(r15:14,r9:8)
		r3:2 = memd(r29+#288)
		memd(r29+#336) = r23:22
	}
	{
		r23:22 = memd(r29+#232)
		memd(r29+#288) = r11:10
	}
	{
		r11:10 = memd(r29+#112)
		memd(r29+#344) = r17:16
	}
	{
		r13:12 = memd(r29+#360)
		memd(r29+#224) = r23:22
	}
	{
		r17:16 = memd(r29+#240)
		memd(r29+#216) = r19:18
	}
	{
		r19:18 = memd(r29+#368)
		memd(r29+#352) = r13:12
	}
	{
		r23:22 = memd(r29+#120)
		memd(r29+#232) = r17:16
	}
	{
		r13:12 = memd(r29+#248)
		memd(r29+#104) = r11:10
	}
	{
		r17:16 = memd(r29+#128)
		memd(r29+#360) = r19:18
	}
	{
		r11:10 = memd(r29+#376)
		memd(r29+#240) = r13:12
	}
	{
		r19:18 = memd(r29+#256)
		memd(r29+#112) = r23:22
	}
	{
		r23:22 = memd(r29+#384)
		memd(r29+#368) = r11:10
	}
	{
		r13:12 = memd(r29+#136)
		memd(r29+#248) = r19:18
	}
	{
		r19:18 = memd(r29+#144)
		memd(r29+#376) = r23:22
	}
	{
		r11:10 = memd(r29+#264)
		memd(r29+#120) = r17:16
	}
	{
		r23:22 = memd(r29+#272)
		memd(r29+#96) = r21:20
	}
	{
		r17:16 = memd(r29+#392)
		memd(r29+#256) = r11:10
	}
	{
		r11:10 = memd(r29+#400)
		memd(r29+#128) = r13:12
	}
	{
		memd(r29+#384) = r17:16
		memd(r29+#136) = r19:18
	}
	{
		memd(r29+#264) = r23:22
		memd(r29+#408) = r15:14
	}
	{
		memd(r29+#280) = r3:2
		memd(r29+#392) = r11:10
	}
	{
		memd(r29+#144) = r5:4
		memd(r29+#272) = r7:6
	}
	{
		if (p0) jump:nt .LBB99_33
		memd(r29+#400) = r7:6
	}
	.falign
.LBB99_35:                              // %while.end
	{
		call ##__hexagon_memcpy_likely_aligned_min32bytes_mult8bytes
		r1 = add(r29,#0)
		r2 = #416
	}
	.falign
// %bb.36:                              // %while.end
	{
		jump .LBB99_26
	}
.Lfunc_end99:
	.size	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b, .Lfunc_end99-_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	.falign
	.type	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t: // @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
// %bb.0:                               // %entry
	{
		r17 = #0
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r3:2 = memd(r1+#16)
	}
	{
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = !tstbit(r2,#1)
		if (!p0.new) r17 = #-14
		if (p0.new) jump:t .LBB100_5
	}
// %bb.1:                               // %if.end
	{
		p1 = tstbit(r2,#0); if (p1.new) jump:t .LBB100_5
		r16 = r1
		r18 = r0
	}
// %bb.2:                               // %if.end9
	{
		r2 = memw(r1+#8)
	}
	{
		r1 = r16
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB100_6
		if (!p0.new) r2 = memw(r2+#60)
	}
// %bb.3:                               // %if.end15
	{
		r2 = memw(r2+#24)
	}
	{
		callr r2
	}
	.falign
// %bb.4:                               // %if.end15
	{
		if (p1.new) r1:0 = combine(r16,r18)
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB100_7
		if (p1.new) r3:2 = memd(r16+#16)
	}
	.falign
.LBB100_5:                              // %return
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB100_6:
	{
		r17 = #-19
	}
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB100_7:                              // %if.end23
	{
		r2 = clrbit(r2,#1)
	}
	{
		call ##halide_msan_annotate_buffer_is_initialized
		memd(r16+#16) = r3:2
	}
	.falign
// %bb.8:                               // %if.end23
	{
		r17 = #0
	}
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end100:
	.size	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t, .Lfunc_end100-_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
                                        // -- End function
	.section	.text.halide_device_release,"ax",@progbits
	.weak	halide_device_release           // -- Begin function halide_device_release
	.balign 32
	.type	halide_device_release,@function
halide_device_release:                  // @halide_device_release
// %bb.0:                               // %entry
	{
		r2 = memw(r1+#60)
	}
	{
		r7 = memw(r2+#20)
	}
	{
		jumpr r7
	}
.Lfunc_end101:
	.size	halide_device_release, .Lfunc_end101-halide_device_release
                                        // -- End function
	.section	.text.halide_copy_to_host,"ax",@progbits
	.weak	halide_copy_to_host             // -- Begin function halide_copy_to_host
	.falign
	.type	halide_copy_to_host,@function
halide_copy_to_host:                    // @halide_copy_to_host
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r17,#0); if (p1.new) jump:nt .LBB102_6
		if (!p1.new) r1:0 = memd(r17+#0)
		if (!p1.new) r2 = memw(r17+#8)
	}
// %bb.2:                               // %if.end.i
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB102_8
	}
// %bb.3:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB102_8
	}
// %bb.4:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.5:                               // %if.then8.i
	{
		r18 = r0
		if (!cmp.eq(r18.new,#0)) jump:t .LBB102_17
	}
	{
		jump .LBB102_15
	}
	.falign
.LBB102_6:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.6.23@PCREL)
		r0 = r16
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.7:                               // %if.then.i
	{
		r18 = r0
		if (!cmp.eq(r18.new,#0)) jump:t .LBB102_17
	}
	{
		jump .LBB102_15
	}
	.falign
.LBB102_8:                              // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB102_12
		p1 = cmp.eq(r1:0,r3:2)
		if (p0) jump:nt .LBB102_12
	}
// %bb.10:                              // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	.falign
// %bb.11:                              // %if.then14.i
	{
		r18 = r0
		if (!cmp.eq(r18.new,#0)) jump:t .LBB102_17
	}
	{
		jump .LBB102_15
	}
	.falign
.LBB102_12:                             // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = add(r16,#0)
		if (!p0.new) jump:t .LBB102_19
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		r18 = r0
		if (!cmp.eq(r18.new,#0)) jump:t .LBB102_17
	}
	.falign
.LBB102_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		r18 = r0
	}
	.falign
.LBB102_17:                             // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.18:                              // %cleanup
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB102_19:                             // %if.end16.i.split
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.20:                              // %if.end16.i.split
	{
		r18 = r0 ; jump .LBB102_17
	}
.Lfunc_end102:
	.size	halide_copy_to_host, .Lfunc_end102-halide_copy_to_host
                                        // -- End function
	.section	.text.copy_to_device_already_locked,"ax",@progbits
	.weak	copy_to_device_already_locked   // -- Begin function copy_to_device_already_locked
	.falign
	.type	copy_to_device_already_locked,@function
copy_to_device_already_locked:          // @copy_to_device_already_locked
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r17,#0)
		if (p1) jump:nt .LBB103_5
		r18 = r2
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r2 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB103_7
	}
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB103_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		r19 = r0
		if (!cmp.eq(r19.new,#0)) jump:t .LBB103_11
	}
	{
		jump .LBB103_15
	}
	.falign
.LBB103_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.7.24@PCREL)
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		r19 = r0
		if (!cmp.eq(r19.new,#0)) jump:t .LBB103_11
	}
	{
		jump .LBB103_15
	}
	.falign
.LBB103_7:                              // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB103_12
		p1 = cmp.eq(r1:0,r3:2)
		if (p0) jump:nt .LBB103_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		r19 = r0
		if (cmp.eq(r19.new,#0)) jump:nt .LBB103_15
	}
	.falign
.LBB103_11:                             // %cleanup
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB103_12:                             // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = add(r17,#0)
		if (!p0.new) jump:t .LBB103_15
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		r19 = r0
		if (!cmp.eq(r19.new,#0)) jump:t .LBB103_11
	}
	.falign
.LBB103_15:                             // %if.end
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:t .LBB103_17
	}
// %bb.16:                              // %if.then2
	{
		r18 = memw(r16+#8)
		if (cmp.eq(r18.new,#0)) jump:nt .LBB103_28
	}
	.falign
.LBB103_17:                             // %if.end11
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r1:0 = combine(r16,r17)
		if (p0.new) r2 = add(r18,#0)
		if (p0.new) jump:nt .LBB103_21
	}
// %bb.18:                              // %land.lhs.true
	{
		r2 = memw(r16+#8)
		if (cmp.eq(r2.new,r18)) jump:nt .LBB103_23
	}
// %bb.19:                              // %if.then14
	{
		r1 = add(pc,##.L.str.9.25@PCREL)
		r0 = r17
	}
	{
		call ##halide_error
	}
	.falign
// %bb.20:                              // %if.then14
	{
		r19 = #-42
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB103_21:                             // %if.then18
	{
		call ##halide_device_malloc
	}
	.falign
// %bb.22:                              // %if.then18
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB103_11
	}
	.falign
.LBB103_23:                             // %if.end27
	{
		r19 = #0
		r1:0 = memd(r16+#16)
	}
	{
		if (p1.new) r19 = #-15
		p1 = tstbit(r0,#0); if (!p1.new) jump:t .LBB103_11
	}
// %bb.24:                              // %if.then29
	{
		p0 = tstbit(r0,#1)
		if (!p0.new) r1:0 = combine(r16,r17)
		if (p0.new) jump:t .LBB103_11
		if (!p0.new) r2 = memw(r18+#60)
	}
// %bb.25:                              // %if.else
	{
		r2 = memw(r2+#28)
	}
	{
		callr r2
	}
	.falign
// %bb.26:                              // %if.else
	{
		if (p1.new) r19 = #0
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB103_11
		if (p1.new) r1:0 = memd(r16+#16)
	}
// %bb.27:                              // %if.then46
	{
		r0 = clrbit(r0,#0)
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		memd(r16+#16) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB103_28:                             // %if.then7
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_no_device_interface
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end103:
	.size	copy_to_device_already_locked, .Lfunc_end103-copy_to_device_already_locked
                                        // -- End function
	.section	.text.halide_device_malloc,"ax",@progbits
	.weak	halide_device_malloc            // -- Begin function halide_device_malloc
	.falign
	.type	halide_device_malloc,@function
halide_device_malloc:                   // @halide_device_malloc
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r2)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) jump:nt .LBB104_5
		r18 = r0
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r2 = memw(r17+#8)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB104_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r1:0,r5:4)
		if (!p1.new) r0 = add(r18,#0)
		if (p1.new) jump:nt .LBB104_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB104_11
	}
	{
		jump .LBB104_15
	}
	.falign
.LBB104_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.17.26@PCREL)
		r0 = r18
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB104_11
	}
	{
		jump .LBB104_15
	}
	.falign
.LBB104_7:                              // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB104_12
		p1 = cmp.eq(r1:0,r5:4)
		if (p0) jump:nt .LBB104_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r18
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB104_15
	}
	.falign
.LBB104_11:                             // %cleanup12
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB104_12:                             // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r5:4)
		if (p0.new) r0 = add(r18,#0)
		if (!p0.new) jump:t .LBB104_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB104_11
	}
	.falign
.LBB104_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r2 = memw(r17+#8)
	}
	.falign
.LBB104_16:                             // %if.end
	{
		if (!p0.new) r0 = add(r18,#0)
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB104_20
	}
// %bb.17:                              // %if.end
	{
		p1 = cmp.eq(r2,r16); if (p1.new) jump:nt .LBB104_20
	}
// %bb.18:                              // %if.then6
	{
		r1 = add(pc,##.L.str.20.27@PCREL)
		call ##halide_error
	}
	.falign
// %bb.19:                              // %if.then6
	{
		r0 = #-42
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB104_20:                             // %if.end7
	{
		r2 = memw(r16+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.21:                              // %if.end7
	{
		r1:0 = combine(r17,r18)
		r2 = memw(r16+#60)
	}
	{
		r2 = memw(r2+#8)
	}
	{
		callr r2
	}
	.falign
// %bb.22:                              // %if.end7
	{
		r16 = r0
		r2 = memw(r16+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.23:                              // %if.end7
	{
		p0 = cmp.eq(r16,#0)
	}
	{
		r0 = mux(p0,#0,#-16)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end104:
	.size	halide_device_malloc, .Lfunc_end104-halide_device_malloc
                                        // -- End function
	.section	.text.halide_copy_to_device,"ax",@progbits
	.weak	halide_copy_to_device           // -- Begin function halide_copy_to_device
	.falign
	.type	halide_copy_to_device,@function
halide_copy_to_device:                  // @halide_copy_to_device
// %bb.0:                               // %entry
	{
		r3 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r16 = r0
	}
	{
		r19:18 = combine(r1,r2)
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r17 = memw(r3+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r17
	}
	{
		call ##copy_to_device_already_locked
		r1:0 = combine(r19,r16)
		r2 = r18
	}
	{
		call ##halide_mutex_unlock
		r16 = r0
		r0 = r17
	}
	{
		r0 = r16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end105:
	.size	halide_copy_to_device, .Lfunc_end105-halide_copy_to_device
                                        // -- End function
	.section	.text.halide_device_sync,"ax",@progbits
	.weak	halide_device_sync              // -- Begin function halide_device_sync
	.falign
	.type	halide_device_sync,@function
halide_device_sync:                     // @halide_device_sync
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r17,#0)
		if (p1) jump:nt .LBB106_5
		if (!p1) r1:0 = memd(r16+#0)
		if (!p1) r2 = memw(r16+#8)
	}
// %bb.1:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB106_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r1:0,r5:4)
		if (!p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB106_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB106_11
	}
	{
		jump .LBB106_15
	}
	.falign
.LBB106_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.16.28@PCREL)
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB106_11
	}
	{
		jump .LBB106_15
	}
	.falign
.LBB106_7:                              // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB106_12
		p1 = cmp.eq(r1:0,r5:4)
		if (p0) jump:nt .LBB106_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB106_15
	}
	.falign
.LBB106_11:                             // %cleanup8
	{
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB106_12:                             // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r5:4)
		if (p0.new) r0 = add(r17,#0)
		if (!p0.new) jump:t .LBB106_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB106_11
	}
	.falign
.LBB106_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r2 = memw(r16+#8)
	}
	.falign
.LBB106_16:                             // %if.end
	{
		r1:0 = combine(r16,r17)
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB106_19
		if (!p0.new) r2 = memw(r2+#60)
	}
// %bb.17:                              // %if.end5
	{
		r2 = memw(r2+#16)
	}
	{
		callr r2
	}
	.falign
// %bb.18:                              // %if.end5
	{
		p1 = cmp.eq(r0,#0)
	}
	{
		r0 = mux(p1,#0,#-17)
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB106_19:                             // %if.then3
	{
		r0 = r17
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_no_device_interface
	}
.Lfunc_end106:
	.size	halide_device_sync, .Lfunc_end106-halide_device_sync
                                        // -- End function
	.section	.text.halide_device_free,"ax",@progbits
	.weak	halide_device_free              // -- Begin function halide_device_free
	.falign
	.type	halide_device_free,@function
halide_device_free:                     // @halide_device_free
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r16,#0)
		if (p1) jump:nt .LBB107_5
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r18 = memw(r17+#8)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:nt .LBB107_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB107_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB107_11
	}
	{
		jump .LBB107_15
	}
	.falign
.LBB107_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.21.29@PCREL)
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB107_11
	}
	{
		jump .LBB107_15
	}
	.falign
.LBB107_7:                              // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB107_12
		p1 = cmp.eq(r1:0,r3:2)
		if (p0) jump:nt .LBB107_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB107_15
	}
	.falign
.LBB107_11:                             // %cleanup12
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB107_12:                             // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = add(r16,#0)
		if (!p0.new) jump:t .LBB107_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB107_11
	}
	.falign
.LBB107_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r17+#8)
	}
	.falign
.LBB107_16:                             // %if.end
	{
		r0 = #0
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB107_24
		if (!p0.new) r2 = memw(r18+#60)
	}
// %bb.17:                              // %if.then3
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.18:                              // %if.then3
	{
		r1:0 = combine(r17,r16)
		r2 = memw(r18+#60)
	}
	{
		r2 = memw(r2+#12)
	}
	{
		callr r2
	}
	.falign
// %bb.19:                              // %if.then3
	{
		r18 = r0
		r2 = memw(r18+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.20:                              // %if.then3
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB107_23
	}
// %bb.21:                              // %if.then8
	{
		r1 = add(pc,##.L.str.22.30@PCREL)
		call ##halide_print
	}
	.falign
// %bb.22:                              // %if.then8
	{
		call ##abort
	}
	.falign
.LBB107_23:                             // %do.end
	{
		p0 = cmp.eq(r18,#0)
	}
	{
		r0 = mux(p0,#0,#-18)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB107_24:                             // %if.end11
	{
		r3:2 = memd(r17+#16)
	}
	{
		r2 = clrbit(r2,#1)
	}
	{
		r17:16 = memd(r29+#8)
		memd(r17+#16) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end107:
	.size	halide_device_free, .Lfunc_end107-halide_device_free
                                        // -- End function
	.section	.text.halide_device_free_as_destructor,"ax",@progbits
	.weak	halide_device_free_as_destructor // -- Begin function halide_device_free_as_destructor
	.balign 32
	.type	halide_device_free_as_destructor,@function
halide_device_free_as_destructor:       // @halide_device_free_as_destructor
// %bb.0:                               // %entry
	{
		jump ##halide_device_free
	}
.Lfunc_end108:
	.size	halide_device_free_as_destructor, .Lfunc_end108-halide_device_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_and_host_malloc,"ax",@progbits
	.weak	halide_device_and_host_malloc   // -- Begin function halide_device_and_host_malloc
	.falign
	.type	halide_device_and_host_malloc,@function
halide_device_and_host_malloc:          // @halide_device_and_host_malloc
// %bb.0:                               // %entry
	{
		p1 = cmp.eq(r1,#0)
		r17:16 = combine(r2,r0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r16,#0)
		if (p1) jump:nt .LBB109_5
		r18 = r1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		r2 = memw(r18+#8)
		r1:0 = memd(r18+#0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB109_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r1:0,r5:4)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB109_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB109_11
	}
	{
		jump .LBB109_15
	}
	.falign
.LBB109_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.23.31@PCREL)
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB109_11
	}
	{
		jump .LBB109_15
	}
	.falign
.LBB109_7:                              // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB109_12
		p1 = cmp.eq(r1:0,r5:4)
		if (p0) jump:nt .LBB109_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB109_15
	}
	.falign
.LBB109_11:                             // %cleanup14
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB109_12:                             // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r1:0 = memd(r18+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r5:4)
		if (p0.new) r0 = add(r16,#0)
		if (!p0.new) jump:t .LBB109_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB109_11
	}
	.falign
.LBB109_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r2 = memw(r18+#8)
	}
	.falign
.LBB109_16:                             // %if.end
	{
		if (!p0.new) r0 = add(r16,#0)
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB109_20
	}
// %bb.17:                              // %if.end
	{
		p1 = cmp.eq(r2,r17); if (p1.new) jump:nt .LBB109_20
	}
// %bb.18:                              // %if.then6
	{
		r1 = add(pc,##.L.str.25@PCREL)
		call ##halide_error
	}
	.falign
// %bb.19:                              // %if.then6
	{
		r0 = #-42
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB109_20:                             // %if.end7
	{
		r2 = memw(r17+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.21:                              // %if.end7
	{
		r1:0 = combine(r18,r16)
		r2 = memw(r17+#60)
	}
	{
		r2 = memw(r2+#32)
	}
	{
		callr r2
	}
	.falign
// %bb.22:                              // %if.end7
	{
		r17 = r0
		r2 = memw(r17+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.23:                              // %if.end7
	{
		r0 = r16
		p0 = cmp.eq(r17,#0); if (p0.new) jump:nt .LBB109_26
		if (p0.new) r17:16 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
// %bb.24:                              // %if.then12
	{
		r1 = add(pc,##.L.str.26@PCREL)
		call ##halide_error
	}
	.falign
// %bb.25:                              // %if.then12
	{
		r0 = #-16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB109_26:
	{
		r0 = #0
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end109:
	.size	halide_device_and_host_malloc, .Lfunc_end109-halide_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_device_and_host_free,"ax",@progbits
	.weak	halide_device_and_host_free     // -- Begin function halide_device_and_host_free
	.falign
	.type	halide_device_and_host_free,@function
halide_device_and_host_free:            // @halide_device_and_host_free
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r17,#0)
		if (p1) jump:nt .LBB110_5
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r18 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:nt .LBB110_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB110_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB110_11
	}
	{
		jump .LBB110_15
	}
	.falign
.LBB110_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.27@PCREL)
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB110_11
	}
	{
		jump .LBB110_15
	}
	.falign
.LBB110_7:                              // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB110_12
		p1 = cmp.eq(r1:0,r3:2)
		if (p0) jump:nt .LBB110_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB110_15
	}
	.falign
.LBB110_11:                             // %cleanup18
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB110_12:                             // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = add(r17,#0)
		if (!p0.new) jump:t .LBB110_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB110_11
	}
	.falign
.LBB110_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r16+#8)
	}
	.falign
.LBB110_16:                             // %if.end
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB110_24
		if (!p0.new) r2 = memw(r18+#60)
	}
// %bb.17:                              // %if.then3
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.18:                              // %if.then3
	{
		r1:0 = combine(r16,r17)
		r2 = memw(r18+#60)
	}
	{
		r2 = memw(r2+#36)
	}
	{
		callr r2
	}
	.falign
// %bb.19:                              // %if.then3
	{
		r18 = r0
		r2 = memw(r18+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.20:                              // %if.then3
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB110_23
	}
// %bb.21:                              // %if.then8
	{
		r1 = add(pc,##.L.str.28@PCREL)
		call ##halide_print
	}
	.falign
// %bb.22:                              // %if.then8
	{
		call ##abort
	}
	.falign
.LBB110_23:                             // %do.end
	{
		p0 = cmp.eq(r18,#0)
	}
	{
		r0 = mux(p0,#0,#-18)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB110_24:                             // %if.else11
	{
		r1 = memw(r16+#12)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB110_27
	}
// %bb.25:                              // %if.then13
	{
		call ##halide_free
		r0 = r17
	}
	.falign
// %bb.26:                              // %if.then13
	{
		memw(r16+#12) = #0
	}
	.falign
.LBB110_27:                             // %if.end17
	{
		r0 = #0
		r3:2 = memd(r16+#16)
	}
	{
		r2 = clrbit(r2,#1)
	}
	{
		r17:16 = memd(r29+#8)
		memd(r16+#16) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end110:
	.size	halide_device_and_host_free, .Lfunc_end110-halide_device_and_host_free
                                        // -- End function
	.section	.text.halide_default_device_and_host_malloc,"ax",@progbits
	.weak	halide_default_device_and_host_malloc // -- Begin function halide_default_device_and_host_malloc
	.falign
	.type	halide_default_device_and_host_malloc,@function
halide_default_device_and_host_malloc:  // @halide_default_device_and_host_malloc
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r17,#0)
		if (p1) jump:nt .LBB111_5
		r18 = r2
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r2 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB111_7
	}
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB111_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		r19 = r0
		if (!cmp.eq(r19.new,#0)) jump:t .LBB111_11
	}
	{
		jump .LBB111_15
	}
	.falign
.LBB111_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.29@PCREL)
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		r19 = r0
		if (!cmp.eq(r19.new,#0)) jump:t .LBB111_11
	}
	{
		jump .LBB111_15
	}
	.falign
.LBB111_7:                              // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB111_12
		p1 = cmp.eq(r1:0,r3:2)
		if (p0) jump:nt .LBB111_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		r19 = r0
		if (cmp.eq(r19.new,#0)) jump:nt .LBB111_15
	}
	.falign
.LBB111_11:                             // %cleanup13
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB111_12:                             // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = add(r17,#0)
		if (!p0.new) jump:t .LBB111_15
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		r19 = r0
		if (!cmp.eq(r19.new,#0)) jump:t .LBB111_11
	}
	.falign
.LBB111_15:                             // %if.end
	{
		r5 = memw(r16+#28)
	}
	{
		if (p0.new) r2 = #0
		p0 = cmp.gt(r5,#0); if (!p0.new) jump:nt .LBB111_25
		if (p0.new) r3 = memw(r16+#32)
	}
// %bb.16:                              // %for.body.lr.ph.i.i
	{
		loop0(.LBB111_17,r5)
		r3 = add(r3,#8)
	}
	{
		r4 = r3
	}
	.falign
.Ltmp11:                                // Block address taken
.LBB111_17:                             // %for.body.i.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r6 = memw(r4+#0)
		if (!cmp.gt(r6.new,#0)) jump:nt .LBB111_19
	}
// %bb.18:                              // %if.then.i.i
                                        //   in Loop: Header=BB111_17 Depth=1
	{
		r7 = memw(r4+#-4)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r2 += mpyi(r7,r6)
	}
	.falign
.LBB111_19:                             // %for.inc.i.i
                                        //   in Loop: Header=BB111_17 Depth=1
	{
		r4 = add(r4,#16)
		nop
	} :endloop0
// %bb.20:                              // %for.body.lr.ph.i5.i
	{
		loop0(.LBB111_21,r5)
		r6 = #0
		r4 = memub(r16+#25)
	}
	.falign
.Ltmp12:                                // Block address taken
.LBB111_21:                             // %for.body.i15.i
                                        // =>This Inner Loop Header: Depth=1
	{
		r5 = memw(r3+#0)
		if (!cmp.gt(r5.new,#-1)) jump:nt .LBB111_23
	}
// %bb.22:                              // %for.inc.i24.i
                                        //   in Loop: Header=BB111_21 Depth=1
	{
		r3 = add(r3,#16)
		nop
	} :endloop0
	{
		jump .LBB111_24
	}
	.falign
.LBB111_23:                             // %if.then.i20.i
                                        //   in Loop: Header=BB111_21 Depth=1
	{
		r7 = memw(r3+#-4)
	}
	{
		r7 = add(r7,#-1)
	}
	{
		r6 += mpyi(r7,r5)
		r3 = add(r3,#16)
	} :endloop0
	.falign
.LBB111_24:                             // %for.inc.i24.i._ZNK15halide_buffer_t13size_in_bytesEv.exit_crit_edge
	{
		r2 = sub(#-1,r2)
	}
	{
		r2 = add(r6,r2)
		jump .LBB111_26
	}
	.falign
.LBB111_25:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	{
		r2 = #-1
		r4 = memub(r16+#25)
	}
	.falign
.LBB111_26:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	{
		r3 = add(r4,#7)
		r0 = r17
	}
	{
		r3 = lsr(r3,#3)
	}
	{
		r2 = mpyi(r2,r3)
	}
	{
		call ##halide_malloc
		r1 = sub(#0,r2)
	}
	.falign
// %bb.27:                              // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	{
		if (!p1.new) r2 = add(r18,#0)
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB111_32
		memw(r16+#12) = r0
	}
// %bb.28:                              // %if.end6
	{
		call ##halide_device_malloc
		r1:0 = combine(r16,r17)
	}
	.falign
// %bb.29:                              // %if.end6
	{
		r19 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB111_33
		if (!p0.new) r1 = memw(r16+#12)
	}
// %bb.30:                              // %if.then9
	{
		call ##halide_free
		r0 = r17
	}
	.falign
// %bb.31:                              // %if.then9
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		memw(r16+#12) = #0
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB111_32:
	{
		r19 = #-1
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB111_33:
	{
		r19 = #0
	}
	{
		r0 = r19
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end111:
	.size	halide_default_device_and_host_malloc, .Lfunc_end111-halide_default_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_default_device_and_host_free,"ax",@progbits
	.weak	halide_default_device_and_host_free // -- Begin function halide_default_device_and_host_free
	.falign
	.type	halide_default_device_and_host_free,@function
halide_default_device_and_host_free:    // @halide_default_device_and_host_free
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r17,#0)
		if (p1) jump:nt .LBB112_5
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r2 = memw(r16+#8)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB112_7
	}
// %bb.2:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB112_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		r18 = r0
		if (!cmp.eq(r18.new,#0)) jump:t .LBB112_11
	}
	{
		jump .LBB112_15
	}
	.falign
.LBB112_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.30@PCREL)
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		r18 = r0
		if (!cmp.eq(r18.new,#0)) jump:t .LBB112_11
	}
	{
		jump .LBB112_15
	}
	.falign
.LBB112_7:                              // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB112_12
		p1 = cmp.eq(r1:0,r3:2)
		if (p0) jump:nt .LBB112_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r17
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		r18 = r0
		if (cmp.eq(r18.new,#0)) jump:nt .LBB112_15
	}
	.falign
.LBB112_11:                             // %cleanup
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB112_12:                             // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r16+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = add(r17,#0)
		if (!p0.new) jump:t .LBB112_20
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		r18 = r0
		if (!cmp.eq(r18.new,#0)) jump:t .LBB112_11
	}
	.falign
.LBB112_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		call ##halide_device_free
		r1:0 = combine(r16,r17)
	}
	.falign
// %bb.16:                              // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	{
		r18 = r0
		r1 = memw(r16+#12)
		if (cmp.eq(r1.new,#0)) jump:nt .LBB112_19
	}
	.falign
.LBB112_17:                             // %if.then2
	{
		call ##halide_free
		r0 = r17
	}
	.falign
// %bb.18:                              // %if.then2
	{
		memw(r16+#12) = #0
	}
	.falign
.LBB112_19:                             // %if.end5
	{
		r2 = #-4
		r1:0 = memd(r16+#16)
	}
	{
		r0 = and(r0,r2)
	}
	{
		r0 = r18
		r17:16 = memd(r29+#8)
		memd(r16+#16) = r1:0
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB112_20:                             // %if.end16.i.split
	{
		call ##halide_device_free
		r1:0 = combine(r16,r17)
	}
	.falign
// %bb.21:                              // %if.end16.i.split
	{
		r18 = r0
		r1 = memw(r16+#12)
		if (!cmp.eq(r1.new,#0)) jump:t .LBB112_17
	}
	{
		jump .LBB112_19
	}
.Lfunc_end112:
	.size	halide_default_device_and_host_free, .Lfunc_end112-halide_default_device_and_host_free
                                        // -- End function
	.section	.text.halide_device_wrap_native,"ax",@progbits
	.weak	halide_device_wrap_native       // -- Begin function halide_device_wrap_native
	.falign
	.type	halide_device_wrap_native,@function
halide_device_wrap_native:              // @halide_device_wrap_native
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r4)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r3,r2)
		r20 = r0
		memd(r29+#8) = r19:18
		memd(r29+#0) = r21:20
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r20,#0)
		if (p1) jump:nt .LBB113_5
		if (!p1) r1:0 = memd(r17+#0)
		if (!p1) r2 = memw(r17+#8)
	}
// %bb.1:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB113_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r1:0,r5:4)
		if (!p1.new) r0 = add(r20,#0)
		if (p1.new) jump:nt .LBB113_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB113_11
	}
	{
		jump .LBB113_15
	}
	.falign
.LBB113_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.31@PCREL)
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB113_11
	}
	{
		jump .LBB113_15
	}
	.falign
.LBB113_7:                              // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB113_12
		p1 = cmp.eq(r1:0,r5:4)
		if (p0) jump:nt .LBB113_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r20
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB113_15
	}
	.falign
.LBB113_11:                             // %cleanup12
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB113_12:                             // %if.end16.i
	{
		r5:4 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r5:4)
		if (p0.new) r0 = add(r20,#0)
		if (!p0.new) jump:t .LBB113_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB113_11
	}
	.falign
.LBB113_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r2 = memw(r17+#8)
	}
	.falign
.LBB113_16:                             // %if.end
	{
		if (!p0.new) r0 = add(r20,#0)
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB113_20
	}
// %bb.17:                              // %if.end
	{
		p1 = cmp.eq(r2,r16); if (p1.new) jump:nt .LBB113_20
	}
// %bb.18:                              // %if.then4
	{
		r1 = add(pc,##.L.str.32@PCREL)
		call ##halide_error
	}
	.falign
// %bb.19:                              // %if.then4
	{
		r0 = #-42
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB113_20:                             // %if.end5
	{
		r2 = memw(r16+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.21:                              // %if.end5
	{
		r1:0 = combine(r17,r20)
		r2 = memw(r16+#60)
		memw(r17+#8) = r16
	}
	{
		r3:2 = combine(r19,r18)
		r4 = memw(r2+#56)
	}
	{
		callr r4
	}
	.falign
// %bb.22:                              // %if.end5
	{
		r16 = r0
		r2 = memw(r16+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.23:                              // %if.end5
	{
		p0 = cmp.eq(r16,#0)
	}
	{
		r0 = mux(p0,#0,#-16)
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end113:
	.size	halide_device_wrap_native, .Lfunc_end113-halide_device_wrap_native
                                        // -- End function
	.section	.text.halide_device_detach_native,"ax",@progbits
	.weak	halide_device_detach_native     // -- Begin function halide_device_detach_native
	.falign
	.type	halide_device_detach_native,@function
halide_device_detach_native:            // @halide_device_detach_native
// %bb.0:                               // %entry
	{
		r17:16 = combine(r1,r0)
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) r0 = add(r16,#0)
		if (p1) jump:nt .LBB114_5
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r3:2 = combine(#0,#0)
		r18 = memw(r17+#8)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:nt .LBB114_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB114_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB114_11
	}
	{
		jump .LBB114_15
	}
	.falign
.LBB114_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.33@PCREL)
	}
	{
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB114_11
	}
	{
		jump .LBB114_15
	}
	.falign
.LBB114_7:                              // %if.end10.i
	{
		r3:2 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB114_12
		p1 = cmp.eq(r1:0,r3:2)
		if (p0) jump:nt .LBB114_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
		r0 = r16
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB114_15
	}
	.falign
.LBB114_11:                             // %cleanup
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB114_12:                             // %if.end16.i
	{
		r3:2 = combine(#0,#3)
		r1:0 = memd(r17+#16)
	}
	{
		r1 = #0
	}
	{
		r0 = and(r0,#3)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = add(r16,#0)
		if (!p0.new) jump:t .LBB114_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB114_11
	}
	.falign
.LBB114_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r18 = memw(r17+#8)
	}
	.falign
.LBB114_16:                             // %if.end
	{
		r0 = #0
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB114_24
		if (!p0.new) r2 = memw(r18+#60)
	}
// %bb.17:                              // %if.then3
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.18:                              // %if.then3
	{
		r1:0 = combine(r17,r16)
		r2 = memw(r18+#60)
	}
	{
		r2 = memw(r2+#60)
	}
	{
		callr r2
	}
	.falign
// %bb.19:                              // %if.then3
	{
		r18 = r0
		r2 = memw(r18+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.20:                              // %if.then3
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p1 = cmp.eq(r1:0,r3:2)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB114_23
	}
// %bb.21:                              // %if.then8
	{
		r1 = add(pc,##.L.str.34@PCREL)
		call ##halide_print
	}
	.falign
// %bb.22:                              // %if.then8
	{
		call ##abort
	}
	.falign
.LBB114_23:                             // %do.end
	{
		p0 = cmp.eq(r18,#0)
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r0 = mux(p0,#0,#-33)
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB114_24:
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end114:
	.size	halide_device_detach_native, .Lfunc_end114-halide_device_detach_native
                                        // -- End function
	.section	.text.halide_default_device_wrap_native,"ax",@progbits
	.weak	halide_default_device_wrap_native // -- Begin function halide_default_device_wrap_native
	.falign
	.type	halide_default_device_wrap_native,@function
halide_default_device_wrap_native:      // @halide_default_device_wrap_native
// %bb.0:                               // %entry
	{
		r16 = r1
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r3,r2)
		if (p1) jump:nt .LBB115_5
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r7:6 = combine(#0,#0)
		r2 = memw(r16+#8)
		r5:4 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB115_7
	}
// %bb.2:                               // %if.end.i
	{
		p1 = cmp.eq(r5:4,r7:6)
		if (p1.new) jump:nt .LBB115_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB115_11
	}
	{
		jump .LBB115_15
	}
	.falign
.LBB115_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.35@PCREL)
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB115_11
	}
	{
		jump .LBB115_15
	}
	.falign
.LBB115_7:                              // %if.end10.i
	{
		r7:6 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB115_12
		p1 = cmp.eq(r5:4,r7:6)
		if (p0) jump:nt .LBB115_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB115_15
	}
	.falign
.LBB115_11:                             // %cleanup
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB115_12:                             // %if.end16.i
	{
		r7:6 = combine(#0,#3)
		r5:4 = memd(r16+#16)
	}
	{
		r5 = #0
	}
	{
		r4 = and(r4,#3)
	}
	{
		p0 = cmp.eq(r5:4,r7:6)
		if (!p0.new) jump:t .LBB115_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB115_11
	}
	.falign
.LBB115_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r2 = memw(r16+#8)
	}
	.falign
.LBB115_16:                             // %if.end
	{
		r2 = memw(r2+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.17:                              // %if.end
	{
		r0 = #0
		r17:16 = memd(r29+#8)
		memd(r16+#0) = r19:18
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end115:
	.size	halide_default_device_wrap_native, .Lfunc_end115-halide_default_device_wrap_native
                                        // -- End function
	.section	.text.halide_default_device_detach_native,"ax",@progbits
	.weak	halide_default_device_detach_native // -- Begin function halide_default_device_detach_native
	.falign
	.type	halide_default_device_detach_native,@function
halide_default_device_detach_native:    // @halide_default_device_detach_native
// %bb.0:                               // %entry
	{
		r16 = r1
		p1 = cmp.eq(r1,#0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		if (p1) jump:nt .LBB116_5
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.end.i
	{
		r2 = memw(r16+#8)
	}
	{
		p0 = cmp.eq(r2,#0); if (!p0.new) jump:nt .LBB116_7
		r3:2 = memd(r16+#0)
	}
// %bb.2:                               // %if.end.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		p1 = cmp.eq(r3:2,r5:4)
		if (p1.new) jump:nt .LBB116_7
	}
// %bb.3:                               // %if.then8.i
	{
		call ##halide_error_no_device_interface
	}
	.falign
// %bb.4:                               // %if.then8.i
	{
		r17 = r0
		if (!cmp.eq(r17.new,#0)) jump:t .LBB116_11
	}
	{
		jump .LBB116_15
	}
	.falign
.LBB116_5:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.36@PCREL)
		call ##halide_error_buffer_is_null
	}
	.falign
// %bb.6:                               // %if.then.i
	{
		r17 = r0
		if (!cmp.eq(r17.new,#0)) jump:t .LBB116_11
	}
	{
		jump .LBB116_15
	}
	.falign
.LBB116_7:                              // %if.end10.i
	{
		r5:4 = combine(#0,#0)
	}
	{
		if (!p1.new) jump:nt .LBB116_12
		p1 = cmp.eq(r3:2,r5:4)
		if (p0) jump:nt .LBB116_12
	}
// %bb.9:                               // %if.then14.i
	{
		call ##halide_error_device_interface_no_device
	}
	.falign
// %bb.10:                              // %if.then14.i
	{
		r17 = r0
		if (cmp.eq(r17.new,#0)) jump:nt .LBB116_15
	}
	.falign
.LBB116_11:                             // %cleanup
	{
		r0 = r17
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB116_12:                             // %if.end16.i
	{
		r7:6 = combine(#0,#3)
		r5:4 = memd(r16+#16)
	}
	{
		r5 = #0
	}
	{
		r4 = and(r4,#3)
	}
	{
		p0 = cmp.eq(r5:4,r7:6)
		if (!p0.new) jump:t .LBB116_16
	}
// %bb.13:                              // %if.then24.i
	{
		call ##halide_error_host_and_device_dirty
	}
	.falign
// %bb.14:                              // %if.then24.i
	{
		r17 = r0
		if (!cmp.eq(r17.new,#0)) jump:t .LBB116_11
	}
	.falign
.LBB116_15:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	{
		r3:2 = memd(r16+#0)
	}
	.falign
.LBB116_16:                             // %if.end
	{
		r17 = #0
		r19:18 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r3:2,r19:18)
		if (p0.new) jump:nt .LBB116_11
		if (!p0.new) r2 = memw(r16+#8)
	}
// %bb.17:                              // %if.end3
	{
		r2 = memw(r2+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.18:                              // %if.end3
	{
		r0 = r17
		memd(r16+#0) = r19:18
		memw(r16+#8) = #0
	}
	{
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end116:
	.size	halide_default_device_detach_native, .Lfunc_end116-halide_default_device_detach_native
                                        // -- End function
	.section	.text.halide_device_and_host_free_as_destructor,"ax",@progbits
	.weak	halide_device_and_host_free_as_destructor // -- Begin function halide_device_and_host_free_as_destructor
	.balign 32
	.type	halide_device_and_host_free_as_destructor,@function
halide_device_and_host_free_as_destructor: // @halide_device_and_host_free_as_destructor
// %bb.0:                               // %entry
	{
		jump ##halide_device_and_host_free
	}
.Lfunc_end117:
	.size	halide_device_and_host_free_as_destructor, .Lfunc_end117-halide_device_and_host_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_host_nop_free,"ax",@progbits
	.weak	halide_device_host_nop_free     // -- Begin function halide_device_host_nop_free
	.balign 32
	.type	halide_device_host_nop_free,@function
halide_device_host_nop_free:            // @halide_device_host_nop_free
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end118:
	.size	halide_device_host_nop_free, .Lfunc_end118-halide_device_host_nop_free
                                        // -- End function
	.section	.text.halide_default_buffer_copy,"ax",@progbits
	.weak	halide_default_buffer_copy      // -- Begin function halide_default_buffer_copy
	.balign 32
	.type	halide_default_buffer_copy,@function
halide_default_buffer_copy:             // @halide_default_buffer_copy
// %bb.0:                               // %entry
	{
		r0 = #-39
		jumpr r31
	}
.Lfunc_end119:
	.size	halide_default_buffer_copy, .Lfunc_end119-halide_default_buffer_copy
                                        // -- End function
	.section	.text.halide_buffer_copy_already_locked,"ax",@progbits
	.weak	halide_buffer_copy_already_locked // -- Begin function halide_buffer_copy_already_locked
	.falign
	.type	halide_buffer_copy_already_locked,@function
halide_buffer_copy_already_locked:      // @halide_buffer_copy_already_locked
// %bb.0:                               // %entry
	{
		p2 = cmp.eq(r2,#0)
		r17:16 = combine(r1,r3)
		memd(r29+#-16) = r17:16
		allocframe(r29,#472):raw
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r2,r0)
		if (p2) jump:nt .LBB120_7
		memd(r29+#456) = r19:18
		memd(r29+#448) = r21:20
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %land.lhs.true
	{
		r2 = memw(r16+#8)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB120_6
	}
// %bb.2:                               // %land.lhs.true
	{
		if (!p1.new) r0 = add(r18,#0)
		p1 = cmp.eq(r2,r19); if (p1.new) jump:nt .LBB120_6
	}
// %bb.3:                               // %if.then
	{
		r1 = add(pc,##.L.str.42@PCREL)
		call ##halide_error
	}
	.falign
// %bb.4:                               // %if.then
	{
		r0 = #-42
	}
	.falign
.LBB120_5:                              // %cleanup135
	{
		r17:16 = memd(r29+#464)
		r19:18 = memd(r29+#456)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#448)
		r31:30 = dealloc_return(r30):raw
	}                                       // 8-byte Folded Reload
	.falign
.LBB120_6:                              // %land.lhs.true5
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r2 = add(r19,#0)
		if (p0.new) r1:0 = combine(r16,r18)
		if (p0.new) jump:nt .LBB120_16
	}
	.falign
.LBB120_7:                              // %if.end13
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB120_10
		r2 = memw(r17+#12)
	}
// %bb.8:                               // %land.rhs
	{
		p3 = and(p3,!p3)
		p1 = cmp.eq(r2,#0); if (p1.new) jump:nt .LBB120_15
		if (!p1.new) r1:0 = memd(r17+#16)
	}
// %bb.9:                               // %land.end.thread
	{
		p3 = tstbit(r0,#0)
		jump .LBB120_12
	}
	.falign
.LBB120_10:                             // %land.end
	{
		p2 = cmp.eq(r19,#0)
		p0 = cmp.eq(r2,#0); if (p0.new) jump:nt .LBB120_18
		if (!p0.new) r1:0 = memd(r17+#16)
	}
// %bb.11:                              // %land.end.land.rhs26_crit_edge
	{
		p3 = or(p3,!p3)
	}
	.falign
.LBB120_12:                             // %land.rhs26
	{
		p0 = or(p0,!p0)
		p1 = !tstbit(r0,#1)
	}
	{
		r2 = p0
		if (!p1) jump:nt .LBB120_14
		memw(r29+#16) = r2.new
	}                                       // 4-byte Folded Spill
// %bb.13:
	{
		p0 = and(p0,!p0)
		jump .LBB120_19
	}
	.falign
.LBB120_14:                             // %lor.rhs28
	{
		r2 = memw(r17+#8)
	}
	{
		p0 = cmp.eq(r2,#0)
	}
	{
		p0 = not(p0)
		jump .LBB120_19
	}
	.falign
.LBB120_15:                             // %land.end.thread260
	{
		p0 = or(p0,!p0)
		p2 = cmp.eq(r19,#0)
	}
	{
		r2 = p3
		jump .LBB120_19
		memw(r29+#16) = r2.new
	}                                       // 4-byte Folded Spill
	.falign
.LBB120_16:                             // %if.then7
	{
		r3 = p2
	}
	{
		call ##halide_device_malloc
		r20 = r3
	}
	.falign
// %bb.17:                              // %if.then7
	{
		r2 = r20
		p1 = cmp.eq(r0,#0)
	}
	{
		p2 = r2
		if (!p1) jump:nt .LBB120_5
	}
	{
		jump .LBB120_7
	}
	.falign
.LBB120_18:
	{
		p3 = or(p3,!p3)
		p1 = and(p1,!p1)
	}
	{
		r2 = p1
		p0 = or(p3,p3)
		memw(r29+#16) = r2.new
	}                                       // 4-byte Folded Spill
	.falign
.LBB120_19:                             // %land.end32
	{
		r2 = memw(r16+#12)
	}
	{
		p1 = cmp.eq(r2,#0)
	}
	{
		r2 = p1
		if (!p1) jump:nt .LBB120_21
		memw(r29+#20) = r2.new
	}                                       // 4-byte Folded Spill
// %bb.20:                              // %land.end32
	{
		r0 = #-34
		if (p2) jump:nt .LBB120_5
	}
	.falign
.LBB120_21:                             // %if.end41
	{
		r2 = p0
		p1 = cmp.eq(r19,#0)
		memw(r29+#8) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r0 = p1
		p1 = or(p3,p1)
		if (p1.new) jump:t .LBB120_24
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
// %bb.22:                              // %if.end49
	{
		r5 = p2
		r6 = p3
		r1:0 = combine(r17,r18)
		r3 = memw(r19+#60)
	}
	{
		r20 = r5
		r21 = r6
	}
	{
		r3:2 = combine(r16,r19)
		r4 = memw(r3+#40)
	}
	{
		callr r4
	}
	.falign
// %bb.23:                              // %if.end49
	{
		r2 = r21
		p0 = cmp.eq(r0,#-42)
	}
	{
		p3 = r2
		r2 = r20
	}
	{
		p2 = r2
		if (!p0) jump:nt .LBB120_44
	}
	.falign
.LBB120_24:                             // %if.then51
	{
		r0 = #-42
		r4 = #1
		r2 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		r2 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		r2 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	{
		p1 = and(p1,!p0)
	}
	{
		p0 = r2
		if (p1) jump:nt .LBB120_5
	}
// %bb.25:                              // %if.end58
	{
		p0 = or(p0,!p2)
		if (!p0.new) r19 = add(r29,#24)
		if (!p0.new) jump:t .LBB120_33
	}
// %bb.26:                              // %if.else
	{
		if (p2) r1:0 = combine(r17,r18)
		if (p2) r3 = memw(r17+#8)
	}
	{
		if (p2) r3 = memw(r3+#60)
	}
	{
		if (!p2) jump:nt .LBB120_36
		if (p2) r4 = memw(r3+#40)
		if (!p2) r2 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
// %bb.27:                              // %if.then64
	{
		r3:2 = combine(r16,#0)
		callr r4
	}
	.falign
// %bb.28:                              // %if.then64
	{
		p1 = cmp.eq(r0,#-42)
		if (p1.new) r1:0 = combine(r17,r18)
		if (!p1.new) jump:t .LBB120_44
	}
// %bb.29:                              // %if.then72
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	}
	.falign
// %bb.30:                              // %if.then72
	{
		if (p0.new) r1:0 = combine(r17,r18)
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB120_5
	}
// %bb.31:                              // %if.then75
	{
		call ##halide_buffer_copy_already_locked
		r3:2 = combine(r16,#0)
	}
	.falign
// %bb.32:                              // %if.then75
	{
		jump .LBB120_44
	}
	.falign
.LBB120_33:                             // %if.end109.thread225
	{
		r3:2 = combine(r16,#1)
		r1:0 = combine(r17,r19)
	}
	{
		call ##_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	}
	.falign
// %bb.34:                              // %if.end109.thread225
	{
		call ##_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
		r1:0 = combine(r18,r19)
	}
	.falign
// %bb.35:                              // %if.end109.thread225
	{
		jump .LBB120_45
	}
	.falign
.LBB120_36:                             // %if.else79
	{
		p2 = r2
	}
	{
		p1 = or(p3,p2)
		if (!p1.new) r1:0 = combine(r17,r18)
		if (!p1.new) jump:t .LBB120_41
		if (!p1.new) r3 = memw(r17+#8)
	}
// %bb.37:                              // %if.else96
	{
		call ##_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
		r1:0 = combine(r17,r18)
	}
	.falign
// %bb.38:                              // %if.else96
	{
		if (p1.new) r1:0 = combine(r17,r18)
		p1 = cmp.eq(r0,#0); if (!p1.new) jump:t .LBB120_5
		if (p1.new) r3 = memw(r19+#60)
	}
// %bb.39:                              // %if.then101
	{
		r3:2 = combine(r16,r19)
		r4 = memw(r3+#40)
	}
	{
		callr r4
	}
	.falign
// %bb.40:                              // %if.then101
	{
		jump .LBB120_44
	}
	.falign
.LBB120_41:                             // %if.then83
	{
		r3 = memw(r3+#60)
	}
	{
		r3:2 = combine(r16,#0)
		r4 = memw(r3+#40)
	}
	{
		callr r4
	}
	.falign
// %bb.42:                              // %if.then83
	{
		r2 = r19
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB120_5
		if (p0.new) r5:4 = memd(r16+#16)
	}
// %bb.43:                              // %if.then93
	{
		r4 = setbit(r4,#0)
		r1:0 = combine(r16,r18)
	}
	{
		call ##copy_to_device_already_locked
		memd(r16+#16) = r5:4
	}
	.falign
.LBB120_44:                             // %if.end109
	{
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB120_5
	}
	.falign
.LBB120_45:                             // %land.lhs.true118
	{
		r4 = #-4
		r0 = #0
		p1 = cmp.eq(r16,r17); if (p1.new) jump:nt .LBB120_5
	}
// %bb.46:                              // %if.then120
	{
		r6 = memw(r29+#4)
		r3:2 = memd(r16+#16)
	}                                       // 4-byte Folded Reload
	{
		p0 = r6
		r2 = and(r2,r4)
		if (p0.new) jump:nt .LBB120_48
	}
// %bb.47:                              // %if.then122
	{
		r2 = setbit(r2,#1)
	}
	{
		r17:16 = memd(r29+#464)
		memd(r16+#16) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#456)
		r21:20 = memd(r29+#448)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB120_48:                             // %if.else125
	{
		r2 = setbit(r2,#0)
	}
	{
		r17:16 = memd(r29+#464)
		memd(r16+#16) = r3:2
	}                                       // 8-byte Folded Reload
	{
		r19:18 = memd(r29+#456)
		r21:20 = memd(r29+#448)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end120:
	.size	halide_buffer_copy_already_locked, .Lfunc_end120-halide_buffer_copy_already_locked
                                        // -- End function
	.section	.text.halide_buffer_copy,"ax",@progbits
	.weak	halide_buffer_copy              // -- Begin function halide_buffer_copy
	.falign
	.type	halide_buffer_copy,@function
halide_buffer_copy:                     // @halide_buffer_copy
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r1)
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r20 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#16) = r21:20
		memd(r29+#24) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r3,r0)
	}
	{
		call ##halide_mutex_lock
		r0 = memw(r20+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r17,#0)
	}
	{
		r2 = p1
		if (p1) jump:nt .LBB121_3
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.then
	{
		r2 = memw(r17+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
.LBB121_3:                              // %if.end
	{
		r2 = memw(r16+#8)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB121_5
	}
// %bb.4:                               // %if.then12
	{
		r2 = memw(r2+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
.LBB121_5:                              // %if.end16
	{
		call ##halide_buffer_copy_already_locked
		r1:0 = combine(r16,r18)
		r3:2 = combine(r19,r17)
	}
	.falign
// %bb.6:                               // %if.end16
	{
		r18 = r0
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) jump:nt .LBB121_8
		if (!p0.new) r2 = memw(r17+#60)
	}
// %bb.7:                               // %if.then18
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
.LBB121_8:                              // %if.end20
	{
		r2 = memw(r16+#8)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB121_10
	}
// %bb.9:                               // %if.then23
	{
		r2 = memw(r2+#60)
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
.LBB121_10:                             // %if.end27
	{
		call ##halide_mutex_unlock
		r0 = memw(r20+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.11:                              // %if.end27
	{
		r0 = r18
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end121:
	.size	halide_buffer_copy, .Lfunc_end121-halide_buffer_copy
                                        // -- End function
	.section	.text.halide_default_device_crop,"ax",@progbits
	.weak	halide_default_device_crop      // -- Begin function halide_default_device_crop
	.balign 32
	.type	halide_default_device_crop,@function
halide_default_device_crop:             // @halide_default_device_crop
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.58@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##halide_error
	}
	{
		r0 = #-40
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end122:
	.size	halide_default_device_crop, .Lfunc_end122-halide_default_device_crop
                                        // -- End function
	.section	.text.halide_default_device_slice,"ax",@progbits
	.weak	halide_default_device_slice     // -- Begin function halide_default_device_slice
	.balign 32
	.type	halide_default_device_slice,@function
halide_default_device_slice:            // @halide_default_device_slice
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.59@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##halide_error
	}
	{
		r0 = #-40
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end123:
	.size	halide_default_device_slice, .Lfunc_end123-halide_default_device_slice
                                        // -- End function
	.section	.text.halide_device_crop,"ax",@progbits
	.weak	halide_device_crop              // -- Begin function halide_device_crop
	.falign
	.type	halide_device_crop,@function
halide_device_crop:                     // @halide_device_crop
// %bb.0:                               // %entry
	{
		r17:16 = combine(r2,r0)
		memd(r29+#-16) = r17:16
		allocframe(#16)
	}                                       // 8-byte Folded Spill
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r18 = r1
		memd(r29+#0) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.1:                               // %entry
	{
		r1:0 = combine(#0,#0)
		r3:2 = memd(r18+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) r16 = #0
		if (p0.new) jump:nt .LBB124_12
		if (!p0.new) r3:2 = memd(r17+#0)
	}
// %bb.2:                               // %if.end
	{
		p1 = cmp.eq(r3:2,r1:0)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB124_6
		if (p1.new) r2 = memw(r18+#28)
	}
// %bb.3:                               // %if.then3
	{
		r1 = add(pc,##.L.str.60@PCREL)
		call ##halide_error
	}
	.falign
// %bb.4:                               // %if.then3
	{
		r16 = #-41
		jump .LBB124_12
	}
	.falign
.LBB124_6:                              // %if.end4
	{
		r3 = memw(r17+#28)
		if (!cmp.eq(r3.new,r2)) jump:t .LBB124_10
	}
// %bb.7:                               // %if.end7
	{
		r2 = memw(r18+#8)
	}
	{
		r2 = memw(r2+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.8:                               // %if.end7
	{
		r1:0 = combine(r18,r16)
		r2 = memw(r18+#8)
	}
	{
		r2 = memw(r2+#60)
	}
	{
		r2 = r17
		r3 = memw(r2+#44)
	}
	{
		callr r3
	}
	.falign
// %bb.9:                               // %if.end7
	{
		r16 = r0 ; jump .LBB124_12
	}
	.falign
.LBB124_10:                             // %if.then6
	{
		r1 = add(pc,##.L.str.61@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
// %bb.11:                              // %if.then6
	{
		r16 = #-41
	}
	.falign
.LBB124_12:                             // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.13:                              // %cleanup
	{
		r0 = r16
		r17:16 = memd(r29+#8)
		r19:18 = memd(r29+#0)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end124:
	.size	halide_device_crop, .Lfunc_end124-halide_device_crop
                                        // -- End function
	.section	.text.halide_device_slice,"ax",@progbits
	.weak	halide_device_slice             // -- Begin function halide_device_slice
	.falign
	.type	halide_device_slice,@function
halide_device_slice:                    // @halide_device_slice
// %bb.0:                               // %entry
	{
		r17:16 = combine(r4,r0)
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r21 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#0) = r21:20
		memd(r29+#8) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r2,r3)
		r20 = r1
	}
	{
		call ##halide_mutex_lock
		r0 = memw(r21+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.1:                               // %entry
	{
		r1:0 = combine(#0,#0)
		r3:2 = memd(r20+#0)
	}
	{
		p0 = cmp.eq(r3:2,r1:0)
		if (p0.new) r16 = #0
		if (p0.new) jump:nt .LBB125_12
		if (!p0.new) r3:2 = memd(r17+#0)
	}
// %bb.2:                               // %if.end
	{
		p1 = cmp.eq(r3:2,r1:0)
		if (!p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB125_6
		if (p1.new) r2 = memw(r17+#28)
	}
// %bb.3:                               // %if.then3
	{
		r1 = add(pc,##.L.str.60@PCREL)
		call ##halide_error
	}
	.falign
// %bb.4:                               // %if.then3
	{
		r16 = #-41
		jump .LBB125_12
	}
	.falign
.LBB125_6:                              // %if.end4
	{
		r0 = r16
		r3 = memw(r20+#28)
	}
	{
		r2 = add(r2,#1)
		if (!cmp.eq(r2.new,r3)) jump:t .LBB125_10
	}
// %bb.7:                               // %if.end7
	{
		r2 = memw(r20+#8)
	}
	{
		r2 = memw(r2+#60)
	}
	{
		r2 = memw(r2+#0)
	}
	{
		callr r2
	}
	.falign
// %bb.8:                               // %if.end7
	{
		r1:0 = combine(r20,r16)
		r4 = r17
		r2 = memw(r20+#8)
	}
	{
		r2 = memw(r2+#60)
	}
	{
		r3:2 = combine(r18,r19)
		r5 = memw(r2+#48)
	}
	{
		callr r5
	}
	.falign
// %bb.9:                               // %if.end7
	{
		r16 = r0 ; jump .LBB125_12
	}
	.falign
.LBB125_10:                             // %if.then6
	{
		r1 = add(pc,##.L.str.64@PCREL)
		call ##halide_error
	}
	.falign
// %bb.11:                              // %if.then6
	{
		r16 = #-41
	}
	.falign
.LBB125_12:                             // %cleanup
	{
		call ##halide_mutex_unlock
		r0 = memw(r21+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	.falign
// %bb.13:                              // %cleanup
	{
		r0 = r16
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end125:
	.size	halide_device_slice, .Lfunc_end125-halide_device_slice
                                        // -- End function
	.section	.text.halide_default_device_release_crop,"ax",@progbits
	.weak	halide_default_device_release_crop // -- Begin function halide_default_device_release_crop
	.falign
	.type	halide_default_device_release_crop,@function
halide_default_device_release_crop:     // @halide_default_device_release_crop
// %bb.0:                               // %entry
	{
		r5:4 = combine(#0,#0)
		r3:2 = memd(r1+#0)
	}
	{
		p0 = cmp.eq(r3:2,r5:4)
		if (p0.new) jump:nt .LBB126_3
	}
// %bb.1:                               // %if.end
	{
		r1 = add(pc,##.L.str.58@PCREL)
		allocframe(r29,#0):raw
	}
	{
		call ##halide_error
	}
	.falign
// %bb.2:                               // %if.end
	{
		r0 = #-40
		r31:30 = deallocframe(r30):raw
	}
	{
		jumpr r31
	}
	.falign
.LBB126_3:
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end126:
	.size	halide_default_device_release_crop, .Lfunc_end126-halide_default_device_release_crop
                                        // -- End function
	.section	.text.halide_device_release_crop,"ax",@progbits
	.weak	halide_device_release_crop      // -- Begin function halide_device_release_crop
	.falign
	.type	halide_device_release_crop,@function
halide_device_release_crop:             // @halide_device_release_crop
// %bb.0:                               // %entry
	{
		memd(r29+#-16) = r17:16
		allocframe(#24)
	}                                       // 8-byte Folded Spill
	{
		r3:2 = memd(r1+#0)
	}
	{
		r21:20 = combine(#0,#0)
		memd(r29+#0) = r21:20
		memd(r29+#8) = r19:18
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.eq(r3:2,r21:20)
		r17:16 = combine(r0,r1)
		if (p0.new) r0 = #0
		if (p0.new) jump:nt .LBB127_6
	}
// %bb.1:                               // %if.then
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r18 = memw(r2+##_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOT)
	}
	{
		call ##halide_mutex_lock
		r0 = r18
	}
	.falign
// %bb.2:                               // %if.then
	{
		r1:0 = combine(r16,r17)
		r19 = memw(r16+#8)
	}
	{
		r2 = memw(r19+#60)
	}
	{
		r2 = memw(r2+#52)
	}
	{
		callr r2
	}
	.falign
// %bb.3:                               // %if.then
	{
		r17 = r0
		r2 = memw(r19+#60)
		memd(r16+#0) = r21:20
	}
	{
		r2 = memw(r2+#4)
	}
	{
		callr r2
	}
	.falign
// %bb.4:                               // %if.then
	{
		call ##halide_mutex_unlock
		r0 = r18
		memw(r16+#8) = #0
	}
	.falign
// %bb.5:                               // %if.then
	{
		r0 = r17
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB127_6:                              // %return
	{
		r17:16 = memd(r29+#16)
		r19:18 = memd(r29+#8)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end127:
	.size	halide_device_release_crop, .Lfunc_end127-halide_device_release_crop
                                        // -- End function
	.section	.text.halide_float16_bits_to_float,"ax",@progbits
	.weak	halide_float16_bits_to_float    // -- Begin function halide_float16_bits_to_float
	.falign
	.type	halide_float16_bits_to_float,@function
halide_float16_bits_to_float:           // @halide_float16_bits_to_float
// %bb.0:                               // %entry
	{
		r5 = extractu(r0,#5,#10)
		r3 = extractu(r0,#10,#0)
		r2 = #1023
	}
	{
		p1 = bitsclr(r0,r2)
	}
	{
		p0 = cmp.eq(r5,#0)
		if (p1) jump:nt .LBB128_3
	}
// %bb.1:                               // %entry
	{
		if (p0) r7 = #-2
		if (p0) r6 = #-2
		if (p0) r4 = #31
		if (!p0) jump:nt .LBB128_3
	}
// %bb.2:                               // %if.then
	{
		r2 = cl0(r3)
	}
	{
		r4 = xor(r2,r4)
	}
	{
		r2 = and(r4,#31)
	}
	{
		r4 = add(##864026624,asl(r4,#23))
		r7:6 = asl(r7:6,r2)
		r2 = sub(#23,r4)
	}
	{
		r3 = and(r3,r7)
	}
	{
		r0 = and(##-2147483648,asl(r0,#16))
		r2 = asl(r3,r2)
	}
	{
		r2 |= or(r4,r0)
	}
	{
		r0 = r2
		jumpr r31
	}
	.falign
.LBB128_3:                              // %if.else
	{
		r5 = add(##939524096,asl(r5,#23))
		r4 = asl(r3,#13)
		p1 = cmp.eq(r5,#31)
	}
	{
		if (p1) r5 = ##2139095040
	}
	{
		r0 = and(##-2147483648,asl(r0,#16))
		r2 = mux(p0,#0,r5)
	}
	{
		r2 |= or(r4,r0)
	}
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end128:
	.size	halide_float16_bits_to_float, .Lfunc_end128-halide_float16_bits_to_float
                                        // -- End function
	.section	.text.halide_float16_bits_to_double,"ax",@progbits
	.weak	halide_float16_bits_to_double   // -- Begin function halide_float16_bits_to_double
	.balign 32
	.type	halide_float16_bits_to_double,@function
halide_float16_bits_to_double:          // @halide_float16_bits_to_double
// %bb.0:                               // %entry
	{
		call ##halide_float16_bits_to_float
		allocframe(r29,#0):raw
	}
	{
		r1:0 = convert_sf2df(r0)
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end129:
	.size	halide_float16_bits_to_double, .Lfunc_end129-halide_float16_bits_to_double
                                        // -- End function
	.section	.text.halide_error_check_fault_and_return,"ax",@progbits
	.weak	halide_error_check_fault_and_return // -- Begin function halide_error_check_fault_and_return
	.balign 32
	.type	halide_error_check_fault_and_return,@function
halide_error_check_fault_and_return:    // @halide_error_check_fault_and_return
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		r3 = sub(#0,r1)
		r4 = #0
	}
	{
		r3 = lsl(#1,r3)
		r0 = r1
		r7:6 = combine(#0,#0)
	}
	{
		r2 = memw(r2+##halide_error_mask@GOT)
	}
	{
		r3:2 = sxtw(r3)
		r9:8 = memd(r2+#0)
	}
	{
		r3:2 = and(r9:8,r3:2)
	}
	{
		p0 = cmp.eq(r3:2,r7:6)
		jumpr r31
		if (!p0.new) memw(r4+#0) = ##-559038737
	}
.Lfunc_end130:
	.size	halide_error_check_fault_and_return, .Lfunc_end130-halide_error_check_fault_and_return
                                        // -- End function
	.section	.text.halide_error_bounds_inference_call_failed,"ax",@progbits
	.weak	halide_error_bounds_inference_call_failed // -- Begin function halide_error_bounds_inference_call_failed
	.falign
	.type	halide_error_bounds_inference_call_failed,@function
halide_error_bounds_inference_call_failed: // @halide_error_bounds_inference_call_failed
// %bb.0:                               // %entry
	{
		r16 = r2
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		r0 = #1024
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r20 = r1
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.37@PCREL)
		if (!p0) r1:0 = combine(r19,r17)
		if (p0) jump:nt .LBB131_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r20,#0); if (p0.new) jump:nt .LBB131_8
	}
	.falign
.LBB131_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB131_9
	}
	.falign
.LBB131_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r20,#0); if (!p0.new) jump:t .LBB131_4
	}
	.falign
.LBB131_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB131_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.1.38@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r16)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r18,#0)
		if (p1.new) jump:nt .LBB131_15
	}
// %bb.12:                              // %if.else.i22
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.13:                              // %if.else.i22
	{
		call ##halide_error
		r1:0 = combine(r17,r18)
	}
	.falign
// %bb.14:                              // %if.else.i22
	{
		jump .LBB131_16
	}
	.falign
.LBB131_15:                             // %if.then.i21
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB131_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r0 = r16
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end131:
	.size	halide_error_bounds_inference_call_failed, .Lfunc_end131-halide_error_bounds_inference_call_failed
                                        // -- End function
	.section	.text.halide_error_extern_stage_failed,"ax",@progbits
	.weak	halide_error_extern_stage_failed // -- Begin function halide_error_extern_stage_failed
	.falign
	.type	halide_error_extern_stage_failed,@function
halide_error_extern_stage_failed:       // @halide_error_extern_stage_failed
// %bb.0:                               // %entry
	{
		r16 = r2
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r0
		r0 = #1024
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r20 = r1
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.2.39@PCREL)
		if (!p0) r1:0 = combine(r19,r17)
		if (p0) jump:nt .LBB132_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r20,#0); if (p0.new) jump:nt .LBB132_8
	}
	.falign
.LBB132_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB132_9
	}
	.falign
.LBB132_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r20,#0); if (!p0.new) jump:t .LBB132_4
	}
	.falign
.LBB132_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB132_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.1.38@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r16)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r18,#0)
		if (p1.new) jump:nt .LBB132_15
	}
// %bb.12:                              // %if.else.i22
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r18)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.13:                              // %if.else.i22
	{
		call ##halide_error
		r1:0 = combine(r17,r18)
	}
	.falign
// %bb.14:                              // %if.else.i22
	{
		jump .LBB132_16
	}
	.falign
.LBB132_15:                             // %if.then.i21
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB132_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r0 = r16
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#16)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end132:
	.size	halide_error_extern_stage_failed, .Lfunc_end132-halide_error_extern_stage_failed
                                        // -- End function
	.section	.text.halide_error_explicit_bounds_too_small,"ax",@progbits
	.weak	halide_error_explicit_bounds_too_small // -- Begin function halide_error_explicit_bounds_too_small
	.falign
	.type	halide_error_explicit_bounds_too_small,@function
halide_error_explicit_bounds_too_small: // @halide_error_explicit_bounds_too_small
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#56)
	}                                       // 8-byte Folded Spill
	{
		r19 = r5
		r21:20 = combine(r3,r4)
		memd(r29+#40) = r19:18
		memd(r29+#32) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r23:22 = combine(r2,r1)
		memd(r29+#24) = r23:22
		memd(r29+#16) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r24 = memw(r29+#64)
	}
	.falign
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r0,#0)
		r17 = r0
	}
	{
		r2 = p1
		r18 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.3.40@PCREL)
		if (!p1) r1:0 = combine(r18,r17)
		if (p1) jump:nt .LBB133_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB133_8
	}
	.falign
.LBB133_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB133_9
	}
	.falign
.LBB133_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r18 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB133_4
	}
	.falign
.LBB133_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB133_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.4.41@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r1 = r18
		p1 = cmp.eq(r22,#0); if (p1.new) jump:nt .LBB133_13
	}
// %bb.11:                              // %if.else.i32
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r22
	}
	.falign
// %bb.12:                              // %if.else.i32
	{
		jump .LBB133_14
	}
	.falign
.LBB133_13:                             // %if.then.i30
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB133_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r2 = add(pc,##.L.str.5.42@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.15:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r3:2 = sxtw(r21)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r21 = add(pc,##.L.str.6.43@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
		r2 = r21
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r3:2 = sxtw(r20)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.18:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r2 = add(pc,##.L.str.7.44@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r3:2 = sxtw(r19)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.20:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r21
	}
	.falign
// %bb.21:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r3:2 = sxtw(r24)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.22:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r2 = add(pc,##.L.str.8.45@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.23:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit34
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) r0 = add(r16,#0)
		if (p0.new) jump:nt .LBB133_27
	}
// %bb.24:                              // %if.else.i78
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.25:                              // %if.else.i78
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.26:                              // %if.else.i78
	{
		jump .LBB133_28
	}
	.falign
.LBB133_27:                             // %if.then.i77
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB133_28:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.29:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-2,r16)
		r17:16 = memd(r29+#48)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#32)
		r23:22 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r25:24 = memd(r29+#16)
		r31:30 = deallocframe(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end133:
	.size	halide_error_explicit_bounds_too_small, .Lfunc_end133-halide_error_explicit_bounds_too_small
                                        // -- End function
	.section	.text.halide_error_bad_type,"ax",@progbits
	.weak	halide_error_bad_type           // -- Begin function halide_error_bad_type
	.falign
	.type	halide_error_bad_type,@function
halide_error_bad_type:                  // @halide_error_bad_type
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r0 = add(r29,#12)
	}
	{
		r19 = r1
		r1 = add(r29,#16)
		memd(r29+#32) = r19:18
		memw(r29+#20) = r2
	}                                       // 8-byte Folded Spill
	{
		r2 = #4
		memw(r29+#16) = r3
		memh(r29+#12) = #0
	}
	{
		memh(r29+#14) = #0
		memh(r29+#8) = #0
	}
	{
		call ##memcpy
		memh(r29+#10) = #0
	}
	.falign
// %bb.1:                               // %entry
	{
		r1 = add(r29,#20)
		r2 = #4
		r0 = add(r29,#8)
	}
	{
		call ##memcpy
	}
	.falign
// %bb.2:                               // %entry
	{
		call ##malloc
		r0 = #1024
	}
	.falign
// %bb.3:                               // %entry
	{
		p1 = cmp.eq(r0,#0)
		r17 = r0
		r2 = #0
		p0 = cmp.eq(r19,#0)
	}
	{
		r1 = p1
		if (p1) r18 = add(r2,#0)
		if (!p1) memb(r0+##1023) = r2
	}
	{
		if (!p1) r18 = add(r0,##1023)
		if (p0) jump:nt .LBB134_6
		memw(r29+#4) = r1
	}                                       // 4-byte Folded Spill
// %bb.4:                               // %if.else.i21
	{
		call ##halide_string_to_string
		r1:0 = combine(r18,r17)
		r2 = r19
	}
	.falign
// %bb.5:                               // %if.else.i21
	{
		jump .LBB134_7
	}
	.falign
.LBB134_6:                              // %if.then.i20
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1:0 = combine(r18,r17)
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB134_7:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.9.46@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.8:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		call ##halide_type_to_string
		r2 = add(r29,#12)
		r1 = r18
	}
	.falign
// %bb.9:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.10.47@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		call ##halide_type_to_string
		r2 = add(r29,#8)
		r1 = r18
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB134_15
	}
// %bb.12:                              // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.13:                              // %if.else.i
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.14:                              // %if.else.i
	{
		jump .LBB134_16
	}
	.falign
.LBB134_15:                             // %if.then.i
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB134_16:                             // %if.then6.i
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.17:                              // %if.then6.i
	{
		call ##halide_error_check_fault_and_return
		r1:0 = combine(#-3,r16)
	}
	.falign
// %bb.18:                              // %if.then6.i
	{
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end134:
	.size	halide_error_bad_type, .Lfunc_end134-halide_error_bad_type
                                        // -- End function
	.section	.text.halide_error_bad_dimensions,"ax",@progbits
	.weak	halide_error_bad_dimensions     // -- Begin function halide_error_bad_dimensions
	.falign
	.type	halide_error_bad_dimensions,@function
halide_error_bad_dimensions:            // @halide_error_bad_dimensions
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r1,r3)
		r19 = r2
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r0,#0)
		r17 = r0
		r2 = #0
		p0 = cmp.eq(r21,#0)
	}
	{
		r1 = p1
		if (p1) r18 = add(r2,#0)
		if (!p1) memb(r0+##1023) = r2
	}
	{
		if (!p1) r18 = add(r0,##1023)
		if (p0) jump:nt .LBB135_4
		memw(r29+#4) = r1
	}                                       // 4-byte Folded Spill
// %bb.2:                               // %if.else.i
	{
		call ##halide_string_to_string
		r1:0 = combine(r18,r17)
		r2 = r21
	}
	.falign
// %bb.3:                               // %if.else.i
	{
		jump .LBB135_5
	}
	.falign
.LBB135_4:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1:0 = combine(r18,r17)
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB135_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.11.48@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r20)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.7:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.12.49@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.8:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r19)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.9:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.13.50@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB135_14
	}
// %bb.11:                              // %if.else.i36
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.12:                              // %if.else.i36
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.13:                              // %if.else.i36
	{
		jump .LBB135_15
	}
	.falign
.LBB135_14:                             // %if.then.i35
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB135_15:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-43,r16)
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r21:20 = memd(r29+#16)
		deallocframe
	}                                       // 8-byte Folded Reload
.Lfunc_end135:
	.size	halide_error_bad_dimensions, .Lfunc_end135-halide_error_bad_dimensions
                                        // -- End function
	.section	.text.halide_error_access_out_of_bounds,"ax",@progbits
	.weak	halide_error_access_out_of_bounds // -- Begin function halide_error_access_out_of_bounds
	.falign
	.type	halide_error_access_out_of_bounds,@function
halide_error_access_out_of_bounds:      // @halide_error_access_out_of_bounds
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r5,r3)
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r18 = r2
		r23 = r1
		memd(r29+#32) = r19:18
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	{
		if (!p0) jump:nt .LBB136_5
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
// %bb.1:                               // %if.then
	{
		r0 = #1024
		r20 = r5
		r22 = r3
	}
	{
		call ##malloc
	}
	.falign
// %bb.2:                               // %if.then
	{
		r2 = #0
		p1 = cmp.eq(r23,#0)
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		if (p0) r19 = add(r2,#0)
		if (!p1) r2 = add(r23,#0)
		if (!p0) memb(r0+##1023) = r2
	}
	{
		r0 = p0
		if (!p0) r19 = add(r0,##1023)
		memw(r29+#4) = r0.new
	}                                       // 4-byte Folded Spill
	{
		if (p1) r1:0 = combine(r19,r17)
		if (p1) jump:nt .LBB136_10
	}
// %bb.3:                               // %if.else.i
	{
		call ##halide_string_to_string
		r1:0 = combine(r19,r17)
	}
	.falign
// %bb.4:                               // %if.else.i
	{
		jump .LBB136_11
	}
	.falign
.LBB136_5:                              // %if.else
	{
		r21 = r4
		r20 = memw(r29+#56)
		if (!cmp.gt(r4,r20.new)) jump:t ##.LBB136_37
	}
// %bb.6:                               // %if.then8
	{
		call ##malloc
		r0 = #1024
	}
	.falign
// %bb.7:                               // %if.then8
	{
		r2 = #0
		p1 = cmp.eq(r23,#0)
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r1 = p0
		if (p0) r19 = add(r2,#0)
		if (!p0) memb(r0+##1023) = r2
	}
	{
		if (!p0) r19 = add(r0,##1023)
		if (p1) jump:nt .LBB136_23
		memw(r29+#4) = r1
	}                                       // 4-byte Folded Spill
// %bb.8:                               // %if.else.i81
	{
		call ##halide_string_to_string
		r1:0 = combine(r19,r17)
		r2 = r23
	}
	.falign
// %bb.9:                               // %if.else.i81
	{
		jump .LBB136_24
	}
	.falign
.LBB136_10:                             // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB136_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.14.51@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r22)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.15.52@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.14:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r20)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.15:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.16.53@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB136_21
	}
// %bb.18:                              // %if.else.i59
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.19:                              // %if.else.i59
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.20:                              // %if.else.i59
	{
		jump .LBB136_36
	}
	.falign
.LBB136_21:                             // %if.then.i58
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
// %bb.22:                              // %if.then.i58
	{
		r17 = #0 ; jump .LBB136_36
	}
	.falign
.LBB136_23:                             // %if.then.i79
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1:0 = combine(r19,r17)
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB136_24:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit84
	{
		r2 = add(pc,##.L.str.14.51@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.25:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit84
	{
		r3:2 = sxtw(r21)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.26:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit84
	{
		r2 = add(pc,##.L.str.17.54@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.27:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit84
	{
		r3:2 = sxtw(r20)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.28:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit84
	{
		r2 = add(pc,##.L.str.16.53@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.29:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit84
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.30:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit84
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB136_34
	}
// %bb.31:                              // %if.else.i125
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.32:                              // %if.else.i125
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.33:                              // %if.else.i125
	{
		jump .LBB136_36
	}
	.falign
.LBB136_34:                             // %if.then.i118
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
// %bb.35:                              // %if.then.i118
	{
		r17 = #0
	}
	.falign
.LBB136_36:                             // %if.end17.sink.split
	{
		call ##free
		r0 = r17
	}
	.falign
.LBB136_37:                             // %if.end17
	{
		r1:0 = combine(#-4,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end136:
	.size	halide_error_access_out_of_bounds, .Lfunc_end136-halide_error_access_out_of_bounds
                                        // -- End function
	.section	.text.halide_error_buffer_allocation_too_large,"ax",@progbits
	.weak	halide_error_buffer_allocation_too_large // -- Begin function halide_error_buffer_allocation_too_large
	.falign
	.type	halide_error_buffer_allocation_too_large,@function
halide_error_buffer_allocation_too_large: // @halide_error_buffer_allocation_too_large
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.18.55@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB137_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB137_8
	}
	.falign
.LBB137_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB137_9
	}
	.falign
.LBB137_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB137_4
	}
	.falign
.LBB137_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB137_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.20.57@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB137_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB137_18
	}
	.falign
.LBB137_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB137_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-5,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end137:
	.size	halide_error_buffer_allocation_too_large, .Lfunc_end137-halide_error_buffer_allocation_too_large
                                        // -- End function
	.section	.text.halide_error_buffer_extents_negative,"ax",@progbits
	.weak	halide_error_buffer_extents_negative // -- Begin function halide_error_buffer_extents_negative
	.falign
	.type	halide_error_buffer_extents_negative,@function
halide_error_buffer_extents_negative:   // @halide_error_buffer_extents_negative
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r3
		r21:20 = combine(r1,r2)
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.21.58@PCREL)
		if (!p0) r1:0 = combine(r19,r17)
		if (p0) jump:nt .LBB138_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r21,#0); if (p0.new) jump:nt .LBB138_8
	}
	.falign
.LBB138_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r21
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB138_9
	}
	.falign
.LBB138_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r21,#0); if (!p0.new) jump:t .LBB138_4
	}
	.falign
.LBB138_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB138_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.22.59@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r20)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.23.60@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.8.45@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.14:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB138_18
	}
// %bb.15:                              // %if.else.i40
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.16:                              // %if.else.i40
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.17:                              // %if.else.i40
	{
		jump .LBB138_19
	}
	.falign
.LBB138_18:                             // %if.then.i39
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB138_19:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.20:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-28,r16)
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r21:20 = memd(r29+#16)
		deallocframe
	}                                       // 8-byte Folded Reload
.Lfunc_end138:
	.size	halide_error_buffer_extents_negative, .Lfunc_end138-halide_error_buffer_extents_negative
                                        // -- End function
	.section	.text.halide_error_buffer_extents_too_large,"ax",@progbits
	.weak	halide_error_buffer_extents_too_large // -- Begin function halide_error_buffer_extents_too_large
	.falign
	.type	halide_error_buffer_extents_too_large,@function
halide_error_buffer_extents_too_large:  // @halide_error_buffer_extents_too_large
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.24.61@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB139_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB139_8
	}
	.falign
.LBB139_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB139_9
	}
	.falign
.LBB139_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB139_4
	}
	.falign
.LBB139_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB139_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.20.57@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB139_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB139_18
	}
	.falign
.LBB139_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB139_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-6,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end139:
	.size	halide_error_buffer_extents_too_large, .Lfunc_end139-halide_error_buffer_extents_too_large
                                        // -- End function
	.section	.text.halide_error_constraints_make_required_region_smaller,"ax",@progbits
	.weak	halide_error_constraints_make_required_region_smaller // -- Begin function halide_error_constraints_make_required_region_smaller
	.falign
	.type	halide_error_constraints_make_required_region_smaller,@function
halide_error_constraints_make_required_region_smaller: // @halide_error_constraints_make_required_region_smaller
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#56)
	}                                       // 8-byte Folded Spill
	{
		r21:20 = combine(r2,r5)
		r19 = r3
		memd(r29+#40) = r19:18
		memd(r29+#32) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r23:22 = combine(r4,r1)
		memd(r29+#24) = r23:22
		memd(r29+#16) = r25:24
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r24 = memw(r29+#64)
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r18 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.25.62@PCREL)
		if (!p0) r1:0 = combine(r18,r17)
		if (p0) jump:nt .LBB140_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		r24 = add(r20,add(r24,#-1))
		r23 = add(r19,add(r23,#-1))
		p0 = cmp.eq(r22,#0); if (p0.new) jump:nt .LBB140_8
	}
	.falign
.LBB140_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r22
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB140_9
	}
	.falign
.LBB140_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r18 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		r24 = add(r20,add(r24,#-1))
		r23 = add(r19,add(r23,#-1))
		p0 = cmp.eq(r22,#0); if (!p0.new) jump:t .LBB140_4
	}
	.falign
.LBB140_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB140_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.26.63@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r21)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r21 = add(pc,##.L.str.27.64@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
		r2 = r21
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.28.65@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r20)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.14:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r20 = add(pc,##.L.str.6.43@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
		r2 = r20
	}
	.falign
// %bb.15:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r24)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r21
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.29.66@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.18:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r19)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r20
	}
	.falign
// %bb.20:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r23)
		r4 = #1
		r1 = r18
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.21:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.30.67@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.22:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB140_26
	}
// %bb.23:                              // %if.else.i91
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.24:                              // %if.else.i91
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.25:                              // %if.else.i91
	{
		jump .LBB140_27
	}
	.falign
.LBB140_26:                             // %if.then.i90
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB140_27:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.28:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-7,r16)
		r17:16 = memd(r29+#48)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#32)
		r23:22 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r25:24 = memd(r29+#16)
		r31:30 = deallocframe(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end140:
	.size	halide_error_constraints_make_required_region_smaller, .Lfunc_end140-halide_error_constraints_make_required_region_smaller
                                        // -- End function
	.section	.text.halide_error_constraint_violated,"ax",@progbits
	.weak	halide_error_constraint_violated // -- Begin function halide_error_constraint_violated
	.falign
	.type	halide_error_constraint_violated,@function
halide_error_constraint_violated:       // @halide_error_constraint_violated
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r18 = r4
		r21:20 = combine(r2,r3)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r22 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r0,#0)
		r17 = r0
	}
	{
		r2 = p1
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.31.68@PCREL)
		if (!p1) r1:0 = combine(r19,r17)
		if (p1) jump:nt .LBB141_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r22,#0); if (p0.new) jump:nt .LBB141_8
	}
	.falign
.LBB141_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r22
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB141_9
	}
	.falign
.LBB141_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r22,#0); if (!p0.new) jump:t .LBB141_4
	}
	.falign
.LBB141_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB141_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.32.69@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r21)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.33.70@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r1 = r19
		p1 = cmp.eq(r20,#0); if (p1.new) jump:nt .LBB141_15
	}
// %bb.13:                              // %if.else.i36
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.14:                              // %if.else.i36
	{
		jump .LBB141_16
	}
	.falign
.LBB141_15:                             // %if.then.i34
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB141_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit38
	{
		r2 = add(pc,##.L.str.32.69@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit38
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.18:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit38
	{
		r2 = add(pc,##.L.str.8.45@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit38
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) r0 = add(r16,#0)
		if (p0.new) jump:nt .LBB141_23
	}
// %bb.20:                              // %if.else.i56
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.21:                              // %if.else.i56
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.22:                              // %if.else.i56
	{
		jump .LBB141_24
	}
	.falign
.LBB141_23:                             // %if.then.i55
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB141_24:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.25:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-8,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end141:
	.size	halide_error_constraint_violated, .Lfunc_end141-halide_error_constraint_violated
                                        // -- End function
	.section	.text.halide_error_param_too_small_i64,"ax",@progbits
	.weak	halide_error_param_too_small_i64 // -- Begin function halide_error_param_too_small_i64
	.falign
	.type	halide_error_param_too_small_i64,@function
halide_error_param_too_small_i64:       // @halide_error_param_too_small_i64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.34.71@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB142_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB142_8
	}
	.falign
.LBB142_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB142_9
	}
	.falign
.LBB142_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB142_4
	}
	.falign
.LBB142_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB142_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.35.72@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB142_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB142_18
	}
	.falign
.LBB142_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB142_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-9,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end142:
	.size	halide_error_param_too_small_i64, .Lfunc_end142-halide_error_param_too_small_i64
                                        // -- End function
	.section	.text.halide_error_param_too_small_u64,"ax",@progbits
	.weak	halide_error_param_too_small_u64 // -- Begin function halide_error_param_too_small_u64
	.falign
	.type	halide_error_param_too_small_u64,@function
halide_error_param_too_small_u64:       // @halide_error_param_too_small_u64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.34.71@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB143_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB143_8
	}
	.falign
.LBB143_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB143_9
	}
	.falign
.LBB143_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB143_4
	}
	.falign
.LBB143_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB143_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.35.72@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB143_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB143_18
	}
	.falign
.LBB143_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB143_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-9,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end143:
	.size	halide_error_param_too_small_u64, .Lfunc_end143-halide_error_param_too_small_u64
                                        // -- End function
	.section	.text.halide_error_param_too_small_f64,"ax",@progbits
	.weak	halide_error_param_too_small_f64 // -- Begin function halide_error_param_too_small_f64
	.falign
	.type	halide_error_param_too_small_f64,@function
halide_error_param_too_small_f64:       // @halide_error_param_too_small_f64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.34.71@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB144_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB144_8
	}
	.falign
.LBB144_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB144_9
	}
	.falign
.LBB144_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB144_4
	}
	.falign
.LBB144_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB144_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.35.72@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB144_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB144_18
	}
	.falign
.LBB144_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB144_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-9,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end144:
	.size	halide_error_param_too_small_f64, .Lfunc_end144-halide_error_param_too_small_f64
                                        // -- End function
	.section	.text.halide_error_param_too_large_i64,"ax",@progbits
	.weak	halide_error_param_too_large_i64 // -- Begin function halide_error_param_too_large_i64
	.falign
	.type	halide_error_param_too_large_i64,@function
halide_error_param_too_large_i64:       // @halide_error_param_too_large_i64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.34.71@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB145_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB145_8
	}
	.falign
.LBB145_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB145_9
	}
	.falign
.LBB145_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB145_4
	}
	.falign
.LBB145_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB145_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.36.73@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB145_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB145_18
	}
	.falign
.LBB145_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB145_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-10,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end145:
	.size	halide_error_param_too_large_i64, .Lfunc_end145-halide_error_param_too_large_i64
                                        // -- End function
	.section	.text.halide_error_param_too_large_u64,"ax",@progbits
	.weak	halide_error_param_too_large_u64 // -- Begin function halide_error_param_too_large_u64
	.falign
	.type	halide_error_param_too_large_u64,@function
halide_error_param_too_large_u64:       // @halide_error_param_too_large_u64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.34.71@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB146_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB146_8
	}
	.falign
.LBB146_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB146_9
	}
	.falign
.LBB146_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB146_4
	}
	.falign
.LBB146_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB146_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.36.73@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_uint64_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB146_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB146_18
	}
	.falign
.LBB146_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB146_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-10,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end146:
	.size	halide_error_param_too_large_u64, .Lfunc_end146-halide_error_param_too_large_u64
                                        // -- End function
	.section	.text.halide_error_param_too_large_f64,"ax",@progbits
	.weak	halide_error_param_too_large_f64 // -- Begin function halide_error_param_too_large_f64
	.falign
	.type	halide_error_param_too_large_f64,@function
halide_error_param_too_large_f64:       // @halide_error_param_too_large_f64
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r4)
		r21:20 = combine(r3,r2)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23 = r1
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r22 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.34.71@PCREL)
		if (!p0) r1:0 = combine(r22,r17)
		if (p0) jump:nt .LBB147_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r23,#0); if (p0.new) jump:nt .LBB147_8
	}
	.falign
.LBB147_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r22
		r2 = r23
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB147_9
	}
	.falign
.LBB147_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r22 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r23,#0); if (!p0.new) jump:t .LBB147_4
	}
	.falign
.LBB147_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB147_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.19.56@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r21,r20)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.36.73@PCREL)
		r1 = r22
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = combine(r19,r18)
		r4 = #1
		r1 = r22
	}
	{
		call ##halide_double_to_string
	}
	.falign
// %bb.13:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB147_17
	}
// %bb.14:                              // %if.else.i33
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.15:                              // %if.else.i33
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.16:                              // %if.else.i33
	{
		jump .LBB147_18
	}
	.falign
.LBB147_17:                             // %if.then.i32
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB147_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-10,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end147:
	.size	halide_error_param_too_large_f64, .Lfunc_end147-halide_error_param_too_large_f64
                                        // -- End function
	.section	.text.halide_error_out_of_memory,"ax",@progbits
	.weak	halide_error_out_of_memory      // -- Begin function halide_error_out_of_memory
	.balign 32
	.type	halide_error_out_of_memory,@function
halide_error_out_of_memory:             // @halide_error_out_of_memory
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.37.74@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_error
		r16 = r0
	}
	{
		r1:0 = combine(#-11,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
	}
.Lfunc_end148:
	.size	halide_error_out_of_memory, .Lfunc_end148-halide_error_out_of_memory
                                        // -- End function
	.section	.text.halide_error_vtcm_out_of_memory,"ax",@progbits
	.weak	halide_error_vtcm_out_of_memory // -- Begin function halide_error_vtcm_out_of_memory
	.balign 32
	.type	halide_error_vtcm_out_of_memory,@function
halide_error_vtcm_out_of_memory:        // @halide_error_vtcm_out_of_memory
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.38@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_error
		r16 = r0
	}
	{
		r1:0 = combine(#-45,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
	}
.Lfunc_end149:
	.size	halide_error_vtcm_out_of_memory, .Lfunc_end149-halide_error_vtcm_out_of_memory
                                        // -- End function
	.section	.text.halide_error_locked_cache_out_of_memory,"ax",@progbits
	.weak	halide_error_locked_cache_out_of_memory // -- Begin function halide_error_locked_cache_out_of_memory
	.balign 32
	.type	halide_error_locked_cache_out_of_memory,@function
halide_error_locked_cache_out_of_memory: // @halide_error_locked_cache_out_of_memory
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.39@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_error
		r16 = r0
	}
	{
		r1:0 = combine(#-46,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
	}
.Lfunc_end150:
	.size	halide_error_locked_cache_out_of_memory, .Lfunc_end150-halide_error_locked_cache_out_of_memory
                                        // -- End function
	.section	.text.halide_error_gpu_shared_out_of_memory,"ax",@progbits
	.weak	halide_error_gpu_shared_out_of_memory // -- Begin function halide_error_gpu_shared_out_of_memory
	.balign 32
	.type	halide_error_gpu_shared_out_of_memory,@function
halide_error_gpu_shared_out_of_memory:  // @halide_error_gpu_shared_out_of_memory
// %bb.0:                               // %entry
	{
		r1 = add(pc,##.L.str.40@PCREL)
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##halide_error
		r16 = r0
	}
	{
		r1:0 = combine(#-47,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
	}
.Lfunc_end151:
	.size	halide_error_gpu_shared_out_of_memory, .Lfunc_end151-halide_error_gpu_shared_out_of_memory
                                        // -- End function
	.section	.text.halide_error_buffer_argument_is_null,"ax",@progbits
	.weak	halide_error_buffer_argument_is_null // -- Begin function halide_error_buffer_argument_is_null
	.falign
	.type	halide_error_buffer_argument_is_null,@function
halide_error_buffer_argument_is_null:   // @halide_error_buffer_argument_is_null
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r19 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r18 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.41@PCREL)
		if (!p0) r1:0 = combine(r18,r17)
		if (p0) jump:nt .LBB152_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r19,#0); if (p0.new) jump:nt .LBB152_8
	}
	.falign
.LBB152_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r19
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB152_9
	}
	.falign
.LBB152_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r18 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r19,#0); if (!p0.new) jump:t .LBB152_4
	}
	.falign
.LBB152_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB152_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.42.75@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB152_14
	}
// %bb.11:                              // %if.else.i19
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.12:                              // %if.else.i19
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.13:                              // %if.else.i19
	{
		jump .LBB152_15
	}
	.falign
.LBB152_14:                             // %if.then.i18
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB152_15:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-12,r16)
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end152:
	.size	halide_error_buffer_argument_is_null, .Lfunc_end152-halide_error_buffer_argument_is_null
                                        // -- End function
	.section	.text.halide_error_debug_to_file_failed,"ax",@progbits
	.weak	halide_error_debug_to_file_failed // -- Begin function halide_error_debug_to_file_failed
	.falign
	.type	halide_error_debug_to_file_failed,@function
halide_error_debug_to_file_failed:      // @halide_error_debug_to_file_failed
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r3
		r21:20 = combine(r1,r2)
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r0,#0)
		r17 = r0
	}
	{
		r2 = p1
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.43@PCREL)
		if (!p1) r1:0 = combine(r19,r17)
		if (p1) jump:nt .LBB153_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r21,#0); if (p0.new) jump:nt .LBB153_8
	}
	.falign
.LBB153_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r21
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB153_9
	}
	.falign
.LBB153_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r21,#0); if (!p0.new) jump:t .LBB153_4
	}
	.falign
.LBB153_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB153_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.44@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r1 = r19
		p1 = cmp.eq(r20,#0); if (p1.new) jump:nt .LBB153_13
	}
// %bb.11:                              // %if.else.i25
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.12:                              // %if.else.i25
	{
		jump .LBB153_14
	}
	.falign
.LBB153_13:                             // %if.then.i23
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB153_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit27
	{
		r2 = add(pc,##.L.str.45@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.15:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit27
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit27
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) r0 = add(r16,#0)
		if (p0.new) jump:nt .LBB153_20
	}
// %bb.17:                              // %if.else.i39
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.18:                              // %if.else.i39
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.19:                              // %if.else.i39
	{
		jump .LBB153_21
	}
	.falign
.LBB153_20:                             // %if.then.i38
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB153_21:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.22:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-13,r16)
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r21:20 = memd(r29+#16)
		deallocframe
	}                                       // 8-byte Folded Reload
.Lfunc_end153:
	.size	halide_error_debug_to_file_failed, .Lfunc_end153-halide_error_debug_to_file_failed
                                        // -- End function
	.section	.text.halide_error_unaligned_host_ptr,"ax",@progbits
	.weak	halide_error_unaligned_host_ptr // -- Begin function halide_error_unaligned_host_ptr
	.falign
	.type	halide_error_unaligned_host_ptr,@function
halide_error_unaligned_host_ptr:        // @halide_error_unaligned_host_ptr
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r2
		r20 = r1
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.46@PCREL)
		if (!p0) r1:0 = combine(r19,r17)
		if (p0) jump:nt .LBB154_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r20,#0); if (p0.new) jump:nt .LBB154_8
	}
	.falign
.LBB154_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB154_9
	}
	.falign
.LBB154_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r20,#0); if (!p0.new) jump:t .LBB154_4
	}
	.falign
.LBB154_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB154_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.47@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.48@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB154_16
	}
// %bb.13:                              // %if.else.i29
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.14:                              // %if.else.i29
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.15:                              // %if.else.i29
	{
		jump .LBB154_17
	}
	.falign
.LBB154_16:                             // %if.then.i28
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB154_17:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.18:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-24,r16)
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r21:20 = memd(r29+#16)
		deallocframe
	}                                       // 8-byte Folded Reload
.Lfunc_end154:
	.size	halide_error_unaligned_host_ptr, .Lfunc_end154-halide_error_unaligned_host_ptr
                                        // -- End function
	.section	.text.halide_error_device_dirty_with_no_device_support,"ax",@progbits
	.weak	halide_error_device_dirty_with_no_device_support // -- Begin function halide_error_device_dirty_with_no_device_support
	.falign
	.type	halide_error_device_dirty_with_no_device_support,@function
halide_error_device_dirty_with_no_device_support: // @halide_error_device_dirty_with_no_device_support
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r19 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r16 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r18 = add(r16,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.49@PCREL)
		if (!p0) r1:0 = combine(r18,r16)
		if (p0) jump:nt .LBB155_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r16+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r19,#0); if (p0.new) jump:nt .LBB155_8
	}
	.falign
.LBB155_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r19
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB155_9
	}
	.falign
.LBB155_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r18 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r19,#0); if (!p0.new) jump:t .LBB155_4
	}
	.falign
.LBB155_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB155_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.50@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.51@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB155_15
	}
// %bb.12:                              // %if.else.i23
	{
		r2 = add(r0,sub(#1,r16))
		r1:0 = combine(r16,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.13:                              // %if.else.i23
	{
		call ##halide_error
		r1:0 = combine(r16,r17)
	}
	.falign
// %bb.14:                              // %if.else.i23
	{
		jump .LBB155_16
	}
	.falign
.LBB155_15:                             // %if.then.i22
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB155_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r16
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r0 = #-44
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end155:
	.size	halide_error_device_dirty_with_no_device_support, .Lfunc_end155-halide_error_device_dirty_with_no_device_support
                                        // -- End function
	.section	.text.halide_error_host_is_null,"ax",@progbits
	.weak	halide_error_host_is_null       // -- Begin function halide_error_host_is_null
	.falign
	.type	halide_error_host_is_null,@function
halide_error_host_is_null:              // @halide_error_host_is_null
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r19 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r18 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.46@PCREL)
		if (!p0) r1:0 = combine(r18,r17)
		if (p0) jump:nt .LBB156_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r19,#0); if (p0.new) jump:nt .LBB156_8
	}
	.falign
.LBB156_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r19
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB156_9
	}
	.falign
.LBB156_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r18 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r19,#0); if (!p0.new) jump:t .LBB156_4
	}
	.falign
.LBB156_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB156_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.52@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB156_14
	}
// %bb.11:                              // %if.else.i19
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.12:                              // %if.else.i19
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.13:                              // %if.else.i19
	{
		jump .LBB156_15
	}
	.falign
.LBB156_14:                             // %if.then.i18
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB156_15:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-34,r16)
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end156:
	.size	halide_error_host_is_null, .Lfunc_end156-halide_error_host_is_null
                                        // -- End function
	.section	.text.halide_error_bad_fold,"ax",@progbits
	.weak	halide_error_bad_fold           // -- Begin function halide_error_bad_fold
	.falign
	.type	halide_error_bad_fold,@function
halide_error_bad_fold:                  // @halide_error_bad_fold
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r3
		r21:20 = combine(r2,r1)
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.53@PCREL)
		if (!p0) r1:0 = combine(r19,r17)
		if (p0) jump:nt .LBB157_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r21,#0); if (p0.new) jump:nt .LBB157_8
	}
	.falign
.LBB157_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r21
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB157_9
	}
	.falign
.LBB157_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r21,#0); if (!p0.new) jump:t .LBB157_4
	}
	.falign
.LBB157_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB157_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r1 = r19
		p1 = cmp.eq(r20,#0); if (p1.new) jump:nt .LBB157_13
	}
// %bb.11:                              // %if.else.i26
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.12:                              // %if.else.i26
	{
		jump .LBB157_14
	}
	.falign
.LBB157_13:                             // %if.then.i24
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB157_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
	{
		r2 = add(pc,##.L.str.55@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.15:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
	{
		r1 = r19
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB157_18
	}
// %bb.16:                              // %if.else.i40
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r18
	}
	.falign
// %bb.17:                              // %if.else.i40
	{
		jump .LBB157_19
	}
	.falign
.LBB157_18:                             // %if.then.i38
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB157_19:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit42
	{
		r2 = add(pc,##.L.str.30.67@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.20:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit42
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB157_24
	}
// %bb.21:                              // %if.else.i51
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.22:                              // %if.else.i51
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.23:                              // %if.else.i51
	{
		jump .LBB157_25
	}
	.falign
.LBB157_24:                             // %if.then.i50
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB157_25:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.26:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-25,r16)
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r21:20 = memd(r29+#16)
		deallocframe
	}                                       // 8-byte Folded Reload
.Lfunc_end157:
	.size	halide_error_bad_fold, .Lfunc_end157-halide_error_bad_fold
                                        // -- End function
	.section	.text.halide_error_bad_extern_fold,"ax",@progbits
	.weak	halide_error_bad_extern_fold    // -- Begin function halide_error_bad_extern_fold
	.falign
	.type	halide_error_bad_extern_fold,@function
halide_error_bad_extern_fold:           // @halide_error_bad_extern_fold
// %bb.0:                               // %entry
	{
		p0 = cmp.gt(r5,r3)
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#56)
	}                                       // 8-byte Folded Spill
	{
		r19:18 = combine(r5,r3)
		r21 = r1
		memd(r29+#40) = r19:18
		memd(r29+#32) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r23:22 = combine(r2,r4)
		memd(r29+#24) = r23:22
		memd(r29+#16) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r20 = add(r22,r18)
		if (p0) jump:nt .LBB158_2
		r24 = memw(r29+#64)
	}
// %bb.1:                               // %lor.lhs.false
	{
		r2 = add(r24,r19)
		if (!cmp.gt(r20,r2.new)) jump:t .LBB158_29
	}
	.falign
.LBB158_2:                              // %if.then
	{
		call ##malloc
		r0 = #1024
	}
	.falign
// %bb.3:                               // %if.then
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r20 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.56@PCREL)
		if (!p0) r1:0 = combine(r20,r17)
		if (p0) jump:nt .LBB158_6
	}
// %bb.4:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.5:                               // %if.then6.i
	{
		jump .LBB158_7
	}
	.falign
.LBB158_6:                              // %if.then.split
	{
		call ##halide_string_to_string
		r20 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
.LBB158_7:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r3:2 = sxtw(r23)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.8:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.9:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r1 = r20
		p0 = cmp.eq(r21,#0); if (p0.new) jump:nt .LBB158_12
	}
// %bb.10:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	.falign
// %bb.11:                              // %if.else.i
	{
		jump .LBB158_13
	}
	.falign
.LBB158_12:                             // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB158_13:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.57@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.14:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.15:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r21 = add(pc,##.L.str.58.76@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
		r2 = r21
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(r22,add(r18,#-1))
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.59.77@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.18:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.60.78@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.19:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r3:2 = sxtw(r19)
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.20:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		call ##halide_string_to_string
		r1 = r20
		r2 = r21
	}
	.falign
// %bb.21:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(r24,add(r19,#-1))
		r4 = #1
		r1 = r20
	}
	{
		call ##halide_int64_to_string
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.22:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.61.79@PCREL)
		r1 = r20
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.23:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB158_27
	}
// %bb.24:                              // %if.else.i113
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.25:                              // %if.else.i113
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.26:                              // %if.else.i113
	{
		jump .LBB158_55
	}
	.falign
.LBB158_27:                             // %if.then.i112
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
// %bb.28:                              // %if.then.i112
	{
		r17 = #0 ; jump .LBB158_55
	}
	.falign
.LBB158_29:                             // %if.else
	{
		call ##malloc
		r0 = #1024
	}
	.falign
// %bb.30:                              // %if.else
	{
		p1 = cmp.eq(r0,#0)
		r17 = r0
	}
	{
		r2 = p1
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.56@PCREL)
		if (!p1) r1:0 = combine(r19,r17)
		if (p1) jump:nt .LBB158_33
	}
// %bb.31:                              // %if.then6.i125
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.32:                              // %if.then6.i125
	{
		jump .LBB158_34
	}
	.falign
.LBB158_33:                             // %if.else.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
.LBB158_34:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit128
	{
		r3:2 = sxtw(r23)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.35:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit128
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.36:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit128
	{
		r1 = r19
		p1 = cmp.eq(r21,#0); if (p1.new) jump:nt .LBB158_39
	}
// %bb.37:                              // %if.else.i151
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r21
	}
	.falign
// %bb.38:                              // %if.else.i151
	{
		jump .LBB158_40
	}
	.falign
.LBB158_39:                             // %if.then.i149
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB158_40:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r2 = add(pc,##.L.str.57@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.41:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.42:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r2 = add(pc,##.L.str.58.76@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.43:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r1 = r19
		r4 = #1
		r2 = add(r20,#-1)
	}
	{
		call ##halide_int64_to_string
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.44:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r2 = add(pc,##.L.str.59.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.45:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r2 = add(pc,##.L.str.62@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.46:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r2 = add(pc,##.L.str.63@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.47:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r3:2 = sxtw(r24)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.48:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r2 = add(pc,##.L.str.30.67@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.49:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit154
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) r0 = add(r16,#0)
		if (p0.new) jump:nt .LBB158_53
	}
// %bb.50:                              // %if.else.i213
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.51:                              // %if.else.i213
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.52:                              // %if.else.i213
	{
		jump .LBB158_55
	}
	.falign
.LBB158_53:                             // %if.then.i206
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
// %bb.54:                              // %if.then.i206
	{
		r17 = #0
	}
	.falign
.LBB158_55:                             // %if.end
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.56:                              // %if.end
	{
		r1:0 = combine(#-35,r16)
		r17:16 = memd(r29+#48)
		r19:18 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#32)
		r23:22 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r25:24 = memd(r29+#16)
		r31:30 = deallocframe(r30):raw
	}                                       // 8-byte Folded Reload
.Lfunc_end158:
	.size	halide_error_bad_extern_fold, .Lfunc_end158-halide_error_bad_extern_fold
                                        // -- End function
	.section	.text.halide_error_fold_factor_too_small,"ax",@progbits
	.weak	halide_error_fold_factor_too_small // -- Begin function halide_error_fold_factor_too_small
	.falign
	.type	halide_error_fold_factor_too_small,@function
halide_error_fold_factor_too_small:     // @halide_error_fold_factor_too_small
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r18 = r5
		r21:20 = combine(r1,r4)
		memd(r29+#32) = r19:18
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r23:22 = combine(r3,r2)
		memd(r29+#16) = r23:22
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.64.80@PCREL)
		if (!p0) r1:0 = combine(r19,r17)
		if (p0) jump:nt .LBB159_4
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		jump .LBB159_5
	}
	.falign
.LBB159_4:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
.LBB159_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r3:2 = sxtw(r23)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.6:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r2 = add(pc,##.L.str.65@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.7:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r1 = r19
		p0 = cmp.eq(r22,#0); if (p0.new) jump:nt .LBB159_10
	}
// %bb.8:                               // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r22
	}
	.falign
// %bb.9:                               // %if.else.i
	{
		jump .LBB159_11
	}
	.falign
.LBB159_10:                             // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB159_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.54@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r1 = r19
		p1 = cmp.eq(r21,#0); if (p1.new) jump:nt .LBB159_15
	}
// %bb.13:                              // %if.else.i36
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r21
	}
	.falign
// %bb.14:                              // %if.else.i36
	{
		jump .LBB159_16
	}
	.falign
.LBB159_15:                             // %if.then.i34
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB159_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit38
	{
		r2 = add(pc,##.L.str.66@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.17:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit38
	{
		r1 = r19
		p0 = cmp.eq(r20,#0); if (p0.new) jump:nt .LBB159_20
	}
// %bb.18:                              // %if.else.i50
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.19:                              // %if.else.i50
	{
		jump .LBB159_21
	}
	.falign
.LBB159_20:                             // %if.then.i48
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
.LBB159_21:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit52
	{
		r2 = add(pc,##.L.str.32.69@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.22:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit52
	{
		r3:2 = sxtw(r18)
		r4 = #1
		r1 = r19
	}
	{
		call ##halide_int64_to_string
	}
	.falign
// %bb.23:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit52
	{
		r2 = add(pc,##.L.str.67@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.24:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit52
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB159_28
	}
// %bb.25:                              // %if.else.i70
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.26:                              // %if.else.i70
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.27:                              // %if.else.i70
	{
		jump .LBB159_29
	}
	.falign
.LBB159_28:                             // %if.then.i69
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB159_29:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.30:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-26,r16)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end159:
	.size	halide_error_fold_factor_too_small, .Lfunc_end159-halide_error_fold_factor_too_small
                                        // -- End function
	.section	.text.halide_error_requirement_failed,"ax",@progbits
	.weak	halide_error_requirement_failed // -- Begin function halide_error_requirement_failed
	.falign
	.type	halide_error_requirement_failed,@function
halide_error_requirement_failed:        // @halide_error_requirement_failed
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#40)
	}                                       // 8-byte Folded Spill
	{
		r18 = r2
		r20 = r1
		memd(r29+#24) = r19:18
		memd(r29+#16) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		p1 = cmp.eq(r0,#0)
		r17 = r0
	}
	{
		r2 = p1
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.68@PCREL)
		if (!p1) r1:0 = combine(r19,r17)
		if (p1) jump:nt .LBB160_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r20,#0); if (p0.new) jump:nt .LBB160_8
	}
	.falign
.LBB160_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r20
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB160_9
	}
	.falign
.LBB160_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r20,#0); if (!p0.new) jump:t .LBB160_4
	}
	.falign
.LBB160_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB160_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.69@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r1 = r19
		p1 = cmp.eq(r18,#0); if (p1.new) jump:nt .LBB160_16
	}
// %bb.11:                              // %if.else.i23
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r18
	}
	.falign
// %bb.12:                              // %if.else.i23
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (p0.new) jump:nt .LBB160_18
	}
	.falign
.LBB160_13:                             // %if.else.i29
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.14:                              // %if.else.i29
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.15:                              // %if.else.i29
	{
		jump .LBB160_19
	}
	.falign
.LBB160_16:                             // %if.then.i21
	{
		r2 = add(pc,##.L.str.77@PCREL)
		call ##halide_string_to_string
	}
	.falign
// %bb.17:                              // %if.then.i21
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (!p0.new) jump:t .LBB160_13
	}
	.falign
.LBB160_18:                             // %if.then.i28
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
.LBB160_19:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.20:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-27,r16)
		r17:16 = memd(r29+#32)
		r19:18 = memd(r29+#24)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r21:20 = memd(r29+#16)
		deallocframe
	}                                       // 8-byte Folded Reload
.Lfunc_end160:
	.size	halide_error_requirement_failed, .Lfunc_end160-halide_error_requirement_failed
                                        // -- End function
	.section	.text.halide_error_specialize_fail,"ax",@progbits
	.weak	halide_error_specialize_fail    // -- Begin function halide_error_specialize_fail
	.falign
	.type	halide_error_specialize_fail,@function
halide_error_specialize_fail:           // @halide_error_specialize_fail
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r18 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.70@PCREL)
		if (!p0) r1:0 = combine(r19,r17)
		if (p0) jump:nt .LBB161_9
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r18,#0); if (p0.new) jump:nt .LBB161_11
	}
	.falign
.LBB161_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r19
		r2 = r18
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) jump:nt .LBB161_13
	}
	.falign
.LBB161_6:                              // %if.else.i13
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.7:                               // %if.else.i13
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.8:                               // %if.else.i13
	{
		jump .LBB161_14
	}
	.falign
.LBB161_9:                              // %entry.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.10:                              // %entry.split
	{
		p0 = cmp.eq(r18,#0); if (!p0.new) jump:t .LBB161_4
	}
	.falign
.LBB161_11:                             // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.12:                              // %if.then.i
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (!p1.new) jump:t .LBB161_6
	}
	.falign
.LBB161_13:                             // %if.then.i12
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
.LBB161_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.15:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-31,r16)
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end161:
	.size	halide_error_specialize_fail, .Lfunc_end161-halide_error_specialize_fail
                                        // -- End function
	.section	.text.halide_error_no_device_interface,"ax",@progbits
	.weak	halide_error_no_device_interface // -- Begin function halide_error_no_device_interface
	.falign
	.type	halide_error_no_device_interface,@function
halide_error_no_device_interface:       // @halide_error_no_device_interface
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB162_6
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.71@PCREL)
		r1 = add(r17,#1023)
		r0 = r17
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	.falign
// %bb.3:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.4:                               // %if.else.i
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB162_8
	}
	.falign
.LBB162_6:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.71@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.7:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
.LBB162_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.9:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-19,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
	}
.Lfunc_end162:
	.size	halide_error_no_device_interface, .Lfunc_end162-halide_error_no_device_interface
                                        // -- End function
	.section	.text.halide_error_device_interface_no_device,"ax",@progbits
	.weak	halide_error_device_interface_no_device // -- Begin function halide_error_device_interface_no_device
	.falign
	.type	halide_error_device_interface_no_device,@function
halide_error_device_interface_no_device: // @halide_error_device_interface_no_device
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB163_6
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.72@PCREL)
		r1 = add(r17,#1023)
		r0 = r17
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	.falign
// %bb.3:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.4:                               // %if.else.i
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB163_8
	}
	.falign
.LBB163_6:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.72@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.7:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
.LBB163_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.9:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-36,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
	}
.Lfunc_end163:
	.size	halide_error_device_interface_no_device, .Lfunc_end163-halide_error_device_interface_no_device
                                        // -- End function
	.section	.text.halide_error_host_and_device_dirty,"ax",@progbits
	.weak	halide_error_host_and_device_dirty // -- Begin function halide_error_host_and_device_dirty
	.falign
	.type	halide_error_host_and_device_dirty,@function
halide_error_host_and_device_dirty:     // @halide_error_host_and_device_dirty
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
	}
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB164_6
	}
// %bb.2:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.73@PCREL)
		r1 = add(r17,#1023)
		r0 = r17
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	.falign
// %bb.3:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.4:                               // %if.else.i
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB164_8
	}
	.falign
.LBB164_6:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.73@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.7:                               // %if.then.i
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
.LBB164_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.9:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-37,r16)
		r17:16 = memd(r29+#0)
		deallocframe
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
	}
.Lfunc_end164:
	.size	halide_error_host_and_device_dirty, .Lfunc_end164-halide_error_host_and_device_dirty
                                        // -- End function
	.section	.text.halide_error_buffer_is_null,"ax",@progbits
	.weak	halide_error_buffer_is_null     // -- Begin function halide_error_buffer_is_null
	.falign
	.type	halide_error_buffer_is_null,@function
halide_error_buffer_is_null:            // @halide_error_buffer_is_null
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1024
		memd(r29+#-16) = r17:16
		allocframe(#32)
	}                                       // 8-byte Folded Spill
	{
		call ##malloc
		r19 = r1
		memd(r29+#16) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r17 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r18 = add(r17,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.74@PCREL)
		if (!p0) r1:0 = combine(r18,r17)
		if (p0) jump:nt .LBB165_6
	}
// %bb.2:                               // %if.then6.i
	{
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.3:                               // %if.then6.i
	{
		p0 = cmp.eq(r19,#0); if (p0.new) jump:nt .LBB165_8
	}
	.falign
.LBB165_4:                              // %if.else.i
	{
		call ##halide_string_to_string
		r1 = r18
		r2 = r19
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		jump .LBB165_9
	}
	.falign
.LBB165_6:                              // %entry.split
	{
		call ##halide_string_to_string
		r18 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
// %bb.7:                               // %entry.split
	{
		p0 = cmp.eq(r19,#0); if (!p0.new) jump:t .LBB165_4
	}
	.falign
.LBB165_8:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.77@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
.LBB165_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = add(pc,##.L.str.75@PCREL)
		r1 = r18
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r16,#0)
		if (p1.new) jump:nt .LBB165_14
	}
// %bb.11:                              // %if.else.i19
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.12:                              // %if.else.i19
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.13:                              // %if.else.i19
	{
		jump .LBB165_15
	}
	.falign
.LBB165_14:                             // %if.then.i18
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB165_15:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.16:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r1:0 = combine(#-38,r16)
		r17:16 = memd(r29+#24)
		r19:18 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_check_fault_and_return
		r31:30 = deallocframe(r30):raw
	}
.Lfunc_end165:
	.size	halide_error_buffer_is_null, .Lfunc_end165-halide_error_buffer_is_null
                                        // -- End function
	.section	.text.halide_msan_annotate_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_memory_is_initialized // -- Begin function halide_msan_annotate_memory_is_initialized
	.balign 32
	.type	halide_msan_annotate_memory_is_initialized,@function
halide_msan_annotate_memory_is_initialized: // @halide_msan_annotate_memory_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end166:
	.size	halide_msan_annotate_memory_is_initialized, .Lfunc_end166-halide_msan_annotate_memory_is_initialized
                                        // -- End function
	.section	.text.halide_msan_check_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_check_memory_is_initialized // -- Begin function halide_msan_check_memory_is_initialized
	.balign 32
	.type	halide_msan_check_memory_is_initialized,@function
halide_msan_check_memory_is_initialized: // @halide_msan_check_memory_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end167:
	.size	halide_msan_check_memory_is_initialized, .Lfunc_end167-halide_msan_check_memory_is_initialized
                                        // -- End function
	.section	.text.halide_msan_check_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_check_buffer_is_initialized // -- Begin function halide_msan_check_buffer_is_initialized
	.balign 32
	.type	halide_msan_check_buffer_is_initialized,@function
halide_msan_check_buffer_is_initialized: // @halide_msan_check_buffer_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end168:
	.size	halide_msan_check_buffer_is_initialized, .Lfunc_end168-halide_msan_check_buffer_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized // -- Begin function halide_msan_annotate_buffer_is_initialized
	.balign 32
	.type	halide_msan_annotate_buffer_is_initialized,@function
halide_msan_annotate_buffer_is_initialized: // @halide_msan_annotate_buffer_is_initialized
// %bb.0:                               // %entry
	{
		r0 = #0
		jumpr r31
	}
.Lfunc_end169:
	.size	halide_msan_annotate_buffer_is_initialized, .Lfunc_end169-halide_msan_annotate_buffer_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized_as_destructor,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized_as_destructor // -- Begin function halide_msan_annotate_buffer_is_initialized_as_destructor
	.balign 32
	.type	halide_msan_annotate_buffer_is_initialized_as_destructor,@function
halide_msan_annotate_buffer_is_initialized_as_destructor: // @halide_msan_annotate_buffer_is_initialized_as_destructor
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end170:
	.size	halide_msan_annotate_buffer_is_initialized_as_destructor, .Lfunc_end170-halide_msan_annotate_buffer_is_initialized_as_destructor
                                        // -- End function
	.section	.text.halide_qurt_hvx_lock,"ax",@progbits
	.weak	halide_qurt_hvx_lock            // -- Begin function halide_qurt_hvx_lock
	.falign
	.type	halide_qurt_hvx_lock,@function
halide_qurt_hvx_lock:                   // @halide_qurt_hvx_lock
// %bb.0:                               // %entry
	{
		r16 = r0
		r0 = #1
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##qurt_hvx_lock
	}
	.falign
// %bb.1:                               // %entry
	{
		if (!p0.new) r0 = #1024
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB171_8
	}
// %bb.2:                               // %if.then
	{
		call ##malloc
	}
	.falign
// %bb.3:                               // %if.then
	{
		r17 = r0
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB171_9
	}
// %bb.4:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.4.93@PCREL)
		r1 = add(r17,#1023)
		r0 = r17
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.6:                               // %if.else.i
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.7:                               // %if.else.i
	{
		jump .LBB171_11
	}
	.falign
.LBB171_8:
	{
		r0 = #0
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB171_9:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.4.93@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
.LBB171_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r0 = #-1
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end171:
	.size	halide_qurt_hvx_lock, .Lfunc_end171-halide_qurt_hvx_lock
                                        // -- End function
	.section	.text.halide_qurt_hvx_unlock,"ax",@progbits
	.weak	halide_qurt_hvx_unlock          // -- Begin function halide_qurt_hvx_unlock
	.falign
	.type	halide_qurt_hvx_unlock,@function
halide_qurt_hvx_unlock:                 // @halide_qurt_hvx_unlock
// %bb.0:                               // %entry
	{
		r16 = r0
		memd(r29+#-16) = r17:16
		allocframe(#8)
	}                                       // 8-byte Folded Spill
	{
		call ##qurt_hvx_unlock
	}
	.falign
// %bb.1:                               // %entry
	{
		if (!p0.new) r0 = #1024
		p0 = cmp.eq(r0,#0); if (p0.new) jump:nt .LBB172_8
	}
// %bb.2:                               // %if.then
	{
		call ##malloc
	}
	.falign
// %bb.3:                               // %if.then
	{
		r17 = r0
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB172_9
	}
// %bb.4:                               // %if.else.i
	{
		r2 = add(pc,##.L.str.6.95@PCREL)
		r1 = add(r17,#1023)
		r0 = r17
	}
	{
		call ##halide_string_to_string
		r3 = #0
		memb(r17+#1023) = r3.new
	}
	.falign
// %bb.5:                               // %if.else.i
	{
		r2 = add(r0,sub(#1,r17))
		r1:0 = combine(r17,r16)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.6:                               // %if.else.i
	{
		call ##halide_error
		r1:0 = combine(r17,r16)
	}
	.falign
// %bb.7:                               // %if.else.i
	{
		jump .LBB172_11
	}
	.falign
.LBB172_8:
	{
		r0 = #0
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
	.falign
.LBB172_9:                              // %if.then.i
	{
		r2 = add(pc,##.L.str.6.95@PCREL)
		r1:0 = combine(#0,#0)
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.10:                              // %if.then.i
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		r0 = r16
	}
	{
		call ##halide_error
	}
	.falign
.LBB172_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r17
	}
	.falign
// %bb.12:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		r0 = #-1
		r17:16 = memd(r29+#0)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end172:
	.size	halide_qurt_hvx_unlock, .Lfunc_end172-halide_qurt_hvx_unlock
                                        // -- End function
	.section	.text.halide_qurt_hvx_unlock_as_destructor,"ax",@progbits
	.weak	halide_qurt_hvx_unlock_as_destructor // -- Begin function halide_qurt_hvx_unlock_as_destructor
	.balign 32
	.type	halide_qurt_hvx_unlock_as_destructor,@function
halide_qurt_hvx_unlock_as_destructor:   // @halide_qurt_hvx_unlock_as_destructor
// %bb.0:                               // %entry
	{
		jump ##halide_qurt_hvx_unlock
	}
.Lfunc_end173:
	.size	halide_qurt_hvx_unlock_as_destructor, .Lfunc_end173-halide_qurt_hvx_unlock_as_destructor
                                        // -- End function
	.section	.text.halide_vtcm_malloc,"ax",@progbits
	.weak	halide_vtcm_malloc              // -- Begin function halide_vtcm_malloc
	.falign
	.type	halide_vtcm_malloc,@function
halide_vtcm_malloc:                     // @halide_vtcm_malloc
// %bb.0:                               // %entry
	{
		r17 = r0
		r0 = add(r1,#128)
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r22 = r1
		r1 = r2
		memd(r29+#16) = r23:22
		memd(r29+#24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		call ##HAP_request_VTCM
		r20 = r2
		memd(r29+#32) = r19:18
	}                                       // 8-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r16 = r0
		if (p0.new) r0 = #1024
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:t .LBB174_17
	}
// %bb.2:                               // %if.then
	{
		call ##malloc
	}
	.falign
// %bb.3:                               // %if.then
	{
		r18 = r0
		p0 = cmp.eq(r0,#0)
	}
	{
		r2 = p0
		r19 = add(r18,#1023)
		memw(r29+#4) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = add(pc,##.L.str.96@PCREL)
		if (!p0) r1:0 = combine(r19,r18)
		if (p0) jump:nt .LBB174_6
	}
// %bb.4:                               // %if.then6.i
	{
		r3 = #0
		memb(r18+#1023) = r3.new
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.5:                               // %if.then6.i
	{
		jump .LBB174_7
	}
	.falign
.LBB174_6:                              // %if.then.split
	{
		call ##halide_string_to_string
		r19 = #0
		r1:0 = combine(#0,#0)
	}
	.falign
.LBB174_7:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r1 = r19
		r23 = #0
		r4 = #1
	}
	{
		call ##halide_uint64_to_string
		r3:2 = combine(r23,r22)
	}
	.falign
// %bb.8:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r2 = add(pc,##.L.str.1.97@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.9:                               // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r1 = r19
		r4 = #1
		r21 = r23
	}
	{
		call ##halide_uint64_to_string
		r3:2 = combine(r21,r20)
	}
	.falign
// %bb.10:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r2 = add(pc,##.L.str.2.98@PCREL)
		r1 = r19
	}
	{
		call ##halide_string_to_string
	}
	.falign
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	{
		r2 = memw(r29+#4)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (p1.new) r0 = add(r17,#0)
		if (p1.new) jump:nt .LBB174_15
	}
// %bb.12:                              // %if.else.i
	{
		r2 = add(r0,sub(#1,r18))
		r1:0 = combine(r18,r17)
	}
	{
		call ##halide_msan_annotate_memory_is_initialized
		r3:2 = sxtw(r2)
	}
	.falign
// %bb.13:                              // %if.else.i
	{
		call ##halide_error
		r1:0 = combine(r18,r17)
	}
	.falign
// %bb.14:                              // %if.else.i
	{
		jump .LBB174_16
	}
	.falign
.LBB174_15:                             // %if.then.i
	{
		r1 = add(pc,##.L.str.6.99@PCREL)
		call ##halide_error
	}
	.falign
.LBB174_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	{
		call ##free
		r0 = r18
	}
	.falign
.LBB174_17:                             // %if.end
	{
		r0 = add(r16,#128)
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#24)
		r23:22 = memd(r29+#16)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end174:
	.size	halide_vtcm_malloc, .Lfunc_end174-halide_vtcm_malloc
                                        // -- End function
	.section	.text.halide_vtcm_free,"ax",@progbits
	.weak	halide_vtcm_free                // -- Begin function halide_vtcm_free
	.balign 32
	.type	halide_vtcm_free,@function
halide_vtcm_free:                       // @halide_vtcm_free
// %bb.0:                               // %entry
	{
		r0 = add(r1,#-128)
		jump ##HAP_release_VTCM
	}
.Lfunc_end175:
	.size	halide_vtcm_free, .Lfunc_end175-halide_vtcm_free
                                        // -- End function
	.section	.text.halide_default_can_use_target_features,"ax",@progbits
	.weak	halide_default_can_use_target_features // -- Begin function halide_default_can_use_target_features
	.falign
	.type	halide_default_can_use_target_features,@function
halide_default_can_use_target_features: // @halide_default_can_use_target_features
// %bb.0:                               // %entry
	{
		r17:16 = combine(r0,r1)
		memd(r29+#-16) = r17:16
		allocframe(#48)
	}                                       // 8-byte Folded Spill
	{
		r19 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
		memd(r29+#32) = r19:18
	}                                       // 8-byte Folded Spill
	{
		call ##halide_mutex_lock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)
	}
	.falign
// %bb.1:                               // %entry
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE@GOT)
	}
	{
		r2 = memb(r2+#0)
		if (cmp.eq(r2.new,#0)) jump:nt .LBB176_10
	}
// %bb.2:                               // %if.end
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)
	}
	.falign
// %bb.3:                               // %if.end
	{
		p1 = cmp.eq(r17,#2); if (p1.new) jump:t .LBB176_5
	}
	.falign
.LBB176_4:                              // %if.then1
	{
		r1 = add(pc,##.L.str.100@PCREL)
		r0 = #0
	}
	{
		call ##halide_error
	}
	.falign
.LBB176_5:                              // %if.end2
	{
		r3:2 = combine(#0,#0)
		r1:0 = memd(r16+#0)
		r4 = memw(r19+##_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOT)
	}
	{
		r5:4 = memd(r4+#0)
	}
	{
		r1:0 = and(r5:4,r1:0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) jump:nt .LBB176_7
	}
// %bb.6:                               // %if.then6
	{
		r4 = memw(r19+##_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOT)
	}
	{
		r5:4 = memd(r4+#16)
	}
	{
		r5:4 = and(r5:4,r1:0)
	}
	{
		p1 = cmp.eq(r5:4,r1:0)
		r0 = #0
		if (!p1.new) jump:t .LBB176_9
	}
	.falign
.LBB176_7:                              // %for.inc
	{
		r1:0 = memd(r16+#8)
		r4 = memw(r19+##_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOT)
	}
	{
		r5:4 = memd(r4+#8)
	}
	{
		r1:0 = and(r5:4,r1:0)
	}
	{
		p0 = cmp.eq(r1:0,r3:2)
		if (p0.new) r0 = #1
		if (p0.new) jump:nt .LBB176_14
		if (p0.new) r17:16 = memd(r29+#40)
	}                                       // 8-byte Folded Reload
// %bb.8:                               // %if.then6.1
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOT)
	}
	{
		r3:2 = memd(r2+#24)
	}
	{
		r3:2 = and(r3:2,r1:0)
	}
	{
		p1 = cmp.eq(r3:2,r1:0)
		r0 = #0
	}
	{
		if (p1) r0 = #1
	}
	.falign
.LBB176_9:                              // %cleanup15
	{
		r17:16 = memd(r29+#40)
		r19:18 = memd(r29+#32)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB176_10:                             // %if.then
	{
		r18 = add(r29,#0)
	}
	{
		call ##_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
		r0 = r18
	}
	.falign
// %bb.11:                              // %if.then
	{
		r1 = r18
		r2 = #32
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOT)
	}
	{
		call ##memcpy
	}
	.falign
// %bb.12:                              // %if.then
	{
		r2 = memw(r19+##_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE@GOT)
	}
	{
		memb(r2+#0) = #1
	}
	{
		call ##halide_mutex_unlock
		r0 = memw(r19+##_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOT)
	}
	.falign
// %bb.13:                              // %if.then
	{
		p1 = cmp.eq(r17,#2); if (p1.new) jump:t .LBB176_5
	}
	{
		jump .LBB176_4
	}
	.falign
.LBB176_14:                             // %for.inc.1
	{
		r19:18 = memd(r29+#32)
		dealloc_return
	}                                       // 8-byte Folded Reload
.Lfunc_end176:
	.size	halide_default_can_use_target_features, .Lfunc_end176-halide_default_can_use_target_features
                                        // -- End function
	.section	.text.halide_set_custom_can_use_target_features,"ax",@progbits
	.weak	halide_set_custom_can_use_target_features // -- Begin function halide_set_custom_can_use_target_features
	.balign 32
	.type	halide_set_custom_can_use_target_features,@function
halide_set_custom_can_use_target_features: // @halide_set_custom_can_use_target_features
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r3 = memw(r2+##_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOT)
	}
	{
		r2 = memw(r3+#0)
		memw(r3+#0) = r0

	} :mem_noshuf
	{
		r0 = r2
		jumpr r31
	}
.Lfunc_end177:
	.size	halide_set_custom_can_use_target_features, .Lfunc_end177-halide_set_custom_can_use_target_features
                                        // -- End function
	.section	.text.halide_can_use_target_features,"ax",@progbits
	.weak	halide_can_use_target_features  // -- Begin function halide_can_use_target_features
	.balign 32
	.type	halide_can_use_target_features,@function
halide_can_use_target_features:         // @halide_can_use_target_features
// %bb.0:                               // %entry
	{
		r2 = add(pc,##_GLOBAL_OFFSET_TABLE_@PCREL)
	}
	{
		r2 = memw(r2+##_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOT)
	}
	{
		r7 = memw(r2+#0)
	}
	{
		jumpr r7
	}
.Lfunc_end178:
	.size	halide_can_use_target_features, .Lfunc_end178-halide_can_use_target_features
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv // -- Begin function _ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	.balign 32
	.type	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,@function
_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv: // @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
// %bb.0:                               // %entry
	{
		r3:2 = combine(#0,#0)
	}
	{
		memd(r0+#0) = r3:2
		memd(r0+#16) = r3:2
	}
	{
		jumpr r31
		memd(r0+#8) = r3:2
		memd(r0+#24) = r3:2
	}
.Lfunc_end179:
	.size	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv, .Lfunc_end179-_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
                                        // -- End function
	.section	.text.halide_use_jit_module,"ax",@progbits
	.weak	halide_use_jit_module           // -- Begin function halide_use_jit_module
	.balign 32
	.type	halide_use_jit_module,@function
halide_use_jit_module:                  // @halide_use_jit_module
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end180:
	.size	halide_use_jit_module, .Lfunc_end180-halide_use_jit_module
                                        // -- End function
	.section	.text.halide_release_jit_module,"ax",@progbits
	.weak	halide_release_jit_module       // -- Begin function halide_release_jit_module
	.balign 32
	.type	halide_release_jit_module,@function
halide_release_jit_module:              // @halide_release_jit_module
// %bb.0:                               // %entry
	{
		jumpr r31
	}
.Lfunc_end181:
	.size	halide_release_jit_module, .Lfunc_end181-halide_release_jit_module
                                        // -- End function
	.section	.text.conv3x3_halide,"ax",@progbits
	.globl	conv3x3_halide                  // -- Begin function conv3x3_halide
	.falign
	.type	conv3x3_halide,@function
conv3x3_halide:                         // @conv3x3_halide
// %bb.0:                               // %entry
	{
		p2 = cmp.eq(r2,#0)
		if (p2.new) r0 = #0
		memd(r29+#-16) = r17:16
		allocframe(r29,#416):raw
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#400) = r19:18
		memd(r29+#392) = r21:20
	}                                       // 8-byte Folded Spill
	{
		memd(r29+#384) = r23:22
		memd(r29+#376) = r25:24
	}                                       // 8-byte Folded Spill
	{
		if (p2) jump:nt .LBB182_35
		if (p2) r17:16 = memd(r29+#408)
		memd(r29+#368) = r27:26
	}                                       // 8-byte Folded Reload
// %bb.1:                               // %"assert succeeded"
	{
		p0 = cmp.eq(r1,#0); if (p0.new) jump:nt .LBB182_36
		r18 = r0
		r17 = r1
	}
// %bb.2:                               // %"assert succeeded2"
	{
		r1 = add(r18,#24)
		r16 = r2
		p1 = cmp.eq(r0,#0); if (p1.new) jump:nt .LBB182_37
	}
// %bb.3:                               // %"assert succeeded4"
	{
		r0 = add(r29,#356)
		r2 = #4
		r20 = memw(r18+#12)
	}
	{
		call ##memcpy
	}
	.falign
// %bb.4:                               // %"assert succeeded4"
	{
		r3 = memw(r18+#32)
		r2 = memw(r29+#356)
	}
	{
		r1:0 = memd(r18+#16)
		memw(r29+#112) = r2
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r18+#28)
		memw(r29+#152) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r1 = add(r17,#24)
		r0 = add(r29,#356)
		r21 = memw(r3+#0)
		memd(r29+#80) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r2 = #4
		r26 = memw(r3+#16)
		r4 = memw(r3+#8)
	}
	{
		r19 = memw(r3+#4)
		memw(r29+#144) = r4
	}                                       // 4-byte Folded Spill
	{
		r25 = memw(r3+#20)
		r3 = memw(r3+#24)
	}
	{
		r3 = memw(r17+#12)
		memw(r29+#128) = r3
	}                                       // 4-byte Folded Spill
	{
		call ##memcpy
		memw(r29+#104) = r3
	}                                       // 4-byte Folded Spill
	.falign
// %bb.5:                               // %"assert succeeded4"
	{
		r3 = memw(r17+#32)
		r2 = memw(r29+#356)
	}
	{
		r1:0 = memd(r17+#16)
		memw(r29+#60) = r2
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r17+#28)
		memw(r29+#56) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = #4
		r4 = memw(r3+#0)
		memw(r29+#136) = r4.new
	}                                       // 4-byte Folded Spill
	{
		r4 = memw(r3+#4)
		memw(r29+#120) = r4.new
	}                                       // 4-byte Folded Spill
	{
		r1 = add(r16,#24)
		r0 = add(r29,#356)
		r4 = memw(r3+#8)
		memd(r29+#72) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r4 = memw(r3+#16)
		memw(r29+#52) = r4
	}                                       // 4-byte Folded Spill
	{
		r4 = memw(r3+#20)
		memw(r29+#132) = r4
	}                                       // 4-byte Folded Spill
	{
		r3 = memw(r3+#24)
		memw(r29+#124) = r4
	}                                       // 4-byte Folded Spill
	{
		call ##memcpy
		r23 = memw(r16+#12)
		memw(r29+#96) = r3
	}                                       // 4-byte Folded Spill
	.falign
// %bb.6:                               // %"assert succeeded4"
	{
		r6 = add(r19,r21)
		r2 = memw(r29+#356)
		memw(r29+#48) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r16+#32)
		memw(r29+#44) = r6
	}                                       // 4-byte Folded Spill
	{
		r4 = memw(r16+#28)
		memw(r29+#36) = r4.new
	}                                       // 4-byte Folded Spill
	{
		r4 = r6
		r1:0 = memd(r16+#16)
		memw(r29+#140) = r19
	}                                       // 4-byte Folded Spill
	{
		r4 &= asr(r6,#31)
		r24 = memw(r2+#20)
		r3 = memw(r2+#4)
	}
	{
		r7 = memw(r2+#0)
		memw(r29+#100) = r3
	}                                       // 4-byte Folded Spill
	{
		r27 = asr(r24,#1)
		r5 = add(r3,#127)
		r4 = add(r4,#-1)
		memw(r29+#160) = r5.new
	}                                       // 4-byte Folded Spill
	{
		r3 = add(r27,r24)
		r5 = or(r5,#127)
		p0 = cmp.eq(r27,#0)
		memw(r29+#68) = r5.new
	}                                       // 4-byte Folded Spill
	{
		r5 = min(r5,r6)
		r4 = max(r4,r21)
		p2 = cmp.gt(r3,#0)
		r6 = add(r21,#1)
	}
	{
		r22 = mux(p2,#0,#-1)
		p3 = cmp.gt(r24,#-1)
		r8 = memw(r2+#8)
		memw(r29+#40) = r7
	}                                       // 4-byte Folded Spill
	{
		r5 = max(r5,r6)
		r19 = mux(p0,#-1,#0)
		r7 = sub(#-1,r22)
		memd(r29+#88) = r1:0
	}                                       // 8-byte Folded Spill
	{
		r1 = sub(r27,r19)
		r0 = add(r3,r7)
		memw(r29+#116) = r21
	}                                       // 4-byte Folded Spill
	{
		r21 = asr(r24,#31)
		r3 = memw(r2+#16)
		memw(r29+#24) = r8
	}                                       // 4-byte Folded Spill
	{
		r2 = memw(r2+#24)
		memw(r29+#172) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = sub(r5,r4)
		memw(r29+#12) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = p3
		memw(r29+#32) = r3
		memw(r29+#16) = r4
	}                                       // 4-byte Folded Spill
	{
		call ##__hexagon_divsi3
		memw(r29+#28) = r5
		memw(r29+#108) = r2
	}                                       // 4-byte Folded Spill
	.falign
// %bb.7:                               // %"assert succeeded4"
	{
		r2 = sub(#-1,r21)
		r5 = add(r24,#-2)
		r8 = add(r26,#1)
		r3 = memw(r29+#108)
	}                                       // 4-byte Folded Reload
	{
		r5 = asr(r5,#5)
		r2 = sub(r2,r21)
		r12 = memw(r18+#12)
	}
	{
		p1 = r3
		r2 = and(r2,r22)
	}
	{
		r4 = add(r2,r0)
		r2 = #-1
	}
	{
		r4 &= xor(r19,r2)
	}
	{
		r2 = add(r4,#-1)
	}
	{
		r2 = mpyi(r2,r27)
		r27 = sub(r24,r27)
	}
	{
		r3 = mux(p1,r2,#0)
		r2 = and(r21,r2)
		r21 = r25
		r25 = r26
	}
	{
		r3 = min(r3,r27)
		p1 = cmp.eq(r12,#0)
		if (p1.new) r1:0 = memd(r18+#0)
	}
	{
		r22 = addasl(r3,r5,#4)
		r5 = min(r2,r27)
		r2 = add(r21,r26)
	}
	{
		r7 = min(r5,r2)
		r6 = add(r22,#17)
	}
	{
		r6 = min(r6,r2)
	}
	{
		r9 = add(r7,#-1)
	}
	{
		r7 = max(r6,r8)
		r6 = max(r9,r26)
	}
	{
		r9 = sub(r7,r6)
		if (!p1) jump:nt .LBB182_12
	}
// %bb.8:                               // %_halide_buffer_is_bounds_query.exit
	{
		r3 = memw(r29+#16)
		if (cmp.eq(r3.new,#0)) jump:t .LBB182_10
	}                                       // 4-byte Folded Reload
// %bb.9:                               // %_halide_buffer_is_bounds_query.exit
	{
		r13:12 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r13:12)
		if (p0.new) r0 = #0
		if (p0.new) jump:nt .LBB182_44
		if (p0.new) r2 = memw(r29+#12)
	}                                       // 4-byte Folded Reload
	.falign
.LBB182_10:                             // %_halide_buffer_is_bounds_query.exit119
	{
		p2 = cmp.eq(r6,#0)
		if (p2.new) jump:t .LBB182_12
	}
// %bb.11:                              // %_halide_buffer_is_bounds_query.exit119
	{
		r13:12 = combine(#0,#0)
	}
	{
		p0 = cmp.eq(r1:0,r13:12)
		if (p0.new) r4 = add(r9,#-1)
		if (p0.new) r5 = add(r6,#0)
		if (p0.new) jump:nt .LBB182_46
	}
	.falign
.LBB182_12:                             // %"assert succeeded8"
	{
		r8 = memw(r16+#12)
		memw(r29+#64) = r4
	}                                       // 4-byte Folded Spill
	{
		p2 = cmp.eq(r8,#0)
		r8 = sub(r22,r5)
		if (!p2.new) jump:t .LBB182_15
	}
// %bb.13:                              // %_halide_buffer_is_bounds_query.exit125
	{
		p0 = cmp.eq(r5,#0); if (p0.new) jump:t .LBB182_15
		if (!p0.new) r1:0 = memd(r16+#0)
	}
// %bb.14:                              // %_halide_buffer_is_bounds_query.exit125
	{
		r13:12 = combine(#0,#0)
	}
	{
		p2 = cmp.eq(r1:0,r13:12)
		if (p2.new) r4 = add(r8,#15)
		if (p2.new) jump:nt .LBB182_48
	}
	.falign
.LBB182_15:                             // %"assert succeeded10"
	{
		r11 = r20
		r10 = memw(r29+#116)
		r4 = memw(r29+#140)
	}                                       // 4-byte Folded Reload
	{
		r19 = memw(r29+#112)
		r28 = memw(r29+#128)
	}                                       // 4-byte Folded Reload
	{
		if (!p1) jump:nt .LBB182_18
		r14 = memw(r29+#152)
		r15 = memw(r29+#144)
	}                                       // 4-byte Folded Reload
// %bb.16:                              // %_halide_buffer_is_bounds_query.exit131
	{
		r1:0 = combine(#0,#0)
		r13:12 = memd(r18+#0)
	}
	{
		p1 = cmp.eq(r13:12,r1:0)
		if (p1.new) r15 = #2
		if (!p1.new) jump:t .LBB182_18
		if (p1.new) r12 = memw(r18+#32)
	}
// %bb.17:                              // %_halide_buffer_init.exit
	{
		r14 = ##67585
		memw(r29+#176) = #0
		memw(r29+#184) = #1
	}
	{
		r20 = memw(r29+#12)
		memd(r18+#24) = r15:14
	}                                       // 4-byte Folded Reload
	{
		memd(r18+#0) = r1:0
		memd(r18+#8) = r1:0
	}
	{
		r13 = and(r20,#-128)
		memw(r29+#200) = r13.new
	}
	{
		memw(r12+#4) = r20
		memw(r12+#12) = #0
	}
	{
		memw(r12+#8) = #1
		memw(r12+#0) = #0
	}
	{
		r12 = memw(r18+#32)
		memw(r29+#180) = r20
	}
	{
		r15 = memw(r29+#144)
		memw(r29+#188) = #0
	}                                       // 4-byte Folded Reload
	{
		r14 = memw(r29+#152)
		memw(r29+#192) = #0
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#196) = r9
		memw(r29+#204) = #0
	}
	{
		memw(r12+#20) = r9
		memw(r12+#28) = #0
	}
	{
		memw(r12+#16) = #0
		memw(r12+#24) = r13
	}
	{
		memd(r18+#16) = r1:0
	}
	.falign
.LBB182_18:                             // %after_bb
	{
		r20 = r23
		r9 = memw(r17+#12)
		r3 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r23 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.eq(r9,#0)
		if (!p0.new) jump:t .LBB182_21
		if (p0.new) r13:12 = memd(r17+#0)
	}
// %bb.19:                              // %_halide_buffer_is_bounds_query.exit137
	{
		r1:0 = combine(#0,#0)
	}
	{
		p2 = cmp.eq(r13:12,r1:0)
		if (p2.new) r13 = #2
		if (!p2.new) jump:t .LBB182_21
		if (p2.new) r9 = memw(r17+#32)
	}
// %bb.20:                              // %_halide_buffer_init.exit167
	{
		r12 = ##67585
		memd(r17+#0) = r1:0
		memd(r17+#8) = r1:0
	}
	{
		memd(r17+#24) = r13:12
		memw(r29+#208) = #0
	}
	{
		memw(r29+#212) = #3
		memw(r9+#12) = #0
	}
	{
		memw(r9+#8) = #1
		memw(r9+#4) = #3
	}
	{
		memw(r9+#0) = #0
		r9 = memw(r17+#32)

	} :mem_noshuf
	{
		memw(r29+#216) = #1
		memw(r29+#220) = #0
	}
	{
		memw(r29+#224) = #0
		memw(r29+#228) = #3
	}
	{
		memw(r29+#232) = #3
		memw(r29+#236) = #0
	}
	{
		memw(r9+#28) = #0
		memw(r9+#24) = #3
	}
	{
		memw(r9+#20) = #3
		memw(r9+#16) = #0
	}
	{
		memd(r17+#16) = r1:0
	}
	.falign
.LBB182_21:                             // %after_bb11
	{
		p0 = and(p0,!p0)
		r9 = memw(r16+#12)
		r26 = memw(r29+#124)
	}                                       // 4-byte Folded Reload
	{
		p1 = or(p0,p0)
	}
	{
		p2 = cmp.eq(r9,#0)
		r9 = memw(r29+#160)
	}                                       // 4-byte Folded Reload
	{
		r9 = and(r9,#-128)
		if (!p2) jump:nt .LBB182_25
		memw(r29+#108) = r9.new
	}                                       // 4-byte Folded Spill
// %bb.22:                              // %_halide_buffer_is_bounds_query.exit146
	{
		r1:0 = combine(#0,#0)
		r13:12 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r13:12,r1:0)
		if (p1.new) r13 = #2
		if (p1.new) jump:nt .LBB182_24
		if (p1.new) r9 = memw(r16+#32)
	}
	.falign
.LBB182_23:                             // %land.rhs.i172
	{
		r9:8 = memd(r16+#0)
	}
	{
		p1 = cmp.eq(r9:8,r1:0)
		jump .LBB182_25
	}
	.falign
.LBB182_24:                             // %after_bb14
	{
		p1 = or(p0,p0)
		r12 = ##67585
		memd(r16+#8) = r1:0
	}
	{
		memd(r16+#24) = r13:12
		memw(r29+#240) = #0
	}
	{
		r8 = add(r8,#16)
		r13 = add(r29,#256)
		r12 = memw(r29+#108)
		memd(r16+#0) = r1:0
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#260) = r8
		memw(r9+#4) = r12
	}
	{
		memw(r9+#12) = #0
		memw(r9+#8) = #1
	}
	{
		memw(r9+#0) = #0
		r9 = memw(r16+#32)

	} :mem_noshuf
	{
		memw(r29+#244) = r12
		memw(r29+#248) = #1
	}
	{
		memw(r29+#252) = #0
		memw(r13+#0) = #0
	}
	{
		memw(r9+#20) = r8
		memw(r9+#24) = r12
	}
	{
		r8 = add(r29,#268)
		memw(r9+#28) = #0
		memw(r29+#264) = r12
	}
	{
		memw(r9+#16) = #0
		r9 = memw(r16+#12)

	} :mem_noshuf
	{
		memw(r8+#0) = #0
		memd(r16+#16) = r1:0
	}
	{
		p2 = cmp.eq(r9,#0)
		if (p2.new) jump:nt .LBB182_23
	}
	.falign
.LBB182_25:                             // %_halide_buffer_is_bounds_query.exit173
	{
		p2 = or(p0,p0)
		r8 = memw(r18+#12)
		if (cmp.eq(r8.new,#0)) jump:nt .LBB182_28
	}
// %bb.26:                              // %_halide_buffer_is_bounds_query.exit179
	{
		r8 = memw(r17+#12)
		if (cmp.eq(r8.new,#0)) jump:nt .LBB182_29
	}
	.falign
.LBB182_27:                             // %_halide_buffer_is_bounds_query.exit185
	{
		p0 = or(p1,or(p2,p0))
		r0 = #0
		if (p0.new) jump:t .LBB182_34
	}
	{
		jump .LBB182_30
	}
	.falign
.LBB182_28:                             // %land.rhs.i178
	{
		r9:8 = combine(#0,#0)
		r1:0 = memd(r18+#0)
	}
	{
		p2 = cmp.eq(r1:0,r9:8)
		r8 = memw(r17+#12)
		if (!cmp.eq(r8.new,#0)) jump:t .LBB182_27
	}
	.falign
.LBB182_29:                             // %land.rhs.i184
	{
		r9:8 = combine(#0,#0)
		r1:0 = memd(r17+#0)
	}
	{
		p0 = cmp.eq(r1:0,r9:8)
		r0 = #0
	}
	{
		p0 = or(p1,or(p2,p0))
		if (p0.new) jump:t .LBB182_34
	}
	.falign
.LBB182_30:                             // %then_bb18
	{
		r9 = ##67585
		p2 = cmp.eq(r14,#2)
		r8 = #0
	}
	{
		p3 = cmp.eq(r15,#1)
		r14 = r4
		p1 = cmp.eq(r19,r9)
		p0 = cmp.eq(r25,#0)
	}
	{
		r14 = and(#128,lsr(r14,#24))
		r12 = mux(p1,#2,#3)
		memw(r29+#8) = r6
		memw(r29+#20) = r20
	}                                       // 4-byte Folded Spill
	{
		r6 = #127
		r0 = #1024
		r19 = memw(r29+#132)
	}                                       // 4-byte Folded Reload
	{
		p2 = bitsclr(r28,r6)
		r13 = mux(p2,r8,r12)
		if (p2) r12 = #1
		memw(r29+#12) = r27
	}                                       // 4-byte Folded Spill
	{
		if (!p1) r13 = add(r12,#0)
		p1 = cmp.eq(r10,#0)
		r10 = memw(r29+#136)
	}                                       // 4-byte Folded Reload
	{
		r12 = setbit(r13,#19)
	}
	{
		if (!p1) r13 = add(r12,#0)
	}
	{
		r12 = or(r13,r14)
		r14 = r21
		r15 = memw(r29+#56)
	}                                       // 4-byte Folded Reload
	{
		r14 = and(##512,lsr(r14,#22))
		r13 = setbit(r12,#18)
		p1 = cmp.eq(r15,#2)
	}
	{
		if (p3) r13 = add(r12,#0)
	}
	{
		r12 = setbit(r13,#21)
	}
	{
		if (!p0) r13 = add(r12,#0)
	}
	{
		r12 = or(r13,r14)
	}
	{
		r14 = setbit(r12,#20)
	}
	{
		r15 = r23
		if (p2) r14 = add(r12,#0)
		r12 = memw(r29+#60)
	}                                       // 4-byte Folded Reload
	{
		r13 = setbit(r14,#2)
	}
	{
		p0 = cmp.eq(r12,r9)
		r12 = add(r23,r10)
	}
	{
		p3 = cmp.gt(r12,#2)
		if (!p0) r14 = add(r13,#0)
		p0 = cmp.gt(r10,#0)
	}
	{
		r15 = and(##2048,lsr(r15,#20))
		r13 = setbit(r14,#3)
	}
	{
		r1 = mux(p3,r8,r0)
		if (!p1) r14 = add(r13,#0)
		r13 = add(r26,r19)
		r10 = #4096
	}
	{
		if (p0) r1 = add(r0,#0)
		r14 = or(r14,r15)
		r15 = r26
		r0 = memw(r29+#52)
	}                                       // 4-byte Folded Reload
	{
		r15 = and(##8192,lsr(r15,#18))
		p2 = cmp.gt(r13,#2)
		p3 = cmp.gt(r19,#0)
	}
	{
		r0 = setbit(r14,#22)
		p1 = cmp.eq(r0,#1)
		r6 = memw(r29+#160)
		r27 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	{
		if (p1) r0 = add(r14,#0)
		r14 = mux(p2,r8,r10)
		r19 = memw(r29+#32)
	}                                       // 4-byte Folded Reload
	{
		r0 = or(r0,r1)
		if (p3) r14 = add(r10,#0)
	}
	{
		r1 = and(r6,#127)
		r15 = or(r0,r15)
		r10 = memw(r29+#40)
	}                                       // 4-byte Folded Reload
	{
		r0 = r27
		r14 = or(r15,r14)
		r6 = memw(r29+#24)
		r15 = memw(r29+#48)
	}                                       // 4-byte Folded Reload
	{
		p1 = cmp.eq(r10,#0)
	}
	{
		r15 = setbit(r14,#4)
		p0 = cmp.eq(r15,r9)
		r9 = add(r9,#-2049)
	}
	{
		if (p0) r15 = add(r14,#0)
		p0 = cmp.eq(r6,#1)
		r14 = memw(r29+#36)
	}                                       // 4-byte Folded Reload
	{
		r14 = setbit(r15,#5)
		p2 = cmp.eq(r14,#2)
	}
	{
		r6 = #127
		if (!p2) r15 = add(r14,#0)
		p2 = cmp.gt(r10,#0)
	}
	{
		r0 = and(##32768,lsr(r0,#16))
		r14 = setbit(r15,#24)
	}
	{
		if (!p1) r15 = add(r14,#0)
		r14 = add(r1,r10)
		r10 = r24
		p1 = cmp.eq(r19,#0)
	}
	{
		r15 = or(r15,r0)
		p3 = cmp.gt(r14,#126)
	}
	{
		r0 = setbit(r15,#23)
		r14 = #16384
	}
	{
		r10 = and(##131072,lsr(r10,#14))
		r1 = mux(p3,r8,r14)
		if (p0) r0 = add(r15,#0)
	}
	{
		p3 = bitsclr(r3,r6)
		r15 = setbit(r0,#26)
		if (p2) r1 = add(r14,#0)
		r6 = memw(r29+#28)
	}                                       // 4-byte Folded Reload
	{
		if (!p1) r0 = add(r15,#0)
		r15 = add(r24,r19)
		p1 = cmp.gt(r19,r5)
	}
	{
		r0 = or(r0,r1)
		r1 = add(r22,#16)
	}
	{
		r0 = or(r0,r10)
		p0 = cmp.gt(r1,r15)
	}
	{
		r1 = setbit(r0,#25)
	}
	{
		if (p3) r1 = add(r0,#0)
		r10 = mux(p0,r9,r8)
		p3 = cmp.gt(r7,r2)
		r0 = memw(r29+#44)
	}                                       // 4-byte Folded Reload
	{
		if (p1) r10 = add(r9,#0)
	}
	{
		r0 = setbit(r1,#6)
		p2 = cmp.gt(r6,r0)
	}
	{
		if (!p2) r0 = add(r1,#0)
		r1 = ##-2147483648
	}
	{
		r9 = or(r0,r10)
	}
	{
		r0 = setbit(r9,#8)
	}
	{
		if (!p3) r0 = add(r9,#0)
	}
	{
		r9 = ct0(r1:0)
		if (!cmp.gtu(r9.new,#26)) jump:nt ##.LBB182_38
	}
// %bb.31:                              // %no_errors_bb
	{
		p2 = cmp.eq(r11,#0)
		r12 = #512
		r13 = #0
		r22 = #127
	}
	{
		r3:2 = sxtw(r4)
		p1 = bitsclr(r11,r22)
		if (!p2) r14 = add(r8,#0)
		r9:8 = memd(r29+#80)
	}                                       // 8-byte Folded Reload
	{
		r25 = r21
		r5 = and(r28,#-128)
		r6 = ##2147483647
	}
	{
		r13:12 &= asl(r9:8,#8)
		r9:8 = abs(r3:2)
		r7 = #0
		r10 = memw(r29+#104)
	}                                       // 4-byte Folded Reload
	{
		r21:20 = mpy(r21,r4)
		r13 = setbit(r14,#12)
		r19 = r4
		r4 = r26
	}
	{
		r9:8 = mpy(r5,r25)
		p3 = cmp.gtu(r9:8,r7:6)
		if (!p1) r14 = add(r13,#0)
		memd(r29+#152) = r9:8
	}                                       // 8-byte Folded Spill
	{
		p0 = cmp.gt(r21:20,r7:6)
		r2 = or(r14,r12)
		p2 = cmp.eq(r10,#0)
		memd(r29+#160) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r13:12 = abs(r9:8)
		r3 = setbit(r2,#0)
		r20 = #1024
		r21 = #0
	}
	{
		r9:8 = mpy(r26,r23)
		r15:14 = sxtw(r23)
		if (!p3) r3 = add(r2,#0)
		r26 = memw(r29+#96)
	}                                       // 4-byte Folded Reload
	{
		r2 = setbit(r3,#2)
		p1 = cmp.gtu(r13:12,r7:6)
		r13:12 = memd(r29+#72)
		memd(r29+#144) = r13:12
	}                                       // 8-byte Folded Reload
	{
		r15:14 = abs(r15:14)
		p0 = cmp.gt(r9:8,r7:6)
		if (!p0) r2 = add(r3,#0)
		r5 = #0
	}
	{
		r21:20 &= asl(r13:12,#9)
		r3 = setbit(r2,#15)
		r13:12 = memd(r29+#88)
	}                                       // 8-byte Folded Reload
	{
		p3 = cmp.gtu(r15:14,r7:6)
		if (!p2) r3 = add(r2,#0)
	}
	{
		r2 = setbit(r3,#1)
	}
	{
		if (!p1) r2 = add(r3,#0)
	}
	{
		r21:20 = mpy(r26,r4)
		r2 = or(r2,r20)
		r4 = memw(r29+#20)
	}                                       // 4-byte Folded Reload
	{
		r3 = setbit(r2,#3)
	}
	{
		p1 = bitsclr(r4,r22)
		if (!p3) r3 = add(r2,#0)
		p2 = cmp.eq(r4,#0)
		r4 = #2048
	}
	{
		r21:20 = abs(r21:20)
		r2 = setbit(r3,#5)
	}
	{
		r5:4 &= asl(r13:12,#10)
		r23:22 = sxtw(r27)
		if (!p0) r2 = add(r3,#0)
	}
	{
		r3 = setbit(r2,#16)
		p3 = cmp.gtu(r21:20,r7:6)
	}
	{
		r13:12 = abs(r23:22)
		r23:22 = mpy(r24,r27)
		if (!p2) r3 = add(r2,#0)
	}
	{
		r2 = setbit(r3,#13)
	}
	{
		p0 = cmp.gtu(r13:12,r7:6)
		p2 = cmp.gt(r23:22,r7:6)
		if (!p1) r3 = add(r2,#0)
		r2 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r5 = setbit(r3,#4)
	}
	{
		if (!p3) r5 = add(r3,#0)
		r2 = and(r2,#-128)
	}
	{
		r4 = or(r5,r4)
	}
	{
		r3:2 = mpy(r2,r24)
		r5 = setbit(r4,#6)
	}
	{
		if (!p0) r5 = add(r4,#0)
	}
	{
		r3:2 = abs(r3:2)
		r4 = setbit(r5,#8)
	}
	{
		if (!p2) r4 = add(r5,#0)
	}
	{
		p1 = cmp.gtu(r3:2,r7:6)
		r5 = setbit(r4,#7)
	}
	{
		r0 = mux(p1,r5,r4)
	}
	{
		r5 = ct0(r1:0)
		if (!cmp.gtu(r5.new,#16)) jump:nt .LBB182_41
	}
// %bb.32:                              // %no_errors_bb46
	{
		r6 = add(r27,#254)
		r5 = add(r27,#-1)
		r2 = memw(r29+#68)
		r7 = memw(r29+#136)
	}                                       // 4-byte Folded Reload
	{
		r6 = min(r6,r19)
		r4 = #1
		r3 = memw(r29+#64)
		memw(r29+#288) = r7
	}                                       // 4-byte Folded Reload
	{
		r2 = min(r2,r19)
		r5 = and(r5,#-128)
		r7 = memw(r29+#132)
		memw(r29+#292) = r7.new
	}                                       // 4-byte Folded Reload
	{
		r5 = setbit(r5,#1)
		r0 = #0
		r7 = memw(r29+#172)
		memw(r29+#308) = r7.new
	}                                       // 4-byte Folded Reload
	{
		r1 = add(pc,##conv3x3_halide.par_for.output.s0.y.yo@PCREL)
		r7 = memw(r29+#12)
		memw(r29+#328) = r2
	}                                       // 4-byte Folded Reload
	{
		r2 = max(r2,r4)
		r4 = add(r29,#272)
		r6 = memw(r29+#108)
		memw(r29+#324) = r6
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.gt(r2,r19)
		r2 = #0
		memw(r29+#272) = r11
		memw(r29+#276) = r19
	}
	{
		r5 = max(r6,r5)
		r6 = memw(r29+#20)
		memw(r29+#320) = r5.new
	}                                       // 4-byte Folded Reload
	{
		r5 = mux(p0,#0,#1)
		memw(r29+#280) = r25
		memw(r29+#284) = r28
	}
	{
		memw(r29+#296) = r26
		memw(r29+#300) = r27
	}
	{
		memw(r29+#304) = r24
		memw(r29+#312) = r7
	}
	{
		memw(r29+#332) = r11
		memw(r29+#336) = r18
	}
	{
		memw(r29+#340) = r10
		memw(r29+#344) = r17
	}
	{
		memw(r29+#348) = r6
		memw(r29+#352) = r16
	}
	{
		call ##halide_do_par_for
		memb(r29+#316) = r5
	}
	.falign
// %bb.33:                              // %no_errors_bb46
	{
		p2 = cmp.eq(r0,#0)
		if (p2.new) r0 = #0
	}
	.falign
.LBB182_34:                             // %destructor_block
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB182_35:                             // %"assert failed"
	{
		r1 = add(pc,##.Lstr@PCREL)
		r19:18 = memd(r29+#400)
		r21:20 = memd(r29+#392)
	}                                       // 8-byte Folded Reload
	{
		r23:22 = memd(r29+#384)
		r25:24 = memd(r29+#376)
	}                                       // 8-byte Folded Reload
	{
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_buffer_argument_is_null
		r31:30 = deallocframe(r30):raw
	}
	.falign
.LBB182_36:                             // %"assert failed1"
	{
		r1 = add(pc,##.Lstr.107@PCREL)
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r0 = #0
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_buffer_argument_is_null
		r31:30 = deallocframe(r30):raw
	}
	.falign
.LBB182_37:                             // %"assert failed3"
	{
		r1 = add(pc,##.Lstr.108@PCREL)
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r0 = #0
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		jump ##halide_error_buffer_argument_is_null
		r31:30 = deallocframe(r30):raw
	}
	.falign
.LBB182_38:                             // %then_bb18
	{
		r4 = add(pc,##.LJTI182_0@PCREL)
		r14 = r25
	}
	{
		r8 = memw(r4+r9<<#2)
	}
	{
		r4 = add(r8,r4)
	}
	{
		jumpr r4
	}
.LBB182_39:                             // %assert_failed
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r0 = #0
		r2 = memw(r29+#112)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_bad_type
		r3 = ##67585
	}
	.falign
// %bb.40:                              // %assert_failed
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB182_41:                             // %no_errors_bb
	{
		r4 = add(pc,##.LJTI182_1@PCREL)
		r17:16 = memd(r29+#144)
		r11:10 = memd(r29+#152)
	}                                       // 8-byte Folded Reload
	{
		r7:6 = memd(r29+#160)
	}                                       // 8-byte Folded Reload
	{
		r5 = memw(r4+r5<<#2)
	}
	{
		r4 = add(r5,r4)
	}
	{
		jumpr r4
	}
.LBB182_42:                             // %assert_failed47
	{
		r1 = add(pc,##.Lstr.108@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r11,r10)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_allocation_too_large
	}
	.falign
// %bb.43:                              // %assert_failed47
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB182_44:                             // %"assert failed5"
	{
		r1 = add(pc,##.Lstr.109@PCREL)
	}
	{
		r4 = add(r2,#-1)
		r5 = memw(r29+#16)
		r2 = memw(r29+#28)
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r2,#-1)
		memw(r29+#0) = r2.new
	}
	{
		call ##halide_error_constraints_make_required_region_smaller
		r3:2 = combine(#0,#0)
	}
	.falign
// %bb.45:                              // %"assert failed5"
	{
		jump .LBB182_34
	}
	.falign
.LBB182_46:                             // %"assert failed7"
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r2 = add(r7,#-1)
		memw(r29+#0) = r2.new
	}
	{
		r0 = #0
		r3:2 = combine(#0,#1)
	}
	{
		call ##halide_error_constraints_make_required_region_smaller
	}
	.falign
// %bb.47:                              // %"assert failed7"
	{
		jump .LBB182_34
	}
	.falign
.LBB182_48:                             // %"assert failed9"
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r2 = add(r22,#15)
		memw(r29+#0) = r2.new
	}
	{
		r0 = #0
		r3:2 = combine(#0,#1)
	}
	{
		call ##halide_error_constraints_make_required_region_smaller
	}
	.falign
// %bb.49:                              // %"assert failed9"
	{
		jump .LBB182_34
	}
.LBB182_50:                             // %assert_failed48
	{
		r1 = add(pc,##.Lstr.108@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r17,r16)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_allocation_too_large
	}
	.falign
// %bb.51:                              // %assert_failed48
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_52:                             // %assert_failed49
	{
		r1 = add(pc,##.Lstr.108@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r7,r6)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_extents_too_large
	}
	.falign
// %bb.53:                              // %assert_failed49
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_54:                             // %assert_failed50
	{
		r1 = add(pc,##.Lstr.107@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r15,r14)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_allocation_too_large
	}
	.falign
// %bb.55:                              // %assert_failed50
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_56:                             // %assert_failed51
	{
		r1 = add(pc,##.Lstr.107@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r21,r20)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_allocation_too_large
	}
	.falign
// %bb.57:                              // %assert_failed51
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_58:                             // %assert_failed52
	{
		r1 = add(pc,##.Lstr.107@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r9,r8)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_extents_too_large
	}
	.falign
// %bb.59:                              // %assert_failed52
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_60:                             // %assert_failed53
	{
		r1 = add(pc,##.Lstr@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r13,r12)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_allocation_too_large
	}
	.falign
// %bb.61:                              // %assert_failed53
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_62:                             // %assert_failed54
	{
		r1 = add(pc,##.Lstr@PCREL)
		r4 = ##2147483647
	}
	{
		call ##halide_error_buffer_allocation_too_large
		r5 = #0
		r0 = #0
	}
	.falign
// %bb.63:                              // %assert_failed54
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_64:                             // %assert_failed55
	{
		r1 = add(pc,##.Lstr@PCREL)
		r4 = ##2147483647
	}
	{
		r3:2 = combine(r23,r22)
		r5 = #0
		r0 = #0
	}
	{
		call ##halide_error_buffer_extents_too_large
	}
	.falign
// %bb.65:                              // %assert_failed55
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_66:                             // %assert_failed56
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r0 = #0
	}
	{
		call ##halide_error_device_dirty_with_no_device_support
	}
	.falign
// %bb.67:                              // %assert_failed56
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_68:                             // %assert_failed57
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r0 = #0
	}
	{
		call ##halide_error_device_dirty_with_no_device_support
	}
	.falign
// %bb.69:                              // %assert_failed57
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_70:                             // %assert_failed58
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r0 = #0
	}
	{
		call ##halide_error_device_dirty_with_no_device_support
	}
	.falign
// %bb.71:                              // %assert_failed58
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_72:                             // %assert_failed59
	{
		r1 = add(pc,##.Lstr.108@PCREL)
		r0 = #0
		r2 = #128
	}
	{
		call ##halide_error_unaligned_host_ptr
	}
	.falign
// %bb.73:                              // %assert_failed59
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_74:                             // %assert_failed60
	{
		r1 = add(pc,##.Lstr@PCREL)
		r0 = #0
		r2 = #128
	}
	{
		call ##halide_error_unaligned_host_ptr
	}
	.falign
// %bb.75:                              // %assert_failed60
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_76:                             // %assert_failed61
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r0 = #0
	}
	{
		call ##halide_error_host_is_null
	}
	.falign
// %bb.77:                              // %assert_failed61
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_78:                             // %assert_failed62
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r0 = #0
	}
	{
		call ##halide_error_host_is_null
	}
	.falign
// %bb.79:                              // %assert_failed62
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_80:                             // %assert_failed63
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r0 = #0
	}
	{
		call ##halide_error_host_is_null
	}
	.falign
// %bb.81:                              // %assert_failed63
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_82:                             // %assert_failed20
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r0 = #0
		r2 = memw(r29+#152)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_bad_dimensions
		r3 = #2
	}
	.falign
// %bb.83:                              // %assert_failed20
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_84:                             // %assert_failed21
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r0 = #0
		r2 = memw(r29+#60)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_bad_type
		r3 = ##67585
	}
	.falign
// %bb.85:                              // %assert_failed21
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_86:                             // %assert_failed22
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r0 = #0
		r2 = memw(r29+#56)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_bad_dimensions
		r3 = #2
	}
	.falign
// %bb.87:                              // %assert_failed22
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_88:                             // %assert_failed23
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r0 = #0
		r2 = memw(r29+#48)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_bad_type
		r3 = ##67585
	}
	.falign
// %bb.89:                              // %assert_failed23
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_90:                             // %assert_failed24
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r0 = #0
		r2 = memw(r29+#36)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_bad_dimensions
		r3 = #2
	}
	.falign
// %bb.91:                              // %assert_failed24
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_92:                             // %assert_failed25
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r2 = memw(r29+#28)
		r3 = memw(r29+#16)
	}                                       // 4-byte Folded Reload
	{
		r0 = #0
		r5 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r4 = add(r2,#-1)
		r2 = memw(r29+#44)
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r2,#-1)
		memw(r29+#0) = r2.new
	}
	{
		call ##halide_error_access_out_of_bounds
		r2 = #0
	}
	.falign
// %bb.93:                              // %assert_failed25
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_94:                             // %assert_failed26
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r0 = #0
		r2 = #0
	}
	{
		call ##halide_error_buffer_extents_negative
		r3 = memw(r29+#140)
	}                                       // 4-byte Folded Reload
	.falign
// %bb.95:                              // %assert_failed26
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_96:                             // %assert_failed27
	{
		r2 = add(r2,#-1)
		r4 = add(r7,#-1)
		r5 = r14
		memw(r29+#0) = r2.new
	}
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r0 = #0
		r2 = #1
	}
	{
		call ##halide_error_access_out_of_bounds
		r3 = memw(r29+#8)
	}                                       // 4-byte Folded Reload
	.falign
// %bb.97:                              // %assert_failed27
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_98:                             // %assert_failed28
	{
		r1 = add(pc,##.Lstr.109@PCREL)
		r3:2 = combine(r21,#1)
		r0 = #0
	}
	{
		call ##halide_error_buffer_extents_negative
	}
	.falign
// %bb.99:                              // %assert_failed28
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_100:                            // %assert_failed29
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r2 = add(r12,#-1)
		memw(r29+#0) = r2.new
	}
	{
		r0 = #0
		r3:2 = combine(#0,#0)
		r4 = #2
		r5 = memw(r29+#136)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_access_out_of_bounds
	}
	.falign
// %bb.101:                             // %assert_failed29
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_102:                            // %assert_failed30
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r0 = #0
		r2 = #0
	}
	{
		call ##halide_error_buffer_extents_negative
		r3 = memw(r29+#120)
	}                                       // 4-byte Folded Reload
	.falign
// %bb.103:                             // %assert_failed30
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_104:                            // %assert_failed31
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r2 = add(r13,#-1)
		memw(r29+#0) = r2.new
	}
	{
		r0 = #0
		r3:2 = combine(#0,#1)
		r4 = #2
		r5 = memw(r29+#132)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_access_out_of_bounds
	}
	.falign
// %bb.105:                             // %assert_failed31
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_106:                            // %assert_failed32
	{
		r1 = add(pc,##.Lstr.111@PCREL)
		r0 = #0
		r2 = #1
	}
	{
		call ##halide_error_buffer_extents_negative
		r3 = memw(r29+#124)
	}                                       // 4-byte Folded Reload
	.falign
// %bb.107:                             // %assert_failed32
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_108:                            // %assert_failed33
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r2 = memw(r29+#100)
		r5 = memw(r29+#40)
	}                                       // 4-byte Folded Reload
	{
		r0 = #0
	}
	{
		r4 = add(r2,#-1)
	}
	{
		r3 = add(r4,r5)
		r4 = or(r4,#127)
		memw(r29+#0) = r3.new
	}
	{
		call ##halide_error_access_out_of_bounds
		r3:2 = combine(#0,#0)
	}
	.falign
// %bb.109:                             // %assert_failed33
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_110:                            // %assert_failed34
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r0 = #0
		r2 = #0
	}
	{
		call ##halide_error_buffer_extents_negative
		r3 = memw(r29+#100)
	}                                       // 4-byte Folded Reload
	.falign
// %bb.111:                             // %assert_failed34
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_112:                            // %assert_failed35
	{
		r2 = add(r15,#-1)
		r4 = add(r22,#15)
		r0 = #0
		memw(r29+#0) = r2.new
	}
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r3:2 = combine(r5,#1)
	}
	{
		call ##halide_error_access_out_of_bounds
		r5 = memw(r29+#32)
	}                                       // 4-byte Folded Reload
	.falign
// %bb.113:                             // %assert_failed35
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_114:                            // %assert_failed36
	{
		r1 = add(pc,##.Lstr.110@PCREL)
		r0 = #0
		r3:2 = combine(r24,#1)
	}
	{
		call ##halide_error_buffer_extents_negative
	}
	.falign
// %bb.115:                             // %assert_failed36
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_116:                            // %assert_failed37
	{
		r1 = add(pc,##.Lstr.112@PCREL)
		r0 = #0
		r2 = memw(r29+#144)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.113@PCREL)
		r4 = #1
	}
	{
		call ##halide_error_constraint_violated
	}
	.falign
// %bb.117:                             // %assert_failed37
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_118:                            // %assert_failed38
	{
		r1 = add(pc,##.Lstr.114@PCREL)
		r0 = #0
		r2 = memw(r29+#116)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.115@PCREL)
		r4 = #0
	}
	{
		call ##halide_error_constraint_violated
	}
	.falign
// %bb.119:                             // %assert_failed38
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_120:                            // %assert_failed39
	{
		r1 = add(pc,##.Lstr.116@PCREL)
		r0 = #0
		r2 = memw(r29+#128)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.117@PCREL)
	}
	{
		call ##halide_error_constraint_violated
		r4 = and(r2,#-128)
	}
	.falign
// %bb.121:                             // %assert_failed39
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_122:                            // %assert_failed40
	{
		r1 = add(pc,##.Lstr.118@PCREL)
		r0 = #0
		r2 = r14
	}
	{
		r3 = add(pc,##.Lstr.115@PCREL)
		r4 = #0
	}
	{
		call ##halide_error_constraint_violated
	}
	.falign
// %bb.123:                             // %assert_failed40
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_124:                            // %assert_failed41
	{
		r1 = add(pc,##.Lstr.119@PCREL)
		r0 = #0
		r2 = memw(r29+#52)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.113@PCREL)
		r4 = #1
	}
	{
		call ##halide_error_constraint_violated
	}
	.falign
// %bb.125:                             // %assert_failed41
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_126:                            // %assert_failed42
	{
		r1 = add(pc,##.Lstr.120@PCREL)
		r0 = #0
		r2 = memw(r29+#24)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.113@PCREL)
		r4 = #1
	}
	{
		call ##halide_error_constraint_violated
	}
	.falign
// %bb.127:                             // %assert_failed42
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_128:                            // %assert_failed43
	{
		r1 = add(pc,##.Lstr.121@PCREL)
		r0 = #0
		r2 = memw(r29+#40)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.115@PCREL)
		r4 = #0
	}
	{
		call ##halide_error_constraint_violated
	}
	.falign
// %bb.129:                             // %assert_failed43
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_130:                            // %assert_failed44
	{
		r1 = add(pc,##.Lstr.122@PCREL)
		r0 = #0
		r2 = memw(r29+#172)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.123@PCREL)
	}
	{
		call ##halide_error_constraint_violated
		r4 = and(r2,#-128)
	}
	.falign
// %bb.131:                             // %assert_failed44
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.LBB182_132:                            // %assert_failed45
	{
		r1 = add(pc,##.Lstr.124@PCREL)
		r0 = #0
		r2 = memw(r29+#32)
	}                                       // 4-byte Folded Reload
	{
		r3 = add(pc,##.Lstr.115@PCREL)
		r4 = #0
	}
	{
		call ##halide_error_constraint_violated
	}
	.falign
// %bb.133:                             // %assert_failed45
	{
		r17:16 = memd(r29+#408)
		r19:18 = memd(r29+#400)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r29+#392)
		r23:22 = memd(r29+#384)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r29+#376)
		r27:26 = memd(r29+#368)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
.Lfunc_end182:
	.size	conv3x3_halide, .Lfunc_end182-conv3x3_halide
	.section	.rodata.conv3x3_halide,"a",@progbits
	.p2align	2
.LJTI182_0:
	.word	.LBB182_39-.LJTI182_0
	.word	.LBB182_82-.LJTI182_0
	.word	.LBB182_84-.LJTI182_0
	.word	.LBB182_86-.LJTI182_0
	.word	.LBB182_88-.LJTI182_0
	.word	.LBB182_90-.LJTI182_0
	.word	.LBB182_92-.LJTI182_0
	.word	.LBB182_94-.LJTI182_0
	.word	.LBB182_96-.LJTI182_0
	.word	.LBB182_98-.LJTI182_0
	.word	.LBB182_100-.LJTI182_0
	.word	.LBB182_102-.LJTI182_0
	.word	.LBB182_104-.LJTI182_0
	.word	.LBB182_106-.LJTI182_0
	.word	.LBB182_108-.LJTI182_0
	.word	.LBB182_110-.LJTI182_0
	.word	.LBB182_112-.LJTI182_0
	.word	.LBB182_114-.LJTI182_0
	.word	.LBB182_116-.LJTI182_0
	.word	.LBB182_118-.LJTI182_0
	.word	.LBB182_120-.LJTI182_0
	.word	.LBB182_122-.LJTI182_0
	.word	.LBB182_124-.LJTI182_0
	.word	.LBB182_126-.LJTI182_0
	.word	.LBB182_128-.LJTI182_0
	.word	.LBB182_130-.LJTI182_0
	.word	.LBB182_132-.LJTI182_0
.LJTI182_1:
	.word	.LBB182_42-.LJTI182_1
	.word	.LBB182_50-.LJTI182_1
	.word	.LBB182_52-.LJTI182_1
	.word	.LBB182_54-.LJTI182_1
	.word	.LBB182_56-.LJTI182_1
	.word	.LBB182_58-.LJTI182_1
	.word	.LBB182_60-.LJTI182_1
	.word	.LBB182_62-.LJTI182_1
	.word	.LBB182_64-.LJTI182_1
	.word	.LBB182_66-.LJTI182_1
	.word	.LBB182_68-.LJTI182_1
	.word	.LBB182_70-.LJTI182_1
	.word	.LBB182_72-.LJTI182_1
	.word	.LBB182_74-.LJTI182_1
	.word	.LBB182_76-.LJTI182_1
	.word	.LBB182_78-.LJTI182_1
	.word	.LBB182_80-.LJTI182_1
                                        // -- End function
	.section	.rodata,"a",@progbits
	.p2align	7                               // -- Begin function conv3x3_halide.par_for.output.s0.y.yo
.LCPI183_0:
	.word	1                               // 0x1
	.word	2                               // 0x2
	.word	3                               // 0x3
	.word	4                               // 0x4
	.word	5                               // 0x5
	.word	6                               // 0x6
	.word	7                               // 0x7
	.word	8                               // 0x8
	.word	9                               // 0x9
	.word	10                              // 0xa
	.word	11                              // 0xb
	.word	12                              // 0xc
	.word	13                              // 0xd
	.word	14                              // 0xe
	.word	15                              // 0xf
	.word	16                              // 0x10
	.word	17                              // 0x11
	.word	18                              // 0x12
	.word	19                              // 0x13
	.word	20                              // 0x14
	.word	21                              // 0x15
	.word	22                              // 0x16
	.word	23                              // 0x17
	.word	24                              // 0x18
	.word	25                              // 0x19
	.word	26                              // 0x1a
	.word	27                              // 0x1b
	.word	28                              // 0x1c
	.word	29                              // 0x1d
	.word	30                              // 0x1e
	.word	31                              // 0x1f
	.word	32                              // 0x20
.LCPI183_1:
	.word	33                              // 0x21
	.word	34                              // 0x22
	.word	35                              // 0x23
	.word	36                              // 0x24
	.word	37                              // 0x25
	.word	38                              // 0x26
	.word	39                              // 0x27
	.word	40                              // 0x28
	.word	41                              // 0x29
	.word	42                              // 0x2a
	.word	43                              // 0x2b
	.word	44                              // 0x2c
	.word	45                              // 0x2d
	.word	46                              // 0x2e
	.word	47                              // 0x2f
	.word	48                              // 0x30
	.word	49                              // 0x31
	.word	50                              // 0x32
	.word	51                              // 0x33
	.word	52                              // 0x34
	.word	53                              // 0x35
	.word	54                              // 0x36
	.word	55                              // 0x37
	.word	56                              // 0x38
	.word	57                              // 0x39
	.word	58                              // 0x3a
	.word	59                              // 0x3b
	.word	60                              // 0x3c
	.word	61                              // 0x3d
	.word	62                              // 0x3e
	.word	63                              // 0x3f
	.word	64                              // 0x40
.LCPI183_2:
	.word	65                              // 0x41
	.word	66                              // 0x42
	.word	67                              // 0x43
	.word	68                              // 0x44
	.word	69                              // 0x45
	.word	70                              // 0x46
	.word	71                              // 0x47
	.word	72                              // 0x48
	.word	73                              // 0x49
	.word	74                              // 0x4a
	.word	75                              // 0x4b
	.word	76                              // 0x4c
	.word	77                              // 0x4d
	.word	78                              // 0x4e
	.word	79                              // 0x4f
	.word	80                              // 0x50
	.word	81                              // 0x51
	.word	82                              // 0x52
	.word	83                              // 0x53
	.word	84                              // 0x54
	.word	85                              // 0x55
	.word	86                              // 0x56
	.word	87                              // 0x57
	.word	88                              // 0x58
	.word	89                              // 0x59
	.word	90                              // 0x5a
	.word	91                              // 0x5b
	.word	92                              // 0x5c
	.word	93                              // 0x5d
	.word	94                              // 0x5e
	.word	95                              // 0x5f
	.word	96                              // 0x60
.LCPI183_3:
	.word	97                              // 0x61
	.word	98                              // 0x62
	.word	99                              // 0x63
	.word	100                             // 0x64
	.word	101                             // 0x65
	.word	102                             // 0x66
	.word	103                             // 0x67
	.word	104                             // 0x68
	.word	105                             // 0x69
	.word	106                             // 0x6a
	.word	107                             // 0x6b
	.word	108                             // 0x6c
	.word	109                             // 0x6d
	.word	110                             // 0x6e
	.word	111                             // 0x6f
	.word	112                             // 0x70
	.word	113                             // 0x71
	.word	114                             // 0x72
	.word	115                             // 0x73
	.word	116                             // 0x74
	.word	117                             // 0x75
	.word	118                             // 0x76
	.word	119                             // 0x77
	.word	120                             // 0x78
	.word	121                             // 0x79
	.word	122                             // 0x7a
	.word	123                             // 0x7b
	.word	124                             // 0x7c
	.word	125                             // 0x7d
	.word	126                             // 0x7e
	.word	127                             // 0x7f
	.word	128                             // 0x80
.LCPI183_4:
	.byte	1                               // 0x1
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
.LCPI183_5:
	.word	0                               // 0x0
	.word	1                               // 0x1
	.word	2                               // 0x2
	.word	3                               // 0x3
	.word	4                               // 0x4
	.word	5                               // 0x5
	.word	6                               // 0x6
	.word	7                               // 0x7
	.word	8                               // 0x8
	.word	9                               // 0x9
	.word	10                              // 0xa
	.word	11                              // 0xb
	.word	12                              // 0xc
	.word	13                              // 0xd
	.word	14                              // 0xe
	.word	15                              // 0xf
	.word	16                              // 0x10
	.word	17                              // 0x11
	.word	18                              // 0x12
	.word	19                              // 0x13
	.word	20                              // 0x14
	.word	21                              // 0x15
	.word	22                              // 0x16
	.word	23                              // 0x17
	.word	24                              // 0x18
	.word	25                              // 0x19
	.word	26                              // 0x1a
	.word	27                              // 0x1b
	.word	28                              // 0x1c
	.word	29                              // 0x1d
	.word	30                              // 0x1e
	.word	31                              // 0x1f
.LCPI183_6:
	.word	32                              // 0x20
	.word	33                              // 0x21
	.word	34                              // 0x22
	.word	35                              // 0x23
	.word	36                              // 0x24
	.word	37                              // 0x25
	.word	38                              // 0x26
	.word	39                              // 0x27
	.word	40                              // 0x28
	.word	41                              // 0x29
	.word	42                              // 0x2a
	.word	43                              // 0x2b
	.word	44                              // 0x2c
	.word	45                              // 0x2d
	.word	46                              // 0x2e
	.word	47                              // 0x2f
	.word	48                              // 0x30
	.word	49                              // 0x31
	.word	50                              // 0x32
	.word	51                              // 0x33
	.word	52                              // 0x34
	.word	53                              // 0x35
	.word	54                              // 0x36
	.word	55                              // 0x37
	.word	56                              // 0x38
	.word	57                              // 0x39
	.word	58                              // 0x3a
	.word	59                              // 0x3b
	.word	60                              // 0x3c
	.word	61                              // 0x3d
	.word	62                              // 0x3e
	.word	63                              // 0x3f
.LCPI183_7:
	.word	64                              // 0x40
	.word	65                              // 0x41
	.word	66                              // 0x42
	.word	67                              // 0x43
	.word	68                              // 0x44
	.word	69                              // 0x45
	.word	70                              // 0x46
	.word	71                              // 0x47
	.word	72                              // 0x48
	.word	73                              // 0x49
	.word	74                              // 0x4a
	.word	75                              // 0x4b
	.word	76                              // 0x4c
	.word	77                              // 0x4d
	.word	78                              // 0x4e
	.word	79                              // 0x4f
	.word	80                              // 0x50
	.word	81                              // 0x51
	.word	82                              // 0x52
	.word	83                              // 0x53
	.word	84                              // 0x54
	.word	85                              // 0x55
	.word	86                              // 0x56
	.word	87                              // 0x57
	.word	88                              // 0x58
	.word	89                              // 0x59
	.word	90                              // 0x5a
	.word	91                              // 0x5b
	.word	92                              // 0x5c
	.word	93                              // 0x5d
	.word	94                              // 0x5e
	.word	95                              // 0x5f
.LCPI183_8:
	.word	96                              // 0x60
	.word	97                              // 0x61
	.word	98                              // 0x62
	.word	99                              // 0x63
	.word	100                             // 0x64
	.word	101                             // 0x65
	.word	102                             // 0x66
	.word	103                             // 0x67
	.word	104                             // 0x68
	.word	105                             // 0x69
	.word	106                             // 0x6a
	.word	107                             // 0x6b
	.word	108                             // 0x6c
	.word	109                             // 0x6d
	.word	110                             // 0x6e
	.word	111                             // 0x6f
	.word	112                             // 0x70
	.word	113                             // 0x71
	.word	114                             // 0x72
	.word	115                             // 0x73
	.word	116                             // 0x74
	.word	117                             // 0x75
	.word	118                             // 0x76
	.word	119                             // 0x77
	.word	120                             // 0x78
	.word	121                             // 0x79
	.word	122                             // 0x7a
	.word	123                             // 0x7b
	.word	124                             // 0x7c
	.word	125                             // 0x7d
	.word	126                             // 0x7e
	.word	127                             // 0x7f
.LCPI183_9:
	.word	4294967295                      // 0xffffffff
	.word	0                               // 0x0
	.word	1                               // 0x1
	.word	2                               // 0x2
	.word	3                               // 0x3
	.word	4                               // 0x4
	.word	5                               // 0x5
	.word	6                               // 0x6
	.word	7                               // 0x7
	.word	8                               // 0x8
	.word	9                               // 0x9
	.word	10                              // 0xa
	.word	11                              // 0xb
	.word	12                              // 0xc
	.word	13                              // 0xd
	.word	14                              // 0xe
	.word	15                              // 0xf
	.word	16                              // 0x10
	.word	17                              // 0x11
	.word	18                              // 0x12
	.word	19                              // 0x13
	.word	20                              // 0x14
	.word	21                              // 0x15
	.word	22                              // 0x16
	.word	23                              // 0x17
	.word	24                              // 0x18
	.word	25                              // 0x19
	.word	26                              // 0x1a
	.word	27                              // 0x1b
	.word	28                              // 0x1c
	.word	29                              // 0x1d
	.word	30                              // 0x1e
.LCPI183_10:
	.word	31                              // 0x1f
	.word	32                              // 0x20
	.word	33                              // 0x21
	.word	34                              // 0x22
	.word	35                              // 0x23
	.word	36                              // 0x24
	.word	37                              // 0x25
	.word	38                              // 0x26
	.word	39                              // 0x27
	.word	40                              // 0x28
	.word	41                              // 0x29
	.word	42                              // 0x2a
	.word	43                              // 0x2b
	.word	44                              // 0x2c
	.word	45                              // 0x2d
	.word	46                              // 0x2e
	.word	47                              // 0x2f
	.word	48                              // 0x30
	.word	49                              // 0x31
	.word	50                              // 0x32
	.word	51                              // 0x33
	.word	52                              // 0x34
	.word	53                              // 0x35
	.word	54                              // 0x36
	.word	55                              // 0x37
	.word	56                              // 0x38
	.word	57                              // 0x39
	.word	58                              // 0x3a
	.word	59                              // 0x3b
	.word	60                              // 0x3c
	.word	61                              // 0x3d
	.word	62                              // 0x3e
.LCPI183_11:
	.word	63                              // 0x3f
	.word	64                              // 0x40
	.word	65                              // 0x41
	.word	66                              // 0x42
	.word	67                              // 0x43
	.word	68                              // 0x44
	.word	69                              // 0x45
	.word	70                              // 0x46
	.word	71                              // 0x47
	.word	72                              // 0x48
	.word	73                              // 0x49
	.word	74                              // 0x4a
	.word	75                              // 0x4b
	.word	76                              // 0x4c
	.word	77                              // 0x4d
	.word	78                              // 0x4e
	.word	79                              // 0x4f
	.word	80                              // 0x50
	.word	81                              // 0x51
	.word	82                              // 0x52
	.word	83                              // 0x53
	.word	84                              // 0x54
	.word	85                              // 0x55
	.word	86                              // 0x56
	.word	87                              // 0x57
	.word	88                              // 0x58
	.word	89                              // 0x59
	.word	90                              // 0x5a
	.word	91                              // 0x5b
	.word	92                              // 0x5c
	.word	93                              // 0x5d
	.word	94                              // 0x5e
.LCPI183_12:
	.word	95                              // 0x5f
	.word	96                              // 0x60
	.word	97                              // 0x61
	.word	98                              // 0x62
	.word	99                              // 0x63
	.word	100                             // 0x64
	.word	101                             // 0x65
	.word	102                             // 0x66
	.word	103                             // 0x67
	.word	104                             // 0x68
	.word	105                             // 0x69
	.word	106                             // 0x6a
	.word	107                             // 0x6b
	.word	108                             // 0x6c
	.word	109                             // 0x6d
	.word	110                             // 0x6e
	.word	111                             // 0x6f
	.word	112                             // 0x70
	.word	113                             // 0x71
	.word	114                             // 0x72
	.word	115                             // 0x73
	.word	116                             // 0x74
	.word	117                             // 0x75
	.word	118                             // 0x76
	.word	119                             // 0x77
	.word	120                             // 0x78
	.word	121                             // 0x79
	.word	122                             // 0x7a
	.word	123                             // 0x7b
	.word	124                             // 0x7c
	.word	125                             // 0x7d
	.word	126                             // 0x7e
	.section	.text.conv3x3_halide.par_for.output.s0.y.yo,"ax",@progbits
	.falign
	.type	conv3x3_halide.par_for.output.s0.y.yo,@function
conv3x3_halide.par_for.output.s0.y.yo:  // @conv3x3_halide.par_for.output.s0.y.yo
	.cfi_startproc
// %bb.0:                               // %entry
	{
		allocframe(r29,#2560):raw
	}
	.cfi_def_cfa r30, 8
	.cfi_offset r31, -4
	.cfi_offset r30, -8
	.cfi_offset r17, -12
	.cfi_offset r16, -16
	.cfi_offset r19, -20
	.cfi_offset r18, -24
	.cfi_offset r21, -28
	.cfi_offset r20, -32
	.cfi_offset r23, -36
	.cfi_offset r22, -40
	.cfi_offset r25, -44
	.cfi_offset r24, -48
	.cfi_offset r27, -52
	.cfi_offset r26, -56
	{
		r29 = and(r29,#-128)
	}
	{
		allocframe(r29,#0):raw
	}
	{
		r31:30 = deallocframe(r30):raw
	}
	{
		r3 = add(r29,#2504)
		memw(r29+#232) = r0
	}                                       // 4-byte Folded Spill
	{
		r3 = add(r29,#2508)
		memw(r3+#0) = #0
		memd(r30+#-24) = r21:20
	}                                       // 8-byte Folded Spill
	{
		r20 = memw(r2+#8)
		memd(r30+#-32) = r23:22
	}                                       // 8-byte Folded Spill
	{
		r23 = memw(r2+#16)
		memd(r30+#-16) = r19:18
	}                                       // 8-byte Folded Spill
	{
		r3 = memw(r2+#20)
		memw(r3+#0) = #0
	}
	{
		r19 = memw(r2+#4)
		memd(r30+#-40) = r25:24
	}                                       // 8-byte Folded Spill
	{
		r21 = memw(r2+#12)
		memw(r29+#2304) = r3
	}                                       // 4-byte Folded Spill
	{
		r17 = r1
		r25 = memw(r2+#32)
		memd(r30+#-8) = r17:16
	}                                       // 8-byte Folded Spill
	{
		r24 = memw(r2+#24)
		memd(r30+#-48) = r27:26
	}                                       // 8-byte Folded Spill
	{
		r3 = memw(r2+#40)
		memw(r29+#2176) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r16 = memw(r2+#28)
		r22 = memw(r2+#36)
	}
	{
		r3 = memw(r2+#48)
		memw(r29+#2048) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = memw(r2+#52)
		memw(r29+#620) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r26 = memw(r2+#56)
		r1 = memw(r2+#68)
	}
	{
		r27 = memub(r2+#44)
		memw(r29+#296) = r1
	}                                       // 4-byte Folded Spill
	{
		r3 = memw(r2+#60)
		memw(r29+#344) = r3.new
	}                                       // 4-byte Folded Spill
	{
		call ##halide_qurt_hvx_lock
		r1 = memw(r2+#76)
		memw(r29+#352) = r1.new
	}                                       // 4-byte Folded Spill
	.falign
// %bb.1:                               // %entry
	{
		r18 = r0
		p0 = cmp.eq(r0,#0); if (!p0.new) jump:nt .LBB183_46
	}
// %bb.2:                               // %"assert succeeded"
	{
		r3 = asr(r25,#1)
		r1 = #0
		p1 = cmp.gt(r25,#1)
		if (!p1.new) jump:nt .LBB183_49
	}
// %bb.3:                               // %"for output.s0.y.y.y.preheader"
	{
		r7 = add(pc,##.LCPI183_3@PCREL)
		r8 = #18
		r5 = add(r19,#1)
	}
	{
		r4 = add(pc,##.LCPI183_0@PCREL)
		r2 = add(r25,#30)
		r9 = memw(r29+#620)
	}                                       // 4-byte Folded Reload
	{
		r6 = add(pc,##.LCPI183_1@PCREL)
		r18 = #-1
		p0 = cmp.gt(r16,#-128)
	}
	{
		r3 = mpyi(r3,r17)
		v3 = vxor(v3,v3)
		r7 = memw(r29+#2048)
		v22 = vmem(r7+#0)
	}                                       // 4-byte Folded Reload
	{
		r0 = add(pc,##.LCPI183_2@PCREL)
		v8 = vsplat(r5)
	}
	{
		r2 = asr(r2,#5)
		q3 = vcmp.gt(v13.w,v8.w)
		v13.cur = vmem(r4+#0)
		memw(r29+#328) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r4 = add(r7,#255)
		r7 = #0
		r6 = memw(r29+#2176)
		v18 = vmem(r6+#0)
	}                                       // 4-byte Folded Reload
	{
		r7 |= asl(r26,#16)
		r13 = asr(r4,#7)
		r0 = memw(r29+#2304)
		v30 = vmem(r0+#0)
	}                                       // 4-byte Folded Reload
	{
		r1 = max(r13,r1)
		r12 = min(r3,r6)
		r2 = add(r29,#2304)
		memw(r29+#236) = r7
	}                                       // 4-byte Folded Spill
	{
		r6 = asr(r26,#31)
		r7 = add(r9,#1)
		q1 = vcmp.gt(v22.w,v8.w)
		q0 = vcmp.gt(v18.w,v8.w)
	}
	{
		r23 += mpyi(r24,r0)
		r3 = asl(r1,#7)
		r2 = #1
		vmem(r2+#0) = v3
	}                                       // 128-byte Folded Spill
	{
		r0 = lsr(r26,#16)
		r7 = asr(r7,#7)
		q2 = vcmp.gt(v30.w,v8.w)
	}
	{
		r1:0 = mpyu(r3,r8)
		r15 = max(r7,r2)
		r5 = or(r21,r0)
		r3 = add(r16,#255)
	}
	{
		r8 = add(pc,##.LCPI183_4@PCREL)
		r14 = asr(r3,#7)
		r3 = add(r9,#-127)
	}
	{
		r5 |= asl(r6,#16)
		r3 = asr(r3,#7)
		r6 = add(r19,#-1)
		memw(r29+#376) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = +mpyi(r13,##896)
		p3 = r27
		r26 = memw(r29+#344)
	}                                       // 4-byte Folded Reload
	{
		r7:6 = lsr(r1:0,#31)
		v22 = vsplat(r6)
		v2 = vmem(r8+#0)
		memw(r29+#292) = r3
	}                                       // 4-byte Folded Spill
	{
		r3 = +mpyi(r13,##768)
		r9:8 = combine(#0,#0)
		memw(r29+#288) = r3.new
	}                                       // 4-byte Folded Spill
	{
		p2 = cmp.eq(r7:6,r9:8)
		r3 = sub(#0,r23)
		r6 = sub(#1,r23)
		memw(r29+#284) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r28 = asl(r24,#1)
		v24 = vand(q1,r18)
		r6 = sub(#2,r23)
		memw(r29+#280) = r6
	}                                       // 4-byte Folded Spill
	{
		r3 = extractu(r13,#23,#0)
		r2 = p2
		p2 = cmp.gt(r16,#0)
		memw(r29+#324) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r2 = extractu(r13,#25,#0)
		v23 = vand(q0,r18)
		r8 = sub(r28,r23)
		v9.b = vpacke(v3.h,v24.h)
	}
	{
		r3 = asl(r3,#9)
		v20 = vand(q2,r18)
		memw(r29+#260) = r3.new
	}                                       // 4-byte Folded Spill
	{
		v19 = vand(q3,r18)
		r3 = or(r0,#129)
		memw(r29+#340) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r3 = +mpyi(r13,##384)
		r27 = #64
		memw(r29+#256) = r3.new
	}                                       // 4-byte Folded Spill
	{
		r7 = +mpyi(r13,##640)
		r3 = #-128
		v31.b = vpacke(v3.h,v23.h)
	}
	{
		r6 = extractu(r13,#24,#0)
		r25 = addasl(r3,r2,#7)
		v28.b = vpacke(v3.h,v20.h)
		memw(r29+#276) = r6
	}                                       // 4-byte Folded Spill
	{
		r3 = p0
		r2 = add(r16,#127)
		v29 = vror(v9,r27)
	}
	{
		r2 = asr(r2,#7)
		v25.b = vpacke(v3.h,v19.h)
		v17 = vor(v29,v28)
		memw(r29+#248) = r2.new
	}                                       // 4-byte Folded Spill
	{
		r6 = asl(r6,#8)
		q3 = vand(v17,r18)
		v0 = vror(v31,r27)
		r2 = memw(r29+#352)
	}                                       // 4-byte Folded Reload
	{
		v21 = vand(q3,r18)
		r6 = #0
		v16 = vor(v0,v25)
		memw(r29+#252) = r6
	}                                       // 4-byte Folded Spill
	{
		r2 += mpyi(r22,r12)
		q2 = vand(v16,r18)
		memw(r29+#352) = r2.new
	}                                       // 4-byte Folded Spill
	{
		v26 = vand(q2,r18)
		r2 = add(r29,#1664)
		v1.b = vpacke(v3.h,v21.h)
		memw(r29+#1916) = r3
	}                                       // 4-byte Folded Spill
	{
		r3 = p2
		r16 = add(r26,#-1)
		memw(r29+#316) = r3.new
	}                                       // 4-byte Folded Spill
	{
		v26.b = vsplat(r6)
		r2 = #1
		v27.b = vpacke(v3.h,v26.h)
		vmem(r2+#0) = v26.new
	}                                       // 128-byte Folded Spill
	{
		v23.b = vsplat(r2)
		r3 = add(r20,#-1)
		r2 = add(r29,#1536)
		v4 = vror(v1,r27)
	}
	{
		v5 = vor(v4,v27)
	}
	{
		q3 = vand(v2,r18)
		q2 = vand(v5,r18)
		memw(r29+#272) = r7
		vmem(r2+#0) = v23
	}                                       // 4-byte Folded Spill
	{
		r7 = sub(r24,r23)
		r2 = memw(r29+#296)
		memw(r29+#1912) = r3
	}                                       // 4-byte Folded Reload
	{
		r3 = ##16843009
		q1 = or(q2,q3)
		memw(r29+#628) = r13
	}                                       // 4-byte Folded Spill
	{
		v11 = vand(q1,r3)
		r3 = add(r2,r7)
		r2 = add(r2,r8)
		vmem(r29+#3) = v11.new
	}                                       // 128-byte Folded Spill
	{
		r1 = setbit(r5,#16)
		r24 = r14
		r2 = memw(r29+#2508)
		memw(r29+#240) = r2
	}                                       // 4-byte Folded Spill
	{
		r17 = asl(r15,#7)
		r23 = and(r4,#-128)
		r2 = memw(r29+#2504)
		memw(r29+#336) = r2
	}                                       // 4-byte Folded Spill
	{
		r2 = sub(#0,r12)
		r7 = #0
		memw(r29+#636) = r2
		memw(r29+#268) = r7
	}                                       // 4-byte Folded Spill
	{
		r2 = sub(r14,r15)
		r1 = add(r29,#1920)
		memw(r29+#368) = r2
		memd(r29+#304) = r1:0
	}                                       // 4-byte Folded Spill
	{
		r2 = sub(#1,r12)
		r0 = add(r29,#2048)
		memw(r29+#380) = r2
		memw(r29+#244) = r3
	}                                       // 4-byte Folded Spill
	{
		r2 = asl(r22,#4)
		memw(r29+#364) = r2
		memw(r29+#264) = r8
	}                                       // 4-byte Folded Spill
	{
		r2 = add(r12,#18)
		memw(r29+#312) = r2
		memw(r29+#624) = r15
	}                                       // 4-byte Folded Spill
	{
		memw(r29+#360) = r2
		memw(r29+#372) = r12
	}                                       // 4-byte Folded Spill
	{
		memw(r29+#356) = r12
		memw(r29+#632) = r14
	}                                       // 4-byte Folded Spill
	{
		memw(r29+#332) = r20
	}                                       // 4-byte Folded Spill
	{
		memw(r29+#320) = r25
		vmem(r1+#0) = v8
	}                                       // 128-byte Folded Spill
	{
		memw(r29+#300) = r21
		vmem(r0+#0) = v22
	}                                       // 128-byte Folded Spill
	.falign
.LBB183_4:                              // %"for output.s0.y.y.y"
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB183_10 Depth 2
                                        //       Child Loop BB183_12 Depth 3
                                        //     Child Loop BB183_16 Depth 2
                                        //       Child Loop BB183_19 Depth 3
                                        //       Child Loop BB183_25 Depth 3
                                        //     Child Loop BB183_30 Depth 2
                                        //       Child Loop BB183_32 Depth 3
                                        //     Child Loop BB183_36 Depth 2
	{
		r4 = r26
		r5 = #1
		r2 = memw(r29+#372)
	}                                       // 4-byte Folded Reload
	{
		r9 = addasl(r2,r7,#4)
	}
	{
		r2 = add(r9,#33)
	}
	{
		r2 = min(r2,r20)
	}
	{
		r3 = max(r2,r5)
	}
	{
		p1 = cmp.gt(r3,r20)
		r3 = add(r9,#16)
	}
	{
		p0 = and(p3,!p1)
		if (!p0.new) jump:t .LBB183_6
		if (p0.new) r1:0 = memd(r29+#304)
	}                                       // 8-byte Folded Reload
// %bb.5:                               // %then_bb
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r3 = min(r3,r20)
	}
	{
		r3 = max(r3,r5)
	}
	{
		r2 = sub(r2,r3)
		r8 = add(r3,#-1)
		r3 = r7
		r7 = memw(r29+#236)
	}                                       // 4-byte Folded Reload
	{
		r2 = max(r2,r6)
	}
	{
		r4 += mpyi(r8,r21)
	}
	{
		r2 = add(r2,#1)
	}
	{
		r0 = or(r7,r2)
		r7 = r3
	}
	{
		memd(r29+#304) = r1:0
	}                                       // 8-byte Folded Spill
	//# InlineAsm Start
	l2fetch(r4,r1:0)
	//# InlineAsm End
	.falign
.LBB183_6:                              // %after_bb
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r2 = memw(r29+#324)
	}                                       // 4-byte Folded Reload
	{
		p1 = r2
		if (!p1.new) jump:nt .LBB183_47
		if (p1.new) r2 = memw(r29+##340)
	}                                       // 4-byte Folded Reload
// %bb.7:                               // %"assert succeeded3"
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r7 = asl(r7,#4)
		r0 = add(r29,#2304)
		r3 = memw(r29+#336)
		memw(r29+#348) = r7
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#1280) = r7
	}                                       // 4-byte Folded Spill
	{
		v1 = vmem(r0+#0)
		memw(r29+#1408) = r9
	}                                       // 128-byte Folded Reload
	{
		if (p1.new) r24 = add(r20,#0)
		p1 = cmp.gtu(r2,r3); if (p1.new) jump:nt .LBB183_38
		if (p1.new) r20 = memw(r29+#232)
	}                                       // 4-byte Folded Reload
	.falign
.LBB183_8:                              // %pseudostack_alloc.exit
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r4 = max(r9,r5)
		r5 = add(r9,#18)
		r2 = add(r9,#17)
		r3 = memw(r29+#372)
	}                                       // 4-byte Folded Reload
	{
		r25 = add(pc,##.LCPI183_5@PCREL)
		r13 = min(r2,r20)
		r8 = #18
	}
	{
		r4 = add(pc,##.LCPI183_6@PCREL)
		r14 = min(r4,r5)
		r3 = add(r7,r3)
	}
	{
		r5 = add(pc,##.LCPI183_7@PCREL)
		r9 = add(r14,#-1)
		r2 = sub(#1,r3)
	}
	{
		r7 = add(pc,##.LCPI183_8@PCREL)
		p1 = cmp.gt(r2,#0)
		p0 = cmp.gt(r14,r13)
	}
	{
		if (!p1) jump:nt .LBB183_14
		if (p1) r3 = memw(r29+##1408)
	}                                       // 4-byte Folded Reload
// %bb.9:                               //   in Loop: Header=BB183_4 Depth=1
	{
		r12 = memw(r29+#636)
	}                                       // 4-byte Folded Reload
	{
		r2 = min(r2,r8)
	}
	{
		r8 = add(r3,#-1)
		if (!p1) r2 = #0
	}
	{
		r2 = add(r2,r8)
	}
	{
		r2 = sub(r2,r8)
	}
	{
		loop1(.LBB183_10,r2)
	}
	.falign
.Ltmp14:                                // Block address taken
.LBB183_10:                             // %"for input_bounded.s0.y"
                                        //   Parent Loop BB183_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB183_12 Depth 3
	{
		p1 = cmp.gt(r20,r8)
		r2 = add(r29,#1920)
		r3 = #1
	}
	{
		r2 = add(r29,#2048)
		v16 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		r2 = memw(r29+#1916)
		v11 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		p2 = r2
		if (p2.new) r15 = #-1
		if (!p2.new) jump:nt .LBB183_13
	}
// %bb.11:                              // %"for input_bounded.s0.x.x.preheader"
                                        //   in Loop: Header=BB183_10 Depth=2
	{
		p2 = cmp.gt(r8,#-1)
		r28 = memw(r29+#1912)
	}                                       // 4-byte Folded Reload
	{
		loop0(.LBB183_12,r24)
		r2 = mux(p1,r8,r28)
		r0 = r12
		r28 = #-1
	}
	{
		r2 = max(r2,r6)
		p1 = not(p1)
	}
	{
		p2 = or(p1,!p2)
		r6 = add(r29,#1664)
	}
	{
		r6 = add(r29,#1536)
		v14 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		r1 = mpyi(r2,r21)
	}
	{
		r6 = add(r29,#2176)
		if (p2) v10 = v30
		if (!p2) v10 = v14
		v30.cur = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		vmem(r6+#0) = v10
	}                                       // 128-byte Folded Spill
	.falign
.Ltmp15:                                // Block address taken
.LBB183_12:                             // %"for input_bounded.s0.x.x"
                                        //   Parent Loop BB183_4 Depth=1
                                        //     Parent Loop BB183_10 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		v5 = vsplat(r28)
		r2 = add(r28,#1)
		r6 = add(r29,#2304)
		v9 = vmem(r4+#0)
	}
	{
		r11 = min(r2,r19)
		v24 = vsplat(r2)
		r2 = add(r29,#2304)
		v8 = vmem(r25+#0)
	}
	{
		v25 = vor(v24,v9)
		v30 = vor(v24,v8)
		v20 = vor(v24,v14)
		v14.cur = vmem(r5+#0)
	}
	{
		r2 = add(r29,#2304)
		q2 = vcmp.gt(v16.w,v25.w)
		q1 = vcmp.eq(v30.w,v1.w)
		v3 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v0 = vand(q1,r18)
		q2 = not(q2)
		q3 = vcmp.eq(v25.w,v1.w)
		q1 = vcmp.eq(v20.w,v1.w)
	}
	{
		v26 = vand(q2,r18)
		r2 = add(r29,#2304)
		v4 = v5
		v27 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v28 = vand(q3,r18)
		v29 = vand(q1,r18)
		v31 = vor(v24,v15)
		v15.cur = vmem(r7+#0)
	}
	{
		r2 = add(r29,#2304)
		q3 = vcmp.eq(v31.w,v1.w)
		q2 = vcmp.gt(v16.w,v31.w)
		v12 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v17 = vand(q3,r18)
		r10 = r1
		v25:24.w = vadd(v5:4.w,v9:8.w)
		q1 = not(q2)
	}
	{
		r2 = add(r29,#2304)
		v6.b = vpacke(v7.h,v26.h)
		q3 = vcmp.gt(v16.w,v20.w)
		v7.cur = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		r6 = add(r29,#2304)
		v21.b = vpacke(v1.h,v0.h)
		q3 = not(q3)
		v26 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		r2 = max(r11,r3)
		r11 = add(r29,#2304)
		v1.b = vpacke(v3.h,v28.h)
		v23 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		r28 = add(r28,#128)
		v9.b = vpacke(v27.h,v29.h)
		v29:28.w = vadd(v5:4.w,v15:14.w)
		v4.w = vmin(v24.w,v11.w)
	}
	{
		v27 = vand(q1,r18)
		r6 = add(r29,#2304)
		v2.b = vpacke(v12.h,v17.h)
		v24 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		r10 += add(r16,r2)
		r11 = add(r29,#2304)
		q0 = vcmp.gt(v16.w,v30.w)
		v17 = vmem(r11+#0)
	}                                       // 128-byte Folded Reload
	{
		v3 = vand(q3,r18)
		r6 = sub(#1,r2)
		r2 = add(r29,#2304)
		v22 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		v5.b = vpacke(v23.h,v27.h)
		q0 = not(q0)
		v28.w = vmin(v28.w,v11.w)
		v12 = vmem(r11+#0)
	}                                       // 128-byte Folded Reload
	{
		v14.w = vmin(v25.w,v11.w)
		v30 = v11
		v11.w = vmin(v29.w,v11.w)
		v29 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v8 = vand(q0,r18)
		r11 = add(r29,#2304)
		r2 = add(r29,#2304)
		v10.b = vpacke(v26.h,v3.h)
	}
	{
		v3 = vsplat(r6)
		v7 = vror(v5,r27)
		v0.w = vmax(v28.w,v22.w)
		v26.w = vmax(v4.w,v24.w)
	}
	{
		r6 = #0
		v22 = vror(v2,r27)
		v19 = vor(v7,v10)
		v2 = v3
	}
	{
		v31 = vror(v1,r27)
		v23 = vor(v22,v9)
		v1.w = vmax(v11.w,v17.w)
		v22 = vmem(r11+#0)
	}                                       // 128-byte Folded Reload
	{
		r2 = add(r29,#2304)
		v24 = vror(v6,r27)
		v27.w = vmax(v14.w,v22.w)
		v6 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v31:30.w = vadd(v1:0.w,v3:2.w)
		v13 = vor(v31,v21)
		v11 = v30
	}
	{
		q3 = vand(v23,r18)
		q1 = vand(v19,r18)
		v23:22.w = vadd(v27:26.w,v3:2.w)
	}
	{
		q2 = vand(v13,r18)
		v0 = vand(q1,r18)
		v18.b = vpacke(v12.h,v8.h)
		v7 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v1 = vand(q3,r18)
		v25 = vand(q2,r18)
		r2 = add(r29,#2304)
		v28 = vor(v24,v18)
	}
	{
		q2 = vand(v28,r18)
		v26.h = vpacke(v23.w,v22.w)
	}
	{
		v28 = vand(q2,r18)
		v30.h = vpacke(v31.w,v30.w)
	}
	{
		v22 = vmemu(r10+#0)
	}
	{
		r2 = add(r29,#2304)
		v17.b = vpacke(v6.h,v0.h)
		v0 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v27.b = vpacke(v0.h,v1.h)
	}
	{
		r2 = add(r29,#2176)
		v2.b = vpacke(v30.h,v26.h)
		v1 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v3.b = vshuff(v22.b)
	}
	{
		v15.b = vpacke(v7.h,v28.h)
	}
	{
		v29.b = vpacke(v29.h,v25.h)
	}
	{
		v28 = vror(v27,r27)
	}
	{
		v31.b = vlut32(v2.b,v3.b,r6)
		v30 = vor(v28,v29)
	}
	{
		q1 = vand(v30,r18)
		v9 = vror(v17,r27)
	}
	{
		r2 = #2
		v23 = vor(v9,v15)
		v9 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		q3 = vand(v9,r15)
		q2 = vand(v23,r18)
		v31.b |= vlut32(v2.b,v3.b,r3)
	}
	{
		r2 = #3
		v31.b |= vlut32(v2.b,v3.b,r2)
		q3 = or(q1,q3)
	}
	{
		v31.b |= vlut32(v2.b,v3.b,r2)
		q2 = or(q3,q2)
	}
	{
		v10 = vmux(q2,v1,v31)
		vmem(r0++#1) = v10.new
	} :endloop0
	.falign
.LBB183_13:                             // %"end for input_bounded.s0.x.x"
                                        //   in Loop: Header=BB183_10 Depth=2
	{
		r8 = add(r8,#1)
		r12 = add(r12,r23)
		nop
	} :endloop1
	.falign
.LBB183_14:                             // %"end for input_bounded.s0.y"
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r2 = sub(r13,r14)
		r8 = mux(p0,r9,r13)
	}
	{
		r2 = max(r2,r18)
	}
	{
		r12 = add(r2,r14)
		if (cmp.gt(r14,r12.new)) jump:nt ##.LBB183_28
	}
// %bb.15:                              // %"for input_bounded.s0.y4.preheader"
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r14 = add(pc,##.LCPI183_11@PCREL)
		r6 = #1
		r2 = memw(r29+#356)
	}                                       // 4-byte Folded Reload
	{
		r13 = add(pc,##.LCPI183_10@PCREL)
		r0 = add(r29,#2048)
		r3 = memw(r29+#360)
	}                                       // 4-byte Folded Reload
	{
		r6 = add(pc,##.LCPI183_9@PCREL)
		r2 = max(r2,r6)
		r1 = memw(r29+#368)
	}                                       // 4-byte Folded Reload
	{
		r2 = min(r2,r3)
		r14 = memw(r29+#624)
		v6 = vmem(r14+#0)
	}                                       // 4-byte Folded Reload
	{
		r0 = memw(r29+#1408)
		v23 = vmem(r0+#0)
	}                                       // 128-byte Folded Reload
	{
		r6 = add(pc,##.LCPI183_12@PCREL)
		v11.w = vmin(v6.w,v23.w)
		v3 = vmem(r6+#0)
	}
	{
		v10.w = vmin(v3.w,v23.w)
		v7.w = vmin(v14.w,v23.w)
		r13 = memw(r29+#628)
		v14.cur = vmem(r13+#0)
	}                                       // 4-byte Folded Reload
	{
		v15.w = vmax(v10.w,v1.w)
		v13.w = vmax(v7.w,v1.w)
		v18.w = vmax(v11.w,v1.w)
		v8 = vmem(r6+#0)
	}
	{
		r6 = add(r2,r1)
		r2 = add(r2,#-1)
		v12.w = vmin(v8.w,v23.w)
		r1 = memw(r29+#636)
	}                                       // 4-byte Folded Reload
	{
		v22.h = vpacke(v13.w,v15.w)
	}
	{
		r14 += mpyi(r13,r6)
		r6 = mpyi(r23,r6)
		r13 = sub(#1,r0)
		v19.w = vmax(v12.w,v1.w)
	}
	{
		r2 = mpyi(r21,r2)
		r14 = asl(r14,#7)
		r0 = add(r29,#2176)
	}
	{
		r24 = add(r1,add(r6,##128))
		r28 = add(r1,r14)
		v31.h = vpacke(v19.w,v18.w)
	}
	{
		r15 = add(r26,add(r2,##128))
	}
	{
		v19.b = vpacke(v31.h,v22.h)
		vmem(r0+#0) = v19.new
	}                                       // 128-byte Folded Spill
	.falign
.LBB183_16:                             // %"for input_bounded.s0.y4"
                                        //   Parent Loop BB183_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB183_19 Depth 3
                                        //       Child Loop BB183_25 Depth 3
	{
		r0 = mpyi(r9,r21)
		r2 = add(r13,r9)
		r3 = add(r29,#2176)
		r6 = memw(r29+#628)
	}                                       // 4-byte Folded Reload
	{
		v8 = vmem(r29+#3)
	}                                       // 128-byte Folded Reload
	{
		r2 = mpyi(r2,r6)
		r14 = add(r26,r0)
		r3 = memw(r29+#636)
		v18 = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		r6 = #0
	}
	{
		r2 = addasl(r3,r2,#7)
		v16.b = vshuff(v7.b)
		r3 = memw(r29+#620)
		v7.cur = vmem(r14+#0)
	}                                       // 4-byte Folded Reload
	{
		p0 = cmp.gt(r3,#254)
		r6 = #1
		v11.b = vlut32(v18.b,v16.b,r6)
	}
	{
		r6 = #2
		v11.b |= vlut32(v18.b,v16.b,r6)
	}
	{
		v11.b |= vlut32(v18.b,v16.b,r6)
		r3 = ##16843009
		r6 = #3
	}
	{
		q0 = vand(v8,r3)
		v11.b |= vlut32(v18.b,v16.b,r6)
	}
	{
		if (!p0) jump:nt .LBB183_23
		v8 = vmux(q0,v1,v11)
		vmem(r2+#0) = v8.new
	}
// %bb.17:                              //   in Loop: Header=BB183_16 Depth=2
	{
		r3 = memw(r29+#376)
	}                                       // 4-byte Folded Reload
	{
		r2 = lsr(r3,#1)
		r1 = and(r3,#1)
	}
	{
		if (!p0.new) r2 = add(r24,#0)
		if (!p0.new) r10 = add(r15,#0)
		p0 = cmp.gtu(r2,#0); if (!p0.new) jump:t .LBB183_22
	}
// %bb.18:                              //   in Loop: Header=BB183_16 Depth=2
	{
		loop0(.LBB183_19,r2)
		r11:10 = combine(r15,r15)
		r14 = r24
		r2 = r24
	}
	.balign 32
.LBB183_19:                             //   Parent Loop BB183_4 Depth=1
                                        //     Parent Loop BB183_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		v7 = vlalign(v12,v7,#1)
		v12.cur = vmem(r10++#2)
		vmem(r2++#2) = v7.new
	}
	{
		r11 = r10
		v15 = vlalign(v7,v12,#1)
		v7.cur = vmem(r11+#1)
		vmem(r14+#1) = v15.new
	}
	{
		r14 = r2
		nop
	} :endloop0
// %bb.20:                              //   in Loop: Header=BB183_16 Depth=2
	{
		p2 = cmp.gtu(r1,#0)
		if (!p2.new) jump:t .LBB183_23
	}
	.falign
.Ltmp16:                                // Block address taken
.LBB183_21:                             // %"for input_bounded.s0.x.x9"
                                        //   in Loop: Header=BB183_16 Depth=2
	{
		jump .LBB183_23
		v18 = vlalign(v13,v7,#1)
		v13.cur = vmem(r10++#1)
		vmem(r2++#1) = v18.new
	}
	.falign
.LBB183_22:                             //   in Loop: Header=BB183_16 Depth=2
	{
		p2 = cmp.gtu(r1,#0)
		if (p2.new) jump:t .LBB183_21
	}
	.falign
.LBB183_23:                             // %after_bb6
                                        //   in Loop: Header=BB183_16 Depth=2
	{
		v19 = vsplat(r17)
		r2 = memw(r29+#632)
		r3 = memw(r29+#624)
	}                                       // 4-byte Folded Reload
	{
		if (p1.new) r2 = add(r29,##1920)
		p1 = cmp.gt(r2,r3); if (!p1.new) jump:nt .LBB183_27
	}
// %bb.24:                              //   in Loop: Header=BB183_16 Depth=2
	{
		r14 = min(r17,r19)
		r3 = add(r29,#2304)
		r6 = #1
		v17 = vmem(r4+#0)
	}
	{
		r10 = add(r17,#128)
		v22 = vor(v19,v17)
		v23 = vor(v19,v16)
		v16.cur = vmem(r25+#0)
	}
	{
		r14 = max(r14,r6)
		r1 = add(r17,#-1)
		q1 = vcmp.gt(v9.w,v22.w)
		v9.cur = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v25 = vand(q1,r18)
		v24 = vor(v19,v5)
		q3 = vcmp.gt(v9.w,v23.w)
		v5.cur = vmem(r7+#0)
	}
	{
		v0 = vand(q3,r18)
		q0 = vcmp.gt(v9.w,v24.w)
		v20 = vor(v19,v4)
		v4.cur = vmem(r5+#0)
	}
	{
		v29 = vand(q0,r18)
		r3 = add(r29,#2304)
		v28.b = vpacke(v1.h,v25.h)
		v25 = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		v19 = vsplat(r1)
		r2 = r0
		v21.b = vpacke(v1.h,v0.h)
		q2 = vcmp.gt(v9.w,v20.w)
	}
	{
		v26 = vand(q2,r18)
		r3 = add(r29,#2304)
		v1.b = vpacke(v25.h,v29.h)
		v25 = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		r2 += add(r16,r14)
		r1 = r28
		r14 = sub(#1,r14)
		v18 = v19
	}
	{
		r3 = add(r29,#2048)
		v22 = vror(v1,r27)
		v1 = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		v30.b = vpacke(v25.h,v26.h)
		v7:6.w = vadd(v19:18.w,v5:4.w)
	}
	{
		v11:10.w = vadd(v19:18.w,v17:16.w)
		v2 = vor(v22,v30)
		r3 = memw(r29+#380)
		v23 = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		v25 = vsplat(r14)
		v3.w = vmin(v6.w,v23.w)
		v6.w = vmin(v7.w,v23.w)
		v27.w = vmin(v11.w,v23.w)
	}
	{
		q3 = vand(v2,r18)
		v31.w = vmin(v10.w,v23.w)
		v13.w = vmax(v27.w,v1.w)
		v14.w = vmax(v3.w,v1.w)
	}
	{
		v4 = vand(q3,r18)
		v12.w = vmax(v31.w,v1.w)
		v24 = v25
		v15.w = vmax(v6.w,v1.w)
	}
	{
		p1 = cmp.gtu(r3,#1)
		v23:22.w = vadd(v15:14.w,v25:24.w)
		v27:26.w = vadd(v13:12.w,v25:24.w)
	}
	{
		v5 = vror(v28,r27)
	}
	{
		r2 = add(r3,#-1)
		v11 = vor(v5,v21)
		v7 = vmemu(r2+#0)
	}
	{
		q3 = vand(v11,r18)
		v14.b = vpacke(v1.h,v4.h)
	}
	{
		loop0(.LBB183_25,r2)
		v12 = vand(q3,r18)
		v10.h = vpacke(v27.w,v26.w)
	}
	{
		v31.h = vpacke(v23.w,v22.w)
	}
	{
		v8 = vror(v14,r27)
	}
	{
		v6.b = vpacke(v31.h,v10.h)
	}
	{
		if (!p1) jump:nt .LBB183_26
		v2.b = vshuff(v7.b)
	}
	.falign
.LBB183_25:                             // %"for input_bounded.s0.x.x12"
                                        //   Parent Loop BB183_4 Depth=1
                                        //     Parent Loop BB183_16 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		r2 = min(r10,r19)
		r3 = #0
		r14 = r0
		v12.b = vpacke(v1.h,v12.h)
	}
	{
		v15 = vsplat(r10)
		r3 = #2
		v13.b = vlut32(v6.b,v2.b,r3)
		v8 = vor(v8,v12)
	}
	{
		r2 = max(r2,r6)
		q2 = vand(v8,r18)
		v13.b |= vlut32(v6.b,v2.b,r6)
		v20 = vmem(r5+#0)
	}
	{
		r3 = #3
		r11 = add(r10,#-1)
		v13.b |= vlut32(v6.b,v2.b,r3)
		v22 = vor(v15,v20)
	}
	{
		r14 += add(r16,r2)
		r3 = add(r29,#2304)
		r2 = sub(#1,r2)
		v13.b |= vlut32(v6.b,v2.b,r3)
	}
	{
		v3 = vsplat(r11)
		v18 = vor(v15,v21)
		q1 = vcmp.gt(v9.w,v22.w)
		v21.cur = vmem(r7+#0)
	}
	{
		r3 = add(r29,#2304)
		q0 = vcmp.gt(v9.w,v18.w)
		v2 = v3
		v28 = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		v19 = vand(q0,r18)
		v23 = vmux(q2,v13,v28)
		v1 = vmem(r4+#0)
		vmem(r1++#1) = v23.new
	}
	{
		v23 = vsplat(r2)
		r2 = add(r29,#2304)
		r3 = add(r29,#2048)
		v29 = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		v20 = vand(q1,r18)
		r10 = add(r10,#128)
		v31:30.w = vadd(v3:2.w,v21:20.w)
		v24 = vor(v15,v1)
	}
	{
		r2 = add(r29,#2304)
		v25.b = vpacke(v29.h,v19.h)
		q1 = vcmp.gt(v9.w,v24.w)
		v7 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v29 = vand(q1,r18)
		v0.w = vmin(v31.w,v14.w)
		v14.cur = vmem(r3+#0)
	}                                       // 128-byte Folded Reload
	{
		r2 = add(r29,#2304)
		v17.w = vmax(v0.w,v22.w)
		v26.w = vmin(v30.w,v14.w)
		v22.cur = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v30.b = vpacke(v7.h,v20.h)
		v20 = vor(v15,v0)
		v22 = v23
		v0.cur = vmem(r25+#0)
	}
	{
		r2 = add(r29,#2304)
		v21 = vror(v25,r27)
		v5:4.w = vadd(v3:2.w,v1:0.w)
		v6 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v6.b = vpacke(v6.h,v29.h)
		q3 = vcmp.gt(v9.w,v20.w)
		v27 = vor(v21,v30)
		v1.w = vmin(v5.w,v14.w)
	}
	{
		v3 = vand(q3,r18)
		r2 = add(r29,#2304)
		v4.w = vmin(v4.w,v14.w)
		v10 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		q3 = vand(v27,r18)
		v14 = vror(v6,r27)
		v16.w = vmax(v26.w,v10.w)
	}
	{
		r2 = add(r29,#2304)
		v7:6.w = vadd(v17:16.w,v23:22.w)
		v19.w = vmax(v1.w,v29.w)
		v29.cur = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v5 = vand(q3,r18)
		v28 = vmemu(r14+#0)
	}
	{
		v7.h = vpacke(v7.w,v6.w)
		v18.w = vmax(v4.w,v1.w)
		v1.cur = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v2.b = vshuff(v28.b)
		v11:10.w = vadd(v19:18.w,v23:22.w)
	}
	{
		v30.b = vpacke(v1.h,v3.h)
	}
	{
		v31.b = vpacke(v1.h,v5.h)
		v12 = vor(v14,v30)
	}
	{
		q1 = vand(v12,r18)
		v10.h = vpacke(v11.w,v10.w)
	}
	{
		v12 = vand(q1,r18)
		v8 = vror(v31,r27)
	}
	{
		nop
		v6.b = vpacke(v7.h,v10.h)
	} :endloop0
	.falign
.LBB183_26:                             //   in Loop: Header=BB183_16 Depth=2
	{
		r3 = #0
		v11.b = vpacke(v1.h,v12.h)
	}
	{
		v15.b = vlut32(v6.b,v2.b,r3)
		v13 = vor(v8,v11)
	}
	{
		q1 = vand(v13,r18)
		r6 = #2
		v15.b |= vlut32(v6.b,v2.b,r6)
	}
	{
		r6 = #3
		v15.b |= vlut32(v6.b,v2.b,r6)
	}
	{
		v15.b |= vlut32(v6.b,v2.b,r6)
	}
	{
		v2 = vmux(q1,v15,v1)
		vmem(r1++#1) = v2.new
	}
	.falign
.LBB183_27:                             // %"end for input_bounded.s0.x.x13"
                                        //   in Loop: Header=BB183_16 Depth=2
	{
		r24 = add(r24,r23)
		r15 = add(r15,r21)
		r28 = add(r28,r23)
	}
	{
		r9 = add(r9,#1)
		if (!cmp.eq(r9.new,r12)) jump:t ##.LBB183_16
	}
	.falign
.LBB183_28:                             // %"end for input_bounded.s0.y5"
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r3 = memw(r29+#1280)
		r6 = memw(r29+#372)
	}                                       // 4-byte Folded Reload
	{
		r10 = memw(r29+#632)
	}                                       // 4-byte Folded Reload
	{
		r2 = sub(r3,r8)
	}
	{
		r6 = #0
		r2 = add(r2,r6)
	}
	{
		p2 = cmp.gt(r2,#-17)
		if (!p2.new) jump:nt .LBB183_34
		if (p2.new) r9 = memw(r29+##636)
	}                                       // 4-byte Folded Reload
// %bb.29:                              // %"for input_bounded.s0.y15.preheader"
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r2 = memw(r29+#364)
		r12 = memw(r29+#372)
	}                                       // 4-byte Folded Reload
	{
		r12 = add(r3,add(r12,#17))
		r2 = add(r8,r2)
	}
	{
		r9 += mpyi(r23,r2)
	}
	.falign
.LBB183_30:                             // %"for input_bounded.s0.y15"
                                        //   Parent Loop BB183_4 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB183_32 Depth 3
	{
		r13 = #-1
		p2 = cmp.gt(r20,r8)
		r2 = add(r29,#1920)
		r3 = #1
	}
	{
		r2 = add(r29,#2048)
		v17 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		r2 = memw(r29+#1916)
		v2 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		p1 = r2
		if (!p1.new) jump:nt .LBB183_33
		if (p1.new) r14 = memw(r29+##1912)
	}                                       // 4-byte Folded Reload
// %bb.31:                              // %"for input_bounded.s0.x.x18.preheader"
                                        //   in Loop: Header=BB183_30 Depth=2
	{
		loop0(.LBB183_32,r10)
	}
	{
		p1 = not(p2)
		r2 = mux(p2,r8,r14)
		r15:14 = combine(r9,#-1)
	}
	{
		r2 = max(r2,r6)
		r6 = add(r29,#1664)
	}
	{
		r6 = add(r29,#1536)
		v27 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		r28 = mpyi(r2,r21)
	}
	{
		r6 = add(r29,#2176)
		if (p1) v25 = v11
		if (!p1) v25 = v27
		v11.cur = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		vmem(r6+#0) = v25
	}                                       // 128-byte Folded Spill
	.falign
.Ltmp17:                                // Block address taken
.LBB183_32:                             // %"for input_bounded.s0.x.x18"
                                        //   Parent Loop BB183_4 Depth=1
                                        //     Parent Loop BB183_30 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	{
		v7 = vsplat(r14)
		r2 = add(r14,#1)
		r6 = add(r29,#2304)
		v11 = vmem(r4+#0)
	}
	{
		r1 = min(r2,r19)
		v9 = vsplat(r2)
		r2 = add(r29,#2304)
		v21 = vmem(r7+#0)
	}
	{
		v8 = vor(v9,v11)
		v19 = vor(v9,v21)
		v18 = vor(v9,v10)
		v10.cur = vmem(r25+#0)
	}
	{
		q2 = vcmp.eq(v8.w,v1.w)
		q3 = vcmp.gt(v17.w,v8.w)
		v6 = v7
		v20 = vmem(r5+#0)
	}
	{
		v24 = vand(q2,r18)
		q2 = vcmp.eq(v19.w,v1.w)
		q0 = vcmp.eq(v18.w,v1.w)
		v22 = vor(v9,v20)
	}
	{
		v28 = vand(q2,r18)
		v23 = vand(q0,r18)
		q2 = vcmp.gt(v17.w,v19.w)
		q0 = vcmp.eq(v22.w,v1.w)
	}
	{
		r24 = add(r29,#2304)
		v9:8.w = vadd(v7:6.w,v11:10.w)
		q3 = not(q3)
		q2 = not(q2)
	}
	{
		v25 = vand(q0,r18)
		r14 = add(r14,#128)
		v13:12.w = vadd(v7:6.w,v21:20.w)
		q1 = vcmp.gt(v17.w,v18.w)
	}
	{
		v29 = vand(q3,r18)
		q0 = vcmp.gt(v17.w,v22.w)
		v20.w = vmin(v8.w,v2.w)
		v16 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v31 = vand(q2,r18)
		r2 = add(r29,#2304)
		r6 = add(r29,#2304)
		v8 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		v26.b = vpacke(v1.h,v24.h)
		q0 = not(q0)
		q1 = not(q1)
		v6.w = vmin(v9.w,v2.w)
	}
	{
		r6 = add(r29,#2304)
		v0.b = vpacke(v1.h,v23.h)
		v14.w = vmin(v13.w,v2.w)
		v9 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		r2 = max(r1,r3)
		v16 = vand(q1,r18)
		v3.b = vpacke(v16.h,v29.h)
		v23 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		r24 = add(r29,#2304)
		r1:0 = combine(#2,r28)
		v21.b = vpacke(v23.h,v31.h)
		v15 = vmem(r24+#0)
	}                                       // 128-byte Folded Reload
	{
		r6 = sub(#1,r2)
		v30.b = vpacke(v1.h,v25.h)
		v24.w = vmax(v20.w,v9.w)
		v13 = vmem(r6+#0)
	}                                       // 128-byte Folded Reload
	{
		r0 += add(r16,r2)
		v1 = vand(q0,r18)
		r2 = add(r29,#2304)
		v27.b = vpacke(v1.h,v28.h)
	}
	{
		v15 = vsplat(r6)
		v7 = vror(v26,r27)
		v5.w = vmin(v12.w,v2.w)
		v29.w = vmax(v14.w,v15.w)
	}
	{
		v4.b = vpacke(v8.h,v1.h)
		v10 = vor(v7,v0)
		v23 = v2
		v28.w = vmax(v5.w,v13.w)
	}
	{
		q3 = vand(v10,r18)
		r24 = add(r29,#2304)
		v20 = vror(v21,r27)
		v21 = vmem(r24+#0)
	}                                       // 128-byte Folded Reload
	{
		v18 = vand(q3,r18)
		v11.b = vpacke(v21.h,v16.h)
		v14 = v15
		v22 = vor(v20,v4)
	}
	{
		q2 = vand(v22,r18)
		r6 = #0
		v8 = vror(v3,r27)
	}
	{
		v2 = vror(v27,r27)
		v27:26.w = vadd(v29:28.w,v15:14.w)
		v19 = vor(v8,v11)
	}
	{
		q3 = vand(v19,r18)
		r2 = add(r29,#2304)
		v9 = vor(v2,v30)
		v19 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		q0 = vand(v9,r18)
		v26.h = vpacke(v27.w,v26.w)
		v25.w = vmax(v6.w,v2.w)
		v2.cur = vmem(r24+#0)
	}                                       // 128-byte Folded Reload
	{
		v0 = vand(q0,r18)
		r2 = add(r29,#2304)
		v21:20.w = vadd(v25:24.w,v15:14.w)
		v11 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v31 = vand(q2,r18)
		v4 = vand(q3,r18)
		v13 = vmemu(r0+#0)
	}
	{
		r2 = add(r29,#2304)
		v7.h = vpacke(v21.w,v20.w)
		v2 = v23
		v6 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v1.b = vshuff(v13.b)
	}
	{
		v27.b = vpacke(v26.h,v7.h)
	}
	{
		r2 = add(r29,#2176)
		v5.b = vpacke(v19.h,v18.h)
		v18 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v14.b = vpacke(v18.h,v0.h)
	}
	{
		q0 = vand(v30,r13)
		r2 = #3
		v29.b = vlut32(v27.b,v1.b,r6)
		v30.cur = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v24.b = vpacke(v11.h,v31.h)
	}
	{
		v29.b |= vlut32(v27.b,v1.b,r3)
	}
	{
		v15 = vror(v14,r27)
	}
	{
		v29.b |= vlut32(v27.b,v1.b,r1)
		v28 = vor(v15,v5)
	}
	{
		q2 = vand(v28,r18)
		v25.b = vpacke(v6.h,v4.h)
	}
	{
		v12 = vror(v24,r27)
		q2 = or(q2,q0)
	}
	{
		r2 = add(r29,#2304)
		v29.b |= vlut32(v27.b,v1.b,r2)
		v3 = vor(v12,v25)
	}
	{
		q3 = vand(v3,r18)
	}
	{
		q3 = or(q2,q3)
		v1 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v31 = vmux(q3,v1,v29)
		vmem(r15++#1) = v31.new
	} :endloop0
	.falign
.LBB183_33:                             // %"end for input_bounded.s0.x.x19"
                                        //   in Loop: Header=BB183_30 Depth=2
	{
		r9 = add(r9,r23)
		r8 = add(r8,#1)
		if (!cmp.eq(r8.new,r12)) jump:t .LBB183_30
	}
	.falign
.LBB183_34:                             // %"consume input_bounded"
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r2 = memw(r29+#316)
		r21 = memw(r29+#320)
	}                                       // 4-byte Folded Reload
	{
		p0 = r2
		if (!p0.new) jump:nt .LBB183_37
		if (p0.new) r2 = memw(r29+##292)
	}                                       // 4-byte Folded Reload
// %bb.35:                              // %then_bb22
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r0 = memw(r29+#636)
		r3 = memw(r29+#288)
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r0,r2)
		r4 = memw(r29+#272)
		r5 = memw(r29+#260)
	}                                       // 4-byte Folded Reload
	{
		r4 = add(r0,r4)
		r15 = add(r0,r23)
		r1 = memw(r29+#244)
		r28 = memw(r29+#296)
	}                                       // 4-byte Folded Reload
	{
		r5 = add(r0,r5)
		r3 = add(r0,r3)
		r6 = memw(r29+#284)
		r10 = memw(r29+#240)
	}                                       // 4-byte Folded Reload
	{
		r2 = memw(r29+#256)
		v6 = vmem(r2+#0)
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r0,r2)
		r7 = memw(r29+#268)
		r9 = memw(r29+#280)
	}                                       // 4-byte Folded Reload
	{
		r13 = memw(r29+#252)
		v20 = vmem(r4+#0)
	}                                       // 4-byte Folded Reload
	{
		r8 = memw(r29+#264)
		r14 = memub(r10+#1)
	}                                       // 4-byte Folded Reload
	{
		r13 = add(r0,r13)
		r7 = memub(r28+r7<<#0)
		r9 = memub(r28+r9<<#0)
	}
	{
		r4 = vsplatb(r7)
		r6 = memub(r28+r6<<#0)
		v27 = vmem(r2+#0)
	}
	{
		r7 = vsplatb(r9)
		r9 = vsplatb(r14)
		r2 = memub(r10+#2)
		v25 = vmem(r3+#0)
	}
	{
		r15 = add(r0,#128)
		r3 = memw(r29+#276)
		v11 = vmem(r15+#0)
	}                                       // 4-byte Folded Reload
	{
		r14 = vsplatb(r2)
		r2 = ##16711935
		v21 = vmem(r5+#0)
	}
	{
		v9 = vsplat(r2)
		r8 = memub(r28+r8<<#0)
		v10 = vmem(r13+#0)
	}
	{
		r12 = memub(r1+#1)
		v15 = vmem(r0+#0)
	}
	{
		r5 = vsplatb(r8)
		r3 = vsplatb(r6)
		r28 = memub(r28+r3<<#0)
		r6 = memub(r1+#2)
	}
	{
		r8 = vsplatb(r12)
		r2 = memw(r29+#248)
	}                                       // 4-byte Folded Reload
	{
		r12 = vsplatb(r28)
		r13 = vsplatb(r6)
		r28 = memw(r29+#352)
	}                                       // 4-byte Folded Reload
	{
		loop0(.LBB183_36,r2)
	}
	.falign
.Ltmp18:                                // Block address taken
.LBB183_36:                             // %"for output.s0.x.x"
                                        //   Parent Loop BB183_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	{
		v3:2.uh = vmpy(v15.ub,r3.ub)
		r2 = add(r29,#2176)
		r0 = add(r29,#1152)
		v12 = vmem(r15+#0)
	}
	{
		v3:2.uh += vmpy(v11.ub,r4.ub)
		r1 = add(r29,#1024)
		r20 = add(r28,r22)
		r24 = add(r29,#1280)
	}
	{
		v3:2.uh += vmpy(v10.ub,r5.ub)
		r2 = add(r15,r23)
		v17 = valign(v12,v15,#1)
		vmem(r2+#0) = v12
	}                                       // 128-byte Folded Spill
	{
		v19:18.uh = vmpy(v11.ub,r3.ub)
		r6 = add(r2,r23)
		r15 = add(r15,#128)
		v14 = valign(v12,v15,#2)
	}
	{
		v3:2.uh += vmpy(v17.ub,r7.ub)
		r2 = add(r29,#1408)
		v5 = valign(v29,v11,#1)
		v29.cur = vmem(r2+#0)
	}
	{
		v16 = valign(v15,v10,#1)
		v1 = v29
		v15.cur = vmem(r6+#0)
	}
	{
		v3:2.uh += vmpy(v5.ub,r8.ub)
		r2 = add(r6,r23)
		vmem(r2+#0) = v29
	}                                       // 128-byte Folded Spill
	{
		v19:18.uh += vmpy(v10.ub,r4.ub)
		r6 = add(r2,r23)
		v11 = valign(v1,v11,#2)
		vmem(r24+#0) = v15
	}                                       // 128-byte Folded Spill
	{
		v3:2.uh += vmpy(v16.ub,r9.ub)
		r2 = add(r6,r23)
		v12 = valign(v4,v27,#1)
		v4.cur = vmem(r2+#0)
	}
	{
		v19:18.uh += vmpy(v27.ub,r5.ub)
		r6 = add(r2,r23)
		v0 = vmem(r6+#0)
		vmem(r0+#0) = v4
	}                                       // 128-byte Folded Spill
	{
		v19:18.uh += vmpy(v5.ub,r7.ub)
		r0 = add(r6,r23)
		v17 = valign(v4,v27,#2)
		vmem(r1+#0) = v0
	}                                       // 128-byte Folded Spill
	{
		v3:2.uh += vmpy(v14.ub,r12.ub)
		r2 = add(r20,r22)
		v26 = valign(v0,v21,#1)
		v24 = vmem(r2+#0)
	}
	{
		v1:0.uh = vmpy(v10.ub,r3.ub)
		r6 = add(r0,r21)
		v4 = valign(v0,v21,#2)
		v13 = vmem(r6+#0)
	}
	{
		v3:2.uh += vmpy(v11.ub,r13.ub)
		r0 = add(r6,r23)
		v5 = valign(v15,v10,#2)
		v23 = vmem(r0+#0)
	}
	{
		v1:0.uh += vmpy(v27.ub,r4.ub)
		r11 = add(r2,r22)
		v29 = valign(v24,v20,#1)
		v31 = vmem(r6+#0)
	}
	{
		v3:2.uh += vmpy(v5.ub,r14.ub)
		r6 = add(r0,r23)
		v28 = valign(v13,v25,#1)
		v7 = vmem(r6+#1)
	}
	{
		v1:0.uh += vmpy(v21.ub,r5.ub)
		r24 = add(r6,r23)
		v2.uh = vmin(v2.uh,v9.uh)
		v30.uh = vmin(v3.uh,v9.uh)
	}
	{
		v1:0.uh += vmpy(v16.ub,r7.ub)
		r26 = add(r24,r23)
		v10.b = vshuffe(v30.b,v2.b)
		vmem(r28+#0) = v10.new
	}
	{
		v3:2.uh = vmpy(v27.ub,r3.ub)
		r25 = add(r26,r23)
		v8 = valign(v23,v6,#1)
		v22 = vmem(r0+#0)
	}
	{
		v1:0.uh += vmpy(v12.ub,r8.ub)
		r10 = add(r25,r23)
		v15 = vmem(r6+#0)
		vmem(r29+#5) = v23
	}                                       // 128-byte Folded Spill
	{
		v3:2.uh += vmpy(v21.ub,r4.ub)
		r0 = add(r10,r23)
		v23 = vmem(r0+#1)
		vmem(r29+#6) = v13
	}                                       // 128-byte Folded Spill
	{
		v1:0.uh += vmpy(v26.ub,r9.ub)
		r1 = add(r11,r22)
		v30 = vmem(r6+#1)
		vmem(r29+#7) = v24
	}                                       // 128-byte Folded Spill
	{
		v19:18.uh += vmpy(v16.ub,r8.ub)
		r6 = add(r0,r23)
		r28 = add(r28,#128)
		v10 = vmem(r25+#0)
	}
	{
		v3:2.uh += vmpy(v20.ub,r5.ub)
		v14 = vmem(r26+#1)
	}
	{
		v1:0.uh += vmpy(v5.ub,r12.ub)
	}
	{
		v19:18.uh += vmpy(v12.ub,r9.ub)
	}
	{
		v3:2.uh += vmpy(v12.ub,r7.ub)
		v12 = vmem(r26+#0)
	}
	{
		v1:0.uh += vmpy(v17.ub,r13.ub)
	}
	{
		v1:0.uh += vmpy(v4.ub,r14.ub)
	}
	{
		v19:18.uh += vmpy(v11.ub,r12.ub)
		v16.uh = vmin(v1.uh,v9.uh)
		v0.uh = vmin(v0.uh,v9.uh)
	}
	{
		v3:2.uh += vmpy(v26.ub,r8.ub)
		v1 = valign(v13,v25,#2)
		v11.b = vshuffe(v16.b,v0.b)
	}
	{
		v19:18.uh += vmpy(v5.ub,r13.ub)
		v5 = valign(v24,v20,#2)
	}
	{
		v3:2.uh += vmpy(v29.ub,r9.ub)
	}
	{
		v19:18.uh += vmpy(v17.ub,r14.ub)
	}
	{
		v3:2.uh += vmpy(v17.ub,r12.ub)
		v18.uh = vmin(v18.uh,v9.uh)
		v19.uh = vmin(v19.uh,v9.uh)
	}
	{
		v17:16.uh = vmpy(v21.ub,r3.ub)
		v27.b = vshuffe(v19.b,v18.b)
		vmem(r20+#0) = v27.new
	}
	{
		v17:16.uh += vmpy(v20.ub,r4.ub)
		r2 = add(r1,r22)
		v18 = vmem(r24+#0)
		vmem(r2+#0) = v11
	}
	{
		v17:16.uh += vmpy(v25.ub,r5.ub)
		v19 = vmem(r24+#1)
	}
	{
		v21:20.uh = vmpy(v20.ub,r3.ub)
		v11 = vmem(r25+#1)
	}
	{
		v17:16.uh += vmpy(v26.ub,r7.ub)
	}
	{
		v21:20.uh += vmpy(v25.ub,r4.ub)
	}
	{
		v27:26.uh = vmpy(v25.ub,r3.ub)
	}
	{
		v17:16.uh += vmpy(v29.ub,r8.ub)
	}
	{
		v21:20.uh += vmpy(v6.ub,r5.ub)
	}
	{
		v27:26.uh += vmpy(v6.ub,r4.ub)
	}
	{
		v17:16.uh += vmpy(v28.ub,r9.ub)
	}
	{
		v21:20.uh += vmpy(v29.ub,r7.ub)
	}
	{
		v27:26.uh += vmpy(v31.ub,r5.ub)
	}
	{
		v3:2.uh += vmpy(v4.ub,r13.ub)
	}
	{
		v17:16.uh += vmpy(v4.ub,r12.ub)
		v4 = valign(v7,v31,#1)
	}
	{
		v21:20.uh += vmpy(v28.ub,r8.ub)
		v7 = valign(v7,v31,#2)
	}
	{
		v27:26.uh += vmpy(v28.ub,r7.ub)
	}
	{
		v21:20.uh += vmpy(v8.ub,r9.ub)
	}
	{
		v27:26.uh += vmpy(v8.ub,r8.ub)
	}
	{
		v17:16.uh += vmpy(v5.ub,r13.ub)
	}
	{
		v21:20.uh += vmpy(v5.ub,r12.ub)
	}
	{
		v29:28.uh = vmpy(v6.ub,r3.ub)
	}
	{
		v27:26.uh += vmpy(v4.ub,r9.ub)
	}
	{
		v29:28.uh += vmpy(v31.ub,r4.ub)
	}
	{
		v17:16.uh += vmpy(v1.ub,r14.ub)
	}
	{
		v21:20.uh += vmpy(v1.ub,r13.ub)
	}
	{
		v27:26.uh += vmpy(v1.ub,r12.ub)
	}
	{
		v1:0.uh = vmpy(v31.ub,r3.ub)
		v31 = valign(v23,v22,#1)
	}
	{
		v29:28.uh += vmpy(v22.ub,r5.ub)
	}
	{
		v1:0.uh += vmpy(v22.ub,r4.ub)
	}
	{
		v29:28.uh += vmpy(v8.ub,r7.ub)
		v8 = vmem(r29+#5)
	}                                       // 128-byte Folded Reload
	{
		v1:0.uh += vmpy(v15.ub,r5.ub)
		v13 = valign(v8,v6,#2)
		v6 = v8
	}
	{
		v29:28.uh += vmpy(v4.ub,r8.ub)
	}
	{
		v1:0.uh += vmpy(v4.ub,r7.ub)
		v4 = valign(v30,v15,#1)
	}
	{
		v3:2.uh += vmpy(v5.ub,r14.ub)
		v5 = valign(v23,v22,#2)
	}
	{
		v25:24.uh = vmpy(v22.ub,r3.ub)
		v2.uh = vmin(v2.uh,v9.uh)
		v3.uh = vmin(v3.uh,v9.uh)
	}
	{
		v29:28.uh += vmpy(v31.ub,r9.ub)
	}
	{
		v1:0.uh += vmpy(v31.ub,r8.ub)
	}
	{
		v27:26.uh += vmpy(v13.ub,r13.ub)
	}
	{
		v29:28.uh += vmpy(v13.ub,r12.ub)
	}
	{
		v25:24.uh += vmpy(v15.ub,r4.ub)
	}
	{
		v1:0.uh += vmpy(v4.ub,r9.ub)
	}
	{
		v27:26.uh += vmpy(v7.ub,r14.ub)
	}
	{
		v25:24.uh += vmpy(v18.ub,r5.ub)
		v26.uh = vmin(v26.uh,v9.uh)
		v27.uh = vmin(v27.uh,v9.uh)
	}
	{
		v29:28.uh += vmpy(v7.ub,r13.ub)
	}
	{
		v1:0.uh += vmpy(v7.ub,r12.ub)
		v7 = valign(v30,v15,#2)
		v30.b = vshuffe(v3.b,v2.b)
	}
	{
		v23:22.uh = vmpy(v15.ub,r3.ub)
		v15 = valign(v19,v18,#1)
		vmem(r11+#0) = v30
	}
	{
		v25:24.uh += vmpy(v31.ub,r7.ub)
		v2 = valign(v19,v18,#2)
		v3 = vmem(r10+#0)
	}
	{
		v23:22.uh += vmpy(v18.ub,r4.ub)
	}
	{
		v31:30.uh = vmpy(v18.ub,r3.ub)
	}
	{
		v25:24.uh += vmpy(v4.ub,r8.ub)
	}
	{
		v23:22.uh += vmpy(v12.ub,r5.ub)
	}
	{
		v31:30.uh += vmpy(v12.ub,r4.ub)
	}
	{
		v19:18.uh = vmpy(v12.ub,r3.ub)
	}
	{
		v21:20.uh += vmpy(v13.ub,r14.ub)
		v13 = valign(v14,v12,#1)
	}
	{
		v25:24.uh += vmpy(v15.ub,r9.ub)
		v20.uh = vmin(v20.uh,v9.uh)
		v21.uh = vmin(v21.uh,v9.uh)
	}
	{
		v23:22.uh += vmpy(v4.ub,r7.ub)
	}
	{
		v31:30.uh += vmpy(v10.ub,r5.ub)
	}
	{
		v19:18.uh += vmpy(v10.ub,r4.ub)
	}
	{
		v29:28.uh += vmpy(v5.ub,r14.ub)
	}
	{
		v1:0.uh += vmpy(v5.ub,r13.ub)
		v28.uh = vmin(v28.uh,v9.uh)
		v29.uh = vmin(v29.uh,v9.uh)
	}
	{
		v25:24.uh += vmpy(v5.ub,r12.ub)
		v5 = valign(v14,v12,#2)
		v12.uh = vmin(v17.uh,v9.uh)
	}
	{
		v23:22.uh += vmpy(v15.ub,r8.ub)
		v17 = valign(v11,v10,#1)
		v14.uh = vmin(v16.uh,v9.uh)
	}
	{
		v31:30.uh += vmpy(v15.ub,r7.ub)
		v16.b = vshuffe(v12.b,v14.b)
		vmem(r1+#0) = v16.new
	}
	{
		v19:18.uh += vmpy(v3.ub,r5.ub)
		v4 = valign(v14,v3,#1)
		v14.cur = vmem(r10+#1)
	}
	{
		v23:22.uh += vmpy(v13.ub,r9.ub)
		v15 = vmem(r0+#1)
	}
	{
		v31:30.uh += vmpy(v13.ub,r8.ub)
	}
	{
		v19:18.uh += vmpy(v13.ub,r7.ub)
	}
	{
		v13:12.uh = vmpy(v10.ub,r3.ub)
		v10 = valign(v11,v10,#2)
		v11 = vmem(r0+#0)
	}
	{
		v13:12.uh += vmpy(v3.ub,r4.ub)
	}
	{
		v25:24.uh += vmpy(v7.ub,r13.ub)
	}
	{
		v23:22.uh += vmpy(v7.ub,r12.ub)
	}
	{
		v31:30.uh += vmpy(v17.ub,r9.ub)
	}
	{
		v13:12.uh += vmpy(v11.ub,r5.ub)
	}
	{
		v1:0.uh += vmpy(v7.ub,r14.ub)
		r2 = add(r2,r22)
		v7.b = vshuffe(v21.b,v20.b)
		vmem(r2+#0) = v7.new
	}
	{
		v25:24.uh += vmpy(v2.ub,r14.ub)
		v0.uh = vmin(v0.uh,v9.uh)
		v1.uh = vmin(v1.uh,v9.uh)
	}
	{
		v23:22.uh += vmpy(v2.ub,r13.ub)
		v20.b = vshuffe(v1.b,v0.b)
		v24.uh = vmin(v24.uh,v9.uh)
	}
	{
		v31:30.uh += vmpy(v2.ub,r12.ub)
		v2 = valign(v15,v11,#1)
		v25.uh = vmin(v25.uh,v9.uh)
	}
	{
		v19:18.uh += vmpy(v17.ub,r8.ub)
	}
	{
		v13:12.uh += vmpy(v17.ub,r7.ub)
	}
	{
		v17:16.uh = vmpy(v3.ub,r3.ub)
		v3 = valign(v14,v3,#2)
		v14 = vmem(r6+#1)
	}
	{
		v19:18.uh += vmpy(v4.ub,r9.ub)
	}
	{
		v13:12.uh += vmpy(v4.ub,r8.ub)
	}
	{
		v23:22.uh += vmpy(v5.ub,r14.ub)
	}
	{
		v31:30.uh += vmpy(v5.ub,r13.ub)
		v22.uh = vmin(v22.uh,v9.uh)
		v23.uh = vmin(v23.uh,v9.uh)
	}
	{
		v19:18.uh += vmpy(v5.ub,r12.ub)
		r2 = add(r2,r22)
		v5.b = vshuffe(v27.b,v26.b)
		vmem(r2+#0) = v5.new
	}
	{
		v13:12.uh += vmpy(v2.ub,r9.ub)
		r0 = add(r2,r22)
		v26.b = vshuffe(v25.b,v24.b)
		v27.b = vshuffe(v23.b,v22.b)
	}
	{
		v17:16.uh += vmpy(v11.ub,r4.ub)
		v25 = vmem(r29+#6)
	}                                       // 128-byte Folded Reload
	{
		v31:30.uh += vmpy(v10.ub,r14.ub)
	}
	{
		v19:18.uh += vmpy(v10.ub,r13.ub)
		v30.uh = vmin(v30.uh,v9.uh)
		v31.uh = vmin(v31.uh,v9.uh)
	}
	{
		v13:12.uh += vmpy(v10.ub,r12.ub)
		v10 = vmem(r6+#0)
	}
	{
		v17:16.uh += vmpy(v10.ub,r5.ub)
	}
	{
		v17:16.uh += vmpy(v4.ub,r7.ub)
		r2 = add(r6,r23)
		v4.b = vshuffe(v29.b,v28.b)
		vmem(r2+#0) = v4.new
	}
	{
		v17:16.uh += vmpy(v2.ub,r8.ub)
		r6 = add(r0,r22)
		v7 = valign(v14,v10,#1)
		vmem(r0+#0) = v20
	}
	{
		v19:18.uh += vmpy(v3.ub,r14.ub)
		r0 = add(r6,r22)
		v28 = valign(v14,v10,#2)
		v21 = vmem(r2+#0)
	}
	{
		v5:4.uh = vmpy(v11.ub,r3.ub)
		r6 = add(r0,r22)
		v11 = valign(v15,v11,#2)
		vmem(r6+#0) = v26
	}
	{
		v17:16.uh += vmpy(v7.ub,r9.ub)
		r2 = add(r6,r22)
		v15 = vmem(r2+#1)
		vmem(r0+#0) = v27
	}
	{
		v13:12.uh += vmpy(v3.ub,r13.ub)
		v18.uh = vmin(v18.uh,v9.uh)
		v19.uh = vmin(v19.uh,v9.uh)
	}
	{
		v17:16.uh += vmpy(v3.ub,r12.ub)
		v3.b = vshuffe(v31.b,v30.b)
		vmem(r6+#0) = v3.new
	}
	{
		v13:12.uh += vmpy(v11.ub,r14.ub)
		v30 = valign(v15,v21,#2)
	}
	{
		v5:4.uh += vmpy(v10.ub,r4.ub)
		r2 = add(r2,r22)
		v10.b = vshuffe(v19.b,v18.b)
		vmem(r2+#0) = v10.new
	}
	{
		v17:16.uh += vmpy(v11.ub,r13.ub)
		v12.uh = vmin(v12.uh,v9.uh)
		v13.uh = vmin(v13.uh,v9.uh)
	}
	{
		v17:16.uh += vmpy(v28.ub,r14.ub)
		r2 = add(r2,r22)
		v31.b = vshuffe(v13.b,v12.b)
		vmem(r2+#0) = v31.new
	}
	{
		v5:4.uh += vmpy(v21.ub,r5.ub)
		r6 = add(r2,r22)
		v16.uh = vmin(v16.uh,v9.uh)
		v17.uh = vmin(v17.uh,v9.uh)
	}
	{
		v5:4.uh += vmpy(v2.ub,r7.ub)
		r2 = add(r29,#2176)
		v20.b = vshuffe(v17.b,v16.b)
		vmem(r2+#0) = v20.new
	}
	{
		v5:4.uh += vmpy(v7.ub,r8.ub)
		v2 = valign(v15,v21,#1)
		v20 = vmem(r29+#7)
	}                                       // 128-byte Folded Reload
	{
		r2 = add(r29,#1408)
		v15 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v5:4.uh += vmpy(v2.ub,r9.ub)
	}
	{
		v5:4.uh += vmpy(v11.ub,r12.ub)
		r2 = add(r29,#1280)
		v11 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v5:4.uh += vmpy(v28.ub,r13.ub)
	}
	{
		v5:4.uh += vmpy(v30.ub,r14.ub)
		r2 = add(r29,#1152)
		v10 = vmem(r2+#0)
	}                                       // 128-byte Folded Reload
	{
		v4.uh = vmin(v4.uh,v9.uh)
		v5.uh = vmin(v5.uh,v9.uh)
	}
	{
		r2 = add(r29,#1024)
		v24.b = vshuffe(v5.b,v4.b)
		v27 = vmem(r2+#0)
		vmem(r6+#0) = v24.new
	}                                       // 128-byte Folded Reload
	{
		nop
		v21 = vmem(r2+#0)
	} :endloop0                             // 128-byte Folded Reload
	.falign
.LBB183_37:                             // %after_bb21
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r6 = #0
		r7 = memw(r29+#348)
		r2 = memw(r29+#356)
	}                                       // 4-byte Folded Reload
	{
		r7 = add(r7,#1)
		r0 = memw(r29+#328)
		r3 = memw(r29+#312)
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r2,#16)
		r1 = memw(r29+#360)
		memw(r29+#356) = r2.new
	}                                       // 4-byte Folded Reload
	{
		p1 = cmp.eq(r7,r0)
		r0 = memw(r29+#368)
		r26 = memw(r29+#344)
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r1,#16)
		r1 = memw(r29+#364)
		memw(r29+#360) = r2.new
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r0,#-16)
		r20 = memw(r29+#332)
		memw(r29+#368) = r2.new
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r1,#-16)
		r0 = memw(r29+#352)
		r24 = memw(r29+#632)
	}                                       // 4-byte Folded Reload
	{
		r21 = memw(r29+#300)
		memw(r29+#364) = r2
	}                                       // 4-byte Folded Reload
	{
		r2 = add(r0,r3)
		if (!p1) jump:nt .LBB183_4
		memw(r29+#352) = r2.new
	}                                       // 4-byte Folded Spill
	{
		jump .LBB183_42
	}
	.falign
.LBB183_38:                             // %if.then.i88
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r2 = p3
		r1 = memw(r29+#636)
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#2176) = r2
	}                                       // 4-byte Folded Spill
	{
		if (!p0.new) r0 = add(r20,#0)
		p0 = cmp.eq(r1,#0); if (p0.new) jump:nt .LBB183_40
	}
// %bb.39:                              // %if.then2.i
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		call ##halide_free
	}
	.falign
.LBB183_40:                             // %if.end.i
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r0 = r20
		r20 = memw(r29+#340)
	}                                       // 4-byte Folded Reload
	{
		call ##halide_malloc
		r1 = r20
	}
	.falign
// %bb.41:                              // %if.end.i
                                        //   in Loop: Header=BB183_4 Depth=1
	{
		r0 = add(r29,#2304)
		r6 = #0
		r2 = memw(r29+#2176)
		memw(r29+#636) = r0
	}                                       // 4-byte Folded Reload
	{
		r20 = r24
		r5 = #1
		r7 = memw(r29+#1280)
		memw(r29+#336) = r20
	}                                       // 4-byte Folded Reload
	{
		p3 = r2
		r24 = memw(r29+#632)
		v1 = vmem(r0+#0)
	}                                       // 128-byte Folded Reload
	{
		jump .LBB183_8
		r9 = memw(r29+#1408)
	}                                       // 4-byte Folded Reload
	.falign
.LBB183_42:                             // %if.then.i
	{
		r2 = add(r29,#2508)
		r1 = memw(r29+#636)
		r16 = memw(r29+#232)
	}                                       // 4-byte Folded Reload
	{
		memw(r29+#2504) = r1
	}
	{
		if (!p0.new) r0 = add(r16,#0)
		p0 = cmp.eq(r1,#0); if (p0.new) jump:nt .LBB183_44
		memw(r2+#0) = #0
	}
// %bb.43:                              // %if.then.i234
	{
		call ##halide_free
	}
	.falign
.LBB183_44:                             // %pseudostack_free.exit
	{
		r18 = #0
		r2 = add(r29,#2504)
	}
	{
		memw(r2+#0) = #0
	}
	.falign
.LBB183_45:                             // %if.then.i86
	{
		call ##halide_qurt_hvx_unlock_as_destructor
		r1:0 = combine(#1,r16)
	}
	.falign
.LBB183_46:                             // %call_destructor.exit87
	{
		r0 = r18
		r17:16 = memd(r30+#-8)
		r19:18 = memd(r30+#-16)
	}                                       // 8-byte Folded Reload
	{
		r21:20 = memd(r30+#-24)
		r23:22 = memd(r30+#-32)
	}                                       // 8-byte Folded Reload
	{
		r25:24 = memd(r30+#-40)
		r27:26 = memd(r30+#-48)
	}                                       // 8-byte Folded Reload
	{
		r31:30 = dealloc_return(r30):raw
	}
	.falign
.LBB183_47:                             // %destructor_block
	{
		r1 = add(pc,##.Lstr.125@PCREL)
		r3:2 = combine(#18,#0)
		r16 = memw(r29+#232)
	}                                       // 4-byte Folded Reload
	{
		r2 = max(r23,r2)
		r4 = memw(r29+#336)
		memw(r29+#2508) = r4.new
	}                                       // 4-byte Folded Reload
	{
		r5 = #0
		r4 = ##2147483647
		r0 = r16
	}
	{
		r3:2 = mpyu(r2,r3)
		r6 = memw(r29+#636)
		memw(r29+#2504) = r6.new
	}                                       // 4-byte Folded Reload
	{
		call ##halide_error_buffer_allocation_too_large
	}
	.falign
// %bb.48:                              // %destructor_block
	{
		r18 = r0 ; jump .LBB183_45
	}
	.falign
.LBB183_49:
	{
		r18 = #0 ; jump .LBB183_45
		r16 = memw(r29+#232)
	}                                       // 4-byte Folded Reload
.Ltmp19:                                // Address of block that was removed by CodeGen
.Lfunc_end183:
	.size	conv3x3_halide.par_for.output.s0.y.yo, .Lfunc_end183-conv3x3_halide.par_for.output.s0.y.yo
	.cfi_endproc
                                        // -- End function
	.section	.text.conv3x3_halide_argv,"ax",@progbits
	.globl	conv3x3_halide_argv             // -- Begin function conv3x3_halide_argv
	.balign 32
	.type	conv3x3_halide_argv,@function
conv3x3_halide_argv:                    // @conv3x3_halide_argv
// %bb.0:                               // %entry
	{
		r3 = memw(r0+#0)
		r2 = memw(r0+#8)
	}
	{
		r1 = memw(r0+#4)
	}
	{
		r0 = r3 ; jump ##conv3x3_halide
	}
.Lfunc_end184:
	.size	conv3x3_halide_argv, .Lfunc_end184-conv3x3_halide_argv
                                        // -- End function
	.section	.text.conv3x3_halide_metadata,"ax",@progbits
	.globl	conv3x3_halide_metadata         // -- Begin function conv3x3_halide_metadata
	.balign 32
	.type	conv3x3_halide_metadata,@function
conv3x3_halide_metadata:                // @conv3x3_halide_metadata
// %bb.0:                               // %entry
	{
		r0 = add(pc,##.Lconv3x3_halide_metadata_storage@PCREL)
		jumpr r31
	}
.Lfunc_end185:
	.size	conv3x3_halide_metadata, .Lfunc_end185-conv3x3_halide_metadata
                                        // -- End function
	.type	malloc_tracing,@object          // @malloc_tracing
	.section	.bss,"aw",@nobits
	.weak	malloc_tracing
	.p2align	2
malloc_tracing:
	.word	0                               // 0x0
	.size	malloc_tracing, 4

	.type	_ZN6Halide7Runtime8Internal11buf_is_usedE,@object // @_ZN6Halide7Runtime8Internal11buf_is_usedE
	.weak	_ZN6Halide7Runtime8Internal11buf_is_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal11buf_is_usedE:
	.space	40
	.size	_ZN6Halide7Runtime8Internal11buf_is_usedE, 40

	.type	_ZN6Halide7Runtime8Internal7mem_bufE,@object // @_ZN6Halide7Runtime8Internal7mem_bufE
	.weak	_ZN6Halide7Runtime8Internal7mem_bufE
	.p2align	2
_ZN6Halide7Runtime8Internal7mem_bufE:
	.space	40
	.size	_ZN6Halide7Runtime8Internal7mem_bufE, 40

	.type	_ZN6Halide7Runtime8Internal13custom_mallocE,@object // @_ZN6Halide7Runtime8Internal13custom_mallocE
	.data
	.weak	_ZN6Halide7Runtime8Internal13custom_mallocE
	.p2align	2
_ZN6Halide7Runtime8Internal13custom_mallocE:
	.word	halide_default_malloc
	.size	_ZN6Halide7Runtime8Internal13custom_mallocE, 4

	.type	_ZN6Halide7Runtime8Internal11custom_freeE,@object // @_ZN6Halide7Runtime8Internal11custom_freeE
	.weak	_ZN6Halide7Runtime8Internal11custom_freeE
	.p2align	2
_ZN6Halide7Runtime8Internal11custom_freeE:
	.word	halide_default_free
	.size	_ZN6Halide7Runtime8Internal11custom_freeE, 4

	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.8,"aMS",@progbits,1
	.p2align	3
.L.str:
	.string	"custom allocators not supported on Hexagon.\n"
	.size	.L.str, 45

	.section	.dtors,"aw",@progbits
	.p2align	2
	.word	_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv
	.word	halide_thread_pool_cleanup
	.type	_ZN6Halide7Runtime8Internal27custom_malloc_tracing_allocE,@object // @_ZN6Halide7Runtime8Internal27custom_malloc_tracing_allocE
	.data
	.weak	_ZN6Halide7Runtime8Internal27custom_malloc_tracing_allocE
	.p2align	2
_ZN6Halide7Runtime8Internal27custom_malloc_tracing_allocE:
	.word	hexagon_default_malloc_tracing_alloc
	.size	_ZN6Halide7Runtime8Internal27custom_malloc_tracing_allocE, 4

	.type	_ZN6Halide7Runtime8Internal34custom_malloc_tracing_failed_allocE,@object // @_ZN6Halide7Runtime8Internal34custom_malloc_tracing_failed_allocE
	.weak	_ZN6Halide7Runtime8Internal34custom_malloc_tracing_failed_allocE
	.p2align	2
_ZN6Halide7Runtime8Internal34custom_malloc_tracing_failed_allocE:
	.word	hexagon_default_malloc_tracing_failed_alloc
	.size	_ZN6Halide7Runtime8Internal34custom_malloc_tracing_failed_allocE, 4

	.type	_ZN6Halide7Runtime8Internal33custom_malloc_tracing_log_requestE,@object // @_ZN6Halide7Runtime8Internal33custom_malloc_tracing_log_requestE
	.weak	_ZN6Halide7Runtime8Internal33custom_malloc_tracing_log_requestE
	.p2align	2
_ZN6Halide7Runtime8Internal33custom_malloc_tracing_log_requestE:
	.word	hexagon_default_malloc_tracing_log_request
	.size	_ZN6Halide7Runtime8Internal33custom_malloc_tracing_log_requestE, 4

	.type	_ZN6Halide7Runtime8Internal26custom_malloc_tracing_freeE,@object // @_ZN6Halide7Runtime8Internal26custom_malloc_tracing_freeE
	.weak	_ZN6Halide7Runtime8Internal26custom_malloc_tracing_freeE
	.p2align	2
_ZN6Halide7Runtime8Internal26custom_malloc_tracing_freeE:
	.word	hexagon_default_malloc_tracing_free
	.size	_ZN6Halide7Runtime8Internal26custom_malloc_tracing_freeE, 4

	.type	halide_qurt_default_thread_priority,@object // @halide_qurt_default_thread_priority
	.weak	halide_qurt_default_thread_priority
	.p2align	1
halide_qurt_default_thread_priority:
	.half	100                             // 0x64
	.size	halide_qurt_default_thread_priority, 2

	.type	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE,@object // @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal15Synchronization13table_storageE:
	.space	12288
	.size	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE, 12288

	.type	_ZN6Halide7Runtime8Internal10work_queueE,@object // @_ZN6Halide7Runtime8Internal10work_queueE
	.weak	_ZN6Halide7Runtime8Internal10work_queueE
	.p2align	2
_ZN6Halide7Runtime8Internal10work_queueE:
	.space	1080
	.size	_ZN6Halide7Runtime8Internal10work_queueE, 1080

	.type	_ZN6Halide7Runtime8Internal14custom_do_taskE,@object // @_ZN6Halide7Runtime8Internal14custom_do_taskE
	.data
	.weak	_ZN6Halide7Runtime8Internal14custom_do_taskE
	.p2align	2
_ZN6Halide7Runtime8Internal14custom_do_taskE:
	.word	halide_default_do_task
	.size	_ZN6Halide7Runtime8Internal14custom_do_taskE, 4

	.type	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE,@object // @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.weak	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.p2align	2
_ZN6Halide7Runtime8Internal19custom_do_loop_taskE:
	.word	halide_default_do_loop_task
	.size	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, 4

	.type	_ZN6Halide7Runtime8Internal17custom_do_par_forE,@object // @_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.weak	_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.p2align	2
_ZN6Halide7Runtime8Internal17custom_do_par_forE:
	.word	halide_default_do_par_for
	.size	_ZN6Halide7Runtime8Internal17custom_do_par_forE, 4

	.type	.L.str.9,@object                // @.str.9
	.section	.rodata.str1.8,"aMS",@progbits,1
	.p2align	3
.L.str.9:
	.string	"/local/mnt/workspace/bots/aus-builder-05-1/halide-24/src/halide/src/runtime/synchronization_common.h:395 Assert failed: next != nullptr\n"
	.size	.L.str.9, 137

	.type	.L.str.6,@object                // @.str.6
	.p2align	3
.L.str.6:
	.string	"/local/mnt/workspace/bots/aus-builder-05-1/halide-24/src/halide/src/runtime/synchronization_common.h:1116 Assert failed: val & 0x1\n"
	.size	.L.str.6, 132

	.type	.L.str.7,@object                // @.str.7
	.p2align	3
.L.str.7:
	.string	"/local/mnt/workspace/bots/aus-builder-05-1/halide-24/src/halide/src/runtime/thread_pool_common.h:153 Assert failed: bytes == limit && \"Logic error in thread pool work queue initialization.\\n\"\n"
	.size	.L.str.7, 193

	.type	.L.str.3,@object                // @.str.3
	.p2align	3
.L.str.3:
	.string	"/local/mnt/workspace/bots/aus-builder-05-1/halide-24/src/halide/src/runtime/thread_pool_common.h:520 Assert failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \"Logic error: thread over commit.\\n\"\n"
	.size	.L.str.3, 270

	.type	.L.str.1,@object                // @.str.1
	.p2align	3
.L.str.1:
	.string	"HL_NUM_THREADS"
	.size	.L.str.1, 15

	.type	.L.str.2,@object                // @.str.2
	.p2align	3
.L.str.2:
	.string	"HL_NUMTHREADS"
	.size	.L.str.2, 14

	.type	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE,@object // @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.data
	.weak	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.p2align	2
_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE:
	.word	halide_default_do_parallel_tasks
	.size	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, 4

	.type	_ZN6Halide7Runtime8Internal21custom_semaphore_initE,@object // @_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.weak	_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.p2align	2
_ZN6Halide7Runtime8Internal21custom_semaphore_initE:
	.word	halide_default_semaphore_init
	.size	_ZN6Halide7Runtime8Internal21custom_semaphore_initE, 4

	.type	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE,@object // @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.weak	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.p2align	2
_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE:
	.word	halide_default_semaphore_try_acquire
	.size	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, 4

	.type	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE,@object // @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.weak	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.p2align	2
_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE:
	.word	halide_default_semaphore_release
	.size	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, 4

	.type	.L.str.4,@object                // @.str.4
	.section	.rodata.str1.8,"aMS",@progbits,1
	.p2align	3
.L.str.4:
	.string	"halide_set_num_threads: must be >= 0."
	.size	.L.str.4, 38

	.type	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE,@object // @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_gpu_deviceE:
	.word	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE,@object // @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.weak	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, 1

	.type	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE,@object // @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, 1

	.type	.L.str.12,@object               // @.str.12
	.section	.rodata.str1.8,"aMS",@progbits,1
	.p2align	3
.L.str.12:
	.string	"HL_GPU_DEVICE"
	.size	.L.str.12, 14

	.type	.L.str.13,@object               // @.str.13
	.p2align	3
.L.str.13:
	.string	"-nan"
	.size	.L.str.13, 5

	.type	.L.str.1.14,@object             // @.str.1.14
	.p2align	3
.L.str.1.14:
	.string	"nan"
	.size	.L.str.1.14, 4

	.type	.L.str.2.15,@object             // @.str.2.15
	.p2align	3
.L.str.2.15:
	.string	"-inf"
	.size	.L.str.2.15, 5

	.type	.L.str.3.16,@object             // @.str.3.16
	.p2align	3
.L.str.3.16:
	.string	"inf"
	.size	.L.str.3.16, 4

	.type	.L.str.4.17,@object             // @.str.4.17
	.p2align	3
.L.str.4.17:
	.string	"-0.000000e+00"
	.size	.L.str.4.17, 14

	.type	.L.str.5,@object                // @.str.5
	.p2align	3
.L.str.5:
	.string	"0.000000e+00"
	.size	.L.str.5, 13

	.type	.L.str.6.18,@object             // @.str.6.18
	.p2align	3
.L.str.6.18:
	.string	"-0.000000"
	.size	.L.str.6.18, 10

	.type	.L.str.7.19,@object             // @.str.7.19
	.p2align	3
.L.str.7.19:
	.string	"0.000000"
	.size	.L.str.7.19, 9

	.type	.L.str.8,@object                // @.str.8
	.p2align	3
.L.str.8:
	.string	"-"
	.size	.L.str.8, 2

	.type	.L.str.10,@object               // @.str.10
	.p2align	3
.L.str.10:
	.string	"e+"
	.size	.L.str.10, 3

	.type	.L.str.11,@object               // @.str.11
	.p2align	3
.L.str.11:
	.string	"e-"
	.size	.L.str.11, 3

	.type	.L.str.12.21,@object            // @.str.12.21
	.p2align	3
.L.str.12.21:
	.string	"0123456789abcdef"
	.size	.L.str.12.21, 17

	.type	.L.str.17,@object               // @.str.17
	.p2align	3
.L.str.17:
	.string	"bad_type_code"
	.size	.L.str.17, 14

	.type	.L.str.16,@object               // @.str.16
	.p2align	3
.L.str.16:
	.string	"handle"
	.size	.L.str.16, 7

	.type	.L.str.15,@object               // @.str.15
	.p2align	3
.L.str.15:
	.string	"float"
	.size	.L.str.15, 6

	.type	.L.str.14,@object               // @.str.14
	.p2align	3
.L.str.14:
	.string	"uint"
	.size	.L.str.14, 5

	.type	.L.str.13.22,@object            // @.str.13.22
	.p2align	3
.L.str.13.22:
	.string	"int"
	.size	.L.str.13.22, 4

	.type	.L.str.18,@object               // @.str.18
	.p2align	3
.L.str.18:
	.string	"x"
	.size	.L.str.18, 2

	.type	.L.str.19,@object               // @.str.19
	.p2align	3
.L.str.19:
	.string	"nullptr"
	.size	.L.str.19, 8

	.type	.L.str.20,@object               // @.str.20
	.p2align	3
.L.str.20:
	.string	"buffer("
	.size	.L.str.20, 8

	.type	.L.str.22,@object               // @.str.22
	.p2align	3
.L.str.22:
	.string	", {"
	.size	.L.str.22, 4

	.type	.L.str.23,@object               // @.str.23
	.p2align	3
.L.str.23:
	.string	"}"
	.size	.L.str.23, 2

	.type	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE,@object // @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	.data
	.weak	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE:
	.byte	1                               // 0x1
	.size	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, 1

	.type	_ZN6Halide7Runtime8Internal21allocation_pools_lockE,@object // @_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal21allocation_pools_lockE:
	.space	4
	.size	_ZN6Halide7Runtime8Internal21allocation_pools_lockE, 4

	.type	_ZN6Halide7Runtime8Internal23device_allocation_poolsE,@object // @_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.weak	_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.p2align	2
_ZN6Halide7Runtime8Internal23device_allocation_poolsE:
	.word	0
	.size	_ZN6Halide7Runtime8Internal23device_allocation_poolsE, 4

	.type	_ZN6Halide7Runtime8Internal17device_copy_mutexE,@object // @_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.weak	_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.p2align	2
_ZN6Halide7Runtime8Internal17device_copy_mutexE:
	.space	4
	.size	_ZN6Halide7Runtime8Internal17device_copy_mutexE, 4

	.type	.L.str.6.23,@object             // @.str.6.23
	.section	.rodata.str1.8,"aMS",@progbits,1
	.p2align	3
.L.str.6.23:
	.string	"halide_copy_to_host"
	.size	.L.str.6.23, 20

	.type	.L.str.7.24,@object             // @.str.7.24
	.p2align	3
.L.str.7.24:
	.string	"halide_copy_to_device"
	.size	.L.str.7.24, 22

	.type	.L.str.9.25,@object             // @.str.9.25
	.p2align	3
.L.str.9.25:
	.string	"halide_copy_to_device does not support switching interfaces\n"
	.size	.L.str.9.25, 61

	.type	.L.str.17.26,@object            // @.str.17.26
	.p2align	3
.L.str.17.26:
	.string	"halide_device_malloc"
	.size	.L.str.17.26, 21

	.type	.L.str.20.27,@object            // @.str.20.27
	.p2align	3
.L.str.20.27:
	.string	"halide_device_malloc doesn't support switching interfaces\n"
	.size	.L.str.20.27, 59

	.type	.L.str.16.28,@object            // @.str.16.28
	.p2align	3
.L.str.16.28:
	.string	"halide_device_sync"
	.size	.L.str.16.28, 19

	.type	.L.str.21.29,@object            // @.str.21.29
	.p2align	3
.L.str.21.29:
	.string	"halide_device_free"
	.size	.L.str.21.29, 19

	.type	.L.str.22.30,@object            // @.str.22.30
	.p2align	3
.L.str.22.30:
	.string	"/local/mnt/workspace/bots/aus-builder-05-1/halide-24/src/halide/src/runtime/device_interface.cpp:252 Assert failed: buf->device == 0\n"
	.size	.L.str.22.30, 134

	.type	.L.str.23.31,@object            // @.str.23.31
	.p2align	3
.L.str.23.31:
	.string	"halide_device_and_host_malloc"
	.size	.L.str.23.31, 30

	.type	.L.str.25,@object               // @.str.25
	.p2align	3
.L.str.25:
	.string	"halide_device_and_host_malloc doesn't support switching interfaces\n"
	.size	.L.str.25, 68

	.type	.L.str.26,@object               // @.str.26
	.p2align	3
.L.str.26:
	.string	"allocating host and device memory failed\n"
	.size	.L.str.26, 42

	.type	.L.str.27,@object               // @.str.27
	.p2align	3
.L.str.27:
	.string	"halide_device_and_host_free"
	.size	.L.str.27, 28

	.type	.L.str.28,@object               // @.str.28
	.p2align	3
.L.str.28:
	.string	"/local/mnt/workspace/bots/aus-builder-05-1/halide-24/src/halide/src/runtime/device_interface.cpp:317 Assert failed: buf->device == 0\n"
	.size	.L.str.28, 134

	.type	.L.str.29,@object               // @.str.29
	.p2align	3
.L.str.29:
	.string	"halide_default_device_and_host_malloc"
	.size	.L.str.29, 38

	.type	.L.str.30,@object               // @.str.30
	.p2align	3
.L.str.30:
	.string	"halide_default_device_and_host_free"
	.size	.L.str.30, 36

	.type	.L.str.31,@object               // @.str.31
	.p2align	3
.L.str.31:
	.string	"halide_device_wrap_native"
	.size	.L.str.31, 26

	.type	.L.str.32,@object               // @.str.32
	.p2align	3
.L.str.32:
	.string	"halide_device_wrap_native doesn't support switching interfaces\n"
	.size	.L.str.32, 64

	.type	.L.str.33,@object               // @.str.33
	.p2align	3
.L.str.33:
	.string	"halide_device_detach_native"
	.size	.L.str.33, 28

	.type	.L.str.34,@object               // @.str.34
	.p2align	3
.L.str.34:
	.string	"/local/mnt/workspace/bots/aus-builder-05-1/halide-24/src/halide/src/runtime/device_interface.cpp:403 Assert failed: buf->device == 0\n"
	.size	.L.str.34, 134

	.type	.L.str.35,@object               // @.str.35
	.p2align	3
.L.str.35:
	.string	"halide_default_device_wrap_native"
	.size	.L.str.35, 34

	.type	.L.str.36,@object               // @.str.36
	.p2align	3
.L.str.36:
	.string	"halide_default_device_detach_native"
	.size	.L.str.36, 36

	.type	.L.str.42,@object               // @.str.42
	.p2align	3
.L.str.42:
	.string	"halide_buffer_copy does not support switching device interfaces"
	.size	.L.str.42, 64

	.type	.L.str.58,@object               // @.str.58
	.p2align	3
.L.str.58:
	.string	"device_interface does not support cropping\n"
	.size	.L.str.58, 44

	.type	.L.str.59,@object               // @.str.59
	.p2align	3
.L.str.59:
	.string	"device_interface does not support slicing\n"
	.size	.L.str.59, 43

	.type	.L.str.60,@object               // @.str.60
	.p2align	3
.L.str.60:
	.string	"destination buffer already has a device allocation\n"
	.size	.L.str.60, 52

	.type	.L.str.61,@object               // @.str.61
	.p2align	3
.L.str.61:
	.string	"src and dst must have identical dimensionality\n"
	.size	.L.str.61, 48

	.type	.L.str.64,@object               // @.str.64
	.p2align	3
.L.str.64:
	.string	"dst must have exactly one fewer dimension than src\n"
	.size	.L.str.64, 52

	.type	halide_error_mask,@object       // @halide_error_mask
	.section	.bss,"aw",@nobits
	.weak	halide_error_mask
	.p2align	3
halide_error_mask:
	.word	0
	.word	0
	.size	halide_error_mask, 8

	.type	.L.str.37,@object               // @.str.37
	.section	.rodata.str1.8,"aMS",@progbits,1
	.p2align	3
.L.str.37:
	.string	"Bounds inference call to external stage "
	.size	.L.str.37, 41

	.type	.L.str.77,@object               // @.str.77
	.p2align	3
.L.str.77:
	.string	"<nullptr>"
	.size	.L.str.77, 10

	.type	.L.str.1.38,@object             // @.str.1.38
	.p2align	3
.L.str.1.38:
	.string	" returned non-zero value: "
	.size	.L.str.1.38, 27

	.type	.L.str.2.39,@object             // @.str.2.39
	.p2align	3
.L.str.2.39:
	.string	"Call to external stage "
	.size	.L.str.2.39, 24

	.type	.L.str.3.40,@object             // @.str.3.40
	.p2align	3
.L.str.3.40:
	.string	"Bounds given for "
	.size	.L.str.3.40, 18

	.type	.L.str.4.41,@object             // @.str.4.41
	.p2align	3
.L.str.4.41:
	.string	" in "
	.size	.L.str.4.41, 5

	.type	.L.str.5.42,@object             // @.str.5.42
	.p2align	3
.L.str.5.42:
	.string	" (from "
	.size	.L.str.5.42, 8

	.type	.L.str.6.43,@object             // @.str.6.43
	.p2align	3
.L.str.6.43:
	.string	" to "
	.size	.L.str.6.43, 5

	.type	.L.str.7.44,@object             // @.str.7.44
	.p2align	3
.L.str.7.44:
	.string	") do not cover required region (from "
	.size	.L.str.7.44, 38

	.type	.L.str.8.45,@object             // @.str.8.45
	.p2align	3
.L.str.8.45:
	.string	")"
	.size	.L.str.8.45, 2

	.type	.L.str.9.46,@object             // @.str.9.46
	.p2align	3
.L.str.9.46:
	.string	" has type "
	.size	.L.str.9.46, 11

	.type	.L.str.10.47,@object            // @.str.10.47
	.p2align	3
.L.str.10.47:
	.string	" but type of the buffer passed in is "
	.size	.L.str.10.47, 38

	.type	.L.str.11.48,@object            // @.str.11.48
	.p2align	3
.L.str.11.48:
	.string	" requires a buffer of exactly "
	.size	.L.str.11.48, 31

	.type	.L.str.12.49,@object            // @.str.12.49
	.p2align	3
.L.str.12.49:
	.string	" dimensions, but the buffer passed in has "
	.size	.L.str.12.49, 43

	.type	.L.str.13.50,@object            // @.str.13.50
	.p2align	3
.L.str.13.50:
	.string	" dimensions"
	.size	.L.str.13.50, 12

	.type	.L.str.14.51,@object            // @.str.14.51
	.p2align	3
.L.str.14.51:
	.string	" is accessed at "
	.size	.L.str.14.51, 17

	.type	.L.str.15.52,@object            // @.str.15.52
	.p2align	3
.L.str.15.52:
	.string	", which is before the min ("
	.size	.L.str.15.52, 28

	.type	.L.str.16.53,@object            // @.str.16.53
	.p2align	3
.L.str.16.53:
	.string	") in dimension "
	.size	.L.str.16.53, 16

	.type	.L.str.17.54,@object            // @.str.17.54
	.p2align	3
.L.str.17.54:
	.string	", which is beyond the max ("
	.size	.L.str.17.54, 28

	.type	.L.str.18.55,@object            // @.str.18.55
	.p2align	3
.L.str.18.55:
	.string	"Total allocation for buffer "
	.size	.L.str.18.55, 29

	.type	.L.str.19.56,@object            // @.str.19.56
	.p2align	3
.L.str.19.56:
	.string	" is "
	.size	.L.str.19.56, 5

	.type	.L.str.20.57,@object            // @.str.20.57
	.p2align	3
.L.str.20.57:
	.string	", which exceeds the maximum size of "
	.size	.L.str.20.57, 37

	.type	.L.str.21.58,@object            // @.str.21.58
	.p2align	3
.L.str.21.58:
	.string	"The extents for buffer "
	.size	.L.str.21.58, 24

	.type	.L.str.22.59,@object            // @.str.22.59
	.p2align	3
.L.str.22.59:
	.string	" dimension "
	.size	.L.str.22.59, 12

	.type	.L.str.23.60,@object            // @.str.23.60
	.p2align	3
.L.str.23.60:
	.string	" is negative ("
	.size	.L.str.23.60, 15

	.type	.L.str.24.61,@object            // @.str.24.61
	.p2align	3
.L.str.24.61:
	.string	"Product of extents for buffer "
	.size	.L.str.24.61, 31

	.type	.L.str.25.62,@object            // @.str.25.62
	.p2align	3
.L.str.25.62:
	.string	"Applying the constraints on "
	.size	.L.str.25.62, 29

	.type	.L.str.26.63,@object            // @.str.26.63
	.p2align	3
.L.str.26.63:
	.string	" to the required region made it smaller in dimension "
	.size	.L.str.26.63, 54

	.type	.L.str.27.64,@object            // @.str.27.64
	.p2align	3
.L.str.27.64:
	.string	". "
	.size	.L.str.27.64, 3

	.type	.L.str.28.65,@object            // @.str.28.65
	.p2align	3
.L.str.28.65:
	.string	"Required size: "
	.size	.L.str.28.65, 16

	.type	.L.str.29.66,@object            // @.str.29.66
	.p2align	3
.L.str.29.66:
	.string	"Constrained size: "
	.size	.L.str.29.66, 19

	.type	.L.str.30.67,@object            // @.str.30.67
	.p2align	3
.L.str.30.67:
	.string	"."
	.size	.L.str.30.67, 2

	.type	.L.str.31.68,@object            // @.str.31.68
	.p2align	3
.L.str.31.68:
	.string	"Constraint violated: "
	.size	.L.str.31.68, 22

	.type	.L.str.32.69,@object            // @.str.32.69
	.p2align	3
.L.str.32.69:
	.string	" ("
	.size	.L.str.32.69, 3

	.type	.L.str.33.70,@object            // @.str.33.70
	.p2align	3
.L.str.33.70:
	.string	") == "
	.size	.L.str.33.70, 6

	.type	.L.str.34.71,@object            // @.str.34.71
	.p2align	3
.L.str.34.71:
	.string	"Parameter "
	.size	.L.str.34.71, 11

	.type	.L.str.35.72,@object            // @.str.35.72
	.p2align	3
.L.str.35.72:
	.string	" but must be at least "
	.size	.L.str.35.72, 23

	.type	.L.str.36.73,@object            // @.str.36.73
	.p2align	3
.L.str.36.73:
	.string	" but must be at most "
	.size	.L.str.36.73, 22

	.type	.L.str.37.74,@object            // @.str.37.74
	.p2align	3
.L.str.37.74:
	.string	"Out of memory (halide_malloc returned nullptr)"
	.size	.L.str.37.74, 47

	.type	.L.str.38,@object               // @.str.38
	.p2align	3
.L.str.38:
	.string	"Out of VTCM memory (halide_vtcm_malloc returned nullptr)"
	.size	.L.str.38, 57

	.type	.L.str.39,@object               // @.str.39
	.p2align	3
.L.str.39:
	.string	"Out of LOCKED_CACHE memory (halide_locked_cache_malloc returned nullptr)"
	.size	.L.str.39, 73

	.type	.L.str.40,@object               // @.str.40
	.p2align	3
.L.str.40:
	.string	"Out of GPUShared memory (halide_malloc returned nullptr)"
	.size	.L.str.40, 57

	.type	.L.str.41,@object               // @.str.41
	.p2align	3
.L.str.41:
	.string	"Buffer argument "
	.size	.L.str.41, 17

	.type	.L.str.42.75,@object            // @.str.42.75
	.p2align	3
.L.str.42.75:
	.string	" is nullptr"
	.size	.L.str.42.75, 12

	.type	.L.str.43,@object               // @.str.43
	.p2align	3
.L.str.43:
	.string	"Failed to dump function "
	.size	.L.str.43, 25

	.type	.L.str.44,@object               // @.str.44
	.p2align	3
.L.str.44:
	.string	" to file "
	.size	.L.str.44, 10

	.type	.L.str.45,@object               // @.str.45
	.p2align	3
.L.str.45:
	.string	" with error "
	.size	.L.str.45, 13

	.type	.L.str.46,@object               // @.str.46
	.p2align	3
.L.str.46:
	.string	"The host pointer of "
	.size	.L.str.46, 21

	.type	.L.str.47,@object               // @.str.47
	.p2align	3
.L.str.47:
	.string	" is not aligned to a "
	.size	.L.str.47, 22

	.type	.L.str.48,@object               // @.str.48
	.p2align	3
.L.str.48:
	.string	" bytes boundary."
	.size	.L.str.48, 17

	.type	.L.str.49,@object               // @.str.49
	.p2align	3
.L.str.49:
	.string	"The buffer "
	.size	.L.str.49, 12

	.type	.L.str.50,@object               // @.str.50
	.p2align	3
.L.str.50:
	.string	" is dirty on device, but this pipeline was compiled "
	.size	.L.str.50, 53

	.type	.L.str.51,@object               // @.str.51
	.p2align	3
.L.str.51:
	.string	"with no support for device to host copies."
	.size	.L.str.51, 43

	.type	.L.str.52,@object               // @.str.52
	.p2align	3
.L.str.52:
	.string	" is null, but the pipeline will access it on the host."
	.size	.L.str.52, 55

	.type	.L.str.53,@object               // @.str.53
	.p2align	3
.L.str.53:
	.string	"The folded storage dimension "
	.size	.L.str.53, 30

	.type	.L.str.54,@object               // @.str.54
	.p2align	3
.L.str.54:
	.string	" of "
	.size	.L.str.54, 5

	.type	.L.str.55,@object               // @.str.55
	.p2align	3
.L.str.55:
	.string	" was accessed out of order by loop "
	.size	.L.str.55, 36

	.type	.L.str.56,@object               // @.str.56
	.p2align	3
.L.str.56:
	.string	"Cannot fold dimension "
	.size	.L.str.56, 23

	.type	.L.str.57,@object               // @.str.57
	.p2align	3
.L.str.57:
	.string	" because an extern stage accesses ["
	.size	.L.str.57, 36

	.type	.L.str.58.76,@object            // @.str.58.76
	.p2align	3
.L.str.58.76:
	.string	", "
	.size	.L.str.58.76, 3

	.type	.L.str.59.77,@object            // @.str.59.77
	.p2align	3
.L.str.59.77:
	.string	"],"
	.size	.L.str.59.77, 3

	.type	.L.str.60.78,@object            // @.str.60.78
	.p2align	3
.L.str.60.78:
	.string	" which is outside the range currently valid: ["
	.size	.L.str.60.78, 47

	.type	.L.str.61.79,@object            // @.str.61.79
	.p2align	3
.L.str.61.79:
	.string	"]."
	.size	.L.str.61.79, 3

	.type	.L.str.62,@object               // @.str.62
	.p2align	3
.L.str.62:
	.string	" which wraps around the boundary of the fold, "
	.size	.L.str.62, 47

	.type	.L.str.63,@object               // @.str.63
	.p2align	3
.L.str.63:
	.string	"which occurs at multiples of "
	.size	.L.str.63, 30

	.type	.L.str.64.80,@object            // @.str.64.80
	.p2align	3
.L.str.64.80:
	.string	"The fold factor ("
	.size	.L.str.64.80, 18

	.type	.L.str.65,@object               // @.str.65
	.p2align	3
.L.str.65:
	.string	") of dimension "
	.size	.L.str.65, 16

	.type	.L.str.66,@object               // @.str.66
	.p2align	3
.L.str.66:
	.string	" is too small to store the required region accessed by loop "
	.size	.L.str.66, 61

	.type	.L.str.67,@object               // @.str.67
	.p2align	3
.L.str.67:
	.string	")."
	.size	.L.str.67, 3

	.type	.L.str.68,@object               // @.str.68
	.p2align	3
.L.str.68:
	.string	"Requirement Failed: ("
	.size	.L.str.68, 22

	.type	.L.str.69,@object               // @.str.69
	.p2align	3
.L.str.69:
	.string	") "
	.size	.L.str.69, 3

	.type	.L.str.70,@object               // @.str.70
	.p2align	3
.L.str.70:
	.string	"A schedule specialized with specialize_fail() was chosen: "
	.size	.L.str.70, 59

	.type	.L.str.71,@object               // @.str.71
	.p2align	3
.L.str.71:
	.string	"Buffer has a non-zero device but no device interface.\n"
	.size	.L.str.71, 55

	.type	.L.str.72,@object               // @.str.72
	.p2align	3
.L.str.72:
	.string	"Buffer has a non-null device_interface but device is 0.\n"
	.size	.L.str.72, 57

	.type	.L.str.73,@object               // @.str.73
	.p2align	3
.L.str.73:
	.string	"Buffer has both host and device dirty bits set.\n"
	.size	.L.str.73, 49

	.type	.L.str.74,@object               // @.str.74
	.p2align	3
.L.str.74:
	.string	"Buffer pointer passed to "
	.size	.L.str.74, 26

	.type	.L.str.75,@object               // @.str.75
	.p2align	3
.L.str.75:
	.string	" is null.\n"
	.size	.L.str.75, 11

	.type	.L.str.4.93,@object             // @.str.4.93
	.p2align	3
.L.str.4.93:
	.string	"qurt_hvx_lock failed\n"
	.size	.L.str.4.93, 22

	.type	.L.str.6.95,@object             // @.str.6.95
	.p2align	3
.L.str.6.95:
	.string	"qurt_hvx_unlock failed\n"
	.size	.L.str.6.95, 24

	.type	.L.str.96,@object               // @.str.96
	.p2align	3
.L.str.96:
	.string	"VTCM_request failed (size: "
	.size	.L.str.96, 28

	.type	.L.str.1.97,@object             // @.str.1.97
	.p2align	3
.L.str.1.97:
	.string	"B, single_page_flag: "
	.size	.L.str.1.97, 22

	.type	.L.str.2.98,@object             // @.str.2.98
	.p2align	3
.L.str.2.98:
	.string	")\n"
	.size	.L.str.2.98, 3

	.type	.L.str.6.99,@object             // @.str.6.99
	.p2align	3
.L.str.6.99:
	.string	"Printer buffer allocation failed.\n"
	.size	.L.str.6.99, 35

	.type	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE,@object // @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.data
	.weak	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.p2align	2
_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE:
	.word	halide_default_can_use_target_features
	.size	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, 4

	.type	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE,@object // @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.section	.bss,"aw",@nobits
	.weak	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE:
	.space	4
	.size	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE, 4

	.type	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE,@object // @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	.weak	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE:
	.byte	0                               // 0x0
	.size	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE,@object // @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.weak	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE:
	.space	32
	.size	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, 32

	.type	.L.str.100,@object              // @.str.100
	.section	.rodata.str1.8,"aMS",@progbits,1
	.p2align	3
.L.str.100:
	.string	"Internal error: wrong structure size passed to halide_can_use_target_features()\n"
	.size	.L.str.100, 81

	.type	.Lstr,@object                   // @str
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr:
	.string	"output"
	.size	.Lstr, 7

	.type	.Lstr.107,@object               // @str.107
	.p2align	5
.Lstr.107:
	.string	"mask"
	.size	.Lstr.107, 5

	.type	.Lstr.108,@object               // @str.108
	.p2align	5
.Lstr.108:
	.string	"input"
	.size	.Lstr.108, 6

	.type	.Lstr.109,@object               // @str.109
	.p2align	5
.Lstr.109:
	.string	"Input buffer input"
	.size	.Lstr.109, 19

	.type	.Lstr.110,@object               // @str.110
	.p2align	5
.Lstr.110:
	.string	"Output buffer output"
	.size	.Lstr.110, 21

	.type	.Lstr.111,@object               // @str.111
	.p2align	5
.Lstr.111:
	.string	"Input buffer mask"
	.size	.Lstr.111, 18

	.type	.Lstr.112,@object               // @str.112
	.p2align	5
.Lstr.112:
	.string	"input.stride.0"
	.size	.Lstr.112, 15

	.type	.Lstr.113,@object               // @str.113
	.p2align	5
.Lstr.113:
	.string	"1"
	.size	.Lstr.113, 2

	.type	.Lstr.114,@object               // @str.114
	.p2align	5
.Lstr.114:
	.string	"input.min.0"
	.size	.Lstr.114, 12

	.type	.Lstr.115,@object               // @str.115
	.p2align	5
.Lstr.115:
	.string	"0"
	.size	.Lstr.115, 2

	.type	.Lstr.116,@object               // @str.116
	.p2align	5
.Lstr.116:
	.string	"input.stride.1"
	.size	.Lstr.116, 15

	.type	.Lstr.117,@object               // @str.117
	.p2align	5
.Lstr.117:
	.string	"((input.stride.1/128)*128)"
	.size	.Lstr.117, 27

	.type	.Lstr.118,@object               // @str.118
	.p2align	5
.Lstr.118:
	.string	"input.min.1"
	.size	.Lstr.118, 12

	.type	.Lstr.119,@object               // @str.119
	.p2align	5
.Lstr.119:
	.string	"mask.stride.0"
	.size	.Lstr.119, 14

	.type	.Lstr.120,@object               // @str.120
	.p2align	5
.Lstr.120:
	.string	"output.stride.0"
	.size	.Lstr.120, 16

	.type	.Lstr.121,@object               // @str.121
	.p2align	5
.Lstr.121:
	.string	"output.min.0"
	.size	.Lstr.121, 13

	.type	.Lstr.122,@object               // @str.122
	.p2align	5
.Lstr.122:
	.string	"output.stride.1"
	.size	.Lstr.122, 16

	.type	.Lstr.123,@object               // @str.123
	.p2align	5
.Lstr.123:
	.string	"((output.stride.1/128)*128)"
	.size	.Lstr.123, 28

	.type	.Lstr.124,@object               // @str.124
	.p2align	5
.Lstr.124:
	.string	"output.min.1"
	.size	.Lstr.124, 13

	.type	.Lstr.125,@object               // @str.125
	.p2align	5
.Lstr.125:
	.string	"input_bounded"
	.size	.Lstr.125, 14

	.type	.L__unnamed_1,@object           // @0
	.p2align	3
.L__unnamed_1:
	.word	0
	.word	0
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object           // @1
	.p2align	3
.L__unnamed_2:
	.word	0
	.word	0
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_3,@object           // @2
	.section	.data.rel.ro,"aw",@progbits
	.p2align	2
.L__unnamed_3:
	.word	.L__unnamed_1
	.word	0
	.word	.L__unnamed_2
	.word	0
	.size	.L__unnamed_3, 16

	.type	.L__unnamed_4,@object           // @3
	.section	.rodata,"a",@progbits
	.p2align	2
.L__unnamed_4:
	.space	16
	.size	.L__unnamed_4, 16

	.type	.L__unnamed_5,@object           // @4
	.p2align	3
.L__unnamed_5:
	.word	0
	.word	0
	.size	.L__unnamed_5, 8

	.type	.L__unnamed_6,@object           // @5
	.p2align	3
.L__unnamed_6:
	.word	0
	.word	0
	.size	.L__unnamed_6, 8

	.type	.L__unnamed_7,@object           // @6
	.section	.data.rel.ro,"aw",@progbits
	.p2align	2
.L__unnamed_7:
	.word	.L__unnamed_5
	.word	0
	.word	.L__unnamed_6
	.word	0
	.size	.L__unnamed_7, 16

	.type	.L__unnamed_8,@object           // @7
	.p2align	2
.L__unnamed_8:
	.word	.Lstr.108
	.word	1                               // 0x1
	.word	2                               // 0x2
	.byte	1                               // 0x1
	.byte	8                               // 0x8
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_3
	.word	.Lstr.107
	.word	1                               // 0x1
	.word	2                               // 0x2
	.byte	1                               // 0x1
	.byte	8                               // 0x8
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_4
	.word	.Lstr
	.word	2                               // 0x2
	.word	2                               // 0x2
	.byte	1                               // 0x1
	.byte	8                               // 0x8
	.half	1                               // 0x1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	.L__unnamed_7
	.size	.L__unnamed_8, 108

	.type	.Lstr.126,@object               // @str.126
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.126:
	.string	"hexagon-32-qurt-hvx-hvx_128"
	.size	.Lstr.126, 28

	.type	.Lstr.127,@object               // @str.127
	.p2align	5
.Lstr.127:
	.string	"conv3x3_halide"
	.size	.Lstr.127, 15

	.type	.Lconv3x3_halide_metadata_storage,@object // @conv3x3_halide_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	2
.Lconv3x3_halide_metadata_storage:
	.word	1                               // 0x1
	.word	3                               // 0x3
	.word	.L__unnamed_8
	.word	.Lstr.126
	.word	.Lstr.127
	.size	.Lconv3x3_halide_metadata_storage, 20

	.type	.Lswitch.table.halide_type_to_string,@object // @switch.table.halide_type_to_string
	.p2align	2
.Lswitch.table.halide_type_to_string:
	.word	.L.str.13.22
	.word	.L.str.14
	.word	.L.str.15
	.word	.L.str.16
	.size	.Lswitch.table.halide_type_to_string, 16

	.ident	"Clang $LLVM_VERSION_MAJOR.$LLVM_VERSION_MINOR"
	.ident	"QuIC LLVM Hexagon Clang version master-branch"
	.section	".note.GNU-stack","",@progbits
