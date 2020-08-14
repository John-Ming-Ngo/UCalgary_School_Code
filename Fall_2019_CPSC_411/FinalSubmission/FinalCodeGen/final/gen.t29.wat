(module	   (import "host" "exit" (func $halt)) 
  (import "host" "getchar" (func $getchar (result i32))) 
  (import "host" "putchar" (func $printc (param i32)))
(global $boolTemp (mut i32) (i32.const 0))
(memory $programStrings 1)
(data (i32.const 0) "\74\72\75\65")
(data (i32.const 4) "\66\61\6c\73\65")
(data (i32.const 9) "\65\76\61\6c\75\61\74\65\64\20\41\0a")
(data (i32.const 21) "\65\76\61\6c\75\61\74\65\64\20\42\0a")
(data (i32.const 33) "\65\76\61\6c\75\61\74\65\64\20\43\0a")
(data (i32.const 45) "\69\66\20\28\28\41\20\26\26\20\42\29\20\7c\7c\20\43\29\20\7b\2e\2e\2e\7d\20\65\6c\73\65\20\7b\2e\2e\2e\7d\2c\20\77\69\74\68\20\41\3d")
(data (i32.const 89) "\20\42\3d")
(data (i32.const 92) "\20\43\3d")
(data (i32.const 95) "\0a")
(data (i32.const 96) "\69\66\2d\70\61\72\74\20\65\78\65\63\75\74\65\64\0a")
(data (i32.const 113) "\65\6c\73\65\2d\70\61\72\74\20\65\78\65\63\75\74\65\64\0a")
(data (i32.const 132) "\78\20\3d\20\28\41\20\26\26\20\21\42\29\20\7c\7c\20\43\2c\20\77\69\74\68\20\41\3d")
(data (i32.const 159) "\20\42\3d")
(data (i32.const 162) "\20\43\3d")
(data (i32.const 165) "\0a")
(data (i32.const 166) "\78\3d")
(data (i32.const 168) "\0a")
(data (i32.const 169) "\0a")
(data (i32.const 170) "\0a")
(data (i32.const 171) "\0a")
(data (i32.const 172) "\0a")
(data (i32.const 173) "\0a")
(data (i32.const 174) "\0a")
(data (i32.const 175) "\0a")
(data (i32.const 176) "\0a")
(data (i32.const 177) "\0a")
(data (i32.const 178) "\0a")
(data (i32.const 179) "\0a")
(data (i32.const 180) "\0a")
(data (i32.const 181) "\0a")
(data (i32.const 182) "\0a")
(data (i32.const 183) "\0a")
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
(func $A
(result i32)
(local $ret3 i32)
(block $20
(block $21
i32.const 9
i32.const 21
call $prints
global.get $glob0
local.set $ret3
br $20
)
)
(local.get $ret3)
)
(func $B
(result i32)
(local $ret4 i32)
(block $22
(block $23
i32.const 21
i32.const 33
call $prints
global.get $glob1
local.set $ret4
br $22
)
)
(local.get $ret4)
)
(func $C
(result i32)
(local $ret5 i32)
(block $24
(block $25
i32.const 33
i32.const 45
call $prints
global.get $glob2
local.set $ret5
br $24
)
)
(local.get $ret5)
)
(func $eval
(param $loc6 i32)
(param $loc7 i32)
(param $loc8 i32)
(block $26
(block $27
local.get $loc6
global.set $glob0
local.get $loc7
global.set $glob1
local.get $loc8
global.set $glob2
i32.const 45
i32.const 89
call $prints
global.get $glob0
call $printb
i32.const 89
i32.const 92
call $prints
global.get $glob1
call $printb
i32.const 92
i32.const 95
call $prints
global.get $glob2
call $printb
i32.const 95
i32.const 96
call $prints
(block $29
(block $28
(block $30
(block $31
call $A
i32.const 0
i32.eq
i32.const 0
global.set $boolTemp
br_if $31
call $B
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $30
call $C
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $28
(block $32
i32.const 96
i32.const 113
call $prints
)
br $29
)
(block $33
i32.const 113
i32.const 132
call $prints
)
)
)
)
)
(func $assign
(param $loc9 i32)
(param $loc10 i32)
(param $loc11 i32)
(local $loc0 i32)
(block $34
(block $35
local.get $loc9
global.set $glob0
local.get $loc10
global.set $glob1
local.get $loc11
global.set $glob2
i32.const 132
i32.const 159
call $prints
global.get $glob0
call $printb
i32.const 89
i32.const 92
call $prints
global.get $glob1
call $printb
i32.const 92
i32.const 95
call $prints
global.get $glob2
call $printb
i32.const 95
i32.const 96
call $prints
(block $36
(block $37
call $A
i32.const 0
i32.eq
i32.const 0
global.set $boolTemp
br_if $37
call $B
i32.const 1
i32.add
i32.const 2
i32.rem_s
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $36
call $C
global.set $boolTemp
)
global.get $boolTemp
local.set $loc0
i32.const 166
i32.const 168
call $prints
local.get $loc0
call $printb
i32.const 95
i32.const 96
call $prints
)
)
)
(func $main
(block $38
(block $39
(i32.const 0)
(i32.const 0)
(i32.const 0)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 0)
(i32.const 0)
(i32.const 1)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 0)
(i32.const 1)
(i32.const 0)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 0)
(i32.const 1)
(i32.const 1)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 0)
(i32.const 0)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 0)
(i32.const 1)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 1)
(i32.const 0)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 1)
(i32.const 1)
call $eval
i32.const 95
i32.const 96
call $prints
(i32.const 0)
(i32.const 0)
(i32.const 0)
call $assign
i32.const 95
i32.const 96
call $prints
(i32.const 0)
(i32.const 0)
(i32.const 1)
call $assign
i32.const 95
i32.const 96
call $prints
(i32.const 0)
(i32.const 1)
(i32.const 0)
call $assign
i32.const 95
i32.const 96
call $prints
(i32.const 0)
(i32.const 1)
(i32.const 1)
call $assign
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 0)
(i32.const 0)
call $assign
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 0)
(i32.const 1)
call $assign
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 1)
(i32.const 0)
call $assign
i32.const 95
i32.const 96
call $prints
(i32.const 1)
(i32.const 1)
(i32.const 1)
call $assign
)
)
)
(start $main)
)
