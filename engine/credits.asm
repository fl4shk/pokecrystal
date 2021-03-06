INCLUDE "includes.asm"


SECTION "Credits", ROMX, BANK[CREDITS]

	const_def
	const SATOSHI_TAJIRI
	const JUNICHI_MASUDA
	const TETSUYA_WATANABE
	const SHIGEKI_MORIMOTO
	const SOUSUKE_TAMADA
	const TAKENORI_OOTA
	const KEN_SUGIMORI
	const MOTOFUMI_FUJIWARA
	const ATSUKO_NISHIDA
	const MUNEO_SAITO
	const SATOSHI_OOTA
	const RENA_YOSHIKAWA
	const JUN_OKUTANI
	const HIRONOBU_YOSHIDA
	const ASUKA_IWASHITA
	const GO_ICHINOSE
	const MORIKAZU_AOKI
	const KOHJI_NISHINO
	const KENJI_MATSUSHIMA
	const TOSHINOBU_MATSUMIYA
	const SATORU_IWATA
	const NOBUHIRO_SEYA
	const KAZUHITO_SEKINE
	const TETSUJI_OOTA
	const NCL_SUPER_MARIO_CLUB
	const SARUGAKUCHO
	const AKITO_MORI
	const TAKAHIRO_HARADA
	const TOHRU_HASHIMOTO
	const NOBORU_MATSUMOTO
	const TAKEHIRO_IZUSHI
	const TAKASHI_KAWAGUCHI
	const TSUNEKAZU_ISHIHARA
	const HIROSHI_YAMAUCHI
	const KENJI_SAIKI
	const ATSUSHI_TADA
	const NAOKO_KAWAKAMI
	const HIROYUKI_ZINNAI
	const KUNIMI_KAWAMURA
	const HISASHI_SOGABE
	const KEITA_KAGAYA
	const YOSHINORI_MATSUDA
	const HITOMI_SATO
	const TORU_OSAWA
	const TAKAO_OHARA
	const YUICHIRO_ITO
	const TAKAO_SHIMIZU
	const PLANNING
	const KEITA_NAKAMURA
	const HIROTAKA_UEMURA
	const HIROAKI_TAMURA
	const NORIAKI_SAKAGUCHI
	const MIYUKI_SATO
	const GAKUZI_NOMOTO
	const AI_MASHIMA
	const MIKIHIRO_ISHIKAWA
	const HIDEYUKI_HASHIMOTO
	const SATOSHI_YAMATO
	const SHIGERU_MIYAMOTO
	const GAIL_TILDEN
	const NOB_OGASAWARA
	const SETH_MCMAHILL
	const HIROTO_ALEXANDER
	const TERESA_LILLYGREN
	const THOMAS_HERTZOG
	const ERIK_JOHNSON
	const HIRO_NAKAMURA
	const TERUKI_MURAKAWA
	const KAZUYOSHI_OSAWA
	const KIMIKO_NAKAMICHI
	const CREDIT_END
	const CREDIT_UNKNOWN
	const STAFF
	const DIRECTOR
	const CODIRECTOR
	const PROGRAMMERS
	const GRAPHICS_DIRECTOR
	const MONSTER_DESIGN
	const GRAPHICS_DESIGN
	const CREDIT_MUSIC
	const CREDIT_SOUND_EFFECTS
	const GAME_DESIGN
	const GAME_SCENARIO
	const TOOL_PROGRAMMING
	const PARAMETRIC_DESIGN
	const SCRIPT_DESIGN
	const MAP_DATA_DESIGN
	const MAP_DESIGN
	const PRODUCT_TESTING
	const SPECIAL_THANKS
	const PRODUCERS
	const EXECUTIVE_PRODUCER
	const POKEMON_ANIMATION
	const POKEDEX_TEXT
	const MOBILE_PRJ_LEADER
	const MOBILE_SYSTEM_AD
	const MOBILE_STADIUM_DIR
	const COORDINATION
	const COPYRIGHT
	const US_VERSION_STAFF
	const US_COORDINATION
	const TEXT_TRANSLATION
	const PAAD_TESTING

const_value SET -7
	const CREDITS_THEEND
	const CREDITS_WAIT2
	const CREDITS_MUSIC
	const CREDITS_CLEAR
	const CREDITS_SCENE
	const CREDITS_WAIT
	const CREDITS_END


Function109847:: ; 109847
	bit 6, b
	ld a, $0
	jr z, .asm_10984f
	ld a, $40
.asm_10984f
	ld [wcf63], a

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	call WhiteBGMap
	call ClearTileMap
	call ClearSprites

	ld hl, wca00
	ld c, $80
	ld de, $ff00

