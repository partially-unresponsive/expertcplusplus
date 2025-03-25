	.file	"6_typesafeprintf.cpp"
# GNU C++17 (GCC) version 14.2.1 20250207 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 14.2.1 20250207, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64
	.text
	.section	.text._ZNSt11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
	.weak	_ZNSt11char_traitsIcE6lengthEPKc
	.type	_ZNSt11char_traitsIcE6lengthEPKc, @function
_ZNSt11char_traitsIcE6lengthEPKc:
.LFB116:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# __s, __s
# /usr/include/c++/14.2.1/x86_64-pc-linux-gnu/bits/c++config.h:550:     return __builtin_is_constant_evaluated();
	movl	$0, %eax	#, D.54629
# /usr/include/c++/14.2.1/bits/char_traits.h:388: 	if (std::__is_constant_evaluated())
	testb	%al, %al	# D.54629
	je	.L3	#,
# /usr/include/c++/14.2.1/bits/char_traits.h:389: 	  return __gnu_cxx::char_traits<char_type>::length(__s);
	movq	-8(%rbp), %rax	# __s, tmp101
	movq	%rax, %rdi	# tmp101,
	call	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc	#
# /usr/include/c++/14.2.1/bits/char_traits.h:389: 	  return __gnu_cxx::char_traits<char_type>::length(__s);
	jmp	.L4	#
.L3:
# /usr/include/c++/14.2.1/bits/char_traits.h:391: 	return __builtin_strlen(__s);
	movq	-8(%rbp), %rax	# __s, tmp103
	movq	%rax, %rdi	# tmp103,
	call	strlen@PLT	#
# /usr/include/c++/14.2.1/bits/char_traits.h:391: 	return __builtin_strlen(__s);
	nop	
.L4:
# /usr/include/c++/14.2.1/bits/char_traits.h:392:       }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE116:
	.size	_ZNSt11char_traitsIcE6lengthEPKc, .-_ZNSt11char_traitsIcE6lengthEPKc
#APP
	.globl _ZSt21ios_base_library_initv
	.section	.rodata
	.align 8
.LC0:
	.string	"Invalid format string: missing arguments"
#NO_APP
	.text
	.globl	_Z9printf_vtPKc
	.type	_Z9printf_vtPKc, @function
_Z9printf_vtPKc:
.LFB2011:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2011
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r12	#
	pushq	%rbx	#
	subq	$16, %rsp	#,
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -24(%rbp)	# s, s
# 6_typesafeprintf.cpp:6: 	while (*s) {
	jmp	.L6	#
.L10:
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	movq	-24(%rbp), %rax	# s, tmp107
	movzbl	(%rax), %eax	# *s_9, _1
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	cmpb	$37, %al	#, _1
	jne	.L7	#,
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	addq	$1, -24(%rbp)	#, s
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	movq	-24(%rbp), %rax	# s, tmp108
	movzbl	(%rax), %eax	# *s_14, _2
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	cmpb	$37, %al	#, _2
	je	.L7	#,
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	movl	$1, %eax	#, iftmp.1_10
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	jmp	.L8	#
.L7:
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	movl	$0, %eax	#, iftmp.1_10
.L8:
# 6_typesafeprintf.cpp:7: 		if (*s == '%' && *(++s) != '%') 
	testb	%al, %al	# iftmp.1_10
	je	.L9	#,
# 6_typesafeprintf.cpp:8: 			throw std::runtime_error("Invalid format string: missing arguments");
	movl	$16, %edi	#,
	call	__cxa_allocate_exception@PLT	#
	movq	%rax, %rbx	# tmp109, _21
# 6_typesafeprintf.cpp:8: 			throw std::runtime_error("Invalid format string: missing arguments");
	leaq	.LC0(%rip), %rax	#, tmp110
	movq	%rax, %rsi	# tmp110,
	movq	%rbx, %rdi	# _21,
.LEHB0:
	call	_ZNSt13runtime_errorC1EPKc@PLT	#
.LEHE0:
# 6_typesafeprintf.cpp:8: 			throw std::runtime_error("Invalid format string: missing arguments");
	movq	_ZNSt13runtime_errorD1Ev@GOTPCREL(%rip), %rax	#, tmp112
	movq	%rax, %rdx	# tmp111,
	leaq	_ZTISt13runtime_error(%rip), %rax	#, tmp113
	movq	%rax, %rsi	# tmp113,
	movq	%rbx, %rdi	# _21,
.LEHB1:
	call	__cxa_throw@PLT	#
.L9:
# 6_typesafeprintf.cpp:9: 		std::cout << *s++;
	movq	-24(%rbp), %rax	# s, s.2_3
	leaq	1(%rax), %rdx	#, tmp114
	movq	%rdx, -24(%rbp)	# tmp114, s
# 6_typesafeprintf.cpp:9: 		std::cout << *s++;
	movzbl	(%rax), %eax	# *s.2_3, _4
# 6_typesafeprintf.cpp:9: 		std::cout << *s++;
	movsbl	%al, %eax	# _4, _5
	movl	%eax, %esi	# _5,
	leaq	_ZSt4cout(%rip), %rax	#, tmp115
	movq	%rax, %rdi	# tmp115,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT	#
.L6:
# 6_typesafeprintf.cpp:6: 	while (*s) {
	movq	-24(%rbp), %rax	# s, tmp116
	movzbl	(%rax), %eax	# *s_9, _6
	testb	%al, %al	# _6
	jne	.L10	#,
# 6_typesafeprintf.cpp:11: }
	jmp	.L13	#
.L12:
# 6_typesafeprintf.cpp:8: 			throw std::runtime_error("Invalid format string: missing arguments");
	movq	%rax, %r12	#, tmp117
	movq	%rbx, %rdi	# _21,
	call	__cxa_free_exception@PLT	#
	movq	%r12, %rax	# tmp117, D.54724
	movq	%rax, %rdi	# D.54724,
	call	_Unwind_Resume@PLT	#
