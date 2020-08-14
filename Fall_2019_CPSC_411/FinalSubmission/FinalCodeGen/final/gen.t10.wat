(module	   (import "host" "exit" (func $halt)) 
  (import "host" "getchar" (func $getchar (result i32))) 
  (import "host" "putchar" (func $printc (param i32)))
(global $boolTemp (mut i32) (i32.const 0))
(memory $programStrings 1)
(data (i32.const 0) "\74\72\75\65")
(data (i32.const 4) "\66\61\6c\73\65")
(data (i32.const 9) "\66\69\62\28")
(data (i32.const 13) "\29\20\3d\20")
(data (i32.const 17) "\0a")
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
(func $main
(local $loc0 i32)
(block $20
(block $21
(i32.const 0 )
local.set $loc0
(block $22
(loop $23
local.get $loc0
(i32.const 46 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $22
(block $24
i32.const 9
i32.const 13
call $prints
local.get $loc0
call $printi
i32.const 13
i32.const 17
call $prints
local.get $loc0
call $fib
call $printi
i32.const 17
i32.const 18
call $prints
local.get $loc0
(i32.const 1 )
i32.add
local.set $loc0
)
br $23
)
)
)
)
)
(start $main)
(func $fib
(param $loc0 i32)
(result i32)
(local $ret1 i32)
(block $25
(block $26
(block $27
local.get $loc0
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $27
(i32.const 0 )
local.set $ret1
br $25
)
(block $28
local.get $loc0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $28
(i32.const 1 )
local.set $ret1
br $25
)
local.get $loc0
(i32.const 1 )
i32.sub
call $fib
local.get $loc0
(i32.const 2 )
i32.sub
call $fib
i32.add
local.set $ret1
br $25
)
)
(local.get $ret1)
)
)