.asm_10986a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	dec c
	jr nz, .asm_10986a

	ld de, CreditsBorderGFX
	ld hl, $9200
	lb bc, BANK(CreditsBorderGFX), $09
	call Request2bpp

	ld de, CopyrightGFX
	ld hl, $9600
	lb bc, BANK(CopyrightGFX), $1d
	call Request2bpp

	ld de, TheEndGFX
	ld hl, $9400
	lb bc, BANK(TheEndGFX), $10
	call Request2bpp

	ld a, $ff
	ld [wcf64], a
	xor a
	ld [wcf65], a

	call Function109bca
	ld e, l
	ld d, h
	ld hl, VTiles2
	lb bc, BANK(CreditsMonsGFX), $10
	call Request2bpp

	call Function109a95
	xor a
	ld [wcf66], a

	ld hl, LYOverrides
	ld bc, $100
	xor a
	call ByteFill

	ld a, rSCX - $ff00
	ld [hLCDStatCustom], a

	call GetCreditsPalette
	call Function32f9
	ld a, [hVBlank]
	push af
	ld a, $5
	ld [hVBlank], a
	ld a, $1
	ld [$ffaa], a
	xor a
	ld [hBGMapMode], a
	ld [CreditsPos], a
	ld [wcd21], a
	ld [CreditsTimer], a

.asm_1098de
	call Function109908
	call Function1098fd
	jr nz, .asm_1098ee

	call Function109926
	call DelayFrame
	jr .asm_1098de

.asm_1098ee
	call WhiteBGMap
	xor a
	ld [hLCDStatCustom], a
	ld [hBGMapAddress], a
	pop af
	ld [hVBlank], a
	pop af
	ld [rSVBK], a
	ret
; 1098fd

Function1098fd: ; 1098fd
	ld a, [hJoypadDown]
	and $1
	ret z
	ld a, [wcf63]
	bit 7, a
	ret
; 109908

Function109908: ; 109908
	ld a, [hJoypadDown]
	and $2
	ret z
	ld a, [wcf63]
	bit 6, a
	ret z
	ld hl, CreditsPos
	ld a, [hli]
	cp $d
	jr nc, .asm_10991e
	ld a, [hli]
	and a
	ret z

.asm_10991e
	ld hl, CreditsTimer
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
; 109926

Function109926: ; 109926
	ld a, [wcf63]
	and $f
	ld e, a
	ld d, 0
	ld hl, Jumptable_109937
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 109937


Jumptable_109937: ; 109937 (42:5937)
	dw ParseCredits
	dw Function109951
	dw Function109951
	dw Function10995e
	dw Function109964
	dw Function10997b
	dw Function109986
	dw Function109951
	dw Function109951
	dw Function109951
	dw Function109964
	dw Function10997b
	dw Function109956


Function109951: ; 109951 (42:5951)
	ld hl, wcf63
	inc [hl]
	ret

Function109956: ; 109956 (42:5956)
	ld hl, wcf63
	ld a, [hl]
	and $f0
	ld [hl], a
	ret

Function10995e: ; 10995e (42:595e)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	jp Function109951

Function109964: ; 109964 (42:5964)
	call Function109bca
	ld a, l
	ld [Requested2bppSource], a
	ld a, h
	ld [Requested2bppSource + 1], a
	ld a, $0
	ld [Requested2bppDest], a
	ld a, $90
	ld [Requested2bppDest + 1], a
	jr Function10997b

Function10997b: ; 10997b (42:597b)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld a, $8
	ld [Requested2bpp], a
	jp Function109951

Function109986: ; 109986 (42:5986)
	ld a, [rLY] ; $ff00+$44
	cp $30
	jr c, Function109986
	ld a, [wcf66]
rept 2
	dec a
endr
	ld [wcf66], a
	ld hl, LYOverrides + $1f
	call Function1099a3
	ld hl, LYOverrides + $87
	call Function1099a3
	jp Function109951

Function1099a3: ; 1099a3 (42:59a3)
	ld c, $8
.asm_1099a5
	ld [hli], a
	dec c
	jr nz, .asm_1099a5
	ret
; 1099aa


ParseCredits: ; 1099aa
	ld hl, wcf63
	bit 7, [hl]
	jp nz, .done
	
; Wait until the timer has run out to parse the next command.
	ld hl, CreditsTimer
	ld a, [hl]
	and a
	jr z, .parse
	
; One tick has passed.
	dec [hl]
	jp .done
	
.parse
; First, let's clear the current text display,
; starting from line 5.
	xor a
	ld [$ffd4], a
	hlcoord 0, 5
	ld bc, 20 * 12
	ld a, " "
	call ByteFill
	
; Then read the script.
	
.loop
	call .get
	
; Commands:
	cp CREDITS_END
	jp z, .end
	cp CREDITS_WAIT
	jr z, .wait
	cp CREDITS_SCENE
	jr z, .scene
	cp CREDITS_CLEAR
	jr z, .clear
	cp CREDITS_MUSIC
	jr z, .music
	cp CREDITS_WAIT2
	jr z, .wait2
	cp CREDITS_THEEND
	jr z, .theend
	
