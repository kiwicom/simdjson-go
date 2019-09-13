//+build !noasm !appengine
// AUTO-GENERATED BY C2GOASM -- DO NOT EDIT

DATA LCDATA1<>+0x000(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x008(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x010(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x018(SB)/8, $0x2222222222222222
DATA LCDATA1<>+0x020(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x028(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x030(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x038(SB)/8, $0x8080808080808080
DATA LCDATA1<>+0x040(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x048(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x050(SB)/8, $0xa0a0a0a0a0a0a0a0
DATA LCDATA1<>+0x058(SB)/8, $0xa0a0a0a0a0a0a0a0
GLOBL LCDATA1<>(SB), 8, $96

TEXT ·_find_quote_mask_and_bits(SB), $0-56

    MOVQ input_lo+0(FP), DI
    MOVQ input_hi+8(FP), SI
    MOVQ odd_ends+16(FP), DX
    MOVQ prev_iter_inside_quote+24(FP), CX
    MOVQ quote_bits+32(FP), R8
    MOVQ error_mask+40(FP), R9
    LEAQ LCDATA1<>(SB), BP

    LONG $0x076ffec5             // vmovdqu    ymm0, yword [rdi]
    LONG $0x0e6ffec5             // vmovdqu    ymm1, yword [rsi]
    LONG $0x556ffdc5; BYTE $0x00 // vmovdqa    ymm2, yword 0[rbp] /* [rip + LCPI0_0] */
    LONG $0xda74fdc5             // vpcmpeqb    ymm3, ymm0, ymm2
    LONG $0xc3d7fdc5             // vpmovmskb    eax, ymm3
    LONG $0xd274f5c5             // vpcmpeqb    ymm2, ymm1, ymm2
    LONG $0xf2d7fdc5             // vpmovmskb    esi, ymm2
    LONG $0x20e6c148             // shl    rsi, 32
    WORD $0x0948; BYTE $0xc6     // or    rsi, rax
    WORD $0xf748; BYTE $0xd2     // not    rdx
    WORD $0x2148; BYTE $0xf2     // and    rdx, rsi
    WORD $0x8949; BYTE $0x10     // mov    qword [r8], rdx
    LONG $0x6ef9e1c4; BYTE $0xd2 // vmovq    xmm2, rdx
    LONG $0xdb76e1c5             // vpcmpeqd    xmm3, xmm3, xmm3
    LONG $0x4469e3c4; WORD $0x00d3 // vpclmulqdq    xmm2, xmm2, xmm3, 0
    LONG $0x7ef9e1c4; BYTE $0xd0 // vmovq    rax, xmm2
    WORD $0x3348; BYTE $0x01     // xor    rax, qword [rcx]
    LONG $0x556ffdc5; BYTE $0x20 // vmovdqa    ymm2, yword 32[rbp] /* [rip + LCPI0_1] */
    LONG $0xc2effdc5             // vpxor    ymm0, ymm0, ymm2
    LONG $0x5d6ffdc5; BYTE $0x40 // vmovdqa    ymm3, yword 64[rbp] /* [rip + LCPI0_2] */
    LONG $0xc064e5c5             // vpcmpgtb    ymm0, ymm3, ymm0
    LONG $0xd0d7fdc5             // vpmovmskb    edx, ymm0
    LONG $0xc2eff5c5             // vpxor    ymm0, ymm1, ymm2
    LONG $0xc064e5c5             // vpcmpgtb    ymm0, ymm3, ymm0
    LONG $0xf0d7fdc5             // vpmovmskb    esi, ymm0
    LONG $0x20e6c148             // shl    rsi, 32
    WORD $0x0948; BYTE $0xd6     // or    rsi, rdx
    WORD $0x2148; BYTE $0xc6     // and    rsi, rax
    WORD $0x0949; BYTE $0x31     // or    qword [r9], rsi
    WORD $0x8948; BYTE $0xc2     // mov    rdx, rax
    LONG $0x3ffac148             // sar    rdx, 63
    WORD $0x8948; BYTE $0x11     // mov    qword [rcx], rdx
    VZEROUPPER
    MOVQ AX, quote_mask+48(FP)
    RET
