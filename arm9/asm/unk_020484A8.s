	.include "asm/macros.inc"
	.include "global.inc"

	.section .rodata

	.global UNK_020F4684
UNK_020F4684: ; 0x020F4684
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global UNK_020F4694
UNK_020F4694: ; 0x020F4694
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global UNK_020F46B0
UNK_020F46B0: ; 0x020F46B0
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_020484A8
sub_020484A8: ; 0x020484A8
	push {r3-r6, lr}
	sub sp, #0x14
	add r5, r0, #0x0
	ldr r0, [r5, #0xc]
	add r6, r1, #0x0
	mov r1, #0xb
	add r2, sp, #0x0
	bl LoadHallOfFame
	add r4, r0, #0x0
	ldr r0, [sp, #0x0]
	cmp r0, #0x1
	bne _020484C6
	cmp r6, #0x0
	bne _020484CC
_020484C6:
	add r0, r4, #0x0
	bl Save_HOF_Init
_020484CC:
	ldr r0, [r5, #0xc]
	bl SaveArray_Party_Get
	add r6, r0, #0x0
	add r0, sp, #0x4
	bl GF_RTC_CopyDate
	add r0, r4, #0x0
	add r1, r6, #0x0
	add r2, sp, #0x4
	bl Save_HOF_RecordParty
	ldr r0, [r5, #0xc]
	add r1, r4, #0x0
	bl SaveHallOfFame
	add r0, r4, #0x0
	bl FreeToHeap
	add sp, #0x14
	pop {r3-r6, pc}
	.balign 4

	thumb_func_start sub_020484F8
sub_020484F8: ; 0x020484F8
	push {r4-r7, lr}
	sub sp, #0xc
	add r4, r0, #0x0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0x0
	add r0, r4, #0x0
	bl TaskManager_GetEnvironment
	add r5, r0, #0x0
	add r0, r4, #0x0
	bl TaskManager_GetStatePtr
	add r4, r0, #0x0
	ldr r0, [r4, #0x0]
	cmp r0, #0x9
	bhi _02048554
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #0x6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02048526: ; jump table (using 16-bit offset)
	.short _0204853A - _02048526 - 2; case 0
	.short _0204854A - _02048526 - 2; case 1
	.short _02048586 - _02048526 - 2; case 2
	.short _020485AE - _02048526 - 2; case 3
	.short _020485C0 - _02048526 - 2; case 4
	.short _020485F6 - _02048526 - 2; case 5
	.short _02048612 - _02048526 - 2; case 6
	.short _02048624 - _02048526 - 2; case 7
	.short _02048644 - _02048526 - 2; case 8
	.short _02048666 - _02048526 - 2; case 9
_0204853A:
	add r0, r6, #0x0
	add r1, r5, #0x4
	bl sub_02038814
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_0204854A:
	add r0, r6, #0x0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0x0
	beq _02048556
_02048554:
	b _02048688
_02048556:
	mov r1, #0x4
	mov r0, #0x3
	lsl r2, r1, #0xf
	bl CreateHeap
	add r0, r6, #0x0
	add r1, r5, #0x0
	bl sub_02048764
	mov r0, #0x8
	str r0, [sp, #0x0]
	mov r1, #0x1
	str r1, [sp, #0x4]
	mov r0, #0x20
	str r0, [sp, #0x8]
	mov r0, #0x3
	add r2, r1, #0x0
	mov r3, #0x0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_02048586:
	bl IsPaletteFadeFinished
	cmp r0, #0x0
	beq _02048688
	ldr r0, [r6, #0xc]
	bl Save_FileDoesNotBelongToPlayer
	cmp r0, #0x0
	bne _020485A8
	add r0, r6, #0x0
	add r1, r5, #0x0
	bl sub_020487E4
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_020485A8:
	mov r0, #0x7
	str r0, [r4, #0x0]
	b _02048688
_020485AE:
	add r0, r5, #0x0
	bl sub_02048838
	cmp r0, #0x0
	beq _02048688
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_020485C0:
	ldr r0, [r6, #0xc]
	bl SaveArray_Party_Get
	bl HealParty
	bl Save_SetDirtyBit
	ldr r0, [r6, #0xc]
	bl SaveGame
	add r7, r0, #0x0
	ldr r1, [r5, #0x0]
	add r0, r6, #0x0
	bl sub_020484A8
	add r0, r5, #0x0
	bl sub_02048848
	add r0, r6, #0x0
	add r1, r5, #0x0
	add r2, r7, #0x0
	bl sub_02048864
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_020485F6:
	add r0, r5, #0x0
	bl sub_02048838
	cmp r0, #0x0
	beq _02048688
	ldr r0, _02048690 ; =0x0000061B
	bl PlaySE
	mov r0, #0x12
	str r0, [r5, #0x38]
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_02048612:
	ldr r1, [r5, #0x38]
	cmp r1, #0x0
	beq _0204861E
	sub r0, r1, #0x1
	str r0, [r5, #0x38]
	b _02048688
_0204861E:
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_02048624:
	mov r0, #0x8
	str r0, [sp, #0x0]
	mov r1, #0x0
	mov r0, #0x1
	str r0, [sp, #0x4]
	mov r0, #0x20
	str r0, [sp, #0x8]
	mov r0, #0x3
	add r2, r1, #0x0
	add r3, r1, #0x0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_02048644:
	bl IsPaletteFadeFinished
	cmp r0, #0x0
	beq _02048688
	add r0, r6, #0x0
	add r1, r5, #0x0
	bl sub_020488D4
	add r5, #0x10
	add r0, r6, #0x0
	add r1, r5, #0x0
	bl sub_02038854
	ldr r0, [r4, #0x0]
	add r0, r0, #0x1
	str r0, [r4, #0x0]
	b _02048688
_02048666:
	add r0, r6, #0x0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0x0
	bne _02048688
	add r0, r5, #0x0
	bl FreeToHeap
	mov r0, #0x4
	bl DestroyHeap
	mov r0, #0x0
	bl OS_ResetSystem
	add sp, #0xc
	mov r0, #0x1
	pop {r4-r7, pc}
_02048688:
	mov r0, #0x0
	add sp, #0xc
	pop {r4-r7, pc}
	nop
_02048690: .word 0x0000061B

	thumb_func_start CallTask_GameClear
CallTask_GameClear: ; 0x02048694
	push {r4-r7, lr}
	sub sp, #0xc
	add r7, r0, #0x0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0x0
	mov r0, #0x20
	mov r1, #0x3c
	bl AllocFromHeap
	add r5, r0, #0x0
	ldr r0, [r4, #0xc]
	bl Save_VarsFlags_Get
	add r6, r0, #0x0
	ldr r0, [r4, #0xc]
	bl Save_PlayerData_GetProfile
	str r0, [sp, #0x0]
	ldr r0, [r4, #0xc]
	bl Save_LocalFieldData_Get
	bl LocalFieldData_GetDynamicWarp
	str r0, [sp, #0x8]
	ldr r0, [r4, #0xc]
	bl Save_LocalFieldData_Get
	bl LocalFieldData_GetSpecialSpawnWarpPtr
	str r0, [sp, #0x4]
	add r0, r6, #0x0
	bl sub_0205ED0C
	str r0, [r5, #0x0]
	ldr r0, [r4, #0xc]
	bl Save_PlayerData_GetProfile
	str r0, [r5, #0x4]
	ldr r0, [r4, #0xc]
	bl SaveArray_Party_Get
	str r0, [r5, #0x8]
	ldr r0, [r4, #0xc]
	bl Save_PlayerData_GetIGTAddr
	str r0, [r5, #0xc]
	ldr r0, [r4, #0xc]
	bl Save_PlayerData_GetProfile
	bl PlayerProfile_GetTrainerGender
	str r0, [r5, #0x10]
	add r0, r6, #0x0
	bl sub_0205ED0C
	str r0, [r5, #0x14]
	ldr r0, [r4, #0xc]
	bl Save_Pokedex_Get
	str r0, [r5, #0x18]
	add r0, r6, #0x0
	bl sub_0205ED0C
	cmp r0, #0x0
	bne _0204871E
	add r0, r4, #0x0
	bl Script_SavRTC_DateTimeTox2C
_0204871E:
	ldr r0, [r4, #0xc]
	bl SaveArray_Party_Get
	bl GiveAllMonsTheSinnohChampRibbon
	ldr r0, [sp, #0x8]
	bl sub_020377B0
	ldr r0, [sp, #0x4]
	bl sub_020377C8
	add r0, r6, #0x0
	bl sub_0205F154
	add r0, r6, #0x0
	bl sub_0205ECFC
	ldr r0, [sp, #0x0]
	bl PlayerProfile_SetGameClearFlag
	ldr r0, [r4, #0xc]
	bl Save_GameStats_Get
	mov r1, #0x2e
	bl GameStats_Inc
	ldr r1, _02048760 ; =sub_020484F8
	add r0, r7, #0x0
	add r2, r5, #0x0
	bl TaskManager_Call
	add sp, #0xc
	pop {r4-r7, pc}
	.balign 4
_02048760: .word sub_020484F8

	thumb_func_start sub_02048764
sub_02048764: ; 0x02048764
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0x0
	mov r0, #0x0
	str r0, [r1, #0x2c]
	str r0, [r1, #0x30]
	add r1, #0x1c
	add r0, r1, #0x0
	bl InitWindow
	ldr r0, _020487D4 ; =UNK_020F46B0
	bl GfGfx_SetBanks
	ldr r2, _020487D8 ; =0x04000304
	ldrh r1, [r2, #0x0]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2, #0x0]
	ldr r0, _020487DC ; =UNK_020F4684
	bl SetBothScreensModesAndDisable
	mov r0, #0x3
	mov r1, #0x0
	bl BG_SetMaskColor
	ldr r0, [r4, #0x8]
	ldr r2, _020487E0 ; =UNK_020F4694
	mov r1, #0x3
	mov r3, #0x0
	bl InitBgFromTemplate
	mov r1, #0x20
	mov r0, #0x3
	mov r2, #0x0
	add r3, r1, #0x0
	bl BG_ClearCharDataRange
	mov r2, #0x0
	str r2, [sp, #0x0]
	mov r0, #0x20
	str r0, [sp, #0x4]
	str r0, [sp, #0x8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x8]
	mov r1, #0x3
	add r3, r2, #0x0
	bl FillBgTilemapRect
	ldr r0, [r4, #0x8]
	mov r1, #0x3
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_020487D4: .word UNK_020F46B0
_020487D8: .word 0x04000304
_020487DC: .word UNK_020F4684
_020487E0: .word UNK_020F4694

	thumb_func_start sub_020487E4
sub_020487E4: ; 0x020487E4
	push {r4-r6, lr}
	add r5, r0, #0x0
	ldr r0, [r5, #0xc]
	add r4, r1, #0x0
	bl Save_PlayerData_GetOptionsAddr
	add r6, r0, #0x0
	mov r0, #0x1a
	mov r1, #0xc7
	mov r2, #0xf
	mov r3, #0x20
	bl ReadMsgData_NewNarc_NewString
	str r0, [r4, #0x2c]
	add r1, r4, #0x0
	ldr r0, [r5, #0x8]
	add r1, #0x1c
	mov r2, #0x3
	bl sub_020545B8
	add r0, r4, #0x0
	add r0, #0x1c
	add r1, r6, #0x0
	bl sub_02054608
	add r0, r4, #0x0
	ldr r1, [r4, #0x2c]
	add r0, #0x1c
	add r2, r6, #0x0
	mov r3, #0x1
	bl sub_02054658
	str r0, [r4, #0x34]
	add r0, r4, #0x0
	ldr r1, _02048834 ; =0x000003E2
	add r0, #0x1c
	bl WaitingIcon_New
	str r0, [r4, #0x30]
	pop {r4-r6, pc}
	.balign 4
_02048834: .word 0x000003E2

	thumb_func_start sub_02048838
sub_02048838: ; 0x02048838
	ldr r0, [r0, #0x34]
	ldr r3, _02048844 ; =sub_020546C8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx r3
	nop
_02048844: .word sub_020546C8

	thumb_func_start sub_02048848
sub_02048848: ; 0x02048848
	push {r4, lr}
	add r4, r0, #0x0
	ldr r0, [r4, #0x2c]
	bl String_Delete
	ldr r0, [r4, #0x30]
	bl sub_0200DBFC
	add r4, #0x1c
	add r0, r4, #0x0
	bl sub_0205464C
	pop {r4, pc}
	.balign 4

	thumb_func_start sub_02048864
sub_02048864: ; 0x02048864
	push {r3-r7, lr}
	add r5, r0, #0x0
	add r4, r1, #0x0
	add r6, r2, #0x0
	mov r0, #0x1
	mov r1, #0x1a
	mov r2, #0xc7
	mov r3, #0x4
	bl NewMsgDataFromNarc
	add r7, r0, #0x0
	cmp r6, #0x2
	bne _020488AC
	mov r0, #0x4
	bl MessageFormat_New
	add r6, r0, #0x0
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetProfile
	add r2, r0, #0x0
	add r0, r6, #0x0
	mov r1, #0x0
	bl BufferPlayersName
	add r0, r6, #0x0
	add r1, r7, #0x0
	mov r2, #0x10
	mov r3, #0x4
	bl ReadMsgData_ExpandPlaceholders
	str r0, [r4, #0x2c]
	add r0, r6, #0x0
	bl MessageFormat_Delete
	b _020488B4
_020488AC:
	mov r1, #0x12
	bl NewString_ReadMsgData
	str r0, [r4, #0x2c]
_020488B4:
	add r0, r7, #0x0
	bl DestroyMsgData
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetOptionsAddr
	add r2, r0, #0x0
	add r0, r4, #0x0
	ldr r1, [r4, #0x2c]
	add r0, #0x1c
	mov r3, #0x1
	bl sub_02054658
	str r0, [r4, #0x34]
	pop {r3-r7, pc}
	.balign 4

	thumb_func_start sub_020488D4
sub_020488D4: ; 0x020488D4
	push {r3-r5, lr}
	add r4, r1, #0x0
	add r5, r0, #0x0
	ldr r0, [r4, #0x2c]
	cmp r0, #0x0
	beq _020488E4
	bl String_Delete
_020488E4:
	add r0, r4, #0x0
	add r0, #0x1c
	bl WindowIsInUse
	cmp r0, #0x0
	beq _020488F8
	add r4, #0x1c
	add r0, r4, #0x0
	bl RemoveWindow
_020488F8:
	ldr r0, [r5, #0x8]
	mov r1, #0x3
	bl FreeBgTilemapBuffer
	pop {r3-r5, pc}
	.balign 4