; If it's not a command, it's a string identifier.
	
	push af
	ld e, a
	ld d, 0
	ld hl, CreditsStrings
rept 2
	add hl, de
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af
	
; Strings spanning multiple lines have special cases.
	
	cp COPYRIGHT
	jr z, .copyright
	
	cp STAFF
	jr c, .staff
	
; The rest start from line 6.

	hlcoord 0, 6
	jr .print
	
.copyright
	hlcoord 2, 6
	jr .print
	
.staff
	hlcoord 0, 6
	
.print
; Print strings spaced every two lines.
	call .get
	ld bc, 20 * 2
	call AddNTimes
	call PlaceString
	jr .loop
	
.theend
; Display "The End" graphic.
	call Function109c11
	jr .loop
	
.scene
; Update the scene number and corresponding palette.
	call .get
	ld [wcf65], a ; scene
	xor a
	ld [wcf64], a ; frame
	call GetCreditsPalette
	call Function32f9 ; update hw pal registers
	jr .loop
	
.clear
; Clear the banner.
	ld a, $ff
	ld [wcf64], a ; frame
	jr .loop
	
.music
; Play the credits music.
	ld de, MUSIC_CREDITS
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	call PlayMusic
	jp .loop
	
.wait2
; Wait for some amount of ticks.
	call .get
	ld [CreditsTimer], a
	jr .done
	
.wait
; Wait for some amount of ticks, and do something else.
	call .get
	ld [CreditsTimer], a
	
	xor a
	ld [$ffd5], a
	ld a, 1
	ld [$ffd4], a
	
.done
	jp Function109951
	
.end
; Stop execution.
	ld hl, wcf63
	set 7, [hl]
	ld a, $20
	ld [MusicFade], a
	ld a, MUSIC_POST_CREDITS % $100
	ld [MusicFadeID], a
	ld a, MUSIC_POST_CREDITS / $100
	ld [MusicFadeIDHi], a
	ret

.get
; Get byte CreditsPos from CreditsScript
	push hl
	push de
	ld a, [CreditsPos]
	ld e, a
	ld a, [CreditsPos+1]
	ld d, a
	ld hl, CreditsScript
	add hl, de
	
	inc de
	ld a, e
	ld [CreditsPos], a
	ld a, d
	ld [CreditsPos+1], a
	ld a, [hl]
	pop de
	pop hl
	ret
; 109a95


Function109a95: ; 109a95 (42:5a95)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld a, $c
	ld [hBGMapAddress], a ; $ff00+$d6
	ld a, $28
	hlcoord 0, 0
	ld bc, $168
	call ByteFill
	ld a, $7f
	hlcoord 0, 4
	ld bc, $118
	call ByteFill
	hlcoord 0, 4
	ld a, $24
	call Function109b1d
	hlcoord 0, 17
	ld a, $20
	call Function109b1d
	hlcoord 0, 0, AttrMap
	ld bc, $50
	xor a
	call ByteFill
	hlcoord 0, 4, AttrMap
	ld bc, $14
	ld a, $1
	call ByteFill
	hlcoord 0, 5, AttrMap
	ld bc, $f0
	ld a, $2
	call ByteFill
	hlcoord 0, 17, AttrMap
	ld bc, $14
	ld a, $1
	call ByteFill
	call Function3200
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld [hBGMapAddress], a ; $ff00+$d6
	hlcoord 0, 0
	call Function109aff
	call Function3200
	ret

Function109aff: ; 109aff (42:5aff)
	ld b, $5
.asm_109b01
	push hl
	ld de, $11
	ld c, $4
	xor a
.asm_109b08
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	add hl, de
	dec c
	jr nz, .asm_109b08
	pop hl
rept 4
	inc hl
endr
	dec b
	jr nz, .asm_109b01
	ret

Function109b1d: ; 109b1d (42:5b1d)
	ld c, $5
.asm_109b1f
	push af
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	pop af
	dec c
	jr nz, .asm_109b1f
	ret

GetCreditsPalette: ; 109b2c
	call .GetPalAddress
	
	push hl
	ld a, 0
	call .UpdatePals
	pop hl
	ret
	
.GetPalAddress
; Each set of palette data is 24 bytes long.
	ld a, [wcf65] ; scene
	and 3
	add a
	add a ; * 8
	add a
	ld e, a
	ld d, 0
	ld hl, CreditsPalettes
	add hl, de
	add hl, de ; * 3
	add hl, de
	ret
	
.UpdatePals
; Update the first three colors in both palette buffers.
	
	push af
	push hl
	add Unkn1Pals % $100
	ld e, a
	ld a, 0
	adc Unkn1Pals / $100
	ld d, a
	ld bc, 24
	call CopyBytes
	
	pop hl
	pop af
	add BGPals % $100
	ld e, a
	ld a, 0
	adc BGPals / $100
	ld d, a
	ld bc, 24
	call CopyBytes
	ret


