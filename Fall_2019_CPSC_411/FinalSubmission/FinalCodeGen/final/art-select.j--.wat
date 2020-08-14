(module	   (import "host" "exit" (func $halt)) 
  (import "host" "getchar" (func $getchar (result i32))) 
  (import "host" "putchar" (func $printc (param i32)))
(global $boolTemp (mut i32) (i32.const 0))
(memory $programStrings 1)
(data (i32.const 0) "\74\72\75\65")
(data (i32.const 4) "\66\61\6c\73\65")
(data (i32.const 9) "\20")
(data (i32.const 10) "\20")
(data (i32.const 11) "\20")
(data (i32.const 12) "\20")
(data (i32.const 13) "\20")
(data (i32.const 14) "\20")
(data (i32.const 15) "\20")
(data (i32.const 16) "\20")
(data (i32.const 17) "\20")
(data (i32.const 18) "\20")
(data (i32.const 19) "\20")
(data (i32.const 20) "\20")
(data (i32.const 21) "\20")
(data (i32.const 22) "\20")
(data (i32.const 23) "\20")
(data (i32.const 24) "\0a")
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
(func $main
(local $loc0 i32)
(local $loc1 i32)
(local $loc2 i32)
(local $loc3 i32)
(block $20
(block $21
(i32.const 1 )
call $INTERNALseed
(i32.const 0 )
local.set $loc0
(block $22
(loop $23
local.get $loc0
(i32.const 14 )
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
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $25
(block $27
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob0
)
br $26
)
(block $29
(block $28
local.get $loc0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $28
(block $30
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob1
)
br $29
)
(block $32
(block $31
local.get $loc0
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $31
(block $33
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob2
)
br $32
)
(block $35
(block $34
local.get $loc0
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $34
(block $36
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob3
)
br $35
)
(block $38
(block $37
local.get $loc0
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $37
(block $39
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob4
)
br $38
)
(block $41
(block $40
local.get $loc0
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $40
(block $42
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob5
)
br $41
)
(block $44
(block $43
local.get $loc0
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $43
(block $45
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob6
)
br $44
)
(block $47
(block $46
local.get $loc0
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $46
(block $48
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob7
)
br $47
)
(block $50
(block $49
local.get $loc0
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $49
(block $51
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob8
)
br $50
)
(block $53
(block $52
local.get $loc0
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $52
(block $54
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob9
)
br $53
)
(block $56
(block $55
local.get $loc0
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $55
(block $57
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob10
)
br $56
)
(block $59
(block $58
local.get $loc0
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $58
(block $60
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob11
)
br $59
)
(block $62
(block $61
local.get $loc0
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $61
(block $63
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob12
)
br $62
)
(block $65
(block $64
local.get $loc0
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $64
(block $66
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob13
)
br $65
)
(block $67
local.get $loc0
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $67
(block $68
call $INTERNALrandom
(i32.const 100 )
i32.rem_s
global.set $glob14
)
)
)
)
)
)
)
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
call $printarray
(i32.const 0 )
local.set $loc0
(block $69
(loop $70
local.get $loc0
(i32.const 13 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $69
(block $71
local.get $loc0
local.set $loc3
local.get $loc0
(i32.const 1 )
i32.add
local.set $loc1
(block $72
(loop $73
local.get $loc1
(i32.const 14 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $72
(block $74
(block $76
(block $75
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $75
(block $77
(block $79
(block $78
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $78
(block $80
(block $81
global.get $glob1
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $81
(block $82
(i32.const 1 )
local.set $loc3
)
)
)
br $79
)
(block $84
(block $83
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $83
(block $85
(block $86
global.get $glob1
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $86
(block $87
(i32.const 1 )
local.set $loc3
)
)
)
br $84
)
(block $89
(block $88
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $88
(block $90
(block $91
global.get $glob1
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $91
(block $92
(i32.const 1 )
local.set $loc3
)
)
)
br $89
)
(block $94
(block $93
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $93
(block $95
(block $96
global.get $glob1
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $96
(block $97
(i32.const 1 )
local.set $loc3
)
)
)
br $94
)
(block $99
(block $98
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $98
(block $100
(block $101
global.get $glob1
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $101
(block $102
(i32.const 1 )
local.set $loc3
)
)
)
br $99
)
(block $104
(block $103
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $103
(block $105
(block $106
global.get $glob1
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $106
(block $107
(i32.const 1 )
local.set $loc3
)
)
)
br $104
)
(block $109
(block $108
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $108
(block $110
(block $111
global.get $glob1
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $111
(block $112
(i32.const 1 )
local.set $loc3
)
)
)
br $109
)
(block $114
(block $113
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $113
(block $115
(block $116
global.get $glob1
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $116
(block $117
(i32.const 1 )
local.set $loc3
)
)
)
br $114
)
(block $119
(block $118
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $118
(block $120
(block $121
global.get $glob1
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $121
(block $122
(i32.const 1 )
local.set $loc3
)
)
)
br $119
)
(block $124
(block $123
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $123
(block $125
(block $126
global.get $glob1
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $126
(block $127
(i32.const 1 )
local.set $loc3
)
)
)
br $124
)
(block $129
(block $128
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $128
(block $130
(block $131
global.get $glob1
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $131
(block $132
(i32.const 1 )
local.set $loc3
)
)
)
br $129
)
(block $134
(block $133
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $133
(block $135
(block $136
global.get $glob1
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $136
(block $137
(i32.const 1 )
local.set $loc3
)
)
)
br $134
)
(block $139
(block $138
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $138
(block $140
(block $141
global.get $glob1
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $141
(block $142
(i32.const 1 )
local.set $loc3
)
)
)
br $139
)
(block $144
(block $143
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $143
(block $145
(block $146
global.get $glob1
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $146
(block $147
(i32.const 1 )
local.set $loc3
)
)
)
br $144
)
(block $148
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $148
(block $149
(block $150
global.get $glob1
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $150
(block $151
(i32.const 1 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $76
)
(block $153
(block $152
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $152
(block $154
(block $156
(block $155
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $155
(block $157
(block $158
global.get $glob2
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $158
(block $159
(i32.const 2 )
local.set $loc3
)
)
)
br $156
)
(block $161
(block $160
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $160
(block $162
(block $163
global.get $glob2
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $163
(block $164
(i32.const 2 )
local.set $loc3
)
)
)
br $161
)
(block $166
(block $165
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $165
(block $167
(block $168
global.get $glob2
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $168
(block $169
(i32.const 2 )
local.set $loc3
)
)
)
br $166
)
(block $171
(block $170
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $170
(block $172
(block $173
global.get $glob2
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $173
(block $174
(i32.const 2 )
local.set $loc3
)
)
)
br $171
)
(block $176
(block $175
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $175
(block $177
(block $178
global.get $glob2
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $178
(block $179
(i32.const 2 )
local.set $loc3
)
)
)
br $176
)
(block $181
(block $180
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $180
(block $182
(block $183
global.get $glob2
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $183
(block $184
(i32.const 2 )
local.set $loc3
)
)
)
br $181
)
(block $186
(block $185
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $185
(block $187
(block $188
global.get $glob2
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $188
(block $189
(i32.const 2 )
local.set $loc3
)
)
)
br $186
)
(block $191
(block $190
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $190
(block $192
(block $193
global.get $glob2
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $193
(block $194
(i32.const 2 )
local.set $loc3
)
)
)
br $191
)
(block $196
(block $195
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $195
(block $197
(block $198
global.get $glob2
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $198
(block $199
(i32.const 2 )
local.set $loc3
)
)
)
br $196
)
(block $201
(block $200
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $200
(block $202
(block $203
global.get $glob2
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $203
(block $204
(i32.const 2 )
local.set $loc3
)
)
)
br $201
)
(block $206
(block $205
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $205
(block $207
(block $208
global.get $glob2
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $208
(block $209
(i32.const 2 )
local.set $loc3
)
)
)
br $206
)
(block $211
(block $210
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $210
(block $212
(block $213
global.get $glob2
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $213
(block $214
(i32.const 2 )
local.set $loc3
)
)
)
br $211
)
(block $216
(block $215
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $215
(block $217
(block $218
global.get $glob2
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $218
(block $219
(i32.const 2 )
local.set $loc3
)
)
)
br $216
)
(block $221
(block $220
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $220
(block $222
(block $223
global.get $glob2
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $223
(block $224
(i32.const 2 )
local.set $loc3
)
)
)
br $221
)
(block $225
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $225
(block $226
(block $227
global.get $glob2
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $227
(block $228
(i32.const 2 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $153
)
(block $230
(block $229
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $229
(block $231
(block $233
(block $232
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $232
(block $234
(block $235
global.get $glob3
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $235
(block $236
(i32.const 3 )
local.set $loc3
)
)
)
br $233
)
(block $238
(block $237
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $237
(block $239
(block $240
global.get $glob3
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $240
(block $241
(i32.const 3 )
local.set $loc3
)
)
)
br $238
)
(block $243
(block $242
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $242
(block $244
(block $245
global.get $glob3
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $245
(block $246
(i32.const 3 )
local.set $loc3
)
)
)
br $243
)
(block $248
(block $247
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $247
(block $249
(block $250
global.get $glob3
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $250
(block $251
(i32.const 3 )
local.set $loc3
)
)
)
br $248
)
(block $253
(block $252
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $252
(block $254
(block $255
global.get $glob3
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $255
(block $256
(i32.const 3 )
local.set $loc3
)
)
)
br $253
)
(block $258
(block $257
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $257
(block $259
(block $260
global.get $glob3
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $260
(block $261
(i32.const 3 )
local.set $loc3
)
)
)
br $258
)
(block $263
(block $262
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $262
(block $264
(block $265
global.get $glob3
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $265
(block $266
(i32.const 3 )
local.set $loc3
)
)
)
br $263
)
(block $268
(block $267
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $267
(block $269
(block $270
global.get $glob3
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $270
(block $271
(i32.const 3 )
local.set $loc3
)
)
)
br $268
)
(block $273
(block $272
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $272
(block $274
(block $275
global.get $glob3
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $275
(block $276
(i32.const 3 )
local.set $loc3
)
)
)
br $273
)
(block $278
(block $277
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $277
(block $279
(block $280
global.get $glob3
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $280
(block $281
(i32.const 3 )
local.set $loc3
)
)
)
br $278
)
(block $283
(block $282
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $282
(block $284
(block $285
global.get $glob3
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $285
(block $286
(i32.const 3 )
local.set $loc3
)
)
)
br $283
)
(block $288
(block $287
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $287
(block $289
(block $290
global.get $glob3
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $290
(block $291
(i32.const 3 )
local.set $loc3
)
)
)
br $288
)
(block $293
(block $292
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $292
(block $294
(block $295
global.get $glob3
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $295
(block $296
(i32.const 3 )
local.set $loc3
)
)
)
br $293
)
(block $298
(block $297
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $297
(block $299
(block $300
global.get $glob3
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $300
(block $301
(i32.const 3 )
local.set $loc3
)
)
)
br $298
)
(block $302
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $302
(block $303
(block $304
global.get $glob3
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $304
(block $305
(i32.const 3 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $230
)
(block $307
(block $306
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $306
(block $308
(block $310
(block $309
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $309
(block $311
(block $312
global.get $glob4
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $312
(block $313
(i32.const 4 )
local.set $loc3
)
)
)
br $310
)
(block $315
(block $314
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $314
(block $316
(block $317
global.get $glob4
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $317
(block $318
(i32.const 4 )
local.set $loc3
)
)
)
br $315
)
(block $320
(block $319
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $319
(block $321
(block $322
global.get $glob4
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $322
(block $323
(i32.const 4 )
local.set $loc3
)
)
)
br $320
)
(block $325
(block $324
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $324
(block $326
(block $327
global.get $glob4
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $327
(block $328
(i32.const 4 )
local.set $loc3
)
)
)
br $325
)
(block $330
(block $329
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $329
(block $331
(block $332
global.get $glob4
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $332
(block $333
(i32.const 4 )
local.set $loc3
)
)
)
br $330
)
(block $335
(block $334
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $334
(block $336
(block $337
global.get $glob4
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $337
(block $338
(i32.const 4 )
local.set $loc3
)
)
)
br $335
)
(block $340
(block $339
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $339
(block $341
(block $342
global.get $glob4
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $342
(block $343
(i32.const 4 )
local.set $loc3
)
)
)
br $340
)
(block $345
(block $344
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $344
(block $346
(block $347
global.get $glob4
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $347
(block $348
(i32.const 4 )
local.set $loc3
)
)
)
br $345
)
(block $350
(block $349
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $349
(block $351
(block $352
global.get $glob4
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $352
(block $353
(i32.const 4 )
local.set $loc3
)
)
)
br $350
)
(block $355
(block $354
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $354
(block $356
(block $357
global.get $glob4
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $357
(block $358
(i32.const 4 )
local.set $loc3
)
)
)
br $355
)
(block $360
(block $359
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $359
(block $361
(block $362
global.get $glob4
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $362
(block $363
(i32.const 4 )
local.set $loc3
)
)
)
br $360
)
(block $365
(block $364
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $364
(block $366
(block $367
global.get $glob4
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $367
(block $368
(i32.const 4 )
local.set $loc3
)
)
)
br $365
)
(block $370
(block $369
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $369
(block $371
(block $372
global.get $glob4
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $372
(block $373
(i32.const 4 )
local.set $loc3
)
)
)
br $370
)
(block $375
(block $374
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $374
(block $376
(block $377
global.get $glob4
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $377
(block $378
(i32.const 4 )
local.set $loc3
)
)
)
br $375
)
(block $379
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $379
(block $380
(block $381
global.get $glob4
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $381
(block $382
(i32.const 4 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $307
)
(block $384
(block $383
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $383
(block $385
(block $387
(block $386
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $386
(block $388
(block $389
global.get $glob5
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $389
(block $390
(i32.const 5 )
local.set $loc3
)
)
)
br $387
)
(block $392
(block $391
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $391
(block $393
(block $394
global.get $glob5
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $394
(block $395
(i32.const 5 )
local.set $loc3
)
)
)
br $392
)
(block $397
(block $396
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $396
(block $398
(block $399
global.get $glob5
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $399
(block $400
(i32.const 5 )
local.set $loc3
)
)
)
br $397
)
(block $402
(block $401
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $401
(block $403
(block $404
global.get $glob5
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $404
(block $405
(i32.const 5 )
local.set $loc3
)
)
)
br $402
)
(block $407
(block $406
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $406
(block $408
(block $409
global.get $glob5
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $409
(block $410
(i32.const 5 )
local.set $loc3
)
)
)
br $407
)
(block $412
(block $411
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $411
(block $413
(block $414
global.get $glob5
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $414
(block $415
(i32.const 5 )
local.set $loc3
)
)
)
br $412
)
(block $417
(block $416
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $416
(block $418
(block $419
global.get $glob5
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $419
(block $420
(i32.const 5 )
local.set $loc3
)
)
)
br $417
)
(block $422
(block $421
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $421
(block $423
(block $424
global.get $glob5
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $424
(block $425
(i32.const 5 )
local.set $loc3
)
)
)
br $422
)
(block $427
(block $426
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $426
(block $428
(block $429
global.get $glob5
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $429
(block $430
(i32.const 5 )
local.set $loc3
)
)
)
br $427
)
(block $432
(block $431
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $431
(block $433
(block $434
global.get $glob5
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $434
(block $435
(i32.const 5 )
local.set $loc3
)
)
)
br $432
)
(block $437
(block $436
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $436
(block $438
(block $439
global.get $glob5
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $439
(block $440
(i32.const 5 )
local.set $loc3
)
)
)
br $437
)
(block $442
(block $441
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $441
(block $443
(block $444
global.get $glob5
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $444
(block $445
(i32.const 5 )
local.set $loc3
)
)
)
br $442
)
(block $447
(block $446
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $446
(block $448
(block $449
global.get $glob5
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $449
(block $450
(i32.const 5 )
local.set $loc3
)
)
)
br $447
)
(block $452
(block $451
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $451
(block $453
(block $454
global.get $glob5
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $454
(block $455
(i32.const 5 )
local.set $loc3
)
)
)
br $452
)
(block $456
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $456
(block $457
(block $458
global.get $glob5
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $458
(block $459
(i32.const 5 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $384
)
(block $461
(block $460
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $460
(block $462
(block $464
(block $463
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $463
(block $465
(block $466
global.get $glob6
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $466
(block $467
(i32.const 6 )
local.set $loc3
)
)
)
br $464
)
(block $469
(block $468
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $468
(block $470
(block $471
global.get $glob6
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $471
(block $472
(i32.const 6 )
local.set $loc3
)
)
)
br $469
)
(block $474
(block $473
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $473
(block $475
(block $476
global.get $glob6
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $476
(block $477
(i32.const 6 )
local.set $loc3
)
)
)
br $474
)
(block $479
(block $478
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $478
(block $480
(block $481
global.get $glob6
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $481
(block $482
(i32.const 6 )
local.set $loc3
)
)
)
br $479
)
(block $484
(block $483
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $483
(block $485
(block $486
global.get $glob6
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $486
(block $487
(i32.const 6 )
local.set $loc3
)
)
)
br $484
)
(block $489
(block $488
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $488
(block $490
(block $491
global.get $glob6
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $491
(block $492
(i32.const 6 )
local.set $loc3
)
)
)
br $489
)
(block $494
(block $493
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $493
(block $495
(block $496
global.get $glob6
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $496
(block $497
(i32.const 6 )
local.set $loc3
)
)
)
br $494
)
(block $499
(block $498
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $498
(block $500
(block $501
global.get $glob6
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $501
(block $502
(i32.const 6 )
local.set $loc3
)
)
)
br $499
)
(block $504
(block $503
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $503
(block $505
(block $506
global.get $glob6
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $506
(block $507
(i32.const 6 )
local.set $loc3
)
)
)
br $504
)
(block $509
(block $508
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $508
(block $510
(block $511
global.get $glob6
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $511
(block $512
(i32.const 6 )
local.set $loc3
)
)
)
br $509
)
(block $514
(block $513
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $513
(block $515
(block $516
global.get $glob6
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $516
(block $517
(i32.const 6 )
local.set $loc3
)
)
)
br $514
)
(block $519
(block $518
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $518
(block $520
(block $521
global.get $glob6
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $521
(block $522
(i32.const 6 )
local.set $loc3
)
)
)
br $519
)
(block $524
(block $523
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $523
(block $525
(block $526
global.get $glob6
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $526
(block $527
(i32.const 6 )
local.set $loc3
)
)
)
br $524
)
(block $529
(block $528
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $528
(block $530
(block $531
global.get $glob6
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $531
(block $532
(i32.const 6 )
local.set $loc3
)
)
)
br $529
)
(block $533
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $533
(block $534
(block $535
global.get $glob6
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $535
(block $536
(i32.const 6 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $461
)
(block $538
(block $537
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $537
(block $539
(block $541
(block $540
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $540
(block $542
(block $543
global.get $glob7
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $543
(block $544
(i32.const 7 )
local.set $loc3
)
)
)
br $541
)
(block $546
(block $545
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $545
(block $547
(block $548
global.get $glob7
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $548
(block $549
(i32.const 7 )
local.set $loc3
)
)
)
br $546
)
(block $551
(block $550
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $550
(block $552
(block $553
global.get $glob7
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $553
(block $554
(i32.const 7 )
local.set $loc3
)
)
)
br $551
)
(block $556
(block $555
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $555
(block $557
(block $558
global.get $glob7
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $558
(block $559
(i32.const 7 )
local.set $loc3
)
)
)
br $556
)
(block $561
(block $560
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $560
(block $562
(block $563
global.get $glob7
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $563
(block $564
(i32.const 7 )
local.set $loc3
)
)
)
br $561
)
(block $566
(block $565
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $565
(block $567
(block $568
global.get $glob7
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $568
(block $569
(i32.const 7 )
local.set $loc3
)
)
)
br $566
)
(block $571
(block $570
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $570
(block $572
(block $573
global.get $glob7
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $573
(block $574
(i32.const 7 )
local.set $loc3
)
)
)
br $571
)
(block $576
(block $575
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $575
(block $577
(block $578
global.get $glob7
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $578
(block $579
(i32.const 7 )
local.set $loc3
)
)
)
br $576
)
(block $581
(block $580
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $580
(block $582
(block $583
global.get $glob7
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $583
(block $584
(i32.const 7 )
local.set $loc3
)
)
)
br $581
)
(block $586
(block $585
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $585
(block $587
(block $588
global.get $glob7
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $588
(block $589
(i32.const 7 )
local.set $loc3
)
)
)
br $586
)
(block $591
(block $590
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $590
(block $592
(block $593
global.get $glob7
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $593
(block $594
(i32.const 7 )
local.set $loc3
)
)
)
br $591
)
(block $596
(block $595
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $595
(block $597
(block $598
global.get $glob7
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $598
(block $599
(i32.const 7 )
local.set $loc3
)
)
)
br $596
)
(block $601
(block $600
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $600
(block $602
(block $603
global.get $glob7
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $603
(block $604
(i32.const 7 )
local.set $loc3
)
)
)
br $601
)
(block $606
(block $605
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $605
(block $607
(block $608
global.get $glob7
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $608
(block $609
(i32.const 7 )
local.set $loc3
)
)
)
br $606
)
(block $610
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $610
(block $611
(block $612
global.get $glob7
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $612
(block $613
(i32.const 7 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $538
)
(block $615
(block $614
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $614
(block $616
(block $618
(block $617
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $617
(block $619
(block $620
global.get $glob8
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $620
(block $621
(i32.const 8 )
local.set $loc3
)
)
)
br $618
)
(block $623
(block $622
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $622
(block $624
(block $625
global.get $glob8
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $625
(block $626
(i32.const 8 )
local.set $loc3
)
)
)
br $623
)
(block $628
(block $627
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $627
(block $629
(block $630
global.get $glob8
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $630
(block $631
(i32.const 8 )
local.set $loc3
)
)
)
br $628
)
(block $633
(block $632
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $632
(block $634
(block $635
global.get $glob8
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $635
(block $636
(i32.const 8 )
local.set $loc3
)
)
)
br $633
)
(block $638
(block $637
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $637
(block $639
(block $640
global.get $glob8
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $640
(block $641
(i32.const 8 )
local.set $loc3
)
)
)
br $638
)
(block $643
(block $642
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $642
(block $644
(block $645
global.get $glob8
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $645
(block $646
(i32.const 8 )
local.set $loc3
)
)
)
br $643
)
(block $648
(block $647
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $647
(block $649
(block $650
global.get $glob8
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $650
(block $651
(i32.const 8 )
local.set $loc3
)
)
)
br $648
)
(block $653
(block $652
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $652
(block $654
(block $655
global.get $glob8
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $655
(block $656
(i32.const 8 )
local.set $loc3
)
)
)
br $653
)
(block $658
(block $657
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $657
(block $659
(block $660
global.get $glob8
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $660
(block $661
(i32.const 8 )
local.set $loc3
)
)
)
br $658
)
(block $663
(block $662
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $662
(block $664
(block $665
global.get $glob8
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $665
(block $666
(i32.const 8 )
local.set $loc3
)
)
)
br $663
)
(block $668
(block $667
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $667
(block $669
(block $670
global.get $glob8
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $670
(block $671
(i32.const 8 )
local.set $loc3
)
)
)
br $668
)
(block $673
(block $672
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $672
(block $674
(block $675
global.get $glob8
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $675
(block $676
(i32.const 8 )
local.set $loc3
)
)
)
br $673
)
(block $678
(block $677
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $677
(block $679
(block $680
global.get $glob8
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $680
(block $681
(i32.const 8 )
local.set $loc3
)
)
)
br $678
)
(block $683
(block $682
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $682
(block $684
(block $685
global.get $glob8
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $685
(block $686
(i32.const 8 )
local.set $loc3
)
)
)
br $683
)
(block $687
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $687
(block $688
(block $689
global.get $glob8
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $689
(block $690
(i32.const 8 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $615
)
(block $692
(block $691
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $691
(block $693
(block $695
(block $694
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $694
(block $696
(block $697
global.get $glob9
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $697
(block $698
(i32.const 9 )
local.set $loc3
)
)
)
br $695
)
(block $700
(block $699
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $699
(block $701
(block $702
global.get $glob9
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $702
(block $703
(i32.const 9 )
local.set $loc3
)
)
)
br $700
)
(block $705
(block $704
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $704
(block $706
(block $707
global.get $glob9
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $707
(block $708
(i32.const 9 )
local.set $loc3
)
)
)
br $705
)
(block $710
(block $709
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $709
(block $711
(block $712
global.get $glob9
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $712
(block $713
(i32.const 9 )
local.set $loc3
)
)
)
br $710
)
(block $715
(block $714
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $714
(block $716
(block $717
global.get $glob9
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $717
(block $718
(i32.const 9 )
local.set $loc3
)
)
)
br $715
)
(block $720
(block $719
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $719
(block $721
(block $722
global.get $glob9
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $722
(block $723
(i32.const 9 )
local.set $loc3
)
)
)
br $720
)
(block $725
(block $724
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $724
(block $726
(block $727
global.get $glob9
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $727
(block $728
(i32.const 9 )
local.set $loc3
)
)
)
br $725
)
(block $730
(block $729
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $729
(block $731
(block $732
global.get $glob9
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $732
(block $733
(i32.const 9 )
local.set $loc3
)
)
)
br $730
)
(block $735
(block $734
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $734
(block $736
(block $737
global.get $glob9
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $737
(block $738
(i32.const 9 )
local.set $loc3
)
)
)
br $735
)
(block $740
(block $739
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $739
(block $741
(block $742
global.get $glob9
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $742
(block $743
(i32.const 9 )
local.set $loc3
)
)
)
br $740
)
(block $745
(block $744
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $744
(block $746
(block $747
global.get $glob9
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $747
(block $748
(i32.const 9 )
local.set $loc3
)
)
)
br $745
)
(block $750
(block $749
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $749
(block $751
(block $752
global.get $glob9
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $752
(block $753
(i32.const 9 )
local.set $loc3
)
)
)
br $750
)
(block $755
(block $754
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $754
(block $756
(block $757
global.get $glob9
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $757
(block $758
(i32.const 9 )
local.set $loc3
)
)
)
br $755
)
(block $760
(block $759
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $759
(block $761
(block $762
global.get $glob9
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $762
(block $763
(i32.const 9 )
local.set $loc3
)
)
)
br $760
)
(block $764
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $764
(block $765
(block $766
global.get $glob9
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $766
(block $767
(i32.const 9 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $692
)
(block $769
(block $768
local.get $loc1
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $768
(block $770
(block $772
(block $771
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $771
(block $773
(block $774
global.get $glob10
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $774
(block $775
(i32.const 10 )
local.set $loc3
)
)
)
br $772
)
(block $777
(block $776
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $776
(block $778
(block $779
global.get $glob10
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $779
(block $780
(i32.const 10 )
local.set $loc3
)
)
)
br $777
)
(block $782
(block $781
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $781
(block $783
(block $784
global.get $glob10
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $784
(block $785
(i32.const 10 )
local.set $loc3
)
)
)
br $782
)
(block $787
(block $786
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $786
(block $788
(block $789
global.get $glob10
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $789
(block $790
(i32.const 10 )
local.set $loc3
)
)
)
br $787
)
(block $792
(block $791
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $791
(block $793
(block $794
global.get $glob10
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $794
(block $795
(i32.const 10 )
local.set $loc3
)
)
)
br $792
)
(block $797
(block $796
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $796
(block $798
(block $799
global.get $glob10
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $799
(block $800
(i32.const 10 )
local.set $loc3
)
)
)
br $797
)
(block $802
(block $801
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $801
(block $803
(block $804
global.get $glob10
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $804
(block $805
(i32.const 10 )
local.set $loc3
)
)
)
br $802
)
(block $807
(block $806
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $806
(block $808
(block $809
global.get $glob10
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $809
(block $810
(i32.const 10 )
local.set $loc3
)
)
)
br $807
)
(block $812
(block $811
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $811
(block $813
(block $814
global.get $glob10
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $814
(block $815
(i32.const 10 )
local.set $loc3
)
)
)
br $812
)
(block $817
(block $816
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $816
(block $818
(block $819
global.get $glob10
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $819
(block $820
(i32.const 10 )
local.set $loc3
)
)
)
br $817
)
(block $822
(block $821
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $821
(block $823
(block $824
global.get $glob10
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $824
(block $825
(i32.const 10 )
local.set $loc3
)
)
)
br $822
)
(block $827
(block $826
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $826
(block $828
(block $829
global.get $glob10
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $829
(block $830
(i32.const 10 )
local.set $loc3
)
)
)
br $827
)
(block $832
(block $831
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $831
(block $833
(block $834
global.get $glob10
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $834
(block $835
(i32.const 10 )
local.set $loc3
)
)
)
br $832
)
(block $837
(block $836
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $836
(block $838
(block $839
global.get $glob10
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $839
(block $840
(i32.const 10 )
local.set $loc3
)
)
)
br $837
)
(block $841
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $841
(block $842
(block $843
global.get $glob10
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $843
(block $844
(i32.const 10 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $769
)
(block $846
(block $845
local.get $loc1
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $845
(block $847
(block $849
(block $848
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $848
(block $850
(block $851
global.get $glob11
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $851
(block $852
(i32.const 11 )
local.set $loc3
)
)
)
br $849
)
(block $854
(block $853
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $853
(block $855
(block $856
global.get $glob11
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $856
(block $857
(i32.const 11 )
local.set $loc3
)
)
)
br $854
)
(block $859
(block $858
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $858
(block $860
(block $861
global.get $glob11
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $861
(block $862
(i32.const 11 )
local.set $loc3
)
)
)
br $859
)
(block $864
(block $863
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $863
(block $865
(block $866
global.get $glob11
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $866
(block $867
(i32.const 11 )
local.set $loc3
)
)
)
br $864
)
(block $869
(block $868
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $868
(block $870
(block $871
global.get $glob11
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $871
(block $872
(i32.const 11 )
local.set $loc3
)
)
)
br $869
)
(block $874
(block $873
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $873
(block $875
(block $876
global.get $glob11
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $876
(block $877
(i32.const 11 )
local.set $loc3
)
)
)
br $874
)
(block $879
(block $878
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $878
(block $880
(block $881
global.get $glob11
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $881
(block $882
(i32.const 11 )
local.set $loc3
)
)
)
br $879
)
(block $884
(block $883
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $883
(block $885
(block $886
global.get $glob11
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $886
(block $887
(i32.const 11 )
local.set $loc3
)
)
)
br $884
)
(block $889
(block $888
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $888
(block $890
(block $891
global.get $glob11
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $891
(block $892
(i32.const 11 )
local.set $loc3
)
)
)
br $889
)
(block $894
(block $893
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $893
(block $895
(block $896
global.get $glob11
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $896
(block $897
(i32.const 11 )
local.set $loc3
)
)
)
br $894
)
(block $899
(block $898
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $898
(block $900
(block $901
global.get $glob11
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $901
(block $902
(i32.const 11 )
local.set $loc3
)
)
)
br $899
)
(block $904
(block $903
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $903
(block $905
(block $906
global.get $glob11
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $906
(block $907
(i32.const 11 )
local.set $loc3
)
)
)
br $904
)
(block $909
(block $908
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $908
(block $910
(block $911
global.get $glob11
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $911
(block $912
(i32.const 11 )
local.set $loc3
)
)
)
br $909
)
(block $914
(block $913
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $913
(block $915
(block $916
global.get $glob11
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $916
(block $917
(i32.const 11 )
local.set $loc3
)
)
)
br $914
)
(block $918
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $918
(block $919
(block $920
global.get $glob11
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $920
(block $921
(i32.const 11 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $846
)
(block $923
(block $922
local.get $loc1
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $922
(block $924
(block $926
(block $925
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $925
(block $927
(block $928
global.get $glob12
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $928
(block $929
(i32.const 12 )
local.set $loc3
)
)
)
br $926
)
(block $931
(block $930
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $930
(block $932
(block $933
global.get $glob12
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $933
(block $934
(i32.const 12 )
local.set $loc3
)
)
)
br $931
)
(block $936
(block $935
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $935
(block $937
(block $938
global.get $glob12
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $938
(block $939
(i32.const 12 )
local.set $loc3
)
)
)
br $936
)
(block $941
(block $940
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $940
(block $942
(block $943
global.get $glob12
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $943
(block $944
(i32.const 12 )
local.set $loc3
)
)
)
br $941
)
(block $946
(block $945
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $945
(block $947
(block $948
global.get $glob12
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $948
(block $949
(i32.const 12 )
local.set $loc3
)
)
)
br $946
)
(block $951
(block $950
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $950
(block $952
(block $953
global.get $glob12
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $953
(block $954
(i32.const 12 )
local.set $loc3
)
)
)
br $951
)
(block $956
(block $955
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $955
(block $957
(block $958
global.get $glob12
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $958
(block $959
(i32.const 12 )
local.set $loc3
)
)
)
br $956
)
(block $961
(block $960
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $960
(block $962
(block $963
global.get $glob12
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $963
(block $964
(i32.const 12 )
local.set $loc3
)
)
)
br $961
)
(block $966
(block $965
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $965
(block $967
(block $968
global.get $glob12
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $968
(block $969
(i32.const 12 )
local.set $loc3
)
)
)
br $966
)
(block $971
(block $970
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $970
(block $972
(block $973
global.get $glob12
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $973
(block $974
(i32.const 12 )
local.set $loc3
)
)
)
br $971
)
(block $976
(block $975
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $975
(block $977
(block $978
global.get $glob12
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $978
(block $979
(i32.const 12 )
local.set $loc3
)
)
)
br $976
)
(block $981
(block $980
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $980
(block $982
(block $983
global.get $glob12
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $983
(block $984
(i32.const 12 )
local.set $loc3
)
)
)
br $981
)
(block $986
(block $985
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $985
(block $987
(block $988
global.get $glob12
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $988
(block $989
(i32.const 12 )
local.set $loc3
)
)
)
br $986
)
(block $991
(block $990
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $990
(block $992
(block $993
global.get $glob12
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $993
(block $994
(i32.const 12 )
local.set $loc3
)
)
)
br $991
)
(block $995
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $995
(block $996
(block $997
global.get $glob12
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $997
(block $998
(i32.const 12 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $923
)
(block $1000
(block $999
local.get $loc1
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $999
(block $1001
(block $1003
(block $1002
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1002
(block $1004
(block $1005
global.get $glob13
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1005
(block $1006
(i32.const 13 )
local.set $loc3
)
)
)
br $1003
)
(block $1008
(block $1007
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1007
(block $1009
(block $1010
global.get $glob13
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1010
(block $1011
(i32.const 13 )
local.set $loc3
)
)
)
br $1008
)
(block $1013
(block $1012
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1012
(block $1014
(block $1015
global.get $glob13
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1015
(block $1016
(i32.const 13 )
local.set $loc3
)
)
)
br $1013
)
(block $1018
(block $1017
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1017
(block $1019
(block $1020
global.get $glob13
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1020
(block $1021
(i32.const 13 )
local.set $loc3
)
)
)
br $1018
)
(block $1023
(block $1022
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1022
(block $1024
(block $1025
global.get $glob13
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1025
(block $1026
(i32.const 13 )
local.set $loc3
)
)
)
br $1023
)
(block $1028
(block $1027
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1027
(block $1029
(block $1030
global.get $glob13
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1030
(block $1031
(i32.const 13 )
local.set $loc3
)
)
)
br $1028
)
(block $1033
(block $1032
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1032
(block $1034
(block $1035
global.get $glob13
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1035
(block $1036
(i32.const 13 )
local.set $loc3
)
)
)
br $1033
)
(block $1038
(block $1037
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1037
(block $1039
(block $1040
global.get $glob13
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1040
(block $1041
(i32.const 13 )
local.set $loc3
)
)
)
br $1038
)
(block $1043
(block $1042
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1042
(block $1044
(block $1045
global.get $glob13
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1045
(block $1046
(i32.const 13 )
local.set $loc3
)
)
)
br $1043
)
(block $1048
(block $1047
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1047
(block $1049
(block $1050
global.get $glob13
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1050
(block $1051
(i32.const 13 )
local.set $loc3
)
)
)
br $1048
)
(block $1053
(block $1052
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1052
(block $1054
(block $1055
global.get $glob13
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1055
(block $1056
(i32.const 13 )
local.set $loc3
)
)
)
br $1053
)
(block $1058
(block $1057
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1057
(block $1059
(block $1060
global.get $glob13
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1060
(block $1061
(i32.const 13 )
local.set $loc3
)
)
)
br $1058
)
(block $1063
(block $1062
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1062
(block $1064
(block $1065
global.get $glob13
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1065
(block $1066
(i32.const 13 )
local.set $loc3
)
)
)
br $1063
)
(block $1068
(block $1067
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1067
(block $1069
(block $1070
global.get $glob13
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1070
(block $1071
(i32.const 13 )
local.set $loc3
)
)
)
br $1068
)
(block $1072
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1072
(block $1073
(block $1074
global.get $glob13
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1074
(block $1075
(i32.const 13 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1000
)
(block $1076
local.get $loc1
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1076
(block $1077
(block $1079
(block $1078
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1078
(block $1080
(block $1081
global.get $glob14
global.get $glob0
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1081
(block $1082
(i32.const 14 )
local.set $loc3
)
)
)
br $1079
)
(block $1084
(block $1083
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1083
(block $1085
(block $1086
global.get $glob14
global.get $glob1
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1086
(block $1087
(i32.const 14 )
local.set $loc3
)
)
)
br $1084
)
(block $1089
(block $1088
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1088
(block $1090
(block $1091
global.get $glob14
global.get $glob2
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1091
(block $1092
(i32.const 14 )
local.set $loc3
)
)
)
br $1089
)
(block $1094
(block $1093
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1093
(block $1095
(block $1096
global.get $glob14
global.get $glob3
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1096
(block $1097
(i32.const 14 )
local.set $loc3
)
)
)
br $1094
)
(block $1099
(block $1098
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1098
(block $1100
(block $1101
global.get $glob14
global.get $glob4
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1101
(block $1102
(i32.const 14 )
local.set $loc3
)
)
)
br $1099
)
(block $1104
(block $1103
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1103
(block $1105
(block $1106
global.get $glob14
global.get $glob5
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1106
(block $1107
(i32.const 14 )
local.set $loc3
)
)
)
br $1104
)
(block $1109
(block $1108
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1108
(block $1110
(block $1111
global.get $glob14
global.get $glob6
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1111
(block $1112
(i32.const 14 )
local.set $loc3
)
)
)
br $1109
)
(block $1114
(block $1113
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1113
(block $1115
(block $1116
global.get $glob14
global.get $glob7
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1116
(block $1117
(i32.const 14 )
local.set $loc3
)
)
)
br $1114
)
(block $1119
(block $1118
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1118
(block $1120
(block $1121
global.get $glob14
global.get $glob8
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1121
(block $1122
(i32.const 14 )
local.set $loc3
)
)
)
br $1119
)
(block $1124
(block $1123
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1123
(block $1125
(block $1126
global.get $glob14
global.get $glob9
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1126
(block $1127
(i32.const 14 )
local.set $loc3
)
)
)
br $1124
)
(block $1129
(block $1128
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1128
(block $1130
(block $1131
global.get $glob14
global.get $glob10
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1131
(block $1132
(i32.const 14 )
local.set $loc3
)
)
)
br $1129
)
(block $1134
(block $1133
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1133
(block $1135
(block $1136
global.get $glob14
global.get $glob11
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1136
(block $1137
(i32.const 14 )
local.set $loc3
)
)
)
br $1134
)
(block $1139
(block $1138
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1138
(block $1140
(block $1141
global.get $glob14
global.get $glob12
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1141
(block $1142
(i32.const 14 )
local.set $loc3
)
)
)
br $1139
)
(block $1144
(block $1143
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1143
(block $1145
(block $1146
global.get $glob14
global.get $glob13
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1146
(block $1147
(i32.const 14 )
local.set $loc3
)
)
)
br $1144
)
(block $1148
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1148
(block $1149
(block $1150
global.get $glob14
global.get $glob14
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1150
(block $1151
(i32.const 14 )
local.set $loc3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
local.get $loc1
(i32.const 1 )
i32.add
local.set $loc1
)
br $73
)
)
(block $1153
(block $1152
local.get $loc0
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1152
(block $1154
(block $1156
(block $1155
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1155
(block $1157
global.get $glob0
local.set $loc2
global.get $glob0
global.set $glob0
local.get $loc2
global.set $glob0
)
br $1156
)
(block $1159
(block $1158
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1158
(block $1160
global.get $glob1
local.set $loc2
global.get $glob0
global.set $glob1
local.get $loc2
global.set $glob0
)
br $1159
)
(block $1162
(block $1161
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1161
(block $1163
global.get $glob2
local.set $loc2
global.get $glob0
global.set $glob2
local.get $loc2
global.set $glob0
)
br $1162
)
(block $1165
(block $1164
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1164
(block $1166
global.get $glob3
local.set $loc2
global.get $glob0
global.set $glob3
local.get $loc2
global.set $glob0
)
br $1165
)
(block $1168
(block $1167
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1167
(block $1169
global.get $glob4
local.set $loc2
global.get $glob0
global.set $glob4
local.get $loc2
global.set $glob0
)
br $1168
)
(block $1171
(block $1170
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1170
(block $1172
global.get $glob5
local.set $loc2
global.get $glob0
global.set $glob5
local.get $loc2
global.set $glob0
)
br $1171
)
(block $1174
(block $1173
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1173
(block $1175
global.get $glob6
local.set $loc2
global.get $glob0
global.set $glob6
local.get $loc2
global.set $glob0
)
br $1174
)
(block $1177
(block $1176
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1176
(block $1178
global.get $glob7
local.set $loc2
global.get $glob0
global.set $glob7
local.get $loc2
global.set $glob0
)
br $1177
)
(block $1180
(block $1179
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1179
(block $1181
global.get $glob8
local.set $loc2
global.get $glob0
global.set $glob8
local.get $loc2
global.set $glob0
)
br $1180
)
(block $1183
(block $1182
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1182
(block $1184
global.get $glob9
local.set $loc2
global.get $glob0
global.set $glob9
local.get $loc2
global.set $glob0
)
br $1183
)
(block $1186
(block $1185
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1185
(block $1187
global.get $glob10
local.set $loc2
global.get $glob0
global.set $glob10
local.get $loc2
global.set $glob0
)
br $1186
)
(block $1189
(block $1188
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1188
(block $1190
global.get $glob11
local.set $loc2
global.get $glob0
global.set $glob11
local.get $loc2
global.set $glob0
)
br $1189
)
(block $1192
(block $1191
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1191
(block $1193
global.get $glob12
local.set $loc2
global.get $glob0
global.set $glob12
local.get $loc2
global.set $glob0
)
br $1192
)
(block $1195
(block $1194
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1194
(block $1196
global.get $glob13
local.set $loc2
global.get $glob0
global.set $glob13
local.get $loc2
global.set $glob0
)
br $1195
)
(block $1197
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1197
(block $1198
global.get $glob14
local.set $loc2
global.get $glob0
global.set $glob14
local.get $loc2
global.set $glob0
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1153
)
(block $1200
(block $1199
local.get $loc0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1199
(block $1201
(block $1203
(block $1202
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1202
(block $1204
global.get $glob0
local.set $loc2
global.get $glob1
global.set $glob0
local.get $loc2
global.set $glob1
)
br $1203
)
(block $1206
(block $1205
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1205
(block $1207
global.get $glob1
local.set $loc2
global.get $glob1
global.set $glob1
local.get $loc2
global.set $glob1
)
br $1206
)
(block $1209
(block $1208
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1208
(block $1210
global.get $glob2
local.set $loc2
global.get $glob1
global.set $glob2
local.get $loc2
global.set $glob1
)
br $1209
)
(block $1212
(block $1211
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1211
(block $1213
global.get $glob3
local.set $loc2
global.get $glob1
global.set $glob3
local.get $loc2
global.set $glob1
)
br $1212
)
(block $1215
(block $1214
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1214
(block $1216
global.get $glob4
local.set $loc2
global.get $glob1
global.set $glob4
local.get $loc2
global.set $glob1
)
br $1215
)
(block $1218
(block $1217
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1217
(block $1219
global.get $glob5
local.set $loc2
global.get $glob1
global.set $glob5
local.get $loc2
global.set $glob1
)
br $1218
)
(block $1221
(block $1220
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1220
(block $1222
global.get $glob6
local.set $loc2
global.get $glob1
global.set $glob6
local.get $loc2
global.set $glob1
)
br $1221
)
(block $1224
(block $1223
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1223
(block $1225
global.get $glob7
local.set $loc2
global.get $glob1
global.set $glob7
local.get $loc2
global.set $glob1
)
br $1224
)
(block $1227
(block $1226
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1226
(block $1228
global.get $glob8
local.set $loc2
global.get $glob1
global.set $glob8
local.get $loc2
global.set $glob1
)
br $1227
)
(block $1230
(block $1229
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1229
(block $1231
global.get $glob9
local.set $loc2
global.get $glob1
global.set $glob9
local.get $loc2
global.set $glob1
)
br $1230
)
(block $1233
(block $1232
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1232
(block $1234
global.get $glob10
local.set $loc2
global.get $glob1
global.set $glob10
local.get $loc2
global.set $glob1
)
br $1233
)
(block $1236
(block $1235
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1235
(block $1237
global.get $glob11
local.set $loc2
global.get $glob1
global.set $glob11
local.get $loc2
global.set $glob1
)
br $1236
)
(block $1239
(block $1238
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1238
(block $1240
global.get $glob12
local.set $loc2
global.get $glob1
global.set $glob12
local.get $loc2
global.set $glob1
)
br $1239
)
(block $1242
(block $1241
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1241
(block $1243
global.get $glob13
local.set $loc2
global.get $glob1
global.set $glob13
local.get $loc2
global.set $glob1
)
br $1242
)
(block $1244
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1244
(block $1245
global.get $glob14
local.set $loc2
global.get $glob1
global.set $glob14
local.get $loc2
global.set $glob1
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1200
)
(block $1247
(block $1246
local.get $loc0
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1246
(block $1248
(block $1250
(block $1249
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1249
(block $1251
global.get $glob0
local.set $loc2
global.get $glob2
global.set $glob0
local.get $loc2
global.set $glob2
)
br $1250
)
(block $1253
(block $1252
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1252
(block $1254
global.get $glob1
local.set $loc2
global.get $glob2
global.set $glob1
local.get $loc2
global.set $glob2
)
br $1253
)
(block $1256
(block $1255
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1255
(block $1257
global.get $glob2
local.set $loc2
global.get $glob2
global.set $glob2
local.get $loc2
global.set $glob2
)
br $1256
)
(block $1259
(block $1258
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1258
(block $1260
global.get $glob3
local.set $loc2
global.get $glob2
global.set $glob3
local.get $loc2
global.set $glob2
)
br $1259
)
(block $1262
(block $1261
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1261
(block $1263
global.get $glob4
local.set $loc2
global.get $glob2
global.set $glob4
local.get $loc2
global.set $glob2
)
br $1262
)
(block $1265
(block $1264
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1264
(block $1266
global.get $glob5
local.set $loc2
global.get $glob2
global.set $glob5
local.get $loc2
global.set $glob2
)
br $1265
)
(block $1268
(block $1267
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1267
(block $1269
global.get $glob6
local.set $loc2
global.get $glob2
global.set $glob6
local.get $loc2
global.set $glob2
)
br $1268
)
(block $1271
(block $1270
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1270
(block $1272
global.get $glob7
local.set $loc2
global.get $glob2
global.set $glob7
local.get $loc2
global.set $glob2
)
br $1271
)
(block $1274
(block $1273
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1273
(block $1275
global.get $glob8
local.set $loc2
global.get $glob2
global.set $glob8
local.get $loc2
global.set $glob2
)
br $1274
)
(block $1277
(block $1276
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1276
(block $1278
global.get $glob9
local.set $loc2
global.get $glob2
global.set $glob9
local.get $loc2
global.set $glob2
)
br $1277
)
(block $1280
(block $1279
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1279
(block $1281
global.get $glob10
local.set $loc2
global.get $glob2
global.set $glob10
local.get $loc2
global.set $glob2
)
br $1280
)
(block $1283
(block $1282
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1282
(block $1284
global.get $glob11
local.set $loc2
global.get $glob2
global.set $glob11
local.get $loc2
global.set $glob2
)
br $1283
)
(block $1286
(block $1285
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1285
(block $1287
global.get $glob12
local.set $loc2
global.get $glob2
global.set $glob12
local.get $loc2
global.set $glob2
)
br $1286
)
(block $1289
(block $1288
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1288
(block $1290
global.get $glob13
local.set $loc2
global.get $glob2
global.set $glob13
local.get $loc2
global.set $glob2
)
br $1289
)
(block $1291
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1291
(block $1292
global.get $glob14
local.set $loc2
global.get $glob2
global.set $glob14
local.get $loc2
global.set $glob2
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1247
)
(block $1294
(block $1293
local.get $loc0
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1293
(block $1295
(block $1297
(block $1296
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1296
(block $1298
global.get $glob0
local.set $loc2
global.get $glob3
global.set $glob0
local.get $loc2
global.set $glob3
)
br $1297
)
(block $1300
(block $1299
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1299
(block $1301
global.get $glob1
local.set $loc2
global.get $glob3
global.set $glob1
local.get $loc2
global.set $glob3
)
br $1300
)
(block $1303
(block $1302
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1302
(block $1304
global.get $glob2
local.set $loc2
global.get $glob3
global.set $glob2
local.get $loc2
global.set $glob3
)
br $1303
)
(block $1306
(block $1305
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1305
(block $1307
global.get $glob3
local.set $loc2
global.get $glob3
global.set $glob3
local.get $loc2
global.set $glob3
)
br $1306
)
(block $1309
(block $1308
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1308
(block $1310
global.get $glob4
local.set $loc2
global.get $glob3
global.set $glob4
local.get $loc2
global.set $glob3
)
br $1309
)
(block $1312
(block $1311
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1311
(block $1313
global.get $glob5
local.set $loc2
global.get $glob3
global.set $glob5
local.get $loc2
global.set $glob3
)
br $1312
)
(block $1315
(block $1314
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1314
(block $1316
global.get $glob6
local.set $loc2
global.get $glob3
global.set $glob6
local.get $loc2
global.set $glob3
)
br $1315
)
(block $1318
(block $1317
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1317
(block $1319
global.get $glob7
local.set $loc2
global.get $glob3
global.set $glob7
local.get $loc2
global.set $glob3
)
br $1318
)
(block $1321
(block $1320
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1320
(block $1322
global.get $glob8
local.set $loc2
global.get $glob3
global.set $glob8
local.get $loc2
global.set $glob3
)
br $1321
)
(block $1324
(block $1323
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1323
(block $1325
global.get $glob9
local.set $loc2
global.get $glob3
global.set $glob9
local.get $loc2
global.set $glob3
)
br $1324
)
(block $1327
(block $1326
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1326
(block $1328
global.get $glob10
local.set $loc2
global.get $glob3
global.set $glob10
local.get $loc2
global.set $glob3
)
br $1327
)
(block $1330
(block $1329
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1329
(block $1331
global.get $glob11
local.set $loc2
global.get $glob3
global.set $glob11
local.get $loc2
global.set $glob3
)
br $1330
)
(block $1333
(block $1332
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1332
(block $1334
global.get $glob12
local.set $loc2
global.get $glob3
global.set $glob12
local.get $loc2
global.set $glob3
)
br $1333
)
(block $1336
(block $1335
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1335
(block $1337
global.get $glob13
local.set $loc2
global.get $glob3
global.set $glob13
local.get $loc2
global.set $glob3
)
br $1336
)
(block $1338
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1338
(block $1339
global.get $glob14
local.set $loc2
global.get $glob3
global.set $glob14
local.get $loc2
global.set $glob3
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1294
)
(block $1341
(block $1340
local.get $loc0
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1340
(block $1342
(block $1344
(block $1343
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1343
(block $1345
global.get $glob0
local.set $loc2
global.get $glob4
global.set $glob0
local.get $loc2
global.set $glob4
)
br $1344
)
(block $1347
(block $1346
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1346
(block $1348
global.get $glob1
local.set $loc2
global.get $glob4
global.set $glob1
local.get $loc2
global.set $glob4
)
br $1347
)
(block $1350
(block $1349
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1349
(block $1351
global.get $glob2
local.set $loc2
global.get $glob4
global.set $glob2
local.get $loc2
global.set $glob4
)
br $1350
)
(block $1353
(block $1352
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1352
(block $1354
global.get $glob3
local.set $loc2
global.get $glob4
global.set $glob3
local.get $loc2
global.set $glob4
)
br $1353
)
(block $1356
(block $1355
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1355
(block $1357
global.get $glob4
local.set $loc2
global.get $glob4
global.set $glob4
local.get $loc2
global.set $glob4
)
br $1356
)
(block $1359
(block $1358
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1358
(block $1360
global.get $glob5
local.set $loc2
global.get $glob4
global.set $glob5
local.get $loc2
global.set $glob4
)
br $1359
)
(block $1362
(block $1361
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1361
(block $1363
global.get $glob6
local.set $loc2
global.get $glob4
global.set $glob6
local.get $loc2
global.set $glob4
)
br $1362
)
(block $1365
(block $1364
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1364
(block $1366
global.get $glob7
local.set $loc2
global.get $glob4
global.set $glob7
local.get $loc2
global.set $glob4
)
br $1365
)
(block $1368
(block $1367
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1367
(block $1369
global.get $glob8
local.set $loc2
global.get $glob4
global.set $glob8
local.get $loc2
global.set $glob4
)
br $1368
)
(block $1371
(block $1370
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1370
(block $1372
global.get $glob9
local.set $loc2
global.get $glob4
global.set $glob9
local.get $loc2
global.set $glob4
)
br $1371
)
(block $1374
(block $1373
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1373
(block $1375
global.get $glob10
local.set $loc2
global.get $glob4
global.set $glob10
local.get $loc2
global.set $glob4
)
br $1374
)
(block $1377
(block $1376
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1376
(block $1378
global.get $glob11
local.set $loc2
global.get $glob4
global.set $glob11
local.get $loc2
global.set $glob4
)
br $1377
)
(block $1380
(block $1379
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1379
(block $1381
global.get $glob12
local.set $loc2
global.get $glob4
global.set $glob12
local.get $loc2
global.set $glob4
)
br $1380
)
(block $1383
(block $1382
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1382
(block $1384
global.get $glob13
local.set $loc2
global.get $glob4
global.set $glob13
local.get $loc2
global.set $glob4
)
br $1383
)
(block $1385
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1385
(block $1386
global.get $glob14
local.set $loc2
global.get $glob4
global.set $glob14
local.get $loc2
global.set $glob4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1341
)
(block $1388
(block $1387
local.get $loc0
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1387
(block $1389
(block $1391
(block $1390
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1390
(block $1392
global.get $glob0
local.set $loc2
global.get $glob5
global.set $glob0
local.get $loc2
global.set $glob5
)
br $1391
)
(block $1394
(block $1393
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1393
(block $1395
global.get $glob1
local.set $loc2
global.get $glob5
global.set $glob1
local.get $loc2
global.set $glob5
)
br $1394
)
(block $1397
(block $1396
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1396
(block $1398
global.get $glob2
local.set $loc2
global.get $glob5
global.set $glob2
local.get $loc2
global.set $glob5
)
br $1397
)
(block $1400
(block $1399
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1399
(block $1401
global.get $glob3
local.set $loc2
global.get $glob5
global.set $glob3
local.get $loc2
global.set $glob5
)
br $1400
)
(block $1403
(block $1402
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1402
(block $1404
global.get $glob4
local.set $loc2
global.get $glob5
global.set $glob4
local.get $loc2
global.set $glob5
)
br $1403
)
(block $1406
(block $1405
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1405
(block $1407
global.get $glob5
local.set $loc2
global.get $glob5
global.set $glob5
local.get $loc2
global.set $glob5
)
br $1406
)
(block $1409
(block $1408
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1408
(block $1410
global.get $glob6
local.set $loc2
global.get $glob5
global.set $glob6
local.get $loc2
global.set $glob5
)
br $1409
)
(block $1412
(block $1411
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1411
(block $1413
global.get $glob7
local.set $loc2
global.get $glob5
global.set $glob7
local.get $loc2
global.set $glob5
)
br $1412
)
(block $1415
(block $1414
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1414
(block $1416
global.get $glob8
local.set $loc2
global.get $glob5
global.set $glob8
local.get $loc2
global.set $glob5
)
br $1415
)
(block $1418
(block $1417
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1417
(block $1419
global.get $glob9
local.set $loc2
global.get $glob5
global.set $glob9
local.get $loc2
global.set $glob5
)
br $1418
)
(block $1421
(block $1420
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1420
(block $1422
global.get $glob10
local.set $loc2
global.get $glob5
global.set $glob10
local.get $loc2
global.set $glob5
)
br $1421
)
(block $1424
(block $1423
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1423
(block $1425
global.get $glob11
local.set $loc2
global.get $glob5
global.set $glob11
local.get $loc2
global.set $glob5
)
br $1424
)
(block $1427
(block $1426
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1426
(block $1428
global.get $glob12
local.set $loc2
global.get $glob5
global.set $glob12
local.get $loc2
global.set $glob5
)
br $1427
)
(block $1430
(block $1429
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1429
(block $1431
global.get $glob13
local.set $loc2
global.get $glob5
global.set $glob13
local.get $loc2
global.set $glob5
)
br $1430
)
(block $1432
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1432
(block $1433
global.get $glob14
local.set $loc2
global.get $glob5
global.set $glob14
local.get $loc2
global.set $glob5
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1388
)
(block $1435
(block $1434
local.get $loc0
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1434
(block $1436
(block $1438
(block $1437
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1437
(block $1439
global.get $glob0
local.set $loc2
global.get $glob6
global.set $glob0
local.get $loc2
global.set $glob6
)
br $1438
)
(block $1441
(block $1440
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1440
(block $1442
global.get $glob1
local.set $loc2
global.get $glob6
global.set $glob1
local.get $loc2
global.set $glob6
)
br $1441
)
(block $1444
(block $1443
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1443
(block $1445
global.get $glob2
local.set $loc2
global.get $glob6
global.set $glob2
local.get $loc2
global.set $glob6
)
br $1444
)
(block $1447
(block $1446
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1446
(block $1448
global.get $glob3
local.set $loc2
global.get $glob6
global.set $glob3
local.get $loc2
global.set $glob6
)
br $1447
)
(block $1450
(block $1449
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1449
(block $1451
global.get $glob4
local.set $loc2
global.get $glob6
global.set $glob4
local.get $loc2
global.set $glob6
)
br $1450
)
(block $1453
(block $1452
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1452
(block $1454
global.get $glob5
local.set $loc2
global.get $glob6
global.set $glob5
local.get $loc2
global.set $glob6
)
br $1453
)
(block $1456
(block $1455
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1455
(block $1457
global.get $glob6
local.set $loc2
global.get $glob6
global.set $glob6
local.get $loc2
global.set $glob6
)
br $1456
)
(block $1459
(block $1458
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1458
(block $1460
global.get $glob7
local.set $loc2
global.get $glob6
global.set $glob7
local.get $loc2
global.set $glob6
)
br $1459
)
(block $1462
(block $1461
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1461
(block $1463
global.get $glob8
local.set $loc2
global.get $glob6
global.set $glob8
local.get $loc2
global.set $glob6
)
br $1462
)
(block $1465
(block $1464
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1464
(block $1466
global.get $glob9
local.set $loc2
global.get $glob6
global.set $glob9
local.get $loc2
global.set $glob6
)
br $1465
)
(block $1468
(block $1467
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1467
(block $1469
global.get $glob10
local.set $loc2
global.get $glob6
global.set $glob10
local.get $loc2
global.set $glob6
)
br $1468
)
(block $1471
(block $1470
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1470
(block $1472
global.get $glob11
local.set $loc2
global.get $glob6
global.set $glob11
local.get $loc2
global.set $glob6
)
br $1471
)
(block $1474
(block $1473
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1473
(block $1475
global.get $glob12
local.set $loc2
global.get $glob6
global.set $glob12
local.get $loc2
global.set $glob6
)
br $1474
)
(block $1477
(block $1476
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1476
(block $1478
global.get $glob13
local.set $loc2
global.get $glob6
global.set $glob13
local.get $loc2
global.set $glob6
)
br $1477
)
(block $1479
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1479
(block $1480
global.get $glob14
local.set $loc2
global.get $glob6
global.set $glob14
local.get $loc2
global.set $glob6
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1435
)
(block $1482
(block $1481
local.get $loc0
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1481
(block $1483
(block $1485
(block $1484
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1484
(block $1486
global.get $glob0
local.set $loc2
global.get $glob7
global.set $glob0
local.get $loc2
global.set $glob7
)
br $1485
)
(block $1488
(block $1487
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1487
(block $1489
global.get $glob1
local.set $loc2
global.get $glob7
global.set $glob1
local.get $loc2
global.set $glob7
)
br $1488
)
(block $1491
(block $1490
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1490
(block $1492
global.get $glob2
local.set $loc2
global.get $glob7
global.set $glob2
local.get $loc2
global.set $glob7
)
br $1491
)
(block $1494
(block $1493
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1493
(block $1495
global.get $glob3
local.set $loc2
global.get $glob7
global.set $glob3
local.get $loc2
global.set $glob7
)
br $1494
)
(block $1497
(block $1496
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1496
(block $1498
global.get $glob4
local.set $loc2
global.get $glob7
global.set $glob4
local.get $loc2
global.set $glob7
)
br $1497
)
(block $1500
(block $1499
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1499
(block $1501
global.get $glob5
local.set $loc2
global.get $glob7
global.set $glob5
local.get $loc2
global.set $glob7
)
br $1500
)
(block $1503
(block $1502
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1502
(block $1504
global.get $glob6
local.set $loc2
global.get $glob7
global.set $glob6
local.get $loc2
global.set $glob7
)
br $1503
)
(block $1506
(block $1505
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1505
(block $1507
global.get $glob7
local.set $loc2
global.get $glob7
global.set $glob7
local.get $loc2
global.set $glob7
)
br $1506
)
(block $1509
(block $1508
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1508
(block $1510
global.get $glob8
local.set $loc2
global.get $glob7
global.set $glob8
local.get $loc2
global.set $glob7
)
br $1509
)
(block $1512
(block $1511
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1511
(block $1513
global.get $glob9
local.set $loc2
global.get $glob7
global.set $glob9
local.get $loc2
global.set $glob7
)
br $1512
)
(block $1515
(block $1514
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1514
(block $1516
global.get $glob10
local.set $loc2
global.get $glob7
global.set $glob10
local.get $loc2
global.set $glob7
)
br $1515
)
(block $1518
(block $1517
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1517
(block $1519
global.get $glob11
local.set $loc2
global.get $glob7
global.set $glob11
local.get $loc2
global.set $glob7
)
br $1518
)
(block $1521
(block $1520
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1520
(block $1522
global.get $glob12
local.set $loc2
global.get $glob7
global.set $glob12
local.get $loc2
global.set $glob7
)
br $1521
)
(block $1524
(block $1523
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1523
(block $1525
global.get $glob13
local.set $loc2
global.get $glob7
global.set $glob13
local.get $loc2
global.set $glob7
)
br $1524
)
(block $1526
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1526
(block $1527
global.get $glob14
local.set $loc2
global.get $glob7
global.set $glob14
local.get $loc2
global.set $glob7
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1482
)
(block $1529
(block $1528
local.get $loc0
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1528
(block $1530
(block $1532
(block $1531
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1531
(block $1533
global.get $glob0
local.set $loc2
global.get $glob8
global.set $glob0
local.get $loc2
global.set $glob8
)
br $1532
)
(block $1535
(block $1534
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1534
(block $1536
global.get $glob1
local.set $loc2
global.get $glob8
global.set $glob1
local.get $loc2
global.set $glob8
)
br $1535
)
(block $1538
(block $1537
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1537
(block $1539
global.get $glob2
local.set $loc2
global.get $glob8
global.set $glob2
local.get $loc2
global.set $glob8
)
br $1538
)
(block $1541
(block $1540
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1540
(block $1542
global.get $glob3
local.set $loc2
global.get $glob8
global.set $glob3
local.get $loc2
global.set $glob8
)
br $1541
)
(block $1544
(block $1543
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1543
(block $1545
global.get $glob4
local.set $loc2
global.get $glob8
global.set $glob4
local.get $loc2
global.set $glob8
)
br $1544
)
(block $1547
(block $1546
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1546
(block $1548
global.get $glob5
local.set $loc2
global.get $glob8
global.set $glob5
local.get $loc2
global.set $glob8
)
br $1547
)
(block $1550
(block $1549
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1549
(block $1551
global.get $glob6
local.set $loc2
global.get $glob8
global.set $glob6
local.get $loc2
global.set $glob8
)
br $1550
)
(block $1553
(block $1552
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1552
(block $1554
global.get $glob7
local.set $loc2
global.get $glob8
global.set $glob7
local.get $loc2
global.set $glob8
)
br $1553
)
(block $1556
(block $1555
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1555
(block $1557
global.get $glob8
local.set $loc2
global.get $glob8
global.set $glob8
local.get $loc2
global.set $glob8
)
br $1556
)
(block $1559
(block $1558
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1558
(block $1560
global.get $glob9
local.set $loc2
global.get $glob8
global.set $glob9
local.get $loc2
global.set $glob8
)
br $1559
)
(block $1562
(block $1561
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1561
(block $1563
global.get $glob10
local.set $loc2
global.get $glob8
global.set $glob10
local.get $loc2
global.set $glob8
)
br $1562
)
(block $1565
(block $1564
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1564
(block $1566
global.get $glob11
local.set $loc2
global.get $glob8
global.set $glob11
local.get $loc2
global.set $glob8
)
br $1565
)
(block $1568
(block $1567
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1567
(block $1569
global.get $glob12
local.set $loc2
global.get $glob8
global.set $glob12
local.get $loc2
global.set $glob8
)
br $1568
)
(block $1571
(block $1570
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1570
(block $1572
global.get $glob13
local.set $loc2
global.get $glob8
global.set $glob13
local.get $loc2
global.set $glob8
)
br $1571
)
(block $1573
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1573
(block $1574
global.get $glob14
local.set $loc2
global.get $glob8
global.set $glob14
local.get $loc2
global.set $glob8
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1529
)
(block $1576
(block $1575
local.get $loc0
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1575
(block $1577
(block $1579
(block $1578
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1578
(block $1580
global.get $glob0
local.set $loc2
global.get $glob9
global.set $glob0
local.get $loc2
global.set $glob9
)
br $1579
)
(block $1582
(block $1581
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1581
(block $1583
global.get $glob1
local.set $loc2
global.get $glob9
global.set $glob1
local.get $loc2
global.set $glob9
)
br $1582
)
(block $1585
(block $1584
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1584
(block $1586
global.get $glob2
local.set $loc2
global.get $glob9
global.set $glob2
local.get $loc2
global.set $glob9
)
br $1585
)
(block $1588
(block $1587
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1587
(block $1589
global.get $glob3
local.set $loc2
global.get $glob9
global.set $glob3
local.get $loc2
global.set $glob9
)
br $1588
)
(block $1591
(block $1590
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1590
(block $1592
global.get $glob4
local.set $loc2
global.get $glob9
global.set $glob4
local.get $loc2
global.set $glob9
)
br $1591
)
(block $1594
(block $1593
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1593
(block $1595
global.get $glob5
local.set $loc2
global.get $glob9
global.set $glob5
local.get $loc2
global.set $glob9
)
br $1594
)
(block $1597
(block $1596
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1596
(block $1598
global.get $glob6
local.set $loc2
global.get $glob9
global.set $glob6
local.get $loc2
global.set $glob9
)
br $1597
)
(block $1600
(block $1599
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1599
(block $1601
global.get $glob7
local.set $loc2
global.get $glob9
global.set $glob7
local.get $loc2
global.set $glob9
)
br $1600
)
(block $1603
(block $1602
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1602
(block $1604
global.get $glob8
local.set $loc2
global.get $glob9
global.set $glob8
local.get $loc2
global.set $glob9
)
br $1603
)
(block $1606
(block $1605
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1605
(block $1607
global.get $glob9
local.set $loc2
global.get $glob9
global.set $glob9
local.get $loc2
global.set $glob9
)
br $1606
)
(block $1609
(block $1608
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1608
(block $1610
global.get $glob10
local.set $loc2
global.get $glob9
global.set $glob10
local.get $loc2
global.set $glob9
)
br $1609
)
(block $1612
(block $1611
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1611
(block $1613
global.get $glob11
local.set $loc2
global.get $glob9
global.set $glob11
local.get $loc2
global.set $glob9
)
br $1612
)
(block $1615
(block $1614
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1614
(block $1616
global.get $glob12
local.set $loc2
global.get $glob9
global.set $glob12
local.get $loc2
global.set $glob9
)
br $1615
)
(block $1618
(block $1617
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1617
(block $1619
global.get $glob13
local.set $loc2
global.get $glob9
global.set $glob13
local.get $loc2
global.set $glob9
)
br $1618
)
(block $1620
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1620
(block $1621
global.get $glob14
local.set $loc2
global.get $glob9
global.set $glob14
local.get $loc2
global.set $glob9
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1576
)
(block $1623
(block $1622
local.get $loc0
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1622
(block $1624
(block $1626
(block $1625
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1625
(block $1627
global.get $glob0
local.set $loc2
global.get $glob10
global.set $glob0
local.get $loc2
global.set $glob10
)
br $1626
)
(block $1629
(block $1628
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1628
(block $1630
global.get $glob1
local.set $loc2
global.get $glob10
global.set $glob1
local.get $loc2
global.set $glob10
)
br $1629
)
(block $1632
(block $1631
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1631
(block $1633
global.get $glob2
local.set $loc2
global.get $glob10
global.set $glob2
local.get $loc2
global.set $glob10
)
br $1632
)
(block $1635
(block $1634
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1634
(block $1636
global.get $glob3
local.set $loc2
global.get $glob10
global.set $glob3
local.get $loc2
global.set $glob10
)
br $1635
)
(block $1638
(block $1637
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1637
(block $1639
global.get $glob4
local.set $loc2
global.get $glob10
global.set $glob4
local.get $loc2
global.set $glob10
)
br $1638
)
(block $1641
(block $1640
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1640
(block $1642
global.get $glob5
local.set $loc2
global.get $glob10
global.set $glob5
local.get $loc2
global.set $glob10
)
br $1641
)
(block $1644
(block $1643
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1643
(block $1645
global.get $glob6
local.set $loc2
global.get $glob10
global.set $glob6
local.get $loc2
global.set $glob10
)
br $1644
)
(block $1647
(block $1646
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1646
(block $1648
global.get $glob7
local.set $loc2
global.get $glob10
global.set $glob7
local.get $loc2
global.set $glob10
)
br $1647
)
(block $1650
(block $1649
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1649
(block $1651
global.get $glob8
local.set $loc2
global.get $glob10
global.set $glob8
local.get $loc2
global.set $glob10
)
br $1650
)
(block $1653
(block $1652
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1652
(block $1654
global.get $glob9
local.set $loc2
global.get $glob10
global.set $glob9
local.get $loc2
global.set $glob10
)
br $1653
)
(block $1656
(block $1655
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1655
(block $1657
global.get $glob10
local.set $loc2
global.get $glob10
global.set $glob10
local.get $loc2
global.set $glob10
)
br $1656
)
(block $1659
(block $1658
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1658
(block $1660
global.get $glob11
local.set $loc2
global.get $glob10
global.set $glob11
local.get $loc2
global.set $glob10
)
br $1659
)
(block $1662
(block $1661
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1661
(block $1663
global.get $glob12
local.set $loc2
global.get $glob10
global.set $glob12
local.get $loc2
global.set $glob10
)
br $1662
)
(block $1665
(block $1664
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1664
(block $1666
global.get $glob13
local.set $loc2
global.get $glob10
global.set $glob13
local.get $loc2
global.set $glob10
)
br $1665
)
(block $1667
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1667
(block $1668
global.get $glob14
local.set $loc2
global.get $glob10
global.set $glob14
local.get $loc2
global.set $glob10
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1623
)
(block $1670
(block $1669
local.get $loc0
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1669
(block $1671
(block $1673
(block $1672
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1672
(block $1674
global.get $glob0
local.set $loc2
global.get $glob11
global.set $glob0
local.get $loc2
global.set $glob11
)
br $1673
)
(block $1676
(block $1675
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1675
(block $1677
global.get $glob1
local.set $loc2
global.get $glob11
global.set $glob1
local.get $loc2
global.set $glob11
)
br $1676
)
(block $1679
(block $1678
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1678
(block $1680
global.get $glob2
local.set $loc2
global.get $glob11
global.set $glob2
local.get $loc2
global.set $glob11
)
br $1679
)
(block $1682
(block $1681
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1681
(block $1683
global.get $glob3
local.set $loc2
global.get $glob11
global.set $glob3
local.get $loc2
global.set $glob11
)
br $1682
)
(block $1685
(block $1684
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1684
(block $1686
global.get $glob4
local.set $loc2
global.get $glob11
global.set $glob4
local.get $loc2
global.set $glob11
)
br $1685
)
(block $1688
(block $1687
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1687
(block $1689
global.get $glob5
local.set $loc2
global.get $glob11
global.set $glob5
local.get $loc2
global.set $glob11
)
br $1688
)
(block $1691
(block $1690
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1690
(block $1692
global.get $glob6
local.set $loc2
global.get $glob11
global.set $glob6
local.get $loc2
global.set $glob11
)
br $1691
)
(block $1694
(block $1693
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1693
(block $1695
global.get $glob7
local.set $loc2
global.get $glob11
global.set $glob7
local.get $loc2
global.set $glob11
)
br $1694
)
(block $1697
(block $1696
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1696
(block $1698
global.get $glob8
local.set $loc2
global.get $glob11
global.set $glob8
local.get $loc2
global.set $glob11
)
br $1697
)
(block $1700
(block $1699
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1699
(block $1701
global.get $glob9
local.set $loc2
global.get $glob11
global.set $glob9
local.get $loc2
global.set $glob11
)
br $1700
)
(block $1703
(block $1702
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1702
(block $1704
global.get $glob10
local.set $loc2
global.get $glob11
global.set $glob10
local.get $loc2
global.set $glob11
)
br $1703
)
(block $1706
(block $1705
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1705
(block $1707
global.get $glob11
local.set $loc2
global.get $glob11
global.set $glob11
local.get $loc2
global.set $glob11
)
br $1706
)
(block $1709
(block $1708
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1708
(block $1710
global.get $glob12
local.set $loc2
global.get $glob11
global.set $glob12
local.get $loc2
global.set $glob11
)
br $1709
)
(block $1712
(block $1711
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1711
(block $1713
global.get $glob13
local.set $loc2
global.get $glob11
global.set $glob13
local.get $loc2
global.set $glob11
)
br $1712
)
(block $1714
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1714
(block $1715
global.get $glob14
local.set $loc2
global.get $glob11
global.set $glob14
local.get $loc2
global.set $glob11
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1670
)
(block $1717
(block $1716
local.get $loc0
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1716
(block $1718
(block $1720
(block $1719
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1719
(block $1721
global.get $glob0
local.set $loc2
global.get $glob12
global.set $glob0
local.get $loc2
global.set $glob12
)
br $1720
)
(block $1723
(block $1722
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1722
(block $1724
global.get $glob1
local.set $loc2
global.get $glob12
global.set $glob1
local.get $loc2
global.set $glob12
)
br $1723
)
(block $1726
(block $1725
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1725
(block $1727
global.get $glob2
local.set $loc2
global.get $glob12
global.set $glob2
local.get $loc2
global.set $glob12
)
br $1726
)
(block $1729
(block $1728
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1728
(block $1730
global.get $glob3
local.set $loc2
global.get $glob12
global.set $glob3
local.get $loc2
global.set $glob12
)
br $1729
)
(block $1732
(block $1731
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1731
(block $1733
global.get $glob4
local.set $loc2
global.get $glob12
global.set $glob4
local.get $loc2
global.set $glob12
)
br $1732
)
(block $1735
(block $1734
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1734
(block $1736
global.get $glob5
local.set $loc2
global.get $glob12
global.set $glob5
local.get $loc2
global.set $glob12
)
br $1735
)
(block $1738
(block $1737
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1737
(block $1739
global.get $glob6
local.set $loc2
global.get $glob12
global.set $glob6
local.get $loc2
global.set $glob12
)
br $1738
)
(block $1741
(block $1740
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1740
(block $1742
global.get $glob7
local.set $loc2
global.get $glob12
global.set $glob7
local.get $loc2
global.set $glob12
)
br $1741
)
(block $1744
(block $1743
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1743
(block $1745
global.get $glob8
local.set $loc2
global.get $glob12
global.set $glob8
local.get $loc2
global.set $glob12
)
br $1744
)
(block $1747
(block $1746
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1746
(block $1748
global.get $glob9
local.set $loc2
global.get $glob12
global.set $glob9
local.get $loc2
global.set $glob12
)
br $1747
)
(block $1750
(block $1749
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1749
(block $1751
global.get $glob10
local.set $loc2
global.get $glob12
global.set $glob10
local.get $loc2
global.set $glob12
)
br $1750
)
(block $1753
(block $1752
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1752
(block $1754
global.get $glob11
local.set $loc2
global.get $glob12
global.set $glob11
local.get $loc2
global.set $glob12
)
br $1753
)
(block $1756
(block $1755
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1755
(block $1757
global.get $glob12
local.set $loc2
global.get $glob12
global.set $glob12
local.get $loc2
global.set $glob12
)
br $1756
)
(block $1759
(block $1758
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1758
(block $1760
global.get $glob13
local.set $loc2
global.get $glob12
global.set $glob13
local.get $loc2
global.set $glob12
)
br $1759
)
(block $1761
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1761
(block $1762
global.get $glob14
local.set $loc2
global.get $glob12
global.set $glob14
local.get $loc2
global.set $glob12
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $1717
)
(block $1763
local.get $loc0
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1763
(block $1764
(block $1766
(block $1765
local.get $loc3
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1765
(block $1767
global.get $glob0
local.set $loc2
global.get $glob13
global.set $glob0
local.get $loc2
global.set $glob13
)
br $1766
)
(block $1769
(block $1768
local.get $loc3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1768
(block $1770
global.get $glob1
local.set $loc2
global.get $glob13
global.set $glob1
local.get $loc2
global.set $glob13
)
br $1769
)
(block $1772
(block $1771
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1771
(block $1773
global.get $glob2
local.set $loc2
global.get $glob13
global.set $glob2
local.get $loc2
global.set $glob13
)
br $1772
)
(block $1775
(block $1774
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1774
(block $1776
global.get $glob3
local.set $loc2
global.get $glob13
global.set $glob3
local.get $loc2
global.set $glob13
)
br $1775
)
(block $1778
(block $1777
local.get $loc3
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1777
(block $1779
global.get $glob4
local.set $loc2
global.get $glob13
global.set $glob4
local.get $loc2
global.set $glob13
)
br $1778
)
(block $1781
(block $1780
local.get $loc3
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1780
(block $1782
global.get $glob5
local.set $loc2
global.get $glob13
global.set $glob5
local.get $loc2
global.set $glob13
)
br $1781
)
(block $1784
(block $1783
local.get $loc3
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1783
(block $1785
global.get $glob6
local.set $loc2
global.get $glob13
global.set $glob6
local.get $loc2
global.set $glob13
)
br $1784
)
(block $1787
(block $1786
local.get $loc3
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1786
(block $1788
global.get $glob7
local.set $loc2
global.get $glob13
global.set $glob7
local.get $loc2
global.set $glob13
)
br $1787
)
(block $1790
(block $1789
local.get $loc3
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1789
(block $1791
global.get $glob8
local.set $loc2
global.get $glob13
global.set $glob8
local.get $loc2
global.set $glob13
)
br $1790
)
(block $1793
(block $1792
local.get $loc3
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1792
(block $1794
global.get $glob9
local.set $loc2
global.get $glob13
global.set $glob9
local.get $loc2
global.set $glob13
)
br $1793
)
(block $1796
(block $1795
local.get $loc3
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1795
(block $1797
global.get $glob10
local.set $loc2
global.get $glob13
global.set $glob10
local.get $loc2
global.set $glob13
)
br $1796
)
(block $1799
(block $1798
local.get $loc3
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1798
(block $1800
global.get $glob11
local.set $loc2
global.get $glob13
global.set $glob11
local.get $loc2
global.set $glob13
)
br $1799
)
(block $1802
(block $1801
local.get $loc3
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1801
(block $1803
global.get $glob12
local.set $loc2
global.get $glob13
global.set $glob12
local.get $loc2
global.set $glob13
)
br $1802
)
(block $1805
(block $1804
local.get $loc3
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1804
(block $1806
global.get $glob13
local.set $loc2
global.get $glob13
global.set $glob13
local.get $loc2
global.set $glob13
)
br $1805
)
(block $1807
local.get $loc3
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1807
(block $1808
global.get $glob14
local.set $loc2
global.get $glob13
global.set $glob14
local.get $loc2
global.set $glob13
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
call $printarray
local.get $loc0
(i32.const 1 )
i32.add
local.set $loc0
)
br $70
)
)
)
)
)
(start $main)
(func $printarray
(local $loc4 i32)
(block $1809
(block $1810
(i32.const 0 )
local.set $loc4
(block $1811
(loop $1812
local.get $loc4
(i32.const 14 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1811
(block $1813
(block $1815
(block $1814
local.get $loc4
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1814
(block $1816
global.get $glob0
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1815
)
(block $1818
(block $1817
local.get $loc4
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1817
(block $1819
global.get $glob1
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1818
)
(block $1821
(block $1820
local.get $loc4
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1820
(block $1822
global.get $glob2
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1821
)
(block $1824
(block $1823
local.get $loc4
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1823
(block $1825
global.get $glob3
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1824
)
(block $1827
(block $1826
local.get $loc4
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1826
(block $1828
global.get $glob4
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1827
)
(block $1830
(block $1829
local.get $loc4
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1829
(block $1831
global.get $glob5
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1830
)
(block $1833
(block $1832
local.get $loc4
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1832
(block $1834
global.get $glob6
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1833
)
(block $1836
(block $1835
local.get $loc4
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1835
(block $1837
global.get $glob7
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1836
)
(block $1839
(block $1838
local.get $loc4
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1838
(block $1840
global.get $glob8
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1839
)
(block $1842
(block $1841
local.get $loc4
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1841
(block $1843
global.get $glob9
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1842
)
(block $1845
(block $1844
local.get $loc4
(i32.const 10 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1844
(block $1846
global.get $glob10
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1845
)
(block $1848
(block $1847
local.get $loc4
(i32.const 11 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1847
(block $1849
global.get $glob11
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1848
)
(block $1851
(block $1850
local.get $loc4
(i32.const 12 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1850
(block $1852
global.get $glob12
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1851
)
(block $1854
(block $1853
local.get $loc4
(i32.const 13 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1853
(block $1855
global.get $glob13
call $printi
i32.const 9
i32.const 10
call $prints
)
br $1854
)
(block $1856
local.get $loc4
(i32.const 14 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1856
(block $1857
global.get $glob14
call $printi
i32.const 9
i32.const 10
call $prints
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
local.get $loc4
(i32.const 1 )
i32.add
local.set $loc4
)
br $1812
)
)
i32.const 24
i32.const 25
call $prints
)
)
)
(func $INTERNALseed
(param $loc17 i32)
(block $1858
(block $1859
local.get $loc17
global.set $glob16
)
)
)
(func $INTERNALrandom
(result i32)
(local $ret18 i32)
(block $1860
(block $1861
(i32.const 17 )
global.get $glob16
i32.mul
(i32.const 13 )
i32.add
(i32.const 32768 )
i32.rem_s
global.set $glob16
global.get $glob16
local.set $ret18
br $1860
)
)
(local.get $ret18)
)
)