.LEHE1:
.L13:
# 6_typesafeprintf.cpp:11: }
	addq	$16, %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2011:
	.section	.gcc_except_table,"a",@progbits
.LLSDA2011:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2011-.LLSDACSB2011
.LLSDACSB2011:
	.uleb128 .LEHB0-.LFB2011
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L12-.LFB2011
	.uleb128 0
	.uleb128 .LEHB1-.LFB2011
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE2011:
	.text
	.size	_Z9printf_vtPKc, .-_Z9printf_vtPKc
	.section	.rodata
.LC2:
	.string	"Variadic templates"
	.align 8
.LC3:
	.string	"%s can accept %i paramters (or %s), x=%d, y=%f\n"
.LC4:
	.string	"more"
	.align 8
.LC5:
	.string	"% can accept % parameters (or %); x=%,y=%\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2013:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2013
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$136, %rsp	#,
	.cfi_offset 3, -24
# 6_typesafeprintf.cpp:25: int main() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp104
	movq	%rax, -24(%rbp)	# tmp104, D.54728
	xorl	%eax, %eax	# tmp104
# 6_typesafeprintf.cpp:26: 	int x = 10;
	movl	$10, -128(%rbp)	#, x
# 6_typesafeprintf.cpp:27: 	float y = 3.6;
	movss	.LC1(%rip), %xmm0	#, tmp105
	movss	%xmm0, -124(%rbp)	# tmp105, y
	leaq	-129(%rbp), %rax	#, tmp106
	movq	%rax, -104(%rbp)	# tmp106, this
# /usr/include/c++/14.2.1/bits/new_allocator.h:88:       __new_allocator() _GLIBCXX_USE_NOEXCEPT { }
	nop	
# /usr/include/c++/14.2.1/bits/allocator.h:161:       allocator() _GLIBCXX_NOTHROW { }
	nop	
# 6_typesafeprintf.cpp:28: 	std::string s = std::string("Variadic templates");
	leaq	-129(%rbp), %rdx	#, tmp107
	leaq	-96(%rbp), %rax	#, tmp108
	leaq	.LC2(%rip), %rcx	#, tmp109
	movq	%rcx, %rsi	# tmp109,
	movq	%rax, %rdi	# tmp108,
.LEHB2:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_	#
.LEHE2:
# /usr/include/c++/14.2.1/bits/allocator.h:182:       ~allocator() _GLIBCXX_NOTHROW { }
	leaq	-129(%rbp), %rax	#, tmp110
	movq	%rax, %rdi	# tmp110,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
# 6_typesafeprintf.cpp:29: 	const char* msg1 = "%s can accept %i paramters (or %s), x=%d, y=%f\n";
	leaq	.LC3(%rip), %rax	#, tmp111
	movq	%rax, -120(%rbp)	# tmp111, msg1
# 6_typesafeprintf.cpp:30: 	printf(msg1, s.c_str(), 100, "more", x, y);  // Replace 's' by 's.c_str()' to prevent the output bug
	pxor	%xmm1, %xmm1	# _1
	cvtss2sd	-124(%rbp), %xmm1	# y, _1
	movq	%xmm1, %rbx	# _1, _1
	leaq	-96(%rbp), %rax	#, tmp112
	movq	%rax, %rdi	# tmp112,
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv@PLT	#
	movq	%rax, %rsi	#, _2
# 6_typesafeprintf.cpp:30: 	printf(msg1, s.c_str(), 100, "more", x, y);  // Replace 's' by 's.c_str()' to prevent the output bug
	movl	-128(%rbp), %edx	# x, tmp113
	movq	-120(%rbp), %rax	# msg1, tmp114
	movq	%rbx, %xmm0	# _1,
	movl	%edx, %r8d	# tmp113,
	leaq	.LC4(%rip), %rdx	#, tmp115
	movq	%rdx, %rcx	# tmp115,
	movl	$100, %edx	#,
	movq	%rax, %rdi	# tmp114,
	movl	$1, %eax	#,
.LEHB3:
	call	printf@PLT	#
# 6_typesafeprintf.cpp:32: 	const char* msg2 = "% can accept % parameters (or %); x=%,y=%\n";
	leaq	.LC5(%rip), %rax	#, tmp116
	movq	%rax, -112(%rbp)	# tmp116, msg2
# 6_typesafeprintf.cpp:33: 	printf_vt(msg2, s, 100, "more", x, y);
	leaq	-96(%rbp), %rdx	#, tmp117
	leaq	-64(%rbp), %rax	#, tmp118
	movq	%rdx, %rsi	# tmp117,
	movq	%rax, %rdi	# tmp118,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_@PLT	#
.LEHE3:
# 6_typesafeprintf.cpp:33: 	printf_vt(msg2, s, 100, "more", x, y);
	movl	-124(%rbp), %edx	# y, tmp119
	movl	-128(%rbp), %ecx	# x, tmp120
	leaq	-64(%rbp), %rsi	#, tmp121
	movq	-112(%rbp), %rax	# msg2, tmp122
	movd	%edx, %xmm0	# tmp119,
	movl	%ecx, %r8d	# tmp120,
	leaq	.LC4(%rip), %rdx	#, tmp123
	movq	%rdx, %rcx	# tmp123,
	movl	$100, %edx	#,
	movq	%rax, %rdi	# tmp122,
.LEHB4:
	call	_Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_	#
.LEHE4:
# 6_typesafeprintf.cpp:33: 	printf_vt(msg2, s, 100, "more", x, y);
	leaq	-64(%rbp), %rax	#, tmp124
	movq	%rax, %rdi	# tmp124,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