CreditsPalettes:

; Pichu
	RGB 31, 00, 31
	RGB 31, 25, 00
	RGB 11, 14, 31
	RGB 07, 07, 07

	RGB 31, 05, 05
	RGB 11, 14, 31
	RGB 11, 14, 31
	RGB 31, 31, 31

	RGB 31, 05, 05
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31

; Smoochum
	RGB 31, 31, 31
	RGB 31, 27, 00
	RGB 26, 06, 31
	RGB 07, 07, 07

	RGB 03, 13, 31
	RGB 20, 00, 24
	RGB 26, 06, 31
	RGB 31, 31, 31

	RGB 03, 13, 31
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31

; Ditto
	RGB 31, 31, 31
	RGB 23, 12, 28
	RGB 31, 22, 00
	RGB 07, 07, 07

	RGB 03, 20, 00
	RGB 31, 22, 00
	RGB 31, 22, 00
	RGB 31, 31, 31

	RGB 03, 20, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31

; Igglybuff
	RGB 31, 31, 31
	RGB 31, 10, 31
	RGB 31, 00, 09
	RGB 07, 07, 07

	RGB 31, 14, 00
	RGB 31, 00, 09
	RGB 31, 00, 09
	RGB 31, 31, 31

	RGB 31, 14, 00
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
; 109bca

Function109bca: ; 109bca (42:5bca)
	ld hl, wcf64
	ld a, [hl]
	cp $ff
	jr z, .asm_109bed

	and 3
	ld e, a
	inc a
	and 3
	ld [hl], a
	ld a, [wcf65]
	and 3
rept 2
	add a
endr
	add e
	add a
	ld e, a
	ld d, 0
	ld hl, CreditsMonsFrames
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.asm_109bed
	ld hl, wca00
	ret
; 109bf1 (42:5bf1)

CreditsMonsFrames: ; 109bf1
	dw CreditsPichuGFX
	dw CreditsPichuGFX     + $100
	dw CreditsPichuGFX     + $200
	dw CreditsPichuGFX     + $300
	dw CreditsSmoochumGFX
	dw CreditsSmoochumGFX  + $100
	dw CreditsSmoochumGFX  + $200
	dw CreditsSmoochumGFX  + $300
	dw CreditsDittoGFX
	dw CreditsDittoGFX     + $100
	dw CreditsDittoGFX     + $200
	dw CreditsDittoGFX     + $300
	dw CreditsIgglybuffGFX
	dw CreditsIgglybuffGFX + $100
	dw CreditsIgglybuffGFX + $200
	dw CreditsIgglybuffGFX + $300
; 109c11

Function109c11: ; 109c11 (42:5c11)
	ld a, $40
	hlcoord 6, 9
	call Function109c1c
	hlcoord 6, 10

Function109c1c: ; 109c1c (42:5c1c)
	ld c, $8
.asm_109c1e
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_109c1e
	ret
; 109c24 (42:5c24)


CreditsBorderGFX:    INCBIN "gfx/credits/border.2bpp"

CreditsMonsGFX:
CreditsPichuGFX:     INCBIN "gfx/credits/pichu.2bpp"
CreditsSmoochumGFX:  INCBIN "gfx/credits/smoochum.2bpp"
CreditsDittoGFX:     INCBIN "gfx/credits/ditto.2bpp"
CreditsIgglybuffGFX: INCBIN "gfx/credits/igglybuff.2bpp"


