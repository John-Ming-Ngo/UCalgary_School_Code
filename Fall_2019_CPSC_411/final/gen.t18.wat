(module	   (import "host" "exit" (func $halt)) 
  (import "host" "getchar" (func $getchar (result i32))) 
  (import "host" "putchar" (func $printc (param i32)))
(global $boolTemp (mut i32) (i32.const 0))
(memory $programStrings 1)
(data (i32.const 0) "\74\72\75\65")
(data (i32.const 4) "\66\61\6c\73\65")
(data (i32.const 9) "\49\6e\74\65\72\6e\61\6c\20\65\72\72\6f\72\3a\20\74\6f\6f\20\6d\61\6e\79\20\75\6e\67\65\74\73\21\0a")
(data (i32.const 42) "\45\72\72\6f\72\3a\20\65\78\70\65\63\74\65\64\20")
(data (i32.const 58) "\0a")
(data (i32.const 59) "\45\72\72\6f\72\3a\20\69\6e\76\61\6c\69\64\20\63\68\61\72\61\63\74\65\72\2e\0a")
(data (i32.const 85) "\20\3d\20")
(data (i32.const 88) "\0a")
(data (i32.const 89) "\45\72\72\6f\72\3a\20\65\78\70\65\63\74\65\64\20\66\61\63\74\6f\72\2e\0a")
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
(func $calculator
(block $20
(block $21
call $init
call $parser
)
)
)
(start $calculator)
(func $getc
(result i32)
(local $ret27 i32)
(block $22
(block $23
(block $24
global.get $glob0
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $24
(block $25
(i32.const 0)
global.set $glob0
global.get $glob1
local.set $ret27
br $22
)
)
call $getchar
local.set $ret27
br $22
)
)
(local.get $ret27)
)
(func $ungetc
(param $loc28 i32)
(block $26
(block $27
(block $28
global.get $glob0
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $28
(block $29
i32.const 9
i32.const 42
call $prints
call $halt
)
)
(i32.const 1)
global.set $glob0
local.get $loc28
global.set $glob1
)
)
)
(func $peek
(result i32)
(local $ret29 i32)
(block $30
(block $31
(block $32
global.get $glob2
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $32
global.get $glob3
local.set $ret29
br $30
)
(i32.const 1)
global.set $glob2
call $scanner
global.set $glob3
global.get $glob3
local.set $ret29
br $30
)
)
(local.get $ret29)
)
(func $match
(param $loc30 i32)
(block $33
(block $34
(block $35
call $peek
local.get $loc30
i32.ne
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $35
(block $36
i32.const 42
i32.const 58
call $prints
local.get $loc30
call $printc
i32.const 58
i32.const 59
call $prints
call $halt
)
)
(i32.const 0)
global.set $glob2
)
)
)
(func $scanner
(result i32)
(local $ret31 i32)
(local $loc0 i32)
(block $37
(block $38
(block $39
(loop $40
call $getc
local.set $loc0
local.get $loc0
call $isspace
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $39
br $40
)
)
(block $41
local.get $loc0
global.get $glob5
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $41
global.get $glob6
local.set $ret31
br $37
)
(block $42
local.get $loc0
global.get $glob26
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $42
global.get $glob7
local.set $ret31
br $37
)
(block $43
local.get $loc0
global.get $glob17
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $43
global.get $glob9
local.set $ret31
br $37
)
(block $44
local.get $loc0
global.get $glob18
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $44
global.get $glob10
local.set $ret31
br $37
)
(block $45
local.get $loc0
global.get $glob19
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $45
global.get $glob11
local.set $ret31
br $37
)
(block $46
local.get $loc0
global.get $glob20
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $46
global.get $glob12
local.set $ret31
br $37
)
(block $47
local.get $loc0
global.get $glob21
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $47
global.get $glob13
local.set $ret31
br $37
)
(block $48
local.get $loc0
global.get $glob22
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $48
global.get $glob14
local.set $ret31
br $37
)
(block $49
local.get $loc0
call $isdigit
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $49
(block $50
(i32.const 0 )
global.set $glob4
(block $51
(loop $52
local.get $loc0
call $isdigit
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $51
(block $53
global.get $glob4
(i32.const 10 )
i32.mul
local.get $loc0
global.get $glob15
i32.sub
i32.add
global.set $glob4
call $getc
local.set $loc0
)
br $52
)
)
local.get $loc0
call $ungetc
global.get $glob8
local.set $ret31
br $37
)
)
i32.const 59
i32.const 85
call $prints
call $halt
)
)
(local.get $ret31)
)
(func $isdigit
(param $loc32 i32)
(result i32)
(local $ret33 i32)
(block $54
(block $55
(block $56
local.get $loc32
global.get $glob15
i32.ge_s
i32.const 0
i32.eq
i32.const 0
global.set $boolTemp
br_if $56
local.get $loc32
global.get $glob16
i32.le_s
global.set $boolTemp
)
global.get $boolTemp
local.set $ret33
br $54
)
)
(local.get $ret33)
)
(func $isspace
(param $loc34 i32)
(result i32)
(local $ret35 i32)
(block $57
(block $58
(block $59
(block $60
local.get $loc34
global.get $glob23
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $60
local.get $loc34
global.get $glob24
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $59
local.get $loc34
global.get $glob25
i32.eq
global.set $boolTemp
)
global.get $boolTemp
local.set $ret35
br $57
)
)
(local.get $ret35)
)
(func $parser
(local $loc1 i32)
(block $61
(block $62
(block $63
(loop $64
call $peek
global.get $glob6
i32.ne
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $63
(block $65
call $E
local.set $loc1
global.get $glob7
call $match
i32.const 85
i32.const 88
call $prints
local.get $loc1
call $printi
i32.const 58
i32.const 59
call $prints
)
br $64
)
)
)
)
)
(func $E
(result i32)
(local $ret36 i32)
(local $loc2 i32)
(local $loc3 i32)
(local $loc4 i32)
(block $66
(block $67
call $T
local.set $loc2
(block $68
(loop $69
(block $70
call $peek
global.get $glob9
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $70
call $peek
global.get $glob10
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $68
(block $71
call $peek
local.set $loc4
local.get $loc4
call $match
call $T
local.set $loc3
(block $73
(block $72
local.get $loc4
global.get $glob9
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $72
local.get $loc2
local.get $loc3
i32.add
local.set $loc2
br $73
)
local.get $loc2
local.get $loc3
i32.sub
local.set $loc2
)
)
br $69
)
)
local.get $loc2
local.set $ret36
br $66
)
)
(local.get $ret36)
)
(func $T
(result i32)
(local $ret37 i32)
(local $loc5 i32)
(local $loc6 i32)
(local $loc7 i32)
(block $74
(block $75
call $F
local.set $loc5
(block $76
(loop $77
(block $78
call $peek
global.get $glob11
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $78
call $peek
global.get $glob12
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $76
(block $79
call $peek
local.set $loc7
local.get $loc7
call $match
call $F
local.set $loc6
(block $81
(block $80
local.get $loc7
global.get $glob11
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $80
local.get $loc5
local.get $loc6
i32.mul
local.set $loc5
br $81
)
local.get $loc5
local.get $loc6
i32.div_s
local.set $loc5
)
)
br $77
)
)
local.get $loc5
local.set $ret37
br $74
)
)
(local.get $ret37)
)
(func $F
(result i32)
(local $ret38 i32)
(local $loc8 i32)
(local $loc9 i32)
(block $82
(block $83
call $peek
local.set $loc9
(block $85
(block $84
local.get $loc9
global.get $glob13
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $84
(block $86
global.get $glob13
call $match
call $E
local.set $loc8
global.get $glob14
call $match
)
br $85
)
(block $88
(block $87
local.get $loc9
global.get $glob10
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $87
(block $89
global.get $glob10
call $match
i32.const 0
call $F
i32.sub
local.set $loc8
)
br $88
)
(block $91
(block $90
local.get $loc9
global.get $glob8
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $90
(block $92
global.get $glob8
call $match
global.get $glob4
local.set $loc8
)
br $91
)
(block $93
i32.const 89
i32.const 113
call $prints
call $halt
)
)
)
)
local.get $loc8
local.set $ret38
br $82
)
)
(local.get $ret38)
)
(func $init
(block $94
(block $95
i32.const 0
(i32.const 1 )
i32.sub
global.set $glob5
(i32.const 48 )
global.set $glob15
(i32.const 57 )
global.set $glob16
(i32.const 43 )
global.set $glob17
(i32.const 45 )
global.set $glob18
(i32.const 42 )
global.set $glob19
(i32.const 47 )
global.set $glob20
(i32.const 40 )
global.set $glob21
(i32.const 41 )
global.set $glob22
(i32.const 32 )
global.set $glob23
(i32.const 9 )
global.set $glob24
(i32.const 13 )
global.set $glob25
(i32.const 10 )
global.set $glob26
(i32.const 256 )
global.set $glob6
(i32.const 257 )
global.set $glob8
global.get $glob17
global.set $glob9
global.get $glob18
global.set $glob10
global.get $glob19
global.set $glob11
global.get $glob20
global.set $glob12
global.get $glob21
global.set $glob13
global.get $glob22
global.set $glob14
global.get $glob26
global.set $glob7
)
)
)
)