# 6_typesafeprintf.cpp:34: 	return 0;
	movl	$0, %ebx	#, _19
# 6_typesafeprintf.cpp:35: }
	leaq	-96(%rbp), %rax	#, tmp125
	movq	%rax, %rdi	# tmp125,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
	movl	%ebx, %eax	# _19, <retval>
	movq	-24(%rbp), %rdx	# D.54728, tmp135
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp135
	je	.L21	#,
	jmp	.L25	#
.L22:
# /usr/include/c++/14.2.1/bits/allocator.h:182:       ~allocator() _GLIBCXX_NOTHROW { }
	movq	%rax, %rbx	#, tmp128
	leaq	-129(%rbp), %rax	#, tmp127
	movq	%rax, %rdi	# tmp127,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
	movq	%rbx, %rax	# tmp128, D.54726
	movq	-24(%rbp), %rdx	# D.54728, tmp136
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp136
	je	.L17	#,
	call	__stack_chk_fail@PLT	#
.L17:
	movq	%rax, %rdi	# D.54726,
.LEHB5:
	call	_Unwind_Resume@PLT	#
.L24:
# 6_typesafeprintf.cpp:33: 	printf_vt(msg2, s, 100, "more", x, y);
	movq	%rax, %rbx	#, tmp131
	leaq	-64(%rbp), %rax	#, tmp129
	movq	%rax, %rdi	# tmp129,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
	jmp	.L19	#
.L23:
# 6_typesafeprintf.cpp:35: }
	movq	%rax, %rbx	#, tmp130
.L19:
	leaq	-96(%rbp), %rax	#, tmp134
	movq	%rax, %rdi	# tmp134,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
	movq	%rbx, %rax	# tmp130, D.54727
	movq	-24(%rbp), %rdx	# D.54728, tmp137
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp137
	je	.L20	#,
	call	__stack_chk_fail@PLT	#
.L20:
	movq	%rax, %rdi	# D.54727,
	call	_Unwind_Resume@PLT	#
.LEHE5:
.L25:
	call	__stack_chk_fail@PLT	#
.L21:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2013:
	.section	.gcc_except_table
.LLSDA2013:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2013-.LLSDACSB2013
.LLSDACSB2013:
	.uleb128 .LEHB2-.LFB2013
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L22-.LFB2013
	.uleb128 0
	.uleb128 .LEHB3-.LFB2013
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L23-.LFB2013
	.uleb128 0
	.uleb128 .LEHB4-.LFB2013
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L24-.LFB2013
	.uleb128 0
	.uleb128 .LEHB5-.LFB2013
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE2013:
	.text
	.size	main, .-main
	.section	.text._ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,comdat
	.align 2
	.weak	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.type	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, @function
_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc:
.LFB2014:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# __p, __p
# /usr/include/c++/14.2.1/bits/char_traits.h:199:     char_traits<_CharT>::
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp103
	movq	%rax, -8(%rbp)	# tmp103, D.54734
	xorl	%eax, %eax	# tmp103
# /usr/include/c++/14.2.1/bits/char_traits.h:202:       std::size_t __i = 0;
	movq	$0, -16(%rbp)	#, __i
# /usr/include/c++/14.2.1/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	jmp	.L27	#
.L28:
# /usr/include/c++/14.2.1/bits/char_traits.h:204:         ++__i;
	addq	$1, -16(%rbp)	#, __i
.L27:
# /usr/include/c++/14.2.1/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	movb	$0, -17(%rbp)	#, D.50196
# /usr/include/c++/14.2.1/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	movq	-40(%rbp), %rdx	# __p, tmp104
	movq	-16(%rbp), %rax	# __i, tmp105
	addq	%rax, %rdx	# tmp105, _1
# /usr/include/c++/14.2.1/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	leaq	-17(%rbp), %rax	#, tmp106
	movq	%rax, %rsi	# tmp106,
	movq	%rdx, %rdi	# _1,
	call	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_	#
# /usr/include/c++/14.2.1/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	xorl	$1, %eax	#, retval.4_10
	testb	%al, %al	# retval.4_10
	jne	.L28	#,
# /usr/include/c++/14.2.1/bits/char_traits.h:205:       return __i;
	movq	-16(%rbp), %rax	# __i, _12
# /usr/include/c++/14.2.1/bits/char_traits.h:206:     }
	movq	-8(%rbp), %rdx	# D.54734, tmp108
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp108
	je	.L30	#,
	call	__stack_chk_fail@PLT	#
.L30:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2014:
	.size	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, .-_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD5Ev,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev:
.LFB2112:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# this, this
	movq	-24(%rbp), %rax	# this, tmp98
	movq	%rax, -8(%rbp)	# tmp98, this
# /usr/include/c++/14.2.1/bits/allocator.h:182:       ~allocator() _GLIBCXX_NOTHROW { }
	movq	-8(%rbp), %rax	# this, tmp99
	movq	%rax, %rdi	# tmp99,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
# /usr/include/c++/14.2.1/bits/basic_string.h:186:       struct _Alloc_hider : allocator_type // TODO check __is_final
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2112:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.section	.rodata
	.align 8
.LC6:
	.string	"basic_string: construction from null is not valid"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LFB2289:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2289
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# this, this
	movq	%rsi, -48(%rbp)	# __s, __s
	movq	%rdx, -56(%rbp)	# __a, __a
# /usr/include/c++/14.2.1/bits/basic_string.h:647:       : _M_dataplus(_M_local_data(), __a)
	movq	-40(%rbp), %rbx	# this, _1
	movq	-40(%rbp), %rax	# this, tmp104
	movq	%rax, %rdi	# tmp104,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv@PLT	#
	movq	%rax, %rcx	#, _2