CreditsScript: ; 10acb4

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Crystal Version Staff
	db                STAFF, 1

	db CREDITS_WAIT, 8

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 0 ; Pichu

	db             DIRECTOR, 1
	db       SATOSHI_TAJIRI, 2

	db CREDITS_WAIT, 12

	db           CODIRECTOR, 1
	db       JUNICHI_MASUDA, 2

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db       SOUSUKE_TAMADA, 1
	db       HISASHI_SOGABE, 2
	db         KEITA_KAGAYA, 3
	db    YOSHINORI_MATSUDA, 4

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db     SHIGEKI_MORIMOTO, 1
	db     TETSUYA_WATANABE, 2
	db        TAKENORI_OOTA, 3

	db CREDITS_WAIT, 12

	db    GRAPHICS_DIRECTOR, 1
	db         KEN_SUGIMORI, 2

	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db         KEN_SUGIMORI, 1
	db    MOTOFUMI_FUJIWARA, 2
	db     SHIGEKI_MORIMOTO, 3
	db     HIRONOBU_YOSHIDA, 4
	db         SATOSHI_OOTA, 5

	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 0
	db       ATSUKO_NISHIDA, 1
	db          MUNEO_SAITO, 2
	db       RENA_YOSHIKAWA, 3

	db CREDITS_WAIT, 12

	db    POKEMON_ANIMATION, 1
	db     HIRONOBU_YOSHIDA, 2
	db          JUN_OKUTANI, 3

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 1 ; Smoochum

	db      GRAPHICS_DESIGN, 0
	db     HIRONOBU_YOSHIDA, 1
	db          JUN_OKUTANI, 2
	db       ASUKA_IWASHITA, 3
	db     TETSUYA_WATANABE, 4

	db CREDITS_WAIT, 12

	db         CREDIT_MUSIC, 0
	db       JUNICHI_MASUDA, 1
	db        MORIKAZU_AOKI, 2
	db          GO_ICHINOSE, 3

	db CREDITS_WAIT, 12

	db CREDIT_SOUND_EFFECTS, 0
	db        MORIKAZU_AOKI, 1
	db       JUNICHI_MASUDA, 2
	db     TETSUYA_WATANABE, 3

	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 0
	db       JUNICHI_MASUDA, 1
	db     SHIGEKI_MORIMOTO, 2
	db        KOHJI_NISHINO, 3

	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db          HITOMI_SATO, 2
	db     KENJI_MATSUSHIMA, 3

	db CREDITS_WAIT, 12

	db        GAME_SCENARIO, 0
	db       JUNICHI_MASUDA, 1
	db        KOHJI_NISHINO, 2
	db  TOSHINOBU_MATSUMIYA, 3
	db     KENJI_MATSUSHIMA, 4

	db CREDITS_WAIT, 12

	db         POKEDEX_TEXT, 1
	db  TOSHINOBU_MATSUMIYA, 2

	db CREDITS_WAIT, 12

	db     TOOL_PROGRAMMING, 1
	db       SOUSUKE_TAMADA, 2
	db        TAKENORI_OOTA, 3

	db CREDITS_WAIT, 12

	db    PARAMETRIC_DESIGN, 1
	db        KOHJI_NISHINO, 2

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 2 ; Ditto

	db        SCRIPT_DESIGN, 1
	db         TETSUJI_OOTA, 2
	db        NOBUHIRO_SEYA, 3

	db CREDITS_WAIT, 12

	db      MAP_DATA_DESIGN, 1
	db         TETSUJI_OOTA, 2
	db      KAZUHITO_SEKINE, 3

	db CREDITS_WAIT, 12

	db           MAP_DESIGN, 0
	db         TETSUJI_OOTA, 1
	db        KOHJI_NISHINO, 2
	db        NOBUHIRO_SEYA, 3

	db CREDITS_WAIT, 12

	db         COORDINATION, 1
	db      HIROYUKI_ZINNAI, 2

	db CREDITS_WAIT, 12

	db            PRODUCERS, 0
	db         SATORU_IWATA, 1
	db       SATOSHI_YAMATO, 2
	db     SHIGERU_MIYAMOTO, 3

	db CREDITS_WAIT, 12

	db            PRODUCERS, 1
	db   TSUNEKAZU_ISHIHARA, 2

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 3 ; Igglybuff

	db     US_VERSION_STAFF, 2

	db CREDITS_WAIT, 9

	db      US_COORDINATION, 1
	db          GAIL_TILDEN, 2
	db        HIRO_NAKAMURA, 3

	db CREDITS_WAIT, 12

	db      US_COORDINATION, 1
	db       JUNICHI_MASUDA, 2
	db        SETH_MCMAHILL, 3

	db CREDITS_WAIT, 12

	db      US_COORDINATION, 1
	db     HIROTO_ALEXANDER, 2
	db     TERESA_LILLYGREN, 3

	db CREDITS_WAIT, 12

	db     TEXT_TRANSLATION, 1
	db        NOB_OGASAWARA, 2

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 1
	db      TERUKI_MURAKAWA, 2
	db      KAZUYOSHI_OSAWA, 3

	db CREDITS_WAIT, 12

	db         PAAD_TESTING, 1
	db       THOMAS_HERTZOG, 2
	db         ERIK_JOHNSON, 3

	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 0
	db             PLANNING, 1

	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 0
	db       KEITA_NAKAMURA, 1
	db      HIROTAKA_UEMURA, 2
	db       HIROAKI_TAMURA, 3
	db    NORIAKI_SAKAGUCHI, 4

	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 0
	db NCL_SUPER_MARIO_CLUB, 1
	db          KENJI_SAIKI, 2
	db         ATSUSHI_TADA, 3
	db          MIYUKI_SATO, 4

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db     KIMIKO_NAKAMICHI, 1
	db           AKITO_MORI, 2

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db        GAKUZI_NOMOTO, 1
	db           AI_MASHIMA, 2
	db      KUNIMI_KAWAMURA, 3

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db    MIKIHIRO_ISHIKAWA, 1
	db   HIDEYUKI_HASHIMOTO, 2

	db CREDITS_WAIT, 12

	db   EXECUTIVE_PRODUCER, 1
	db     HIROSHI_YAMAUCHI, 2

	db CREDITS_WAIT, 12

	db            COPYRIGHT, 1

	db CREDITS_WAIT, 9

