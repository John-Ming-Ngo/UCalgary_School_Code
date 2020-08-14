(module	   (import "host" "exit" (func $halt)) 
  (import "host" "getchar" (func $getchar (result i32))) 
  (import "host" "putchar" (func $printc (param i32)))
(global $boolTemp (mut i32) (i32.const 0))
(memory $programStrings 1)
(data (i32.const 0) "\74\72\75\65")
(data (i32.const 4) "\66\61\6c\73\65")
(data (i32.const 9) "\32\0a")
(data (i32.const 11) "\0a")
(data (i32.const 12) "\0a")
(data (i32.const 13) "\0a")
(data (i32.const 14) "\0a")
(data (i32.const 15) "\0a")
(data (i32.const 16) "\0a")
(data (i32.const 17) "\0a")
(data (i32.const 18) "\0a")
(data (i32.const 19) "\0a")
(data (i32.const 20) "\0a")
(data (i32.const 21) "\0a")
(data (i32.const 22) "\0a")
(data (i32.const 23) "\0a")
(data (i32.const 24) "\0a")
(data (i32.const 25) "\0a")
(data (i32.const 26) "\0a")
(data (i32.const 27) "\0a")
(data (i32.const 28) "\0a")
(data (i32.const 29) "\0a")
(data (i32.const 30) "\0a")
(data (i32.const 31) "\0a")
(data (i32.const 32) "\0a")
(data (i32.const 33) "\0a")
(data (i32.const 34) "\0a")
(data (i32.const 35) "\0a")
(data (i32.const 36) "\0a")
(data (i32.const 37) "\0a")
(data (i32.const 38) "\0a")
(data (i32.const 39) "\0a")
(data (i32.const 40) "\0a")
(data (i32.const 41) "\0a")
(data (i32.const 42) "\0a")
(data (i32.const 43) "\0a")
(data (i32.const 44) "\0a")
(data (i32.const 45) "\0a")
(data (i32.const 46) "\0a")
(data (i32.const 47) "\0a")
(data (i32.const 48) "\0a")
(data (i32.const 49) "\0a")
(data (i32.const 50) "\0a")
(data (i32.const 51) "\0a")
(data (i32.const 52) "\0a")
(data (i32.const 53) "\0a")
(data (i32.const 54) "\0a")
(data (i32.const 55) "\0a")
(data (i32.const 56) "\0a")
(data (i32.const 57) "\0a")
(data (i32.const 58) "\0a")
(data (i32.const 59) "\0a")
(data (i32.const 60) "\0a")
(data (i32.const 61) "\0a")
(data (i32.const 62) "\0a")
(data (i32.const 63) "\0a")
(data (i32.const 64) "\0a")
(data (i32.const 65) "\0a")
(data (i32.const 66) "\0a")
(data (i32.const 67) "\0a")
(data (i32.const 68) "\0a")
(data (i32.const 69) "\0a")
(data (i32.const 70) "\0a")
(data (i32.const 71) "\0a")
(data (i32.const 72) "\0a")
(data (i32.const 73) "\0a")
(data (i32.const 74) "\0a")
(data (i32.const 75) "\0a")
(data (i32.const 76) "\0a")
(data (i32.const 77) "\0a")
(data (i32.const 78) "\0a")
(data (i32.const 79) "\0a")
(data (i32.const 80) "\0a")
(data (i32.const 81) "\0a")
(data (i32.const 82) "\0a")
(data (i32.const 83) "\0a")
(data (i32.const 84) "\0a")
(data (i32.const 85) "\0a")
(data (i32.const 86) "\0a")
(data (i32.const 87) "\0a")
(data (i32.const 88) "\0a")
(data (i32.const 89) "\0a")
(data (i32.const 90) "\0a")
(data (i32.const 91) "\0a")
(data (i32.const 92) "\0a")
(data (i32.const 93) "\0a")
(data (i32.const 94) "\0a")
(data (i32.const 95) "\0a")
(data (i32.const 96) "\0a")
(data (i32.const 97) "\0a")
(data (i32.const 98) "\0a")
(data (i32.const 99) "\0a")
(data (i32.const 100) "\0a")
(data (i32.const 101) "\0a")
(data (i32.const 102) "\0a")
(data (i32.const 103) "\0a")
(data (i32.const 104) "\0a")
(data (i32.const 105) "\0a")
(data (i32.const 106) "\0a")
(data (i32.const 107) "\0a")
(data (i32.const 108) "\0a")
(data (i32.const 109) "\20\70\72\69\6d\65\20\6e\75\6d\62\65\72\73\20\3c\3d\20")
(data (i32.const 127) "\0a")
  (func $printb		
	(param $bool i32)			
	(block $falsePrint			
		i32.const 1			
		local.get $bool			
		i32.eq			
		br_if $falsePrint			
		i32.const 4			
		i32.const 9			
		call $prints			
	)			
	(block $truePrint			
		i32.const 0			
		local.get $bool			
		i32.eq			
		br_if $truePrint			
		i32.const 0			
		i32.const 4			
		call $prints			
	)			
				
  )			
  			
  (func $printNum (param $printNumint i32)			
	(block $end			
	(block $9			
	(block $8			
	(block $7			
	(block $6			
	(block $5			
	(block $4			
	(block $3			
	(block $2			
	(block $1			
	(block $NUM0			
	local.get $printNumint			
	i32.const 0			
	i32.eq			
	br_if $NUM0			
	local.get $printNumint			
	i32.const 1			
	i32.eq			
	br_if $1			
	local.get $printNumint			
	i32.const 2			
	i32.eq			
	br_if $2			
	local.get $printNumint			
	i32.const 3			
	i32.eq			
	br_if $3			
	local.get $printNumint			
	i32.const 4			
	i32.eq			
	br_if $4			
	local.get $printNumint			
	i32.const 5			
	i32.eq			
	br_if $5			
	local.get $printNumint			
	i32.const 6			
	i32.eq			
	br_if $6			
	local.get $printNumint			
	i32.const 7			
	i32.eq			
	br_if $7			
	local.get $printNumint			
	i32.const 8			
	i32.eq			
	br_if $8			
	local.get $printNumint			
	i32.const 9			
	i32.eq			
	br_if $9			
	)			
	i32.const 48			
	call $printc			
	br $end			
	)			
	i32.const 49			
	call $printc			
	br $end			
	)			
	i32.const 50			
	call $printc			
	br $end			
	)			
	i32.const 51			
	call $printc			
	br $end			
	)			
	i32.const 52			
	call $printc			
	br $end			
	)			
	i32.const 53			
	call $printc			
	br $end			
	)			
	i32.const 54			
	call $printc			
	br $end			
	)			
	i32.const 55			
	call $printc			
	br $end			
	)			
	i32.const 56			
	call $printc			
	br $end			
	)			
	i32.const 57			
	call $printc			
	br $end			
	)			
				
  )			
  			
  (func $printi2			
	(param $intVal i32)			
	(local $localIntVal i32)			
	local.get $intVal			
	local.set $localIntVal			
	(block $printiB1			
		(loop $printiL1			
			local.get $localIntVal			
			i32.const 0			
			i32.eq			
			br_if $printiB1			
						
			local.get $localIntVal			
			i32.const 10			
			i32.div_u			
			call $printi2			
						
			local.get $localIntVal			
			i32.const 10			
			i32.rem_u			
			call $printNum			
		)			
	)			
  )			
  			
  (func $printi3			
	(param $intVal i32)			
	(local $localIntVal i32)			
	local.get $intVal			
	local.set $localIntVal			
	(block $printNumZero			
		local.get $localIntVal			
		i32.const 0			
		i32.ne			
		br_if $printNumZero			
					
		local.get $localIntVal			
		call $printNum			
	)			
	(block $printiB1			
		(loop $printiL1			
			local.get $localIntVal			
			i32.const 0			
			i32.eq			
			br_if $printiB1			
						
			local.get $localIntVal			
			i32.const 10			
			i32.div_u			
			call $printi2			
						
			local.get $localIntVal			
			i32.const 10			
			i32.rem_u			
			call $printNum			
		)			
	)			
  )			
  (func $printi				
	(param $intInput i32)				
	(block $posVal				
	(block $negVal				
	local.get $intInput				
	i32.const 0				
	i32.ge_s				
	br_if $negVal				
	i32.const 45 ;;Neg symbol				
	call $printc				
	i32.const 0				
	local.get $intInput				
	i32.sub				
	call $printi3				
	br $posVal				
	)				
	local.get $intInput				
	call $printi3				
	)				
  )			
  			
  			
  (func $prints 			
	  (param $strStart i32) 			
	  (param $strEnd i32)			
	  (local $strCounter i32)			
	  local.get $strStart			
	  local.set $strCounter			
	  (block $printsB1			
		(loop $printsL1			
					
		local.get $strCounter			
		local.get $strEnd			
		i32.ge_s			
		br_if $printsB1			
					
		local.get $strCounter 			
		i32.load8_u			
		call $printc			
					
		local.get $strCounter			
		i32.const 1			
		i32.add			
		local.set $strCounter			
					
		br $printsL1			
		)			
	  )			
  )
(global $glob0 (mut i32) (i32.const 0))
(global $glob1 (mut i32) (i32.const 0))
(global $glob2 (mut i32) (i32.const 0))
(global $glob3 (mut i32) (i32.const 0))
(global $glob4 (mut i32) (i32.const 0))
(global $glob5 (mut i32) (i32.const 0))
(global $glob6 (mut i32) (i32.const 0))
(global $glob7 (mut i32) (i32.const 0))
(global $glob8 (mut i32) (i32.const 0))
(global $glob9 (mut i32) (i32.const 0))
(global $glob10 (mut i32) (i32.const 0))
(global $glob11 (mut i32) (i32.const 0))
(global $glob12 (mut i32) (i32.const 0))
(global $glob13 (mut i32) (i32.const 0))
(global $glob14 (mut i32) (i32.const 0))
(global $glob15 (mut i32) (i32.const 0))
(global $glob16 (mut i32) (i32.const 0))
(global $glob17 (mut i32) (i32.const 0))
(global $glob18 (mut i32) (i32.const 0))
(global $glob19 (mut i32) (i32.const 0))
(global $glob20 (mut i32) (i32.const 0))
(global $glob21 (mut i32) (i32.const 0))
(global $glob22 (mut i32) (i32.const 0))
(global $glob23 (mut i32) (i32.const 0))
(global $glob24 (mut i32) (i32.const 0))
(global $glob25 (mut i32) (i32.const 0))
(global $glob26 (mut i32) (i32.const 0))
(global $glob27 (mut i32) (i32.const 0))
(global $glob28 (mut i32) (i32.const 0))
(global $glob29 (mut i32) (i32.const 0))
(global $glob30 (mut i32) (i32.const 0))
(global $glob31 (mut i32) (i32.const 0))
(global $glob32 (mut i32) (i32.const 0))
(global $glob33 (mut i32) (i32.const 0))
(global $glob34 (mut i32) (i32.const 0))
(global $glob35 (mut i32) (i32.const 0))
(global $glob36 (mut i32) (i32.const 0))
(global $glob37 (mut i32) (i32.const 0))
(global $glob38 (mut i32) (i32.const 0))
(global $glob39 (mut i32) (i32.const 0))
(global $glob40 (mut i32) (i32.const 0))
(global $glob41 (mut i32) (i32.const 0))
(global $glob42 (mut i32) (i32.const 0))
(global $glob43 (mut i32) (i32.const 0))
(global $glob44 (mut i32) (i32.const 0))
(global $glob45 (mut i32) (i32.const 0))
(global $glob46 (mut i32) (i32.const 0))
(global $glob47 (mut i32) (i32.const 0))
(global $glob48 (mut i32) (i32.const 0))
(global $glob49 (mut i32) (i32.const 0))
(global $glob50 (mut i32) (i32.const 0))
(global $glob51 (mut i32) (i32.const 0))
(global $glob52 (mut i32) (i32.const 0))
(global $glob53 (mut i32) (i32.const 0))
(global $glob54 (mut i32) (i32.const 0))
(global $glob55 (mut i32) (i32.const 0))
(global $glob56 (mut i32) (i32.const 0))
(global $glob57 (mut i32) (i32.const 0))
(global $glob58 (mut i32) (i32.const 0))
(global $glob59 (mut i32) (i32.const 0))
(global $glob60 (mut i32) (i32.const 0))
(global $glob61 (mut i32) (i32.const 0))
(global $glob62 (mut i32) (i32.const 0))
(global $glob63 (mut i32) (i32.const 0))
(global $glob64 (mut i32) (i32.const 0))
(global $glob65 (mut i32) (i32.const 0))
(global $glob66 (mut i32) (i32.const 0))
(global $glob67 (mut i32) (i32.const 0))
(global $glob68 (mut i32) (i32.const 0))
(global $glob69 (mut i32) (i32.const 0))
(global $glob70 (mut i32) (i32.const 0))
(global $glob71 (mut i32) (i32.const 0))
(global $glob72 (mut i32) (i32.const 0))
(global $glob73 (mut i32) (i32.const 0))
(global $glob74 (mut i32) (i32.const 0))
(global $glob75 (mut i32) (i32.const 0))
(global $glob76 (mut i32) (i32.const 0))
(global $glob77 (mut i32) (i32.const 0))
(global $glob78 (mut i32) (i32.const 0))
(global $glob79 (mut i32) (i32.const 0))
(global $glob80 (mut i32) (i32.const 0))
(global $glob81 (mut i32) (i32.const 0))
(global $glob82 (mut i32) (i32.const 0))
(global $glob83 (mut i32) (i32.const 0))
(global $glob84 (mut i32) (i32.const 0))
(global $glob85 (mut i32) (i32.const 0))
(global $glob86 (mut i32) (i32.const 0))
(global $glob87 (mut i32) (i32.const 0))
(global $glob88 (mut i32) (i32.const 0))
(global $glob89 (mut i32) (i32.const 0))
(global $glob90 (mut i32) (i32.const 0))
(global $glob91 (mut i32) (i32.const 0))
(global $glob92 (mut i32) (i32.const 0))
(global $glob93 (mut i32) (i32.const 0))
(global $glob94 (mut i32) (i32.const 0))
(global $glob95 (mut i32) (i32.const 0))
(global $glob96 (mut i32) (i32.const 0))
(global $glob97 (mut i32) (i32.const 0))
(global $glob98 (mut i32) (i32.const 0))
(global $glob99 (mut i32) (i32.const 0))
(global $glob100 (mut i32) (i32.const 0))
(global $glob101 (mut i32) (i32.const 0))
(global $glob102 (mut i32) (i32.const 0))
(func $main
(local $loc0 i32)
(local $loc1 i32)
(local $loc2 i32)
(block $20
(block $21
(i32.const 1 )
local.set $loc0
(block $22
(loop $23
local.get $loc0
(i32.const 100 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $22
(block $24
(block $26
(block $25
local.get $loc0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $25
(block $27
(i32.const 0 )
global.set $glob1
)
br $26
)
(block $29
(block $28
local.get $loc0
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $28
(block $30
(i32.const 0 )
global.set $glob2
)
br $29
)
(block $32
(block $31
local.get $loc0
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $31
(block $33
(i32.const 0 )
global.set $glob3
)
br $32
)
(block $35
(block $34
local.get $loc0
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $34
(block $36
(i32.const 0 )
global.set $glob4
)
br $35
)
(block $38
(block $37
local.get $loc0
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $37
(block $39
(i32.const 0 )
global.set $glob5
)
br $38
)
(block $41
(block $40
local.get $loc0
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $40
(block $42
(i32.const 0 )
global.set $glob6
)
br $41
)
(block $44
(block $43
local.get $loc0
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $43
(block $45
(i32.const 0 )
global.set $glob7
)
br $44
)
(block $47
(block $46
local.get $loc0
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $46
(block $48
(i32.const 0 )
global.set $glob8
)
br $47
)
(block $50
(block $49
local.get $loc0
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $49
(block $51
(i32.const 0 )
global.set $glob9
)
br $50
)
(block $53
(block $52
local.get $loc0
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $52
(block $54
(i32.const 0 )
global.set $glob10
)
br $53
)
(block $56
(block $55
local.get $loc0
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $55
(block $57
(i32.const 0 )
global.set $glob11
)
br $56
)
(block $59
(block $58
local.get $loc0
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $58
(block $60
(i32.const 0 )
global.set $glob12
)
br $59
)
(block $62
(block $61
local.get $loc0
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $61
(block $63
(i32.const 0 )
global.set $glob13
)
br $62
)
(block $65
(block $64
local.get $loc0
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $64
(block $66
(i32.const 0 )
global.set $glob14
)
br $65
)
(block $68
(block $67
local.get $loc0
(i32.const 15 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $67
(block $69
(i32.const 0 )
global.set $glob15
)
br $68
)
(block $71
(block $70
local.get $loc0
(i32.const 16 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $70
(block $72
(i32.const 0 )
global.set $glob16
)
br $71
)
(block $74
(block $73
local.get $loc0
(i32.const 17 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $73
(block $75
(i32.const 0 )
global.set $glob17
)
br $74
)
(block $77
(block $76
local.get $loc0
(i32.const 18 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $76
(block $78
(i32.const 0 )
global.set $glob18
)
br $77
)
(block $80
(block $79
local.get $loc0
(i32.const 19 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $79
(block $81
(i32.const 0 )
global.set $glob19
)
br $80
)
(block $83
(block $82
local.get $loc0
(i32.const 20 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $82
(block $84
(i32.const 0 )
global.set $glob20
)
br $83
)
(block $86
(block $85
local.get $loc0
(i32.const 21 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $85
(block $87
(i32.const 0 )
global.set $glob21
)
br $86
)
(block $89
(block $88
local.get $loc0
(i32.const 22 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $88
(block $90
(i32.const 0 )
global.set $glob22
)
br $89
)
(block $92
(block $91
local.get $loc0
(i32.const 23 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $91
(block $93
(i32.const 0 )
global.set $glob23
)
br $92
)
(block $95
(block $94
local.get $loc0
(i32.const 24 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $94
(block $96
(i32.const 0 )
global.set $glob24
)
br $95
)
(block $98
(block $97
local.get $loc0
(i32.const 25 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $97
(block $99
(i32.const 0 )
global.set $glob25
)
br $98
)
(block $101
(block $100
local.get $loc0
(i32.const 26 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $100
(block $102
(i32.const 0 )
global.set $glob26
)
br $101
)
(block $104
(block $103
local.get $loc0
(i32.const 27 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $103
(block $105
(i32.const 0 )
global.set $glob27
)
br $104
)
(block $107
(block $106
local.get $loc0
(i32.const 28 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $106
(block $108
(i32.const 0 )
global.set $glob28
)
br $107
)
(block $110
(block $109
local.get $loc0
(i32.const 29 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $109
(block $111
(i32.const 0 )
global.set $glob29
)
br $110
)
(block $113
(block $112
local.get $loc0
(i32.const 30 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $112
(block $114
(i32.const 0 )
global.set $glob30
)
br $113
)
(block $116
(block $115
local.get $loc0
(i32.const 31 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $115
(block $117
(i32.const 0 )
global.set $glob31
)
br $116
)
(block $119
(block $118
local.get $loc0
(i32.const 32 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $118
(block $120
(i32.const 0 )
global.set $glob32
)
br $119
)
(block $122
(block $121
local.get $loc0
(i32.const 33 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $121
(block $123
(i32.const 0 )
global.set $glob33
)
br $122
)
(block $125
(block $124
local.get $loc0
(i32.const 34 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $124
(block $126
(i32.const 0 )
global.set $glob34
)
br $125
)
(block $128
(block $127
local.get $loc0
(i32.const 35 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $127
(block $129
(i32.const 0 )
global.set $glob35
)
br $128
)
(block $131
(block $130
local.get $loc0
(i32.const 36 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $130
(block $132
(i32.const 0 )
global.set $glob36
)
br $131
)
(block $134
(block $133
local.get $loc0
(i32.const 37 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $133
(block $135
(i32.const 0 )
global.set $glob37
)
br $134
)
(block $137
(block $136
local.get $loc0
(i32.const 38 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $136
(block $138
(i32.const 0 )
global.set $glob38
)
br $137
)
(block $140
(block $139
local.get $loc0
(i32.const 39 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $139
(block $141
(i32.const 0 )
global.set $glob39
)
br $140
)
(block $143
(block $142
local.get $loc0
(i32.const 40 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $142
(block $144
(i32.const 0 )
global.set $glob40
)
br $143
)
(block $146
(block $145
local.get $loc0
(i32.const 41 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $145
(block $147
(i32.const 0 )
global.set $glob41
)
br $146
)
(block $149
(block $148
local.get $loc0
(i32.const 42 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $148
(block $150
(i32.const 0 )
global.set $glob42
)
br $149
)
(block $152
(block $151
local.get $loc0
(i32.const 43 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $151
(block $153
(i32.const 0 )
global.set $glob43
)
br $152
)
(block $155
(block $154
local.get $loc0
(i32.const 44 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $154
(block $156
(i32.const 0 )
global.set $glob44
)
br $155
)
(block $158
(block $157
local.get $loc0
(i32.const 45 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $157
(block $159
(i32.const 0 )
global.set $glob45
)
br $158
)
(block $161
(block $160
local.get $loc0
(i32.const 46 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $160
(block $162
(i32.const 0 )
global.set $glob46
)
br $161
)
(block $164
(block $163
local.get $loc0
(i32.const 47 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $163
(block $165
(i32.const 0 )
global.set $glob47
)
br $164
)
(block $167
(block $166
local.get $loc0
(i32.const 48 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $166
(block $168
(i32.const 0 )
global.set $glob48
)
br $167
)
(block $170
(block $169
local.get $loc0
(i32.const 49 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $169
(block $171
(i32.const 0 )
global.set $glob49
)
br $170
)
(block $173
(block $172
local.get $loc0
(i32.const 50 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $172
(block $174
(i32.const 0 )
global.set $glob50
)
br $173
)
(block $176
(block $175
local.get $loc0
(i32.const 51 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $175
(block $177
(i32.const 0 )
global.set $glob51
)
br $176
)
(block $179
(block $178
local.get $loc0
(i32.const 52 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $178
(block $180
(i32.const 0 )
global.set $glob52
)
br $179
)
(block $182
(block $181
local.get $loc0
(i32.const 53 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $181
(block $183
(i32.const 0 )
global.set $glob53
)
br $182
)
(block $185
(block $184
local.get $loc0
(i32.const 54 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $184
(block $186
(i32.const 0 )
global.set $glob54
)
br $185
)
(block $188
(block $187
local.get $loc0
(i32.const 55 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $187
(block $189
(i32.const 0 )
global.set $glob55
)
br $188
)
(block $191
(block $190
local.get $loc0
(i32.const 56 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $190
(block $192
(i32.const 0 )
global.set $glob56
)
br $191
)
(block $194
(block $193
local.get $loc0
(i32.const 57 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $193
(block $195
(i32.const 0 )
global.set $glob57
)
br $194
)
(block $197
(block $196
local.get $loc0
(i32.const 58 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $196
(block $198
(i32.const 0 )
global.set $glob58
)
br $197
)
(block $200
(block $199
local.get $loc0
(i32.const 59 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $199
(block $201
(i32.const 0 )
global.set $glob59
)
br $200
)
(block $203
(block $202
local.get $loc0
(i32.const 60 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $202
(block $204
(i32.const 0 )
global.set $glob60
)
br $203
)
(block $206
(block $205
local.get $loc0
(i32.const 61 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $205
(block $207
(i32.const 0 )
global.set $glob61
)
br $206
)
(block $209
(block $208
local.get $loc0
(i32.const 62 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $208
(block $210
(i32.const 0 )
global.set $glob62
)
br $209
)
(block $212
(block $211
local.get $loc0
(i32.const 63 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $211
(block $213
(i32.const 0 )
global.set $glob63
)
br $212
)
(block $215
(block $214
local.get $loc0
(i32.const 64 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $214
(block $216
(i32.const 0 )
global.set $glob64
)
br $215
)
(block $218
(block $217
local.get $loc0
(i32.const 65 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $217
(block $219
(i32.const 0 )
global.set $glob65
)
br $218
)
(block $221
(block $220
local.get $loc0
(i32.const 66 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $220
(block $222
(i32.const 0 )
global.set $glob66
)
br $221
)
(block $224
(block $223
local.get $loc0
(i32.const 67 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $223
(block $225
(i32.const 0 )
global.set $glob67
)
br $224
)
(block $227
(block $226
local.get $loc0
(i32.const 68 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $226
(block $228
(i32.const 0 )
global.set $glob68
)
br $227
)
(block $230
(block $229
local.get $loc0
(i32.const 69 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $229
(block $231
(i32.const 0 )
global.set $glob69
)
br $230
)
(block $233
(block $232
local.get $loc0
(i32.const 70 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $232
(block $234
(i32.const 0 )
global.set $glob70
)
br $233
)
(block $236
(block $235
local.get $loc0
(i32.const 71 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $235
(block $237
(i32.const 0 )
global.set $glob71
)
br $236
)
(block $239
(block $238
local.get $loc0
(i32.const 72 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $238
(block $240
(i32.const 0 )
global.set $glob72
)
br $239
)
(block $242
(block $241
local.get $loc0
(i32.const 73 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $241
(block $243
(i32.const 0 )
global.set $glob73
)
br $242
)
(block $245
(block $244
local.get $loc0
(i32.const 74 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $244
(block $246
(i32.const 0 )
global.set $glob74
)
br $245
)
(block $248
(block $247
local.get $loc0
(i32.const 75 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $247
(block $249
(i32.const 0 )
global.set $glob75
)
br $248
)
(block $251
(block $250
local.get $loc0
(i32.const 76 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $250
(block $252
(i32.const 0 )
global.set $glob76
)
br $251
)
(block $254
(block $253
local.get $loc0
(i32.const 77 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $253
(block $255
(i32.const 0 )
global.set $glob77
)
br $254
)
(block $257
(block $256
local.get $loc0
(i32.const 78 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $256
(block $258
(i32.const 0 )
global.set $glob78
)
br $257
)
(block $260
(block $259
local.get $loc0
(i32.const 79 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $259
(block $261
(i32.const 0 )
global.set $glob79
)
br $260
)
(block $263
(block $262
local.get $loc0
(i32.const 80 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $262
(block $264
(i32.const 0 )
global.set $glob80
)
br $263
)
(block $266
(block $265
local.get $loc0
(i32.const 81 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $265
(block $267
(i32.const 0 )
global.set $glob81
)
br $266
)
(block $269
(block $268
local.get $loc0
(i32.const 82 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $268
(block $270
(i32.const 0 )
global.set $glob82
)
br $269
)
(block $272
(block $271
local.get $loc0
(i32.const 83 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $271
(block $273
(i32.const 0 )
global.set $glob83
)
br $272
)
(block $275
(block $274
local.get $loc0
(i32.const 84 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $274
(block $276
(i32.const 0 )
global.set $glob84
)
br $275
)
(block $278
(block $277
local.get $loc0
(i32.const 85 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $277
(block $279
(i32.const 0 )
global.set $glob85
)
br $278
)
(block $281
(block $280
local.get $loc0
(i32.const 86 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $280
(block $282
(i32.const 0 )
global.set $glob86
)
br $281
)
(block $284
(block $283
local.get $loc0
(i32.const 87 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $283
(block $285
(i32.const 0 )
global.set $glob87
)
br $284
)
(block $287
(block $286
local.get $loc0
(i32.const 88 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $286
(block $288
(i32.const 0 )
global.set $glob88
)
br $287
)
(block $290
(block $289
local.get $loc0
(i32.const 89 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $289
(block $291
(i32.const 0 )
global.set $glob89
)
br $290
)
(block $293
(block $292
local.get $loc0
(i32.const 90 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $292
(block $294
(i32.const 0 )
global.set $glob90
)
br $293
)
(block $296
(block $295
local.get $loc0
(i32.const 91 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $295
(block $297
(i32.const 0 )
global.set $glob91
)
br $296
)
(block $299
(block $298
local.get $loc0
(i32.const 92 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $298
(block $300
(i32.const 0 )
global.set $glob92
)
br $299
)
(block $302
(block $301
local.get $loc0
(i32.const 93 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $301
(block $303
(i32.const 0 )
global.set $glob93
)
br $302
)
(block $305
(block $304
local.get $loc0
(i32.const 94 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $304
(block $306
(i32.const 0 )
global.set $glob94
)
br $305
)
(block $308
(block $307
local.get $loc0
(i32.const 95 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $307
(block $309
(i32.const 0 )
global.set $glob95
)
br $308
)
(block $311
(block $310
local.get $loc0
(i32.const 96 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $310
(block $312
(i32.const 0 )
global.set $glob96
)
br $311
)
(block $314
(block $313
local.get $loc0
(i32.const 97 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $313
(block $315
(i32.const 0 )
global.set $glob97
)
br $314
)
(block $317
(block $316
local.get $loc0
(i32.const 98 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $316
(block $318
(i32.const 0 )
global.set $glob98
)
br $317
)
(block $320
(block $319
local.get $loc0
(i32.const 99 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $319
(block $321
(i32.const 0 )
global.set $glob99
)
br $320
)
(block $322
local.get $loc0
(i32.const 100 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $322
(block $323
(i32.const 0 )
global.set $glob100
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
local.get $loc0
(i32.const 1 )
i32.add
local.set $loc0
)
br $23
)
)
(i32.const 2 )
local.set $loc0
(block $324
(loop $325
local.get $loc0
(i32.const 10 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $324
(block $326
local.get $loc0
local.get $loc0
i32.add
local.set $loc1
(block $327
(loop $328
local.get $loc1
(i32.const 100 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $327
(block $329
(block $331
(block $330
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $330
(block $332
(i32.const 1 )
global.set $glob2
(i32.const 2 )
local.get $loc0
i32.add
local.set $loc1
)
br $331
)
(block $334
(block $333
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $333
(block $335
(i32.const 1 )
global.set $glob3
(i32.const 3 )
local.get $loc0
i32.add
local.set $loc1
)
br $334
)
(block $337
(block $336
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $336
(block $338
(i32.const 1 )
global.set $glob4
(i32.const 4 )
local.get $loc0
i32.add
local.set $loc1
)
br $337
)
(block $340
(block $339
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $339
(block $341
(i32.const 1 )
global.set $glob5
(i32.const 5 )
local.get $loc0
i32.add
local.set $loc1
)
br $340
)
(block $343
(block $342
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $342
(block $344
(i32.const 1 )
global.set $glob6
(i32.const 6 )
local.get $loc0
i32.add
local.set $loc1
)
br $343
)
(block $346
(block $345
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $345
(block $347
(i32.const 1 )
global.set $glob7
(i32.const 7 )
local.get $loc0
i32.add
local.set $loc1
)
br $346
)
(block $349
(block $348
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $348
(block $350
(i32.const 1 )
global.set $glob8
(i32.const 8 )
local.get $loc0
i32.add
local.set $loc1
)
br $349
)
(block $352
(block $351
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $351
(block $353
(i32.const 1 )
global.set $glob9
(i32.const 9 )
local.get $loc0
i32.add
local.set $loc1
)
br $352
)
(block $355
(block $354
local.get $loc1
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $354
(block $356
(i32.const 1 )
global.set $glob10
(i32.const 10 )
local.get $loc0
i32.add
local.set $loc1
)
br $355
)
(block $358
(block $357
local.get $loc1
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $357
(block $359
(i32.const 1 )
global.set $glob11
(i32.const 11 )
local.get $loc0
i32.add
local.set $loc1
)
br $358
)
(block $361
(block $360
local.get $loc1
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $360
(block $362
(i32.const 1 )
global.set $glob12
(i32.const 12 )
local.get $loc0
i32.add
local.set $loc1
)
br $361
)
(block $364
(block $363
local.get $loc1
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $363
(block $365
(i32.const 1 )
global.set $glob13
(i32.const 13 )
local.get $loc0
i32.add
local.set $loc1
)
br $364
)
(block $367
(block $366
local.get $loc1
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $366
(block $368
(i32.const 1 )
global.set $glob14
(i32.const 14 )
local.get $loc0
i32.add
local.set $loc1
)
br $367
)
(block $370
(block $369
local.get $loc1
(i32.const 15 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $369
(block $371
(i32.const 1 )
global.set $glob15
(i32.const 15 )
local.get $loc0
i32.add
local.set $loc1
)
br $370
)
(block $373
(block $372
local.get $loc1
(i32.const 16 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $372
(block $374
(i32.const 1 )
global.set $glob16
(i32.const 16 )
local.get $loc0
i32.add
local.set $loc1
)
br $373
)
(block $376
(block $375
local.get $loc1
(i32.const 17 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $375
(block $377
(i32.const 1 )
global.set $glob17
(i32.const 17 )
local.get $loc0
i32.add
local.set $loc1
)
br $376
)
(block $379
(block $378
local.get $loc1
(i32.const 18 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $378
(block $380
(i32.const 1 )
global.set $glob18
(i32.const 18 )
local.get $loc0
i32.add
local.set $loc1
)
br $379
)
(block $382
(block $381
local.get $loc1
(i32.const 19 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $381
(block $383
(i32.const 1 )
global.set $glob19
(i32.const 19 )
local.get $loc0
i32.add
local.set $loc1
)
br $382
)
(block $385
(block $384
local.get $loc1
(i32.const 20 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $384
(block $386
(i32.const 1 )
global.set $glob20
(i32.const 20 )
local.get $loc0
i32.add
local.set $loc1
)
br $385
)
(block $388
(block $387
local.get $loc1
(i32.const 21 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $387
(block $389
(i32.const 1 )
global.set $glob21
(i32.const 21 )
local.get $loc0
i32.add
local.set $loc1
)
br $388
)
(block $391
(block $390
local.get $loc1
(i32.const 22 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $390
(block $392
(i32.const 1 )
global.set $glob22
(i32.const 22 )
local.get $loc0
i32.add
local.set $loc1
)
br $391
)
(block $394
(block $393
local.get $loc1
(i32.const 23 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $393
(block $395
(i32.const 1 )
global.set $glob23
(i32.const 23 )
local.get $loc0
i32.add
local.set $loc1
)
br $394
)
(block $397
(block $396
local.get $loc1
(i32.const 24 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $396
(block $398
(i32.const 1 )
global.set $glob24
(i32.const 24 )
local.get $loc0
i32.add
local.set $loc1
)
br $397
)
(block $400
(block $399
local.get $loc1
(i32.const 25 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $399
(block $401
(i32.const 1 )
global.set $glob25
(i32.const 25 )
local.get $loc0
i32.add
local.set $loc1
)
br $400
)
(block $403
(block $402
local.get $loc1
(i32.const 26 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $402
(block $404
(i32.const 1 )
global.set $glob26
(i32.const 26 )
local.get $loc0
i32.add
local.set $loc1
)
br $403
)
(block $406
(block $405
local.get $loc1
(i32.const 27 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $405
(block $407
(i32.const 1 )
global.set $glob27
(i32.const 27 )
local.get $loc0
i32.add
local.set $loc1
)
br $406
)
(block $409
(block $408
local.get $loc1
(i32.const 28 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $408
(block $410
(i32.const 1 )
global.set $glob28
(i32.const 28 )
local.get $loc0
i32.add
local.set $loc1
)
br $409
)
(block $412
(block $411
local.get $loc1
(i32.const 29 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $411
(block $413
(i32.const 1 )
global.set $glob29
(i32.const 29 )
local.get $loc0
i32.add
local.set $loc1
)
br $412
)
(block $415
(block $414
local.get $loc1
(i32.const 30 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $414
(block $416
(i32.const 1 )
global.set $glob30
(i32.const 30 )
local.get $loc0
i32.add
local.set $loc1
)
br $415
)
(block $418
(block $417
local.get $loc1
(i32.const 31 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $417
(block $419
(i32.const 1 )
global.set $glob31
(i32.const 31 )
local.get $loc0
i32.add
local.set $loc1
)
br $418
)
(block $421
(block $420
local.get $loc1
(i32.const 32 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $420
(block $422
(i32.const 1 )
global.set $glob32
(i32.const 32 )
local.get $loc0
i32.add
local.set $loc1
)
br $421
)
(block $424
(block $423
local.get $loc1
(i32.const 33 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $423
(block $425
(i32.const 1 )
global.set $glob33
(i32.const 33 )
local.get $loc0
i32.add
local.set $loc1
)
br $424
)
(block $427
(block $426
local.get $loc1
(i32.const 34 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $426
(block $428
(i32.const 1 )
global.set $glob34
(i32.const 34 )
local.get $loc0
i32.add
local.set $loc1
)
br $427
)
(block $430
(block $429
local.get $loc1
(i32.const 35 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $429
(block $431
(i32.const 1 )
global.set $glob35
(i32.const 35 )
local.get $loc0
i32.add
local.set $loc1
)
br $430
)
(block $433
(block $432
local.get $loc1
(i32.const 36 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $432
(block $434
(i32.const 1 )
global.set $glob36
(i32.const 36 )
local.get $loc0
i32.add
local.set $loc1
)
br $433
)
(block $436
(block $435
local.get $loc1
(i32.const 37 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $435
(block $437
(i32.const 1 )
global.set $glob37
(i32.const 37 )
local.get $loc0
i32.add
local.set $loc1
)
br $436
)
(block $439
(block $438
local.get $loc1
(i32.const 38 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $438
(block $440
(i32.const 1 )
global.set $glob38
(i32.const 38 )
local.get $loc0
i32.add
local.set $loc1
)
br $439
)
(block $442
(block $441
local.get $loc1
(i32.const 39 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $441
(block $443
(i32.const 1 )
global.set $glob39
(i32.const 39 )
local.get $loc0
i32.add
local.set $loc1
)
br $442
)
(block $445
(block $444
local.get $loc1
(i32.const 40 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $444
(block $446
(i32.const 1 )
global.set $glob40
(i32.const 40 )
local.get $loc0
i32.add
local.set $loc1
)
br $445
)
(block $448
(block $447
local.get $loc1
(i32.const 41 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $447
(block $449
(i32.const 1 )
global.set $glob41
(i32.const 41 )
local.get $loc0
i32.add
local.set $loc1
)
br $448
)
(block $451
(block $450
local.get $loc1
(i32.const 42 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $450
(block $452
(i32.const 1 )
global.set $glob42
(i32.const 42 )
local.get $loc0
i32.add
local.set $loc1
)
br $451
)
(block $454
(block $453
local.get $loc1
(i32.const 43 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $453
(block $455
(i32.const 1 )
global.set $glob43
(i32.const 43 )
local.get $loc0
i32.add
local.set $loc1
)
br $454
)
(block $457
(block $456
local.get $loc1
(i32.const 44 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $456
(block $458
(i32.const 1 )
global.set $glob44
(i32.const 44 )
local.get $loc0
i32.add
local.set $loc1
)
br $457
)
(block $460
(block $459
local.get $loc1
(i32.const 45 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $459
(block $461
(i32.const 1 )
global.set $glob45
(i32.const 45 )
local.get $loc0
i32.add
local.set $loc1
)
br $460
)
(block $463
(block $462
local.get $loc1
(i32.const 46 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $462
(block $464
(i32.const 1 )
global.set $glob46
(i32.const 46 )
local.get $loc0
i32.add
local.set $loc1
)
br $463
)
(block $466
(block $465
local.get $loc1
(i32.const 47 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $465
(block $467
(i32.const 1 )
global.set $glob47
(i32.const 47 )
local.get $loc0
i32.add
local.set $loc1
)
br $466
)
(block $469
(block $468
local.get $loc1
(i32.const 48 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $468
(block $470
(i32.const 1 )
global.set $glob48
(i32.const 48 )
local.get $loc0
i32.add
local.set $loc1
)
br $469
)
(block $472
(block $471
local.get $loc1
(i32.const 49 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $471
(block $473
(i32.const 1 )
global.set $glob49
(i32.const 49 )
local.get $loc0
i32.add
local.set $loc1
)
br $472
)
(block $475
(block $474
local.get $loc1
(i32.const 50 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $474
(block $476
(i32.const 1 )
global.set $glob50
(i32.const 50 )
local.get $loc0
i32.add
local.set $loc1
)
br $475
)
(block $478
(block $477
local.get $loc1
(i32.const 51 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $477
(block $479
(i32.const 1 )
global.set $glob51
(i32.const 51 )
local.get $loc0
i32.add
local.set $loc1
)
br $478
)
(block $481
(block $480
local.get $loc1
(i32.const 52 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $480
(block $482
(i32.const 1 )
global.set $glob52
(i32.const 52 )
local.get $loc0
i32.add
local.set $loc1
)
br $481
)
(block $484
(block $483
local.get $loc1
(i32.const 53 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $483
(block $485
(i32.const 1 )
global.set $glob53
(i32.const 53 )
local.get $loc0
i32.add
local.set $loc1
)
br $484
)
(block $487
(block $486
local.get $loc1
(i32.const 54 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $486
(block $488
(i32.const 1 )
global.set $glob54
(i32.const 54 )
local.get $loc0
i32.add
local.set $loc1
)
br $487
)
(block $490
(block $489
local.get $loc1
(i32.const 55 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $489
(block $491
(i32.const 1 )
global.set $glob55
(i32.const 55 )
local.get $loc0
i32.add
local.set $loc1
)
br $490
)
(block $493
(block $492
local.get $loc1
(i32.const 56 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $492
(block $494
(i32.const 1 )
global.set $glob56
(i32.const 56 )
local.get $loc0
i32.add
local.set $loc1
)
br $493
)
(block $496
(block $495
local.get $loc1
(i32.const 57 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $495
(block $497
(i32.const 1 )
global.set $glob57
(i32.const 57 )
local.get $loc0
i32.add
local.set $loc1
)
br $496
)
(block $499
(block $498
local.get $loc1
(i32.const 58 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $498
(block $500
(i32.const 1 )
global.set $glob58
(i32.const 58 )
local.get $loc0
i32.add
local.set $loc1
)
br $499
)
(block $502
(block $501
local.get $loc1
(i32.const 59 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $501
(block $503
(i32.const 1 )
global.set $glob59
(i32.const 59 )
local.get $loc0
i32.add
local.set $loc1
)
br $502
)
(block $505
(block $504
local.get $loc1
(i32.const 60 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $504
(block $506
(i32.const 1 )
global.set $glob60
(i32.const 60 )
local.get $loc0
i32.add
local.set $loc1
)
br $505
)
(block $508
(block $507
local.get $loc1
(i32.const 61 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $507
(block $509
(i32.const 1 )
global.set $glob61
(i32.const 61 )
local.get $loc0
i32.add
local.set $loc1
)
br $508
)
(block $511
(block $510
local.get $loc1
(i32.const 62 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $510
(block $512
(i32.const 1 )
global.set $glob62
(i32.const 62 )
local.get $loc0
i32.add
local.set $loc1
)
br $511
)
(block $514
(block $513
local.get $loc1
(i32.const 63 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $513
(block $515
(i32.const 1 )
global.set $glob63
(i32.const 63 )
local.get $loc0
i32.add
local.set $loc1
)
br $514
)
(block $517
(block $516
local.get $loc1
(i32.const 64 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $516
(block $518
(i32.const 1 )
global.set $glob64
(i32.const 64 )
local.get $loc0
i32.add
local.set $loc1
)
br $517
)
(block $520
(block $519
local.get $loc1
(i32.const 65 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $519
(block $521
(i32.const 1 )
global.set $glob65
(i32.const 65 )
local.get $loc0
i32.add
local.set $loc1
)
br $520
)
(block $523
(block $522
local.get $loc1
(i32.const 66 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $522
(block $524
(i32.const 1 )
global.set $glob66
(i32.const 66 )
local.get $loc0
i32.add
local.set $loc1
)
br $523
)
(block $526
(block $525
local.get $loc1
(i32.const 67 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $525
(block $527
(i32.const 1 )
global.set $glob67
(i32.const 67 )
local.get $loc0
i32.add
local.set $loc1
)
br $526
)
(block $529
(block $528
local.get $loc1
(i32.const 68 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $528
(block $530
(i32.const 1 )
global.set $glob68
(i32.const 68 )
local.get $loc0
i32.add
local.set $loc1
)
br $529
)
(block $532
(block $531
local.get $loc1
(i32.const 69 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $531
(block $533
(i32.const 1 )
global.set $glob69
(i32.const 69 )
local.get $loc0
i32.add
local.set $loc1
)
br $532
)
(block $535
(block $534
local.get $loc1
(i32.const 70 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $534
(block $536
(i32.const 1 )
global.set $glob70
(i32.const 70 )
local.get $loc0
i32.add
local.set $loc1
)
br $535
)
(block $538
(block $537
local.get $loc1
(i32.const 71 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $537
(block $539
(i32.const 1 )
global.set $glob71
(i32.const 71 )
local.get $loc0
i32.add
local.set $loc1
)
br $538
)
(block $541
(block $540
local.get $loc1
(i32.const 72 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $540
(block $542
(i32.const 1 )
global.set $glob72
(i32.const 72 )
local.get $loc0
i32.add
local.set $loc1
)
br $541
)
(block $544
(block $543
local.get $loc1
(i32.const 73 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $543
(block $545
(i32.const 1 )
global.set $glob73
(i32.const 73 )
local.get $loc0
i32.add
local.set $loc1
)
br $544
)
(block $547
(block $546
local.get $loc1
(i32.const 74 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $546
(block $548
(i32.const 1 )
global.set $glob74
(i32.const 74 )
local.get $loc0
i32.add
local.set $loc1
)
br $547
)
(block $550
(block $549
local.get $loc1
(i32.const 75 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $549
(block $551
(i32.const 1 )
global.set $glob75
(i32.const 75 )
local.get $loc0
i32.add
local.set $loc1
)
br $550
)
(block $553
(block $552
local.get $loc1
(i32.const 76 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $552
(block $554
(i32.const 1 )
global.set $glob76
(i32.const 76 )
local.get $loc0
i32.add
local.set $loc1
)
br $553
)
(block $556
(block $555
local.get $loc1
(i32.const 77 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $555
(block $557
(i32.const 1 )
global.set $glob77
(i32.const 77 )
local.get $loc0
i32.add
local.set $loc1
)
br $556
)
(block $559
(block $558
local.get $loc1
(i32.const 78 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $558
(block $560
(i32.const 1 )
global.set $glob78
(i32.const 78 )
local.get $loc0
i32.add
local.set $loc1
)
br $559
)
(block $562
(block $561
local.get $loc1
(i32.const 79 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $561
(block $563
(i32.const 1 )
global.set $glob79
(i32.const 79 )
local.get $loc0
i32.add
local.set $loc1
)
br $562
)
(block $565
(block $564
local.get $loc1
(i32.const 80 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $564
(block $566
(i32.const 1 )
global.set $glob80
(i32.const 80 )
local.get $loc0
i32.add
local.set $loc1
)
br $565
)
(block $568
(block $567
local.get $loc1
(i32.const 81 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $567
(block $569
(i32.const 1 )
global.set $glob81
(i32.const 81 )
local.get $loc0
i32.add
local.set $loc1
)
br $568
)
(block $571
(block $570
local.get $loc1
(i32.const 82 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $570
(block $572
(i32.const 1 )
global.set $glob82
(i32.const 82 )
local.get $loc0
i32.add
local.set $loc1
)
br $571
)
(block $574
(block $573
local.get $loc1
(i32.const 83 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $573
(block $575
(i32.const 1 )
global.set $glob83
(i32.const 83 )
local.get $loc0
i32.add
local.set $loc1
)
br $574
)
(block $577
(block $576
local.get $loc1
(i32.const 84 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $576
(block $578
(i32.const 1 )
global.set $glob84
(i32.const 84 )
local.get $loc0
i32.add
local.set $loc1
)
br $577
)
(block $580
(block $579
local.get $loc1
(i32.const 85 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $579
(block $581
(i32.const 1 )
global.set $glob85
(i32.const 85 )
local.get $loc0
i32.add
local.set $loc1
)
br $580
)
(block $583
(block $582
local.get $loc1
(i32.const 86 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $582
(block $584
(i32.const 1 )
global.set $glob86
(i32.const 86 )
local.get $loc0
i32.add
local.set $loc1
)
br $583
)
(block $586
(block $585
local.get $loc1
(i32.const 87 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $585
(block $587
(i32.const 1 )
global.set $glob87
(i32.const 87 )
local.get $loc0
i32.add
local.set $loc1
)
br $586
)
(block $589
(block $588
local.get $loc1
(i32.const 88 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $588
(block $590
(i32.const 1 )
global.set $glob88
(i32.const 88 )
local.get $loc0
i32.add
local.set $loc1
)
br $589
)
(block $592
(block $591
local.get $loc1
(i32.const 89 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $591
(block $593
(i32.const 1 )
global.set $glob89
(i32.const 89 )
local.get $loc0
i32.add
local.set $loc1
)
br $592
)
(block $595
(block $594
local.get $loc1
(i32.const 90 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $594
(block $596
(i32.const 1 )
global.set $glob90
(i32.const 90 )
local.get $loc0
i32.add
local.set $loc1
)
br $595
)
(block $598
(block $597
local.get $loc1
(i32.const 91 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $597
(block $599
(i32.const 1 )
global.set $glob91
(i32.const 91 )
local.get $loc0
i32.add
local.set $loc1
)
br $598
)
(block $601
(block $600
local.get $loc1
(i32.const 92 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $600
(block $602
(i32.const 1 )
global.set $glob92
(i32.const 92 )
local.get $loc0
i32.add
local.set $loc1
)
br $601
)
(block $604
(block $603
local.get $loc1
(i32.const 93 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $603
(block $605
(i32.const 1 )
global.set $glob93
(i32.const 93 )
local.get $loc0
i32.add
local.set $loc1
)
br $604
)
(block $607
(block $606
local.get $loc1
(i32.const 94 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $606
(block $608
(i32.const 1 )
global.set $glob94
(i32.const 94 )
local.get $loc0
i32.add
local.set $loc1
)
br $607
)
(block $610
(block $609
local.get $loc1
(i32.const 95 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $609
(block $611
(i32.const 1 )
global.set $glob95
(i32.const 95 )
local.get $loc0
i32.add
local.set $loc1
)
br $610
)
(block $613
(block $612
local.get $loc1
(i32.const 96 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $612
(block $614
(i32.const 1 )
global.set $glob96
(i32.const 96 )
local.get $loc0
i32.add
local.set $loc1
)
br $613
)
(block $616
(block $615
local.get $loc1
(i32.const 97 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $615
(block $617
(i32.const 1 )
global.set $glob97
(i32.const 97 )
local.get $loc0
i32.add
local.set $loc1
)
br $616
)
(block $619
(block $618
local.get $loc1
(i32.const 98 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $618
(block $620
(i32.const 1 )
global.set $glob98
(i32.const 98 )
local.get $loc0
i32.add
local.set $loc1
)
br $619
)
(block $622
(block $621
local.get $loc1
(i32.const 99 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $621
(block $623
(i32.const 1 )
global.set $glob99
(i32.const 99 )
local.get $loc0
i32.add
local.set $loc1
)
br $622
)
(block $624
local.get $loc1
(i32.const 100 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $624
(block $625
(i32.const 1 )
global.set $glob100
(i32.const 100 )
local.get $loc0
i32.add
local.set $loc1
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $328
)
)
local.get $loc0
(i32.const 1 )
i32.add
local.set $loc0
)
br $325
)
)
(i32.const 1 )
local.set $loc2
i32.const 9
i32.const 11
call $prints
(i32.const 3 )
local.set $loc0
(block $626
(loop $627
local.get $loc0
(i32.const 100 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $626
(block $628
(block $630
(block $629
local.get $loc0
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $629
(block $631
(block $632
global.get $glob3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $632
(block $633
(i32.const 3 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $630
)
(block $635
(block $634
local.get $loc0
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $634
(block $636
(block $637
global.get $glob4
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $637
(block $638
(i32.const 4 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $635
)
(block $640
(block $639
local.get $loc0
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $639
(block $641
(block $642
global.get $glob5
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $642
(block $643
(i32.const 5 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $640
)
(block $645
(block $644
local.get $loc0
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $644
(block $646
(block $647
global.get $glob6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $647
(block $648
(i32.const 6 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $645
)
(block $650
(block $649
local.get $loc0
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $649
(block $651
(block $652
global.get $glob7
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $652
(block $653
(i32.const 7 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $650
)
(block $655
(block $654
local.get $loc0
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $654
(block $656
(block $657
global.get $glob8
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $657
(block $658
(i32.const 8 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $655
)
(block $660
(block $659
local.get $loc0
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $659
(block $661
(block $662
global.get $glob9
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $662
(block $663
(i32.const 9 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $660
)
(block $665
(block $664
local.get $loc0
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $664
(block $666
(block $667
global.get $glob10
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $667
(block $668
(i32.const 10 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $665
)
(block $670
(block $669
local.get $loc0
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $669
(block $671
(block $672
global.get $glob11
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $672
(block $673
(i32.const 11 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $670
)
(block $675
(block $674
local.get $loc0
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $674
(block $676
(block $677
global.get $glob12
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $677
(block $678
(i32.const 12 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $675
)
(block $680
(block $679
local.get $loc0
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $679
(block $681
(block $682
global.get $glob13
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $682
(block $683
(i32.const 13 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $680
)
(block $685
(block $684
local.get $loc0
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $684
(block $686
(block $687
global.get $glob14
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $687
(block $688
(i32.const 14 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $685
)
(block $690
(block $689
local.get $loc0
(i32.const 15 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $689
(block $691
(block $692
global.get $glob15
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $692
(block $693
(i32.const 15 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $690
)
(block $695
(block $694
local.get $loc0
(i32.const 16 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $694
(block $696
(block $697
global.get $glob16
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $697
(block $698
(i32.const 16 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $695
)
(block $700
(block $699
local.get $loc0
(i32.const 17 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $699
(block $701
(block $702
global.get $glob17
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $702
(block $703
(i32.const 17 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $700
)
(block $705
(block $704
local.get $loc0
(i32.const 18 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $704
(block $706
(block $707
global.get $glob18
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $707
(block $708
(i32.const 18 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $705
)
(block $710
(block $709
local.get $loc0
(i32.const 19 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $709
(block $711
(block $712
global.get $glob19
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $712
(block $713
(i32.const 19 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $710
)
(block $715
(block $714
local.get $loc0
(i32.const 20 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $714
(block $716
(block $717
global.get $glob20
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $717
(block $718
(i32.const 20 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $715
)
(block $720
(block $719
local.get $loc0
(i32.const 21 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $719
(block $721
(block $722
global.get $glob21
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $722
(block $723
(i32.const 21 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $720
)
(block $725
(block $724
local.get $loc0
(i32.const 22 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $724
(block $726
(block $727
global.get $glob22
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $727
(block $728
(i32.const 22 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $725
)
(block $730
(block $729
local.get $loc0
(i32.const 23 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $729
(block $731
(block $732
global.get $glob23
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $732
(block $733
(i32.const 23 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $730
)
(block $735
(block $734
local.get $loc0
(i32.const 24 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $734
(block $736
(block $737
global.get $glob24
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $737
(block $738
(i32.const 24 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $735
)
(block $740
(block $739
local.get $loc0
(i32.const 25 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $739
(block $741
(block $742
global.get $glob25
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $742
(block $743
(i32.const 25 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $740
)
(block $745
(block $744
local.get $loc0
(i32.const 26 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $744
(block $746
(block $747
global.get $glob26
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $747
(block $748
(i32.const 26 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $745
)
(block $750
(block $749
local.get $loc0
(i32.const 27 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $749
(block $751
(block $752
global.get $glob27
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $752
(block $753
(i32.const 27 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $750
)
(block $755
(block $754
local.get $loc0
(i32.const 28 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $754
(block $756
(block $757
global.get $glob28
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $757
(block $758
(i32.const 28 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $755
)
(block $760
(block $759
local.get $loc0
(i32.const 29 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $759
(block $761
(block $762
global.get $glob29
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $762
(block $763
(i32.const 29 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $760
)
(block $765
(block $764
local.get $loc0
(i32.const 30 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $764
(block $766
(block $767
global.get $glob30
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $767
(block $768
(i32.const 30 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $765
)
(block $770
(block $769
local.get $loc0
(i32.const 31 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $769
(block $771
(block $772
global.get $glob31
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $772
(block $773
(i32.const 31 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $770
)
(block $775
(block $774
local.get $loc0
(i32.const 32 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $774
(block $776
(block $777
global.get $glob32
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $777
(block $778
(i32.const 32 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $775
)
(block $780
(block $779
local.get $loc0
(i32.const 33 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $779
(block $781
(block $782
global.get $glob33
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $782
(block $783
(i32.const 33 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $780
)
(block $785
(block $784
local.get $loc0
(i32.const 34 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $784
(block $786
(block $787
global.get $glob34
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $787
(block $788
(i32.const 34 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $785
)
(block $790
(block $789
local.get $loc0
(i32.const 35 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $789
(block $791
(block $792
global.get $glob35
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $792
(block $793
(i32.const 35 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $790
)
(block $795
(block $794
local.get $loc0
(i32.const 36 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $794
(block $796
(block $797
global.get $glob36
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $797
(block $798
(i32.const 36 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $795
)
(block $800
(block $799
local.get $loc0
(i32.const 37 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $799
(block $801
(block $802
global.get $glob37
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $802
(block $803
(i32.const 37 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $800
)
(block $805
(block $804
local.get $loc0
(i32.const 38 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $804
(block $806
(block $807
global.get $glob38
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $807
(block $808
(i32.const 38 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $805
)
(block $810
(block $809
local.get $loc0
(i32.const 39 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $809
(block $811
(block $812
global.get $glob39
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $812
(block $813
(i32.const 39 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $810
)
(block $815
(block $814
local.get $loc0
(i32.const 40 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $814
(block $816
(block $817
global.get $glob40
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $817
(block $818
(i32.const 40 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $815
)
(block $820
(block $819
local.get $loc0
(i32.const 41 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $819
(block $821
(block $822
global.get $glob41
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $822
(block $823
(i32.const 41 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $820
)
(block $825
(block $824
local.get $loc0
(i32.const 42 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $824
(block $826
(block $827
global.get $glob42
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $827
(block $828
(i32.const 42 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $825
)
(block $830
(block $829
local.get $loc0
(i32.const 43 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $829
(block $831
(block $832
global.get $glob43
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $832
(block $833
(i32.const 43 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $830
)
(block $835
(block $834
local.get $loc0
(i32.const 44 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $834
(block $836
(block $837
global.get $glob44
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $837
(block $838
(i32.const 44 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $835
)
(block $840
(block $839
local.get $loc0
(i32.const 45 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $839
(block $841
(block $842
global.get $glob45
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $842
(block $843
(i32.const 45 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $840
)
(block $845
(block $844
local.get $loc0
(i32.const 46 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $844
(block $846
(block $847
global.get $glob46
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $847
(block $848
(i32.const 46 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $845
)
(block $850
(block $849
local.get $loc0
(i32.const 47 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $849
(block $851
(block $852
global.get $glob47
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $852
(block $853
(i32.const 47 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $850
)
(block $855
(block $854
local.get $loc0
(i32.const 48 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $854
(block $856
(block $857
global.get $glob48
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $857
(block $858
(i32.const 48 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $855
)
(block $860
(block $859
local.get $loc0
(i32.const 49 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $859
(block $861
(block $862
global.get $glob49
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $862
(block $863
(i32.const 49 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $860
)
(block $865
(block $864
local.get $loc0
(i32.const 50 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $864
(block $866
(block $867
global.get $glob50
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $867
(block $868
(i32.const 50 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $865
)
(block $870
(block $869
local.get $loc0
(i32.const 51 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $869
(block $871
(block $872
global.get $glob51
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $872
(block $873
(i32.const 51 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $870
)
(block $875
(block $874
local.get $loc0
(i32.const 52 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $874
(block $876
(block $877
global.get $glob52
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $877
(block $878
(i32.const 52 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $875
)
(block $880
(block $879
local.get $loc0
(i32.const 53 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $879
(block $881
(block $882
global.get $glob53
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $882
(block $883
(i32.const 53 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $880
)
(block $885
(block $884
local.get $loc0
(i32.const 54 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $884
(block $886
(block $887
global.get $glob54
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $887
(block $888
(i32.const 54 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $885
)
(block $890
(block $889
local.get $loc0
(i32.const 55 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $889
(block $891
(block $892
global.get $glob55
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $892
(block $893
(i32.const 55 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $890
)
(block $895
(block $894
local.get $loc0
(i32.const 56 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $894
(block $896
(block $897
global.get $glob56
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $897
(block $898
(i32.const 56 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $895
)
(block $900
(block $899
local.get $loc0
(i32.const 57 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $899
(block $901
(block $902
global.get $glob57
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $902
(block $903
(i32.const 57 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $900
)
(block $905
(block $904
local.get $loc0
(i32.const 58 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $904
(block $906
(block $907
global.get $glob58
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $907
(block $908
(i32.const 58 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $905
)
(block $910
(block $909
local.get $loc0
(i32.const 59 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $909
(block $911
(block $912
global.get $glob59
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $912
(block $913
(i32.const 59 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $910
)
(block $915
(block $914
local.get $loc0
(i32.const 60 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $914
(block $916
(block $917
global.get $glob60
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $917
(block $918
(i32.const 60 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $915
)
(block $920
(block $919
local.get $loc0
(i32.const 61 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $919
(block $921
(block $922
global.get $glob61
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $922
(block $923
(i32.const 61 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $920
)
(block $925
(block $924
local.get $loc0
(i32.const 62 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $924
(block $926
(block $927
global.get $glob62
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $927
(block $928
(i32.const 62 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $925
)
(block $930
(block $929
local.get $loc0
(i32.const 63 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $929
(block $931
(block $932
global.get $glob63
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $932
(block $933
(i32.const 63 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $930
)
(block $935
(block $934
local.get $loc0
(i32.const 64 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $934
(block $936
(block $937
global.get $glob64
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $937
(block $938
(i32.const 64 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $935
)
(block $940
(block $939
local.get $loc0
(i32.const 65 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $939
(block $941
(block $942
global.get $glob65
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $942
(block $943
(i32.const 65 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $940
)
(block $945
(block $944
local.get $loc0
(i32.const 66 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $944
(block $946
(block $947
global.get $glob66
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $947
(block $948
(i32.const 66 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $945
)
(block $950
(block $949
local.get $loc0
(i32.const 67 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $949
(block $951
(block $952
global.get $glob67
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $952
(block $953
(i32.const 67 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $950
)
(block $955
(block $954
local.get $loc0
(i32.const 68 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $954
(block $956
(block $957
global.get $glob68
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $957
(block $958
(i32.const 68 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $955
)
(block $960
(block $959
local.get $loc0
(i32.const 69 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $959
(block $961
(block $962
global.get $glob69
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $962
(block $963
(i32.const 69 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $960
)
(block $965
(block $964
local.get $loc0
(i32.const 70 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $964
(block $966
(block $967
global.get $glob70
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $967
(block $968
(i32.const 70 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $965
)
(block $970
(block $969
local.get $loc0
(i32.const 71 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $969
(block $971
(block $972
global.get $glob71
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $972
(block $973
(i32.const 71 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $970
)
(block $975
(block $974
local.get $loc0
(i32.const 72 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $974
(block $976
(block $977
global.get $glob72
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $977
(block $978
(i32.const 72 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $975
)
(block $980
(block $979
local.get $loc0
(i32.const 73 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $979
(block $981
(block $982
global.get $glob73
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $982
(block $983
(i32.const 73 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $980
)
(block $985
(block $984
local.get $loc0
(i32.const 74 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $984
(block $986
(block $987
global.get $glob74
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $987
(block $988
(i32.const 74 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $985
)
(block $990
(block $989
local.get $loc0
(i32.const 75 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $989
(block $991
(block $992
global.get $glob75
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $992
(block $993
(i32.const 75 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $990
)
(block $995
(block $994
local.get $loc0
(i32.const 76 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $994
(block $996
(block $997
global.get $glob76
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $997
(block $998
(i32.const 76 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $995
)
(block $1000
(block $999
local.get $loc0
(i32.const 77 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $999
(block $1001
(block $1002
global.get $glob77
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1002
(block $1003
(i32.const 77 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1000
)
(block $1005
(block $1004
local.get $loc0
(i32.const 78 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1004
(block $1006
(block $1007
global.get $glob78
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1007
(block $1008
(i32.const 78 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1005
)
(block $1010
(block $1009
local.get $loc0
(i32.const 79 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1009
(block $1011
(block $1012
global.get $glob79
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1012
(block $1013
(i32.const 79 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1010
)
(block $1015
(block $1014
local.get $loc0
(i32.const 80 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1014
(block $1016
(block $1017
global.get $glob80
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1017
(block $1018
(i32.const 80 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1015
)
(block $1020
(block $1019
local.get $loc0
(i32.const 81 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1019
(block $1021
(block $1022
global.get $glob81
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1022
(block $1023
(i32.const 81 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1020
)
(block $1025
(block $1024
local.get $loc0
(i32.const 82 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1024
(block $1026
(block $1027
global.get $glob82
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1027
(block $1028
(i32.const 82 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1025
)
(block $1030
(block $1029
local.get $loc0
(i32.const 83 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1029
(block $1031
(block $1032
global.get $glob83
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1032
(block $1033
(i32.const 83 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1030
)
(block $1035
(block $1034
local.get $loc0
(i32.const 84 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1034
(block $1036
(block $1037
global.get $glob84
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1037
(block $1038
(i32.const 84 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1035
)
(block $1040
(block $1039
local.get $loc0
(i32.const 85 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1039
(block $1041
(block $1042
global.get $glob85
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1042
(block $1043
(i32.const 85 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1040
)
(block $1045
(block $1044
local.get $loc0
(i32.const 86 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1044
(block $1046
(block $1047
global.get $glob86
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1047
(block $1048
(i32.const 86 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1045
)
(block $1050
(block $1049
local.get $loc0
(i32.const 87 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1049
(block $1051
(block $1052
global.get $glob87
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1052
(block $1053
(i32.const 87 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1050
)
(block $1055
(block $1054
local.get $loc0
(i32.const 88 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1054
(block $1056
(block $1057
global.get $glob88
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1057
(block $1058
(i32.const 88 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1055
)
(block $1060
(block $1059
local.get $loc0
(i32.const 89 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1059
(block $1061
(block $1062
global.get $glob89
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1062
(block $1063
(i32.const 89 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1060
)
(block $1065
(block $1064
local.get $loc0
(i32.const 90 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1064
(block $1066
(block $1067
global.get $glob90
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1067
(block $1068
(i32.const 90 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1065
)
(block $1070
(block $1069
local.get $loc0
(i32.const 91 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1069
(block $1071
(block $1072
global.get $glob91
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1072
(block $1073
(i32.const 91 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1070
)
(block $1075
(block $1074
local.get $loc0
(i32.const 92 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1074
(block $1076
(block $1077
global.get $glob92
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1077
(block $1078
(i32.const 92 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1075
)
(block $1080
(block $1079
local.get $loc0
(i32.const 93 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1079
(block $1081
(block $1082
global.get $glob93
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1082
(block $1083
(i32.const 93 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1080
)
(block $1085
(block $1084
local.get $loc0
(i32.const 94 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1084
(block $1086
(block $1087
global.get $glob94
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1087
(block $1088
(i32.const 94 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1085
)
(block $1090
(block $1089
local.get $loc0
(i32.const 95 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1089
(block $1091
(block $1092
global.get $glob95
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1092
(block $1093
(i32.const 95 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1090
)
(block $1095
(block $1094
local.get $loc0
(i32.const 96 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1094
(block $1096
(block $1097
global.get $glob96
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1097
(block $1098
(i32.const 96 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1095
)
(block $1100
(block $1099
local.get $loc0
(i32.const 97 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1099
(block $1101
(block $1102
global.get $glob97
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1102
(block $1103
(i32.const 97 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1100
)
(block $1105
(block $1104
local.get $loc0
(i32.const 98 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1104
(block $1106
(block $1107
global.get $glob98
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1107
(block $1108
(i32.const 98 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1105
)
(block $1110
(block $1109
local.get $loc0
(i32.const 99 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1109
(block $1111
(block $1112
global.get $glob99
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1112
(block $1113
(i32.const 99 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
br $1110
)
(block $1114
local.get $loc0
(i32.const 100 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1114
(block $1115
(block $1116
global.get $glob100
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1116
(block $1117
(i32.const 100 )
call $printi
i32.const 11
i32.const 12
call $prints
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
local.get $loc0
(i32.const 1 )
i32.add
local.set $loc0
)
br $627
)
)
local.get $loc2
call $printi
i32.const 109
i32.const 127
call $prints
(i32.const 100 )
call $printi
i32.const 11
i32.const 12
call $prints
)
)
)
(start $main)
(func $INTERNALseed
(param $loc103 i32)
(block $1118
(block $1119
local.get $loc103
global.set $glob102
)
)
)
(func $INTERNALrandom
(result i32)
(local $ret104 i32)
(block $1120
(block $1121
(i32.const 17 )
global.get $glob102
i32.mul
(i32.const 13 )
i32.add
(i32.const 32768 )
i32.rem_s
global.set $glob102
global.get $glob102
local.set $ret104
br $1120
)
)
(local.get $ret104)
)
)