# /usr/include/c++/14.2.1/bits/basic_string.h:647:       : _M_dataplus(_M_local_data(), __a)
	movq	-56(%rbp), %rax	# __a, tmp105
	movq	%rax, %rdx	# tmp105,
	movq	%rcx, %rsi	# _2,
	movq	%rbx, %rdi	# _1,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_@PLT	#
# /usr/include/c++/14.2.1/bits/basic_string.h:650: 	if (__s == 0)
	cmpq	$0, -48(%rbp)	#, __s
	jne	.L33	#,
# /usr/include/c++/14.2.1/bits/basic_string.h:651: 	  std::__throw_logic_error(__N("basic_string: "
	leaq	.LC6(%rip), %rax	#, tmp106
	movq	%rax, %rdi	# tmp106,
.LEHB6:
	call	_ZSt19__throw_logic_errorPKc@PLT	#
.L33:
# /usr/include/c++/14.2.1/bits/basic_string.h:653: 	const _CharT* __end = __s + traits_type::length(__s);
	movq	-48(%rbp), %rax	# __s, tmp107
	movq	%rax, %rdi	# tmp107,
	call	_ZNSt11char_traitsIcE6lengthEPKc	#
# /usr/include/c++/14.2.1/bits/basic_string.h:653: 	const _CharT* __end = __s + traits_type::length(__s);
	movq	-48(%rbp), %rdx	# __s, tmp111
	addq	%rdx, %rax	# tmp111, __end_15
	movq	%rax, -24(%rbp)	# __end_15, __end
# /usr/include/c++/14.2.1/bits/basic_string.h:654: 	_M_construct(__s, __end, forward_iterator_tag());
	movq	-24(%rbp), %rdx	# __end, tmp112
	movq	-48(%rbp), %rcx	# __s, tmp113
	movq	-40(%rbp), %rax	# this, tmp114
	movq	%rcx, %rsi	# tmp113,
	movq	%rax, %rdi	# tmp114,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag	#
.LEHE6:
# /usr/include/c++/14.2.1/bits/basic_string.h:655:       }
	jmp	.L36	#
.L35:
	movq	%rax, %rbx	#, tmp115
	movq	-40(%rbp), %rax	# this, _4
	movq	%rax, %rdi	# _4,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev	#
	movq	%rbx, %rax	# tmp115, D.54735
	movq	%rax, %rdi	# D.54735,
.LEHB7:
	call	_Unwind_Resume@PLT	#
.LEHE7:
.L36:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2289:
	.section	.gcc_except_table
.LLSDA2289:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2289-.LLSDACSB2289
.LLSDACSB2289:
	.uleb128 .LEHB6-.LFB2289
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L35-.LFB2289
	.uleb128 0
	.uleb128 .LEHB7-.LFB2289
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE2289:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.text._Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_,"axG",@progbits,_Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_,comdat
	.weak	_Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_
	.type	_Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_, @function
_Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_:
.LFB2294:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -8(%rbp)	# s, s
	movq	%rsi, -16(%rbp)	# value, value
	movl	%edx, -20(%rbp)	# rest#0, rest#0
	movq	%rcx, -32(%rbp)	# rest#1, rest#1
	movl	%r8d, -24(%rbp)	# rest#2, rest#2
	movss	%xmm0, -36(%rbp)	# rest#3, rest#3
# 6_typesafeprintf.cpp:15: 	while (*s){
	jmp	.L38	#
.L43:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp105
	movzbl	(%rax), %eax	# *s_9, _1
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _1
	jne	.L39	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	addq	$1, -8(%rbp)	#, s
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp106
	movzbl	(%rax), %eax	# *s_15, _2
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _2
	je	.L39	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$1, %eax	#, iftmp.14_10
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	jmp	.L40	#
.L39:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$0, %eax	#, iftmp.14_10
.L40:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	testb	%al, %al	# iftmp.14_10
	je	.L41	#,
# 6_typesafeprintf.cpp:17: 			std::cout << value;
	movq	-16(%rbp), %rax	# value, tmp107
	movq	%rax, %rsi	# tmp107,
	leaq	_ZSt4cout(%rip), %rax	#, tmp108
	movq	%rax, %rdi	# tmp108,
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT	#
# 6_typesafeprintf.cpp:18: 			printf_vt(s, rest...);
	movl	-36(%rbp), %edi	# rest#3, tmp109
	movl	-24(%rbp), %ecx	# rest#2, tmp110
	movq	-32(%rbp), %rdx	# rest#1, tmp111
	movl	-20(%rbp), %esi	# rest#0, tmp112
	movq	-8(%rbp), %rax	# s, tmp113
	movd	%edi, %xmm0	# tmp109,
	movq	%rax, %rdi	# tmp113,
	call	_Z9printf_vtIiJPKcifEEvS1_T_DpT0_	#
# 6_typesafeprintf.cpp:19: 			return;
	jmp	.L37	#
.L41:
# 6_typesafeprintf.cpp:21: 	std::cout << *s++;
	movq	-8(%rbp), %rax	# s, s.15_3
	leaq	1(%rax), %rdx	#, tmp114
	movq	%rdx, -8(%rbp)	# tmp114, s
	movzbl	(%rax), %eax	# *s.15_3, _4
	movsbl	%al, %eax	# _4, _5
	movl	%eax, %esi	# _5,
	leaq	_ZSt4cout(%rip), %rax	#, tmp115
	movq	%rax, %rdi	# tmp115,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT	#
.L38:
# 6_typesafeprintf.cpp:15: 	while (*s){
	movq	-8(%rbp), %rax	# s, tmp116
	movzbl	(%rax), %eax	# *s_9, _6
	testb	%al, %al	# _6
	jne	.L43	#,