; Display "The End" graphic.
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db CREDITS_END
; 10ae13


CreditsStrings:
	dw .SatoshiTajiri
	dw .JunichiMasuda
	dw .TetsuyaWatanabe
	dw .ShigekiMorimoto
	dw .SousukeTamada
	dw .TakenoriOota
	dw .KenSugimori
	dw .MotofumiFujiwara
	dw .AtsukoNishida
	dw .MuneoSaito
	dw .SatoshiOota
	dw .RenaYoshikawa
	dw .JunOkutani
	dw .HironobuYoshida
	dw .AsukaIwashita
	dw .GoIchinose
	dw .MorikazuAoki
	dw .KohjiNishino
	dw .KenjiMatsushima
	dw .ToshinobuMatsumiya
	dw .SatoruIwata
	dw .NobuhiroSeya
	dw .KazuhitoSekine
	dw .TetsujiOota
	dw .NclSuperMarioClub
	dw .Sarugakucho
	dw .AkitoMori
	dw .TakahiroHarada
	dw .TohruHashimoto
	dw .NoboruMatsumoto
	dw .TakehiroIzushi
	dw .TakashiKawaguchi
	dw .TsunekazuIshihara
	dw .HiroshiYamauchi
	dw .KenjiSaiki
	dw .AtsushiTada
	dw .NaokoKawakami
	dw .HiroyukiZinnai
	dw .KunimiKawamura
	dw .HisashiSogabe
	dw .KeitaKagaya
	dw .YoshinoriMatsuda
	dw .HitomiSato
	dw .ToruOsawa
	dw .TakaoOhara
	dw .YuichiroIto
	dw .TakaoShimizu
	dw .Planning
	dw .KeitaNakamura
	dw .HirotakaUemura
	dw .HiroakiTamura
	dw .NoriakiSakaguchi
	dw .MiyukiSato
	dw .GakuziNomoto
	dw .AiMashima
	dw .MikihiroIshikawa
	dw .HideyukiHashimoto
	dw .SatoshiYamato
	dw .ShigeruMiyamoto
	dw .GailTilden
	dw .NobOgasawara
	dw .SethMcMahill
	dw .HirotoAlexander
	dw .TeresaLillygren
	dw .ThomasHertzog
	dw .ErikJohnson
	dw .HiroNakamura
	dw .TerukiMurakawa
	dw .KazuyoshiOsawa
	dw .KimikoNakamichi
	dw .End
	dw .Unknown
	dw .Staff
	dw .Director
	dw .CoDirector
	dw .Programmers
	dw .GraphicsDirector
	dw .MonsterDesign
	dw .GraphicsDesign
	dw .Music
	dw .SoundEffects
	dw .GameDesign
	dw .GameScenario
	dw .ToolProgramming
	dw .ParametricDesign
	dw .ScriptDesign
	dw .MapDataDesign
	dw .MapDesign
	dw .ProductTesting
	dw .SpecialThanks
	dw .Producers
	dw .ExecutiveProducer
	dw .PokemonAnimation
	dw .PokedexText
	dw .MobilePrjLeader
	dw .MobileSystemAd
	dw .MobileStadiumDir
	dw .Coordination
	dw .Copyright
	dw .UsVersionStaff
	dw .UsCoordination
	dw .TextTranslation
	dw .PaadTesting

.SatoshiTajiri:       db "   SATOSHI TAJIRI@"         ; "たじり さとし@"
.JunichiMasuda:       db "   JUNICHI MASUDA@"         ; "ますだ じゅんいち@"
.TetsuyaWatanabe:     db "  TETSUYA WATANABE@"        ; "わたなべ てつや@"
.ShigekiMorimoto:     db "  SHIGEKI MORIMOTO@"        ; "もりもと しげき@"
.SousukeTamada:       db "   SOUSUKE TAMADA@"         ; "たまだ そうすけ@"
.TakenoriOota:        db "   TAKENORI OOTA@"          ; "おおた たけのり@"
.KenSugimori:         db "    KEN SUGIMORI@"          ; "すぎもり けん@"
.MotofumiFujiwara:    db " MOTOFUMI FUJIWARA@"        ; "ふじわら もとふみ@"
.AtsukoNishida:       db "   ATSUKO NISHIDA@"         ; "にしだ あつこ@"
.MuneoSaito:          db "    MUNEO SAITO@"           ; "さいとう むねお@"
.SatoshiOota:         db "    SATOSHI OOTA@"          ; "おおた さとし@"
.RenaYoshikawa:       db "   RENA YOSHIKAWA@"         ; "よしかわ れな@"
.JunOkutani:          db "    JUN OKUTANI@"           ; "おくたに じゅん@"
.HironobuYoshida:     db "  HIRONOBU YOSHIDA@"        ; "よしだ ひろのぶ@"
.AsukaIwashita:       db "   ASUKA IWASHITA@"         ; "いわした あすか@"
.GoIchinose:          db "    GO ICHINOSE@"           ; "いちのせ ごう@"
.MorikazuAoki:        db "   MORIKAZU AOKI@"          ; "あおき もりかず@"
.KohjiNishino:        db "   KOHJI NISHINO@"          ; "にしの こうじ@"
.KenjiMatsushima:     db "  KENJI MATSUSHIMA@"        ; "まつしま けんじ@"
.ToshinobuMatsumiya:  db "TOSHINOBU MATSUMIYA@"       ; "まつみや としのぶ@"
.SatoruIwata:         db "    SATORU IWATA@"          ; "いわた さとる@"
.NobuhiroSeya:        db "   NOBUHIRO SEYA@"          ; "せや のぶひろ@"
.KazuhitoSekine:      db "  KAZUHITO SEKINE@"         ; "せきね かずひと@"
.TetsujiOota:         db "    TETSUJI OOTA@"          ; "おおた てつじ@"
.NclSuperMarioClub:   db "NCL SUPER MARIO CLUB@"      ; "スーパーマりォクラブ@"
.Sarugakucho:         db "    SARUGAKUCHO@"           ; "さるがくちょう@"
.AkitoMori:           db "     AKITO MORI@"           ; "もり あきと@"
.TakahiroHarada:      db "  TAKAHIRO HARADA@"         ; "はらだ たかひろ@"
.TohruHashimoto:      db "  TOHRU HASHIMOTO@"         ; "はしもと とおる@"
.NoboruMatsumoto:     db "  NOBORU MATSUMOTO@"        ; "まつもと のぼる@"
.TakehiroIzushi:      db "  TAKEHIRO IZUSHI@"         ; "いずし たけひろ@"
.TakashiKawaguchi:    db " TAKASHI KAWAGUCHI@"        ; "かわぐち たかし@"
.TsunekazuIshihara:   db " TSUNEKAZU ISHIHARA@"       ; "いしはら つねかず@"
.HiroshiYamauchi:     db "  HIROSHI YAMAUCHI@"        ; "やまうち ひろし@"
.KenjiSaiki:          db "    KENJI SAIKI@"           ; "さいき けんじ@"
.AtsushiTada:         db "    ATSUSHI TADA@"          ; "ただ あつし@"
.NaokoKawakami:       db "   NAOKO KAWAKAMI@"         ; "かわかみ なおこ@"
.HiroyukiZinnai:      db "  HIROYUKI ZINNAI@"         ; "じんない ひろゆき@"
.KunimiKawamura:      db "  KUNIMI KAWAMURA@"         ; "かわむら くにみ@"
.HisashiSogabe:       db "   HISASHI SOGABE@"         ; "そがべ ひさし@"
.KeitaKagaya:         db "    KEITA KAGAYA@"          ; "かがや けいた@"
.YoshinoriMatsuda:    db " YOSHINORI MATSUDA@"        ; "まつだ よしのり@"
.HitomiSato:          db "    HITOMI SATO@"           ; "さとう ひとみ@"
.ToruOsawa:           db "     TORU OSAWA@"           ; "おおさわ とおる@"
.TakaoOhara:          db "    TAKAO OHARA@"           ; "おおはら たかお@"
.YuichiroIto:         db "    YUICHIRO ITO@"          ; "いとう ゆういちろう@"
.TakaoShimizu:        db "   TAKAO SHIMIZU@"          ; "しみず たかお@"
.Planning:            db " SPECIAL PRODUCTION"
                    next "      PLANNING"             ; "きかくかいはつぶ@"
                    next " & DEVELOPMENT DEPT.@"