.L37:
# 6_typesafeprintf.cpp:23: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2294:
	.size	_Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_, .-_Z9printf_vtINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEJiPKcifEEvS7_T_DpT0_
	.section	.text._ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,comdat
	.weak	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.type	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, @function
_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_:
.LFB2295:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# __c1, __c1
	movq	%rsi, -16(%rbp)	# __c2, __c2
# /usr/include/c++/14.2.1/bits/char_traits.h:137:       { return __c1 == __c2; }
	movq	-8(%rbp), %rax	# __c1, tmp102
	movzbl	(%rax), %edx	# *__c1_4(D), _1
	movq	-16(%rbp), %rax	# __c2, tmp103
	movzbl	(%rax), %eax	# *__c2_5(D), _2
# /usr/include/c++/14.2.1/bits/char_traits.h:137:       { return __c1 == __c2; }
	cmpb	%al, %dl	# _2, _1
	sete	%al	#, _6
# /usr/include/c++/14.2.1/bits/char_traits.h:137:       { return __c1 == __c2; }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2295:
	.size	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, .-_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.section	.text._ZNSt15__new_allocatorIcED2Ev,"axG",@progbits,_ZNSt15__new_allocatorIcED5Ev,comdat
	.align 2
	.weak	_ZNSt15__new_allocatorIcED2Ev
	.type	_ZNSt15__new_allocatorIcED2Ev, @function
_ZNSt15__new_allocatorIcED2Ev:
.LFB2349:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# this, this
# /usr/include/c++/14.2.1/bits/new_allocator.h:104:       ~__new_allocator() _GLIBCXX_USE_NOEXCEPT { }
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2349:
	.size	_ZNSt15__new_allocatorIcED2Ev, .-_ZNSt15__new_allocatorIcED2Ev
	.weak	_ZNSt15__new_allocatorIcED1Ev
	.set	_ZNSt15__new_allocatorIcED1Ev,_ZNSt15__new_allocatorIcED2Ev
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC5EPS4_,comdat
	.align 2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, @function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_:
.LFB2356:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# this, this
	movq	%rsi, -16(%rbp)	# __s, __s
# /usr/include/c++/14.2.1/bits/basic_string.tcc:239: 	  explicit _Guard(basic_string* __s) : _M_guarded(__s) { }
	movq	-8(%rbp), %rax	# this, tmp98
	movq	-16(%rbp), %rdx	# __s, tmp99
	movq	%rdx, (%rax)	# tmp99, this_2(D)->_M_guarded
# /usr/include/c++/14.2.1/bits/basic_string.tcc:239: 	  explicit _Guard(basic_string* __s) : _M_guarded(__s) { }
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2356:
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.align 2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, @function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev:
.LFB2359:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2359
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# this, this
# /usr/include/c++/14.2.1/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	movq	-8(%rbp), %rax	# this, tmp100
	movq	(%rax), %rax	# this_5(D)->_M_guarded, _1
# /usr/include/c++/14.2.1/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	testq	%rax, %rax	# _1
	je	.L50	#,
# /usr/include/c++/14.2.1/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	movq	-8(%rbp), %rax	# this, tmp101
	movq	(%rax), %rax	# this_5(D)->_M_guarded, _2
# /usr/include/c++/14.2.1/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	movq	%rax, %rdi	# _2,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT	#
.L50:
# /usr/include/c++/14.2.1/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2359:
	.section	.gcc_except_table
.LLSDA2359:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2359-.LLSDACSB2359
.LLSDACSB2359:
.LLSDACSE2359:
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag:
.LFB2354:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA2354
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$104, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)	# this, this
	movq	%rsi, -96(%rbp)	# __beg, __beg
	movq	%rdx, -104(%rbp)	# __end, __end
# /usr/include/c++/14.2.1/bits/basic_string.tcc:221:       basic_string<_CharT, _Traits, _Alloc>::
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp110
	movq	%rax, -24(%rbp)	# tmp110, D.54739
	xorl	%eax, %eax	# tmp110
	movq	-96(%rbp), %rax	# __beg, tmp111
	movq	%rax, -64(%rbp)	# tmp111, MEM[(const char * *)_30]
	movq	-104(%rbp), %rax	# __end, tmp112
	movq	%rax, -56(%rbp)	# tmp112, __last
# /usr/include/c++/14.2.1/bits/stl_iterator_base_types.h:240:     { return typename iterator_traits<_Iter>::iterator_category(); }
	nop	
# /usr/include/c++/14.2.1/bits/stl_iterator_base_funcs.h:151:       return std::__distance(__first, __last,
	movq	-64(%rbp), %rax	# MEM[(const char * *)_30], __first.8_32
	movq	%rax, -48(%rbp)	# __first.8_32, __first
	movq	-56(%rbp), %rax	# __last, tmp113
	movq	%rax, -40(%rbp)	# tmp113, __last
# /usr/include/c++/14.2.1/bits/stl_iterator_base_funcs.h:106:       return __last - __first;
	movq	-40(%rbp), %rax	# __last, tmp114
	subq	-48(%rbp), %rax	# __first, D.54673
# /usr/include/c++/14.2.1/bits/stl_iterator_base_funcs.h:152: 			     std::__iterator_category(__first));
	nop	
# /usr/include/c++/14.2.1/bits/basic_string.tcc:225: 	size_type __dnew = static_cast<size_type>(std::distance(__beg, __end));
	movq	%rax, -72(%rbp)	# _2, __dnew
# /usr/include/c++/14.2.1/bits/basic_string.tcc:227: 	if (__dnew > size_type(_S_local_capacity))
	movq	-72(%rbp), %rax	# __dnew, __dnew.5_3
# /usr/include/c++/14.2.1/bits/basic_string.tcc:227: 	if (__dnew > size_type(_S_local_capacity))
	cmpq	$15, %rax	#, __dnew.5_3
	jbe	.L55	#,
# /usr/include/c++/14.2.1/bits/basic_string.tcc:229: 	    _M_data(_M_create(__dnew, size_type(0)));
	leaq	-72(%rbp), %rcx	#, tmp115
	movq	-88(%rbp), %rax	# this, tmp116
	movl	$0, %edx	#,
	movq	%rcx, %rsi	# tmp115,
	movq	%rax, %rdi	# tmp116,
.LEHB8:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT	#
.LEHE8:
	movq	%rax, %rdx	#, _4
# /usr/include/c++/14.2.1/bits/basic_string.tcc:229: 	    _M_data(_M_create(__dnew, size_type(0)));
	movq	-88(%rbp), %rax	# this, tmp117
	movq	%rdx, %rsi	# _4,
	movq	%rax, %rdi	# tmp117,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc@PLT	#
# /usr/include/c++/14.2.1/bits/basic_string.tcc:230: 	    _M_capacity(__dnew);
	movq	-72(%rbp), %rdx	# __dnew, __dnew.6_5
	movq	-88(%rbp), %rax	# this, tmp118
	movq	%rdx, %rsi	# __dnew.6_5,
	movq	%rax, %rdi	# tmp118,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm@PLT	#
	jmp	.L56	#
.L55:
	movq	-88(%rbp), %rax	# this, tmp119
	movq	%rax, -32(%rbp)	# tmp119, this
# /usr/include/c++/14.2.1/bits/basic_string.h:360:       }
	nop	
.L56:
# /usr/include/c++/14.2.1/bits/basic_string.tcc:245: 	} __guard(this);
	movq	-88(%rbp), %rdx	# this, tmp120
	leaq	-64(%rbp), %rax	#, tmp121
	movq	%rdx, %rsi	# tmp120,
	movq	%rax, %rdi	# tmp121,
	call	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_	#
# /usr/include/c++/14.2.1/bits/basic_string.tcc:247: 	this->_S_copy_chars(_M_data(), __beg, __end);
	movq	-88(%rbp), %rax	# this, tmp122
	movq	%rax, %rdi	# tmp122,
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv@PLT	#
	movq	%rax, %rcx	#, _6
# /usr/include/c++/14.2.1/bits/basic_string.tcc:247: 	this->_S_copy_chars(_M_data(), __beg, __end);
	movq	-104(%rbp), %rdx	# __end, tmp123
	movq	-96(%rbp), %rax	# __beg, tmp124
	movq	%rax, %rsi	# tmp124,
	movq	%rcx, %rdi	# _6,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_@PLT	#
# /usr/include/c++/14.2.1/bits/basic_string.tcc:249: 	__guard._M_guarded = 0;
	movq	$0, -64(%rbp)	#, MEM[(struct _Guard *)_30]._M_guarded
# /usr/include/c++/14.2.1/bits/basic_string.tcc:251: 	_M_set_length(__dnew);
	movq	-72(%rbp), %rdx	# __dnew, __dnew.7_7
	movq	-88(%rbp), %rax	# this, tmp125
	movq	%rdx, %rsi	# __dnew.7_7,
	movq	%rax, %rdi	# tmp125,
.LEHB9:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm@PLT	#
.LEHE9:
# /usr/include/c++/14.2.1/bits/basic_string.tcc:252:       }
	leaq	-64(%rbp), %rax	#, tmp126
	movq	%rax, %rdi	# tmp126,
	call	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev	#
	movq	-24(%rbp), %rax	# D.54739, tmp129
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp129
	je	.L59	#,
	jmp	.L61	#
.L60:
	movq	%rax, %rbx	#, tmp128
	leaq	-64(%rbp), %rax	#, tmp127
	movq	%rax, %rdi	# tmp127,
	call	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev	#
	movq	%rbx, %rax	# tmp128, D.54737
	movq	-24(%rbp), %rdx	# D.54739, tmp130
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp130
	je	.L58	#,
	call	__stack_chk_fail@PLT	#
.L58:
	movq	%rax, %rdi	# D.54737,
.LEHB10:
	call	_Unwind_Resume@PLT	#
.LEHE10:
.L61:
	call	__stack_chk_fail@PLT	#
.L59:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2354:
	.section	.gcc_except_table
.LLSDA2354:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2354-.LLSDACSB2354
.LLSDACSB2354:
	.uleb128 .LEHB8-.LFB2354
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB2354
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L60-.LFB2354
	.uleb128 0
	.uleb128 .LEHB10-.LFB2354
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE2354:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.section	.text._Z9printf_vtIiJPKcifEEvS1_T_DpT0_,"axG",@progbits,_Z9printf_vtIiJPKcifEEvS1_T_DpT0_,comdat
	.weak	_Z9printf_vtIiJPKcifEEvS1_T_DpT0_
	.type	_Z9printf_vtIiJPKcifEEvS1_T_DpT0_, @function
_Z9printf_vtIiJPKcifEEvS1_T_DpT0_:
.LFB2417:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# s, s
	movl	%esi, -12(%rbp)	# value, value
	movq	%rdx, -24(%rbp)	# rest#0, rest#0
	movl	%ecx, -16(%rbp)	# rest#1, rest#1
	movss	%xmm0, -28(%rbp)	# rest#2, rest#2
# 6_typesafeprintf.cpp:15: 	while (*s){
	jmp	.L63	#
.L68:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp105
	movzbl	(%rax), %eax	# *s_9, _1
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _1
	jne	.L64	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	addq	$1, -8(%rbp)	#, s
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp106
	movzbl	(%rax), %eax	# *s_15, _2
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _2
	je	.L64	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$1, %eax	#, iftmp.17_10
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	jmp	.L65	#
.L64:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$0, %eax	#, iftmp.17_10
.L65:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	testb	%al, %al	# iftmp.17_10
	je	.L66	#,