.KeitaNakamura:       db "   KEITA NAKAMURA@"         ; "なかむら けいた@"
.HirotakaUemura:      db "  HIROTAKA UEMURA@"         ; "うえむら ひろたか@"
.HiroakiTamura:       db "   HIROAKI TAMURA@"         ; "たむら ひろあき@"
.NoriakiSakaguchi:    db " NORIAKI SAKAGUCHI@"        ; "さかぐち のりあき@"
.MiyukiSato:          db "    MIYUKI SATO@"           ; "さとう みゆき@"
.GakuziNomoto:        db "   GAKUZI NOMOTO@"          ; "のもと がくじ@"
.AiMashima:           db "     AI MASHIMA@"           ; "ましま あい@"
.MikihiroIshikawa:    db " MIKIHIRO ISHIKAWA@"        ; "いしかわ みきひろ@"
.HideyukiHashimoto:   db " HIDEYUKI HASHIMOTO@"       ; "はしもと ひでゆき@"
.SatoshiYamato:       db "   SATOSHI YAMATO@"         ; "やまと さとし@"
.ShigeruMiyamoto:     db "  SHIGERU MIYAMOTO@"        ; "みやもと しげる@"
.End:                 db "        END@"               ; "おしまい@"
.Unknown:             db "      ????????@"            ; "????????@"
.GailTilden:          db "    GAIL TILDEN@"
.NobOgasawara:        db "   NOB OGASAWARA@"
.SethMcMahill:        db "   SETH McMAHILL@"
.HirotoAlexander:     db "  HIROTO ALEXANDER@"
.TeresaLillygren:     db "  TERESA LILLYGREN@"
.ThomasHertzog:       db "   THOMAS HERTZOG@"
.ErikJohnson:         db "    ERIK JOHNSON@"
.HiroNakamura:        db "   HIRO NAKAMURA@"
.TerukiMurakawa:      db "  TERUKI MURAKAWA@"
.KazuyoshiOsawa:      db "  KAZUYOSHI OSAWA@"
.KimikoNakamichi:     db "  KIMIKO NAKAMICHI@"
.Staff:               db "      #MON"                 ; "ポケットモンスター"
                    next "  CRYSTAL VERSION"          ; "  クりスタル バージョン"
                    next "       STAFF@"              ; "    スタッフ@"
.Director:            db "      DIRECTOR@"            ; "エグゼクティブ ディレクター@"
.CoDirector:          db "    CO-DIRECTOR@"           ; "ディレクター@"
.Programmers:         db "    PROGRAMMERS@"           ; "プログラム@"
.GraphicsDirector:    db " GRAPHICS DIRECTOR@"        ; "グラフィック ディレクター@"
.MonsterDesign:       db "   MONSTER DESIGN@"         ; "# デザイン@"
.GraphicsDesign:      db "  GRAPHICS DESIGN@"         ; "グラフィック デザイン@"
.Music:               db "       MUSIC@"              ; "おんがく@"
.SoundEffects:        db "   SOUND EFFECTS@"          ; "サウンド エフ→クト@"
.GameDesign:          db "    GAME DESIGN@"           ; "ゲームデザイン@"
.GameScenario:        db "   GAME SCENARIO@"          ; "シナりォ@"
.ToolProgramming:     db "  TOOL PROGRAMMING@"        ; "ツール プログラム@"
.ParametricDesign:    db " PARAMETRIC DESIGN@"        ; "パラメーター せってい@"
.ScriptDesign:        db "   SCRIPT DESIGN@"          ; "スクりプト せってい@"
.MapDataDesign:       db "  MAP DATA DESIGN@"         ; "マップデータ せってい@"
.MapDesign:           db "     MAP DESIGN@"           ; "マップ デザイン@"
.ProductTesting:      db "  PRODUCT TESTING@"         ; "デバッグプレイ@"
.SpecialThanks:       db "   SPECIAL THANKS@"         ; "スぺシャルサンクス@"
.Producers:           db "     PRODUCERS@"            ; "プロデューサー@"
.ExecutiveProducer:   db " EXECUTIVE PRODUCER@"       ; "エグゼクティブ プロデューサー@"
.PokemonAnimation:    db " #MON ANIMATION@"           ; "# アニメーション@"
.PokedexText:         db "    #DEX TEXT@"             ; "ずかん テキスト@"
.MobilePrjLeader:     db " MOBILE PRJ. LEADER@"       ; "モバイルプロジ→クト りーダー@"
.MobileSystemAd:      db " MOBILE SYSTEM AD.@"        ; "モバイル システムアドバイザー@"
.MobileStadiumDir:    db "MOBILE STADIUM DIR.@"       ; "モバイルスタジアム ディレクター@"
.Coordination:        db "    COORDINATION@"          ; "コーディネーター@"
.UsVersionStaff:      db "  US VERSION STAFF@"
.UsCoordination:      db "  US COORDINATION@"
.TextTranslation:     db "  TEXT TRANSLATION@"
.PaadTesting:         db "    PAAD TESTING@"

.Copyright:
	;    (C) 1  9  9  5 - 2  0  0  1     N  i  n  t  e  n  d  o
	db   $60,$61,$62,$63,$64,$65,$66, $67, $68, $69, $6a, $6b, $6c
	;    (C) 1  9  9  5 - 2  0  0  1    C  r  e  a  t  u  r  e  s      i  n  c .
	next $60,$61,$62,$63,$64,$65,$66, $6d, $6e, $6f, $70, $71, $72,  $7a, $7b, $7c
	;    (C) 1  9  9  5 - 2  0  0  1  G   A   M   E   F   R   E   A   K     i  n  c .
	next $60,$61,$62,$63,$64,$65,$66, $73, $74, $75, $76, $77, $78, $79,  $7a, $7b, $7c
	db "@"