# 6_typesafeprintf.cpp:17: 			std::cout << value;
	movl	-12(%rbp), %eax	# value, tmp107
	movl	%eax, %esi	# tmp107,
	leaq	_ZSt4cout(%rip), %rax	#, tmp108
	movq	%rax, %rdi	# tmp108,
	call	_ZNSolsEi@PLT	#
# 6_typesafeprintf.cpp:18: 			printf_vt(s, rest...);
	movl	-28(%rbp), %esi	# rest#2, tmp109
	movl	-16(%rbp), %edx	# rest#1, tmp110
	movq	-24(%rbp), %rcx	# rest#0, tmp111
	movq	-8(%rbp), %rax	# s, tmp112
	movd	%esi, %xmm0	# tmp109,
	movq	%rcx, %rsi	# tmp111,
	movq	%rax, %rdi	# tmp112,
	call	_Z9printf_vtIPKcJifEEvS1_T_DpT0_	#
# 6_typesafeprintf.cpp:19: 			return;
	jmp	.L62	#
.L66:
# 6_typesafeprintf.cpp:21: 	std::cout << *s++;
	movq	-8(%rbp), %rax	# s, s.18_3
	leaq	1(%rax), %rdx	#, tmp113
	movq	%rdx, -8(%rbp)	# tmp113, s
	movzbl	(%rax), %eax	# *s.18_3, _4
	movsbl	%al, %eax	# _4, _5
	movl	%eax, %esi	# _5,
	leaq	_ZSt4cout(%rip), %rax	#, tmp114
	movq	%rax, %rdi	# tmp114,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT	#
.L63:
# 6_typesafeprintf.cpp:15: 	while (*s){
	movq	-8(%rbp), %rax	# s, tmp115
	movzbl	(%rax), %eax	# *s_9, _6
	testb	%al, %al	# _6
	jne	.L68	#,
.L62:
# 6_typesafeprintf.cpp:23: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2417:
	.size	_Z9printf_vtIiJPKcifEEvS1_T_DpT0_, .-_Z9printf_vtIiJPKcifEEvS1_T_DpT0_
	.section	.text._Z9printf_vtIPKcJifEEvS1_T_DpT0_,"axG",@progbits,_Z9printf_vtIPKcJifEEvS1_T_DpT0_,comdat
	.weak	_Z9printf_vtIPKcJifEEvS1_T_DpT0_
	.type	_Z9printf_vtIPKcJifEEvS1_T_DpT0_, @function
_Z9printf_vtIPKcJifEEvS1_T_DpT0_:
.LFB2472:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -8(%rbp)	# s, s
	movq	%rsi, -16(%rbp)	# value, value
	movl	%edx, -20(%rbp)	# rest#0, rest#0
	movss	%xmm0, -24(%rbp)	# rest#1, rest#1
# 6_typesafeprintf.cpp:15: 	while (*s){
	jmp	.L70	#
.L75:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp105
	movzbl	(%rax), %eax	# *s_9, _1
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _1
	jne	.L71	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	addq	$1, -8(%rbp)	#, s
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp106
	movzbl	(%rax), %eax	# *s_15, _2
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _2
	je	.L71	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$1, %eax	#, iftmp.20_10
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	jmp	.L72	#
.L71:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$0, %eax	#, iftmp.20_10
.L72:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	testb	%al, %al	# iftmp.20_10
	je	.L73	#,
# 6_typesafeprintf.cpp:17: 			std::cout << value;
	movq	-16(%rbp), %rax	# value, tmp107
	movq	%rax, %rsi	# tmp107,
	leaq	_ZSt4cout(%rip), %rax	#, tmp108
	movq	%rax, %rdi	# tmp108,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# 6_typesafeprintf.cpp:18: 			printf_vt(s, rest...);
	movl	-24(%rbp), %ecx	# rest#1, tmp109
	movl	-20(%rbp), %edx	# rest#0, tmp110
	movq	-8(%rbp), %rax	# s, tmp111
	movd	%ecx, %xmm0	# tmp109,
	movl	%edx, %esi	# tmp110,
	movq	%rax, %rdi	# tmp111,
	call	_Z9printf_vtIiJfEEvPKcT_DpT0_	#
# 6_typesafeprintf.cpp:19: 			return;
	jmp	.L69	#
.L73:
# 6_typesafeprintf.cpp:21: 	std::cout << *s++;
	movq	-8(%rbp), %rax	# s, s.21_3
	leaq	1(%rax), %rdx	#, tmp112
	movq	%rdx, -8(%rbp)	# tmp112, s
	movzbl	(%rax), %eax	# *s.21_3, _4
	movsbl	%al, %eax	# _4, _5
	movl	%eax, %esi	# _5,
	leaq	_ZSt4cout(%rip), %rax	#, tmp113
	movq	%rax, %rdi	# tmp113,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT	#
.L70:
# 6_typesafeprintf.cpp:15: 	while (*s){
	movq	-8(%rbp), %rax	# s, tmp114
	movzbl	(%rax), %eax	# *s_9, _6
	testb	%al, %al	# _6
	jne	.L75	#,
.L69:
# 6_typesafeprintf.cpp:23: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2472:
	.size	_Z9printf_vtIPKcJifEEvS1_T_DpT0_, .-_Z9printf_vtIPKcJifEEvS1_T_DpT0_
	.section	.text._Z9printf_vtIiJfEEvPKcT_DpT0_,"axG",@progbits,_Z9printf_vtIiJfEEvPKcT_DpT0_,comdat
	.weak	_Z9printf_vtIiJfEEvPKcT_DpT0_
	.type	_Z9printf_vtIiJfEEvPKcT_DpT0_, @function
_Z9printf_vtIiJfEEvPKcT_DpT0_:
.LFB2522:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# s, s
	movl	%esi, -12(%rbp)	# value, value
	movss	%xmm0, -16(%rbp)	# rest#0, rest#0
# 6_typesafeprintf.cpp:15: 	while (*s){
	jmp	.L77	#
.L82:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp105
	movzbl	(%rax), %eax	# *s_9, _1
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _1
	jne	.L78	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	addq	$1, -8(%rbp)	#, s
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp106
	movzbl	(%rax), %eax	# *s_15, _2
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _2
	je	.L78	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$1, %eax	#, iftmp.23_10
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	jmp	.L79	#
.L78:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$0, %eax	#, iftmp.23_10
.L79:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	testb	%al, %al	# iftmp.23_10
	je	.L80	#,
# 6_typesafeprintf.cpp:17: 			std::cout << value;
	movl	-12(%rbp), %eax	# value, tmp107
	movl	%eax, %esi	# tmp107,
	leaq	_ZSt4cout(%rip), %rax	#, tmp108
	movq	%rax, %rdi	# tmp108,
	call	_ZNSolsEi@PLT	#
# 6_typesafeprintf.cpp:18: 			printf_vt(s, rest...);
	movl	-16(%rbp), %edx	# rest#0, tmp109
	movq	-8(%rbp), %rax	# s, tmp110
	movd	%edx, %xmm0	# tmp109,
	movq	%rax, %rdi	# tmp110,
	call	_Z9printf_vtIfJEEvPKcT_DpT0_	#
# 6_typesafeprintf.cpp:19: 			return;
	jmp	.L76	#
.L80:
# 6_typesafeprintf.cpp:21: 	std::cout << *s++;
	movq	-8(%rbp), %rax	# s, s.24_3
	leaq	1(%rax), %rdx	#, tmp111
	movq	%rdx, -8(%rbp)	# tmp111, s
	movzbl	(%rax), %eax	# *s.24_3, _4
	movsbl	%al, %eax	# _4, _5
	movl	%eax, %esi	# _5,
	leaq	_ZSt4cout(%rip), %rax	#, tmp112
	movq	%rax, %rdi	# tmp112,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT	#
.L77:
# 6_typesafeprintf.cpp:15: 	while (*s){
	movq	-8(%rbp), %rax	# s, tmp113
	movzbl	(%rax), %eax	# *s_9, _6
	testb	%al, %al	# _6
	jne	.L82	#,
.L76:
# 6_typesafeprintf.cpp:23: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2522:
	.size	_Z9printf_vtIiJfEEvPKcT_DpT0_, .-_Z9printf_vtIiJfEEvPKcT_DpT0_
	.section	.text._Z9printf_vtIfJEEvPKcT_DpT0_,"axG",@progbits,_Z9printf_vtIfJEEvPKcT_DpT0_,comdat
	.weak	_Z9printf_vtIfJEEvPKcT_DpT0_
	.type	_Z9printf_vtIfJEEvPKcT_DpT0_, @function
_Z9printf_vtIfJEEvPKcT_DpT0_:
.LFB2542:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# s, s
	movss	%xmm0, -12(%rbp)	# value, value
# 6_typesafeprintf.cpp:15: 	while (*s){
	jmp	.L84	#
.L89:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp105
	movzbl	(%rax), %eax	# *s_9, _1
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _1
	jne	.L85	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	addq	$1, -8(%rbp)	#, s
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movq	-8(%rbp), %rax	# s, tmp106
	movzbl	(%rax), %eax	# *s_15, _2
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	cmpb	$37, %al	#, _2
	je	.L85	#,
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$1, %eax	#, iftmp.26_10
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	jmp	.L86	#
.L85:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	movl	$0, %eax	#, iftmp.26_10
.L86:
# 6_typesafeprintf.cpp:16: 		if (*s == '%' && *(++s) != '%'){
	testb	%al, %al	# iftmp.26_10
	je	.L87	#,
# 6_typesafeprintf.cpp:17: 			std::cout << value;
	movl	-12(%rbp), %eax	# value, tmp107
	movd	%eax, %xmm0	# tmp107,
	leaq	_ZSt4cout(%rip), %rax	#, tmp108
	movq	%rax, %rdi	# tmp108,
	call	_ZNSolsEf@PLT	#
# 6_typesafeprintf.cpp:18: 			printf_vt(s, rest...);
	movq	-8(%rbp), %rax	# s, tmp109
	movq	%rax, %rdi	# tmp109,
	call	_Z9printf_vtPKc	#
# 6_typesafeprintf.cpp:19: 			return;
	jmp	.L83	#
.L87:
# 6_typesafeprintf.cpp:21: 	std::cout << *s++;
	movq	-8(%rbp), %rax	# s, s.27_3
	leaq	1(%rax), %rdx	#, tmp110
	movq	%rdx, -8(%rbp)	# tmp110, s
	movzbl	(%rax), %eax	# *s.27_3, _4
	movsbl	%al, %eax	# _4, _5
	movl	%eax, %esi	# _5,
	leaq	_ZSt4cout(%rip), %rax	#, tmp111
	movq	%rax, %rdi	# tmp111,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c@PLT	#
.L84:
# 6_typesafeprintf.cpp:15: 	while (*s){
	movq	-8(%rbp), %rax	# s, tmp112
	movzbl	(%rax), %eax	# *s_9, _6
	testb	%al, %al	# _6
	jne	.L89	#,
.L83:
# 6_typesafeprintf.cpp:23: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2542:
	.size	_Z9printf_vtIfJEEvPKcT_DpT0_, .-_Z9printf_vtIfJEEvPKcT_DpT0_
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.align 4
.LC1:
	.long	1080452710
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.globl	__gxx_personality_v0
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
