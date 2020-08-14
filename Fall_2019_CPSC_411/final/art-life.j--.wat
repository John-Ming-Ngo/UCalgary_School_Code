(module	   (import "host" "exit" (func $halt)) 
  (import "host" "getchar" (func $getchar (result i32))) 
  (import "host" "putchar" (func $printc (param i32)))
(global $boolTemp (mut i32) (i32.const 0))
(memory $programStrings 1)
(data (i32.const 0) "\74\72\75\65")
(data (i32.const 4) "\66\61\6c\73\65")
(data (i32.const 9) "\47\65\6e\65\72\61\74\69\6f\6e\20")
(data (i32.const 20) "\3a\0a")
(data (i32.const 22) "\20")
(data (i32.const 23) "\20")
(data (i32.const 24) "\20")
(data (i32.const 25) "\20")
(data (i32.const 26) "\20")
(data (i32.const 27) "\20")
(data (i32.const 28) "\20")
(data (i32.const 29) "\20")
(data (i32.const 30) "\20")
(data (i32.const 31) "\20")
(data (i32.const 32) "\20")
(data (i32.const 33) "\20")
(data (i32.const 34) "\20")
(data (i32.const 35) "\20")
(data (i32.const 36) "\20")
(data (i32.const 37) "\20")
(data (i32.const 38) "\20")
(data (i32.const 39) "\20")
(data (i32.const 40) "\20")
(data (i32.const 41) "\20")
(data (i32.const 42) "\20")
(data (i32.const 43) "\20")
(data (i32.const 44) "\20")
(data (i32.const 45) "\20")
(data (i32.const 46) "\20")
(data (i32.const 47) "\20")
(data (i32.const 48) "\20")
(data (i32.const 49) "\20")
(data (i32.const 50) "\20")
(data (i32.const 51) "\20")
(data (i32.const 52) "\20")
(data (i32.const 53) "\20")
(data (i32.const 54) "\20")
(data (i32.const 55) "\20")
(data (i32.const 56) "\20")
(data (i32.const 57) "\20")
(data (i32.const 58) "\20")
(data (i32.const 59) "\20")
(data (i32.const 60) "\20")
(data (i32.const 61) "\20")
(data (i32.const 62) "\20")
(data (i32.const 63) "\20")
(data (i32.const 64) "\20")
(data (i32.const 65) "\20")
(data (i32.const 66) "\20")
(data (i32.const 67) "\20")
(data (i32.const 68) "\20")
(data (i32.const 69) "\20")
(data (i32.const 70) "\20")
(data (i32.const 71) "\20")
(data (i32.const 72) "\20")
(data (i32.const 73) "\20")
(data (i32.const 74) "\20")
(data (i32.const 75) "\20")
(data (i32.const 76) "\20")
(data (i32.const 77) "\20")
(data (i32.const 78) "\20")
(data (i32.const 79) "\20")
(data (i32.const 80) "\20")
(data (i32.const 81) "\20")
(data (i32.const 82) "\20")
(data (i32.const 83) "\20")
(data (i32.const 84) "\20")
(data (i32.const 85) "\20")
(data (i32.const 86) "\20")
(data (i32.const 87) "\20")
(data (i32.const 88) "\20")
(data (i32.const 89) "\20")
(data (i32.const 90) "\20")
(data (i32.const 91) "\20")
(data (i32.const 92) "\20")
(data (i32.const 93) "\20")
(data (i32.const 94) "\20")
(data (i32.const 95) "\20")
(data (i32.const 96) "\20")
(data (i32.const 97) "\20")
(data (i32.const 98) "\20")
(data (i32.const 99) "\20")
(data (i32.const 100) "\20")
(data (i32.const 101) "\20")
(data (i32.const 102) "\20")
(data (i32.const 103) "\20")
(data (i32.const 104) "\20")
(data (i32.const 105) "\20")
(data (i32.const 106) "\20")
(data (i32.const 107) "\20")
(data (i32.const 108) "\20")
(data (i32.const 109) "\20")
(data (i32.const 110) "\20")
(data (i32.const 111) "\20")
(data (i32.const 112) "\20")
(data (i32.const 113) "\20")
(data (i32.const 114) "\20")
(data (i32.const 115) "\20")
(data (i32.const 116) "\20")
(data (i32.const 117) "\20")
(data (i32.const 118) "\20")
(data (i32.const 119) "\20")
(data (i32.const 120) "\20")
(data (i32.const 121) "\20")
(data (i32.const 122) "\0a")
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
(global $glob103 (mut i32) (i32.const 0))
(global $glob104 (mut i32) (i32.const 0))
(global $glob105 (mut i32) (i32.const 0))
(global $glob106 (mut i32) (i32.const 0))
(global $glob107 (mut i32) (i32.const 0))
(global $glob108 (mut i32) (i32.const 0))
(global $glob109 (mut i32) (i32.const 0))
(global $glob110 (mut i32) (i32.const 0))
(global $glob111 (mut i32) (i32.const 0))
(global $glob112 (mut i32) (i32.const 0))
(global $glob113 (mut i32) (i32.const 0))
(global $glob114 (mut i32) (i32.const 0))
(global $glob115 (mut i32) (i32.const 0))
(global $glob116 (mut i32) (i32.const 0))
(global $glob117 (mut i32) (i32.const 0))
(global $glob118 (mut i32) (i32.const 0))
(global $glob119 (mut i32) (i32.const 0))
(global $glob120 (mut i32) (i32.const 0))
(global $glob121 (mut i32) (i32.const 0))
(global $glob122 (mut i32) (i32.const 0))
(global $glob123 (mut i32) (i32.const 0))
(global $glob124 (mut i32) (i32.const 0))
(global $glob125 (mut i32) (i32.const 0))
(global $glob126 (mut i32) (i32.const 0))
(global $glob127 (mut i32) (i32.const 0))
(global $glob128 (mut i32) (i32.const 0))
(global $glob129 (mut i32) (i32.const 0))
(global $glob130 (mut i32) (i32.const 0))
(global $glob131 (mut i32) (i32.const 0))
(global $glob132 (mut i32) (i32.const 0))
(global $glob133 (mut i32) (i32.const 0))
(global $glob134 (mut i32) (i32.const 0))
(global $glob135 (mut i32) (i32.const 0))
(global $glob136 (mut i32) (i32.const 0))
(global $glob137 (mut i32) (i32.const 0))
(global $glob138 (mut i32) (i32.const 0))
(global $glob139 (mut i32) (i32.const 0))
(global $glob140 (mut i32) (i32.const 0))
(global $glob141 (mut i32) (i32.const 0))
(global $glob142 (mut i32) (i32.const 0))
(global $glob143 (mut i32) (i32.const 0))
(global $glob144 (mut i32) (i32.const 0))
(global $glob145 (mut i32) (i32.const 0))
(global $glob146 (mut i32) (i32.const 0))
(global $glob147 (mut i32) (i32.const 0))
(global $glob148 (mut i32) (i32.const 0))
(global $glob149 (mut i32) (i32.const 0))
(global $glob150 (mut i32) (i32.const 0))
(global $glob151 (mut i32) (i32.const 0))
(global $glob152 (mut i32) (i32.const 0))
(global $glob153 (mut i32) (i32.const 0))
(global $glob154 (mut i32) (i32.const 0))
(global $glob155 (mut i32) (i32.const 0))
(global $glob156 (mut i32) (i32.const 0))
(global $glob157 (mut i32) (i32.const 0))
(global $glob158 (mut i32) (i32.const 0))
(global $glob159 (mut i32) (i32.const 0))
(global $glob160 (mut i32) (i32.const 0))
(global $glob161 (mut i32) (i32.const 0))
(global $glob162 (mut i32) (i32.const 0))
(global $glob163 (mut i32) (i32.const 0))
(global $glob164 (mut i32) (i32.const 0))
(global $glob165 (mut i32) (i32.const 0))
(global $glob166 (mut i32) (i32.const 0))
(global $glob167 (mut i32) (i32.const 0))
(global $glob168 (mut i32) (i32.const 0))
(global $glob169 (mut i32) (i32.const 0))
(global $glob170 (mut i32) (i32.const 0))
(global $glob171 (mut i32) (i32.const 0))
(global $glob172 (mut i32) (i32.const 0))
(global $glob173 (mut i32) (i32.const 0))
(global $glob174 (mut i32) (i32.const 0))
(global $glob175 (mut i32) (i32.const 0))
(global $glob176 (mut i32) (i32.const 0))
(global $glob177 (mut i32) (i32.const 0))
(global $glob178 (mut i32) (i32.const 0))
(global $glob179 (mut i32) (i32.const 0))
(global $glob180 (mut i32) (i32.const 0))
(global $glob181 (mut i32) (i32.const 0))
(global $glob182 (mut i32) (i32.const 0))
(global $glob183 (mut i32) (i32.const 0))
(global $glob184 (mut i32) (i32.const 0))
(global $glob185 (mut i32) (i32.const 0))
(global $glob186 (mut i32) (i32.const 0))
(global $glob187 (mut i32) (i32.const 0))
(global $glob188 (mut i32) (i32.const 0))
(global $glob189 (mut i32) (i32.const 0))
(global $glob190 (mut i32) (i32.const 0))
(global $glob191 (mut i32) (i32.const 0))
(global $glob192 (mut i32) (i32.const 0))
(global $glob193 (mut i32) (i32.const 0))
(global $glob194 (mut i32) (i32.const 0))
(global $glob195 (mut i32) (i32.const 0))
(global $glob196 (mut i32) (i32.const 0))
(global $glob197 (mut i32) (i32.const 0))
(global $glob198 (mut i32) (i32.const 0))
(global $glob199 (mut i32) (i32.const 0))
(global $glob200 (mut i32) (i32.const 0))
(global $glob201 (mut i32) (i32.const 0))
(func $main
(local $loc0 i32)
(local $loc1 i32)
(local $loc2 i32)
(local $loc3 i32)
(block $20
(block $21
(i32.const 123 )
call $INTERNALseed
(i32.const 0 )
local.set $loc0
(block $22
(loop $23
local.get $loc0
(i32.const 9 )
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
(i32.const 0 )
local.set $loc1
(block $28
(loop $29
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $28
(block $30
(block $32
(block $31
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $31
(block $33
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob0
)
br $32
)
(block $35
(block $34
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $34
(block $36
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob1
)
br $35
)
(block $38
(block $37
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $37
(block $39
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob2
)
br $38
)
(block $41
(block $40
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $40
(block $42
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob3
)
br $41
)
(block $44
(block $43
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $43
(block $45
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob4
)
br $44
)
(block $47
(block $46
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $46
(block $48
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob5
)
br $47
)
(block $50
(block $49
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $49
(block $51
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob6
)
br $50
)
(block $53
(block $52
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $52
(block $54
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob7
)
br $53
)
(block $56
(block $55
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $55
(block $57
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob8
)
br $56
)
(block $58
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $58
(block $59
call $morerandom
(i32.const 2 )
i32.rem_s
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
local.get $loc1
(i32.const 1 )
i32.add
local.set $loc1
)
br $29
)
)
)
br $26
)
(block $61
(block $60
local.get $loc0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $60
(block $62
(i32.const 0 )
local.set $loc1
(block $63
(loop $64
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $63
(block $65
(block $67
(block $66
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $66
(block $68
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob10
)
br $67
)
(block $70
(block $69
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $69
(block $71
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob11
)
br $70
)
(block $73
(block $72
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $72
(block $74
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob12
)
br $73
)
(block $76
(block $75
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $75
(block $77
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob13
)
br $76
)
(block $79
(block $78
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $78
(block $80
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob14
)
br $79
)
(block $82
(block $81
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $81
(block $83
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob15
)
br $82
)
(block $85
(block $84
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $84
(block $86
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob16
)
br $85
)
(block $88
(block $87
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $87
(block $89
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob17
)
br $88
)
(block $91
(block $90
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $90
(block $92
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob18
)
br $91
)
(block $93
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $93
(block $94
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob19
)
)
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
br $64
)
)
)
br $61
)
(block $96
(block $95
local.get $loc0
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $95
(block $97
(i32.const 0 )
local.set $loc1
(block $98
(loop $99
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $98
(block $100
(block $102
(block $101
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $101
(block $103
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob20
)
br $102
)
(block $105
(block $104
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $104
(block $106
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob21
)
br $105
)
(block $108
(block $107
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $107
(block $109
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob22
)
br $108
)
(block $111
(block $110
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $110
(block $112
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob23
)
br $111
)
(block $114
(block $113
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $113
(block $115
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob24
)
br $114
)
(block $117
(block $116
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $116
(block $118
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob25
)
br $117
)
(block $120
(block $119
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $119
(block $121
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob26
)
br $120
)
(block $123
(block $122
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $122
(block $124
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob27
)
br $123
)
(block $126
(block $125
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $125
(block $127
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob28
)
br $126
)
(block $128
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $128
(block $129
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob29
)
)
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
br $99
)
)
)
br $96
)
(block $131
(block $130
local.get $loc0
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $130
(block $132
(i32.const 0 )
local.set $loc1
(block $133
(loop $134
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $133
(block $135
(block $137
(block $136
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $136
(block $138
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob30
)
br $137
)
(block $140
(block $139
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $139
(block $141
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob31
)
br $140
)
(block $143
(block $142
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $142
(block $144
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob32
)
br $143
)
(block $146
(block $145
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $145
(block $147
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob33
)
br $146
)
(block $149
(block $148
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $148
(block $150
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob34
)
br $149
)
(block $152
(block $151
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $151
(block $153
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob35
)
br $152
)
(block $155
(block $154
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $154
(block $156
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob36
)
br $155
)
(block $158
(block $157
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $157
(block $159
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob37
)
br $158
)
(block $161
(block $160
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $160
(block $162
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob38
)
br $161
)
(block $163
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $163
(block $164
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob39
)
)
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
br $134
)
)
)
br $131
)
(block $166
(block $165
local.get $loc0
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $165
(block $167
(i32.const 0 )
local.set $loc1
(block $168
(loop $169
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $168
(block $170
(block $172
(block $171
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $171
(block $173
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob40
)
br $172
)
(block $175
(block $174
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $174
(block $176
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob41
)
br $175
)
(block $178
(block $177
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $177
(block $179
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob42
)
br $178
)
(block $181
(block $180
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $180
(block $182
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob43
)
br $181
)
(block $184
(block $183
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $183
(block $185
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob44
)
br $184
)
(block $187
(block $186
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $186
(block $188
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob45
)
br $187
)
(block $190
(block $189
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $189
(block $191
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob46
)
br $190
)
(block $193
(block $192
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $192
(block $194
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob47
)
br $193
)
(block $196
(block $195
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $195
(block $197
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob48
)
br $196
)
(block $198
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $198
(block $199
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob49
)
)
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
br $169
)
)
)
br $166
)
(block $201
(block $200
local.get $loc0
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $200
(block $202
(i32.const 0 )
local.set $loc1
(block $203
(loop $204
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $203
(block $205
(block $207
(block $206
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $206
(block $208
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob50
)
br $207
)
(block $210
(block $209
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $209
(block $211
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob51
)
br $210
)
(block $213
(block $212
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $212
(block $214
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob52
)
br $213
)
(block $216
(block $215
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $215
(block $217
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob53
)
br $216
)
(block $219
(block $218
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $218
(block $220
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob54
)
br $219
)
(block $222
(block $221
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $221
(block $223
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob55
)
br $222
)
(block $225
(block $224
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $224
(block $226
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob56
)
br $225
)
(block $228
(block $227
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $227
(block $229
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob57
)
br $228
)
(block $231
(block $230
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $230
(block $232
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob58
)
br $231
)
(block $233
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $233
(block $234
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob59
)
)
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
br $204
)
)
)
br $201
)
(block $236
(block $235
local.get $loc0
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $235
(block $237
(i32.const 0 )
local.set $loc1
(block $238
(loop $239
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $238
(block $240
(block $242
(block $241
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $241
(block $243
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob60
)
br $242
)
(block $245
(block $244
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $244
(block $246
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob61
)
br $245
)
(block $248
(block $247
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $247
(block $249
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob62
)
br $248
)
(block $251
(block $250
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $250
(block $252
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob63
)
br $251
)
(block $254
(block $253
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $253
(block $255
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob64
)
br $254
)
(block $257
(block $256
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $256
(block $258
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob65
)
br $257
)
(block $260
(block $259
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $259
(block $261
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob66
)
br $260
)
(block $263
(block $262
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $262
(block $264
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob67
)
br $263
)
(block $266
(block $265
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $265
(block $267
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob68
)
br $266
)
(block $268
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $268
(block $269
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob69
)
)
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
br $239
)
)
)
br $236
)
(block $271
(block $270
local.get $loc0
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $270
(block $272
(i32.const 0 )
local.set $loc1
(block $273
(loop $274
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $273
(block $275
(block $277
(block $276
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $276
(block $278
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob70
)
br $277
)
(block $280
(block $279
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $279
(block $281
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob71
)
br $280
)
(block $283
(block $282
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $282
(block $284
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob72
)
br $283
)
(block $286
(block $285
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $285
(block $287
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob73
)
br $286
)
(block $289
(block $288
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $288
(block $290
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob74
)
br $289
)
(block $292
(block $291
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $291
(block $293
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob75
)
br $292
)
(block $295
(block $294
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $294
(block $296
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob76
)
br $295
)
(block $298
(block $297
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $297
(block $299
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob77
)
br $298
)
(block $301
(block $300
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $300
(block $302
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob78
)
br $301
)
(block $303
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $303
(block $304
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob79
)
)
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
br $274
)
)
)
br $271
)
(block $306
(block $305
local.get $loc0
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $305
(block $307
(i32.const 0 )
local.set $loc1
(block $308
(loop $309
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $308
(block $310
(block $312
(block $311
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $311
(block $313
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob80
)
br $312
)
(block $315
(block $314
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $314
(block $316
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob81
)
br $315
)
(block $318
(block $317
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $317
(block $319
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob82
)
br $318
)
(block $321
(block $320
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $320
(block $322
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob83
)
br $321
)
(block $324
(block $323
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $323
(block $325
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob84
)
br $324
)
(block $327
(block $326
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $326
(block $328
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob85
)
br $327
)
(block $330
(block $329
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $329
(block $331
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob86
)
br $330
)
(block $333
(block $332
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $332
(block $334
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob87
)
br $333
)
(block $336
(block $335
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $335
(block $337
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob88
)
br $336
)
(block $338
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $338
(block $339
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob89
)
)
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
br $309
)
)
)
br $306
)
(block $340
local.get $loc0
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $340
(block $341
(i32.const 0 )
local.set $loc1
(block $342
(loop $343
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $342
(block $344
(block $346
(block $345
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $345
(block $347
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob90
)
br $346
)
(block $349
(block $348
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $348
(block $350
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob91
)
br $349
)
(block $352
(block $351
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $351
(block $353
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob92
)
br $352
)
(block $355
(block $354
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $354
(block $356
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob93
)
br $355
)
(block $358
(block $357
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $357
(block $359
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob94
)
br $358
)
(block $361
(block $360
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $360
(block $362
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob95
)
br $361
)
(block $364
(block $363
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $363
(block $365
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob96
)
br $364
)
(block $367
(block $366
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $366
(block $368
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob97
)
br $367
)
(block $370
(block $369
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $369
(block $371
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob98
)
br $370
)
(block $372
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $372
(block $373
call $morerandom
(i32.const 2 )
i32.rem_s
global.set $glob99
)
)
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
br $343
)
)
)
)
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
(i32.const 1 )
local.set $loc2
(block $374
(loop $375
local.get $loc2
(i32.const 10 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $374
(block $376
(i32.const 0 )
local.set $loc0
(block $377
(loop $378
local.get $loc0
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $377
(block $379
(block $381
(block $380
local.get $loc0
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $380
(block $382
(i32.const 0 )
local.set $loc1
(block $383
(loop $384
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $383
(block $385
(block $387
(block $386
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $386
(block $388
(i32.const 0 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $390
(block $389
global.get $glob0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $389
(block $391
(block $393
(block $392
(block $394
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $394
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $392
(block $395
(i32.const 1 )
global.set $glob101
)
br $393
)
(block $396
(i32.const 0 )
global.set $glob101
)
)
)
br $390
)
(block $397
(block $399
(block $398
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $398
(block $400
(i32.const 1 )
global.set $glob101
)
br $399
)
(block $401
(i32.const 0 )
global.set $glob101
)
)
)
)
)
br $387
)
(block $403
(block $402
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $402
(block $404
(i32.const 0 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $406
(block $405
global.get $glob1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $405
(block $407
(block $409
(block $408
(block $410
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $410
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $408
(block $411
(i32.const 1 )
global.set $glob102
)
br $409
)
(block $412
(i32.const 0 )
global.set $glob102
)
)
)
br $406
)
(block $413
(block $415
(block $414
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $414
(block $416
(i32.const 1 )
global.set $glob102
)
br $415
)
(block $417
(i32.const 0 )
global.set $glob102
)
)
)
)
)
br $403
)
(block $419
(block $418
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $418
(block $420
(i32.const 0 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $422
(block $421
global.get $glob2
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $421
(block $423
(block $425
(block $424
(block $426
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $426
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $424
(block $427
(i32.const 1 )
global.set $glob103
)
br $425
)
(block $428
(i32.const 0 )
global.set $glob103
)
)
)
br $422
)
(block $429
(block $431
(block $430
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $430
(block $432
(i32.const 1 )
global.set $glob103
)
br $431
)
(block $433
(i32.const 0 )
global.set $glob103
)
)
)
)
)
br $419
)
(block $435
(block $434
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $434
(block $436
(i32.const 0 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $438
(block $437
global.get $glob3
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $437
(block $439
(block $441
(block $440
(block $442
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $442
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $440
(block $443
(i32.const 1 )
global.set $glob104
)
br $441
)
(block $444
(i32.const 0 )
global.set $glob104
)
)
)
br $438
)
(block $445
(block $447
(block $446
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $446
(block $448
(i32.const 1 )
global.set $glob104
)
br $447
)
(block $449
(i32.const 0 )
global.set $glob104
)
)
)
)
)
br $435
)
(block $451
(block $450
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $450
(block $452
(i32.const 0 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $454
(block $453
global.get $glob4
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $453
(block $455
(block $457
(block $456
(block $458
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $458
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $456
(block $459
(i32.const 1 )
global.set $glob105
)
br $457
)
(block $460
(i32.const 0 )
global.set $glob105
)
)
)
br $454
)
(block $461
(block $463
(block $462
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $462
(block $464
(i32.const 1 )
global.set $glob105
)
br $463
)
(block $465
(i32.const 0 )
global.set $glob105
)
)
)
)
)
br $451
)
(block $467
(block $466
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $466
(block $468
(i32.const 0 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $470
(block $469
global.get $glob5
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $469
(block $471
(block $473
(block $472
(block $474
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $474
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $472
(block $475
(i32.const 1 )
global.set $glob106
)
br $473
)
(block $476
(i32.const 0 )
global.set $glob106
)
)
)
br $470
)
(block $477
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
(i32.const 1 )
global.set $glob106
)
br $479
)
(block $481
(i32.const 0 )
global.set $glob106
)
)
)
)
)
br $467
)
(block $483
(block $482
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $482
(block $484
(i32.const 0 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $486
(block $485
global.get $glob6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $485
(block $487
(block $489
(block $488
(block $490
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $490
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $488
(block $491
(i32.const 1 )
global.set $glob107
)
br $489
)
(block $492
(i32.const 0 )
global.set $glob107
)
)
)
br $486
)
(block $493
(block $495
(block $494
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $494
(block $496
(i32.const 1 )
global.set $glob107
)
br $495
)
(block $497
(i32.const 0 )
global.set $glob107
)
)
)
)
)
br $483
)
(block $499
(block $498
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $498
(block $500
(i32.const 0 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $502
(block $501
global.get $glob7
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $501
(block $503
(block $505
(block $504
(block $506
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $506
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $504
(block $507
(i32.const 1 )
global.set $glob108
)
br $505
)
(block $508
(i32.const 0 )
global.set $glob108
)
)
)
br $502
)
(block $509
(block $511
(block $510
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $510
(block $512
(i32.const 1 )
global.set $glob108
)
br $511
)
(block $513
(i32.const 0 )
global.set $glob108
)
)
)
)
)
br $499
)
(block $515
(block $514
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $514
(block $516
(i32.const 0 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $518
(block $517
global.get $glob8
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $517
(block $519
(block $521
(block $520
(block $522
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $522
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $520
(block $523
(i32.const 1 )
global.set $glob109
)
br $521
)
(block $524
(i32.const 0 )
global.set $glob109
)
)
)
br $518
)
(block $525
(block $527
(block $526
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $526
(block $528
(i32.const 1 )
global.set $glob109
)
br $527
)
(block $529
(i32.const 0 )
global.set $glob109
)
)
)
)
)
br $515
)
(block $530
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $530
(block $531
(i32.const 0 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $533
(block $532
global.get $glob9
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $532
(block $534
(block $536
(block $535
(block $537
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $537
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $535
(block $538
(i32.const 1 )
global.set $glob110
)
br $536
)
(block $539
(i32.const 0 )
global.set $glob110
)
)
)
br $533
)
(block $540
(block $542
(block $541
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $541
(block $543
(i32.const 1 )
global.set $glob110
)
br $542
)
(block $544
(i32.const 0 )
global.set $glob110
)
)
)
)
)
)
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
br $384
)
)
)
br $381
)
(block $546
(block $545
local.get $loc0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $545
(block $547
(i32.const 0 )
local.set $loc1
(block $548
(loop $549
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $548
(block $550
(block $552
(block $551
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $551
(block $553
(i32.const 1 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $555
(block $554
global.get $glob10
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $554
(block $556
(block $558
(block $557
(block $559
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $559
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $557
(block $560
(i32.const 1 )
global.set $glob111
)
br $558
)
(block $561
(i32.const 0 )
global.set $glob111
)
)
)
br $555
)
(block $562
(block $564
(block $563
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $563
(block $565
(i32.const 1 )
global.set $glob111
)
br $564
)
(block $566
(i32.const 0 )
global.set $glob111
)
)
)
)
)
br $552
)
(block $568
(block $567
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $567
(block $569
(i32.const 1 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $571
(block $570
global.get $glob11
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $570
(block $572
(block $574
(block $573
(block $575
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $575
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $573
(block $576
(i32.const 1 )
global.set $glob112
)
br $574
)
(block $577
(i32.const 0 )
global.set $glob112
)
)
)
br $571
)
(block $578
(block $580
(block $579
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $579
(block $581
(i32.const 1 )
global.set $glob112
)
br $580
)
(block $582
(i32.const 0 )
global.set $glob112
)
)
)
)
)
br $568
)
(block $584
(block $583
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $583
(block $585
(i32.const 1 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $587
(block $586
global.get $glob12
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $586
(block $588
(block $590
(block $589
(block $591
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $591
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $589
(block $592
(i32.const 1 )
global.set $glob113
)
br $590
)
(block $593
(i32.const 0 )
global.set $glob113
)
)
)
br $587
)
(block $594
(block $596
(block $595
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $595
(block $597
(i32.const 1 )
global.set $glob113
)
br $596
)
(block $598
(i32.const 0 )
global.set $glob113
)
)
)
)
)
br $584
)
(block $600
(block $599
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $599
(block $601
(i32.const 1 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $603
(block $602
global.get $glob13
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $602
(block $604
(block $606
(block $605
(block $607
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $607
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $605
(block $608
(i32.const 1 )
global.set $glob114
)
br $606
)
(block $609
(i32.const 0 )
global.set $glob114
)
)
)
br $603
)
(block $610
(block $612
(block $611
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $611
(block $613
(i32.const 1 )
global.set $glob114
)
br $612
)
(block $614
(i32.const 0 )
global.set $glob114
)
)
)
)
)
br $600
)
(block $616
(block $615
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $615
(block $617
(i32.const 1 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $619
(block $618
global.get $glob14
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $618
(block $620
(block $622
(block $621
(block $623
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $623
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $621
(block $624
(i32.const 1 )
global.set $glob115
)
br $622
)
(block $625
(i32.const 0 )
global.set $glob115
)
)
)
br $619
)
(block $626
(block $628
(block $627
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $627
(block $629
(i32.const 1 )
global.set $glob115
)
br $628
)
(block $630
(i32.const 0 )
global.set $glob115
)
)
)
)
)
br $616
)
(block $632
(block $631
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $631
(block $633
(i32.const 1 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $635
(block $634
global.get $glob15
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $634
(block $636
(block $638
(block $637
(block $639
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $639
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $637
(block $640
(i32.const 1 )
global.set $glob116
)
br $638
)
(block $641
(i32.const 0 )
global.set $glob116
)
)
)
br $635
)
(block $642
(block $644
(block $643
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $643
(block $645
(i32.const 1 )
global.set $glob116
)
br $644
)
(block $646
(i32.const 0 )
global.set $glob116
)
)
)
)
)
br $632
)
(block $648
(block $647
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $647
(block $649
(i32.const 1 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $651
(block $650
global.get $glob16
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $650
(block $652
(block $654
(block $653
(block $655
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $655
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $653
(block $656
(i32.const 1 )
global.set $glob117
)
br $654
)
(block $657
(i32.const 0 )
global.set $glob117
)
)
)
br $651
)
(block $658
(block $660
(block $659
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $659
(block $661
(i32.const 1 )
global.set $glob117
)
br $660
)
(block $662
(i32.const 0 )
global.set $glob117
)
)
)
)
)
br $648
)
(block $664
(block $663
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $663
(block $665
(i32.const 1 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $667
(block $666
global.get $glob17
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $666
(block $668
(block $670
(block $669
(block $671
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $671
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $669
(block $672
(i32.const 1 )
global.set $glob118
)
br $670
)
(block $673
(i32.const 0 )
global.set $glob118
)
)
)
br $667
)
(block $674
(block $676
(block $675
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $675
(block $677
(i32.const 1 )
global.set $glob118
)
br $676
)
(block $678
(i32.const 0 )
global.set $glob118
)
)
)
)
)
br $664
)
(block $680
(block $679
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $679
(block $681
(i32.const 1 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $683
(block $682
global.get $glob18
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $682
(block $684
(block $686
(block $685
(block $687
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $687
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $685
(block $688
(i32.const 1 )
global.set $glob119
)
br $686
)
(block $689
(i32.const 0 )
global.set $glob119
)
)
)
br $683
)
(block $690
(block $692
(block $691
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $691
(block $693
(i32.const 1 )
global.set $glob119
)
br $692
)
(block $694
(i32.const 0 )
global.set $glob119
)
)
)
)
)
br $680
)
(block $695
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $695
(block $696
(i32.const 1 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $698
(block $697
global.get $glob19
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $697
(block $699
(block $701
(block $700
(block $702
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $702
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $700
(block $703
(i32.const 1 )
global.set $glob120
)
br $701
)
(block $704
(i32.const 0 )
global.set $glob120
)
)
)
br $698
)
(block $705
(block $707
(block $706
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $706
(block $708
(i32.const 1 )
global.set $glob120
)
br $707
)
(block $709
(i32.const 0 )
global.set $glob120
)
)
)
)
)
)
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
br $549
)
)
)
br $546
)
(block $711
(block $710
local.get $loc0
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $710
(block $712
(i32.const 0 )
local.set $loc1
(block $713
(loop $714
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $713
(block $715
(block $717
(block $716
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $716
(block $718
(i32.const 2 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $720
(block $719
global.get $glob20
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $719
(block $721
(block $723
(block $722
(block $724
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $724
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $722
(block $725
(i32.const 1 )
global.set $glob121
)
br $723
)
(block $726
(i32.const 0 )
global.set $glob121
)
)
)
br $720
)
(block $727
(block $729
(block $728
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $728
(block $730
(i32.const 1 )
global.set $glob121
)
br $729
)
(block $731
(i32.const 0 )
global.set $glob121
)
)
)
)
)
br $717
)
(block $733
(block $732
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $732
(block $734
(i32.const 2 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $736
(block $735
global.get $glob21
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $735
(block $737
(block $739
(block $738
(block $740
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $740
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $738
(block $741
(i32.const 1 )
global.set $glob122
)
br $739
)
(block $742
(i32.const 0 )
global.set $glob122
)
)
)
br $736
)
(block $743
(block $745
(block $744
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $744
(block $746
(i32.const 1 )
global.set $glob122
)
br $745
)
(block $747
(i32.const 0 )
global.set $glob122
)
)
)
)
)
br $733
)
(block $749
(block $748
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $748
(block $750
(i32.const 2 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $752
(block $751
global.get $glob22
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $751
(block $753
(block $755
(block $754
(block $756
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $756
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $754
(block $757
(i32.const 1 )
global.set $glob123
)
br $755
)
(block $758
(i32.const 0 )
global.set $glob123
)
)
)
br $752
)
(block $759
(block $761
(block $760
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $760
(block $762
(i32.const 1 )
global.set $glob123
)
br $761
)
(block $763
(i32.const 0 )
global.set $glob123
)
)
)
)
)
br $749
)
(block $765
(block $764
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $764
(block $766
(i32.const 2 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $768
(block $767
global.get $glob23
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $767
(block $769
(block $771
(block $770
(block $772
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $772
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $770
(block $773
(i32.const 1 )
global.set $glob124
)
br $771
)
(block $774
(i32.const 0 )
global.set $glob124
)
)
)
br $768
)
(block $775
(block $777
(block $776
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $776
(block $778
(i32.const 1 )
global.set $glob124
)
br $777
)
(block $779
(i32.const 0 )
global.set $glob124
)
)
)
)
)
br $765
)
(block $781
(block $780
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $780
(block $782
(i32.const 2 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $784
(block $783
global.get $glob24
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $783
(block $785
(block $787
(block $786
(block $788
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $788
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $786
(block $789
(i32.const 1 )
global.set $glob125
)
br $787
)
(block $790
(i32.const 0 )
global.set $glob125
)
)
)
br $784
)
(block $791
(block $793
(block $792
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $792
(block $794
(i32.const 1 )
global.set $glob125
)
br $793
)
(block $795
(i32.const 0 )
global.set $glob125
)
)
)
)
)
br $781
)
(block $797
(block $796
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $796
(block $798
(i32.const 2 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $800
(block $799
global.get $glob25
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $799
(block $801
(block $803
(block $802
(block $804
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $804
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $802
(block $805
(i32.const 1 )
global.set $glob126
)
br $803
)
(block $806
(i32.const 0 )
global.set $glob126
)
)
)
br $800
)
(block $807
(block $809
(block $808
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $808
(block $810
(i32.const 1 )
global.set $glob126
)
br $809
)
(block $811
(i32.const 0 )
global.set $glob126
)
)
)
)
)
br $797
)
(block $813
(block $812
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $812
(block $814
(i32.const 2 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $816
(block $815
global.get $glob26
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $815
(block $817
(block $819
(block $818
(block $820
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $820
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $818
(block $821
(i32.const 1 )
global.set $glob127
)
br $819
)
(block $822
(i32.const 0 )
global.set $glob127
)
)
)
br $816
)
(block $823
(block $825
(block $824
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $824
(block $826
(i32.const 1 )
global.set $glob127
)
br $825
)
(block $827
(i32.const 0 )
global.set $glob127
)
)
)
)
)
br $813
)
(block $829
(block $828
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $828
(block $830
(i32.const 2 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $832
(block $831
global.get $glob27
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $831
(block $833
(block $835
(block $834
(block $836
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $836
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $834
(block $837
(i32.const 1 )
global.set $glob128
)
br $835
)
(block $838
(i32.const 0 )
global.set $glob128
)
)
)
br $832
)
(block $839
(block $841
(block $840
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $840
(block $842
(i32.const 1 )
global.set $glob128
)
br $841
)
(block $843
(i32.const 0 )
global.set $glob128
)
)
)
)
)
br $829
)
(block $845
(block $844
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $844
(block $846
(i32.const 2 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $848
(block $847
global.get $glob28
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $847
(block $849
(block $851
(block $850
(block $852
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $852
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $850
(block $853
(i32.const 1 )
global.set $glob129
)
br $851
)
(block $854
(i32.const 0 )
global.set $glob129
)
)
)
br $848
)
(block $855
(block $857
(block $856
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $856
(block $858
(i32.const 1 )
global.set $glob129
)
br $857
)
(block $859
(i32.const 0 )
global.set $glob129
)
)
)
)
)
br $845
)
(block $860
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $860
(block $861
(i32.const 2 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $863
(block $862
global.get $glob29
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $862
(block $864
(block $866
(block $865
(block $867
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $867
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $865
(block $868
(i32.const 1 )
global.set $glob130
)
br $866
)
(block $869
(i32.const 0 )
global.set $glob130
)
)
)
br $863
)
(block $870
(block $872
(block $871
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $871
(block $873
(i32.const 1 )
global.set $glob130
)
br $872
)
(block $874
(i32.const 0 )
global.set $glob130
)
)
)
)
)
)
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
br $714
)
)
)
br $711
)
(block $876
(block $875
local.get $loc0
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $875
(block $877
(i32.const 0 )
local.set $loc1
(block $878
(loop $879
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $878
(block $880
(block $882
(block $881
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $881
(block $883
(i32.const 3 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $885
(block $884
global.get $glob30
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $884
(block $886
(block $888
(block $887
(block $889
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $889
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $887
(block $890
(i32.const 1 )
global.set $glob131
)
br $888
)
(block $891
(i32.const 0 )
global.set $glob131
)
)
)
br $885
)
(block $892
(block $894
(block $893
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $893
(block $895
(i32.const 1 )
global.set $glob131
)
br $894
)
(block $896
(i32.const 0 )
global.set $glob131
)
)
)
)
)
br $882
)
(block $898
(block $897
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $897
(block $899
(i32.const 3 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $901
(block $900
global.get $glob31
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $900
(block $902
(block $904
(block $903
(block $905
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $905
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $903
(block $906
(i32.const 1 )
global.set $glob132
)
br $904
)
(block $907
(i32.const 0 )
global.set $glob132
)
)
)
br $901
)
(block $908
(block $910
(block $909
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $909
(block $911
(i32.const 1 )
global.set $glob132
)
br $910
)
(block $912
(i32.const 0 )
global.set $glob132
)
)
)
)
)
br $898
)
(block $914
(block $913
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $913
(block $915
(i32.const 3 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $917
(block $916
global.get $glob32
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $916
(block $918
(block $920
(block $919
(block $921
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $921
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $919
(block $922
(i32.const 1 )
global.set $glob133
)
br $920
)
(block $923
(i32.const 0 )
global.set $glob133
)
)
)
br $917
)
(block $924
(block $926
(block $925
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $925
(block $927
(i32.const 1 )
global.set $glob133
)
br $926
)
(block $928
(i32.const 0 )
global.set $glob133
)
)
)
)
)
br $914
)
(block $930
(block $929
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $929
(block $931
(i32.const 3 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $933
(block $932
global.get $glob33
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $932
(block $934
(block $936
(block $935
(block $937
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $937
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $935
(block $938
(i32.const 1 )
global.set $glob134
)
br $936
)
(block $939
(i32.const 0 )
global.set $glob134
)
)
)
br $933
)
(block $940
(block $942
(block $941
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $941
(block $943
(i32.const 1 )
global.set $glob134
)
br $942
)
(block $944
(i32.const 0 )
global.set $glob134
)
)
)
)
)
br $930
)
(block $946
(block $945
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $945
(block $947
(i32.const 3 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $949
(block $948
global.get $glob34
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $948
(block $950
(block $952
(block $951
(block $953
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $953
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $951
(block $954
(i32.const 1 )
global.set $glob135
)
br $952
)
(block $955
(i32.const 0 )
global.set $glob135
)
)
)
br $949
)
(block $956
(block $958
(block $957
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $957
(block $959
(i32.const 1 )
global.set $glob135
)
br $958
)
(block $960
(i32.const 0 )
global.set $glob135
)
)
)
)
)
br $946
)
(block $962
(block $961
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $961
(block $963
(i32.const 3 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $965
(block $964
global.get $glob35
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $964
(block $966
(block $968
(block $967
(block $969
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $969
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $967
(block $970
(i32.const 1 )
global.set $glob136
)
br $968
)
(block $971
(i32.const 0 )
global.set $glob136
)
)
)
br $965
)
(block $972
(block $974
(block $973
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $973
(block $975
(i32.const 1 )
global.set $glob136
)
br $974
)
(block $976
(i32.const 0 )
global.set $glob136
)
)
)
)
)
br $962
)
(block $978
(block $977
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $977
(block $979
(i32.const 3 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $981
(block $980
global.get $glob36
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $980
(block $982
(block $984
(block $983
(block $985
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $985
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $983
(block $986
(i32.const 1 )
global.set $glob137
)
br $984
)
(block $987
(i32.const 0 )
global.set $glob137
)
)
)
br $981
)
(block $988
(block $990
(block $989
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $989
(block $991
(i32.const 1 )
global.set $glob137
)
br $990
)
(block $992
(i32.const 0 )
global.set $glob137
)
)
)
)
)
br $978
)
(block $994
(block $993
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $993
(block $995
(i32.const 3 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $997
(block $996
global.get $glob37
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $996
(block $998
(block $1000
(block $999
(block $1001
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1001
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $999
(block $1002
(i32.const 1 )
global.set $glob138
)
br $1000
)
(block $1003
(i32.const 0 )
global.set $glob138
)
)
)
br $997
)
(block $1004
(block $1006
(block $1005
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1005
(block $1007
(i32.const 1 )
global.set $glob138
)
br $1006
)
(block $1008
(i32.const 0 )
global.set $glob138
)
)
)
)
)
br $994
)
(block $1010
(block $1009
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1009
(block $1011
(i32.const 3 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $1013
(block $1012
global.get $glob38
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1012
(block $1014
(block $1016
(block $1015
(block $1017
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1017
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1015
(block $1018
(i32.const 1 )
global.set $glob139
)
br $1016
)
(block $1019
(i32.const 0 )
global.set $glob139
)
)
)
br $1013
)
(block $1020
(block $1022
(block $1021
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1021
(block $1023
(i32.const 1 )
global.set $glob139
)
br $1022
)
(block $1024
(i32.const 0 )
global.set $glob139
)
)
)
)
)
br $1010
)
(block $1025
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1025
(block $1026
(i32.const 3 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $1028
(block $1027
global.get $glob39
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1027
(block $1029
(block $1031
(block $1030
(block $1032
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1032
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1030
(block $1033
(i32.const 1 )
global.set $glob140
)
br $1031
)
(block $1034
(i32.const 0 )
global.set $glob140
)
)
)
br $1028
)
(block $1035
(block $1037
(block $1036
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1036
(block $1038
(i32.const 1 )
global.set $glob140
)
br $1037
)
(block $1039
(i32.const 0 )
global.set $glob140
)
)
)
)
)
)
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
br $879
)
)
)
br $876
)
(block $1041
(block $1040
local.get $loc0
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1040
(block $1042
(i32.const 0 )
local.set $loc1
(block $1043
(loop $1044
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1043
(block $1045
(block $1047
(block $1046
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1046
(block $1048
(i32.const 4 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $1050
(block $1049
global.get $glob40
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1049
(block $1051
(block $1053
(block $1052
(block $1054
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1054
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1052
(block $1055
(i32.const 1 )
global.set $glob141
)
br $1053
)
(block $1056
(i32.const 0 )
global.set $glob141
)
)
)
br $1050
)
(block $1057
(block $1059
(block $1058
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1058
(block $1060
(i32.const 1 )
global.set $glob141
)
br $1059
)
(block $1061
(i32.const 0 )
global.set $glob141
)
)
)
)
)
br $1047
)
(block $1063
(block $1062
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1062
(block $1064
(i32.const 4 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $1066
(block $1065
global.get $glob41
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1065
(block $1067
(block $1069
(block $1068
(block $1070
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1070
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1068
(block $1071
(i32.const 1 )
global.set $glob142
)
br $1069
)
(block $1072
(i32.const 0 )
global.set $glob142
)
)
)
br $1066
)
(block $1073
(block $1075
(block $1074
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1074
(block $1076
(i32.const 1 )
global.set $glob142
)
br $1075
)
(block $1077
(i32.const 0 )
global.set $glob142
)
)
)
)
)
br $1063
)
(block $1079
(block $1078
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1078
(block $1080
(i32.const 4 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $1082
(block $1081
global.get $glob42
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1081
(block $1083
(block $1085
(block $1084
(block $1086
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1086
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1084
(block $1087
(i32.const 1 )
global.set $glob143
)
br $1085
)
(block $1088
(i32.const 0 )
global.set $glob143
)
)
)
br $1082
)
(block $1089
(block $1091
(block $1090
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1090
(block $1092
(i32.const 1 )
global.set $glob143
)
br $1091
)
(block $1093
(i32.const 0 )
global.set $glob143
)
)
)
)
)
br $1079
)
(block $1095
(block $1094
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1094
(block $1096
(i32.const 4 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $1098
(block $1097
global.get $glob43
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1097
(block $1099
(block $1101
(block $1100
(block $1102
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1102
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1100
(block $1103
(i32.const 1 )
global.set $glob144
)
br $1101
)
(block $1104
(i32.const 0 )
global.set $glob144
)
)
)
br $1098
)
(block $1105
(block $1107
(block $1106
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1106
(block $1108
(i32.const 1 )
global.set $glob144
)
br $1107
)
(block $1109
(i32.const 0 )
global.set $glob144
)
)
)
)
)
br $1095
)
(block $1111
(block $1110
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1110
(block $1112
(i32.const 4 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $1114
(block $1113
global.get $glob44
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1113
(block $1115
(block $1117
(block $1116
(block $1118
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1118
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1116
(block $1119
(i32.const 1 )
global.set $glob145
)
br $1117
)
(block $1120
(i32.const 0 )
global.set $glob145
)
)
)
br $1114
)
(block $1121
(block $1123
(block $1122
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1122
(block $1124
(i32.const 1 )
global.set $glob145
)
br $1123
)
(block $1125
(i32.const 0 )
global.set $glob145
)
)
)
)
)
br $1111
)
(block $1127
(block $1126
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1126
(block $1128
(i32.const 4 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $1130
(block $1129
global.get $glob45
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1129
(block $1131
(block $1133
(block $1132
(block $1134
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1134
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1132
(block $1135
(i32.const 1 )
global.set $glob146
)
br $1133
)
(block $1136
(i32.const 0 )
global.set $glob146
)
)
)
br $1130
)
(block $1137
(block $1139
(block $1138
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1138
(block $1140
(i32.const 1 )
global.set $glob146
)
br $1139
)
(block $1141
(i32.const 0 )
global.set $glob146
)
)
)
)
)
br $1127
)
(block $1143
(block $1142
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1142
(block $1144
(i32.const 4 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $1146
(block $1145
global.get $glob46
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1145
(block $1147
(block $1149
(block $1148
(block $1150
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1150
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1148
(block $1151
(i32.const 1 )
global.set $glob147
)
br $1149
)
(block $1152
(i32.const 0 )
global.set $glob147
)
)
)
br $1146
)
(block $1153
(block $1155
(block $1154
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1154
(block $1156
(i32.const 1 )
global.set $glob147
)
br $1155
)
(block $1157
(i32.const 0 )
global.set $glob147
)
)
)
)
)
br $1143
)
(block $1159
(block $1158
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1158
(block $1160
(i32.const 4 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $1162
(block $1161
global.get $glob47
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1161
(block $1163
(block $1165
(block $1164
(block $1166
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1166
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1164
(block $1167
(i32.const 1 )
global.set $glob148
)
br $1165
)
(block $1168
(i32.const 0 )
global.set $glob148
)
)
)
br $1162
)
(block $1169
(block $1171
(block $1170
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1170
(block $1172
(i32.const 1 )
global.set $glob148
)
br $1171
)
(block $1173
(i32.const 0 )
global.set $glob148
)
)
)
)
)
br $1159
)
(block $1175
(block $1174
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1174
(block $1176
(i32.const 4 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $1178
(block $1177
global.get $glob48
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1177
(block $1179
(block $1181
(block $1180
(block $1182
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1182
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1180
(block $1183
(i32.const 1 )
global.set $glob149
)
br $1181
)
(block $1184
(i32.const 0 )
global.set $glob149
)
)
)
br $1178
)
(block $1185
(block $1187
(block $1186
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1186
(block $1188
(i32.const 1 )
global.set $glob149
)
br $1187
)
(block $1189
(i32.const 0 )
global.set $glob149
)
)
)
)
)
br $1175
)
(block $1190
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1190
(block $1191
(i32.const 4 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $1193
(block $1192
global.get $glob49
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1192
(block $1194
(block $1196
(block $1195
(block $1197
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1197
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1195
(block $1198
(i32.const 1 )
global.set $glob150
)
br $1196
)
(block $1199
(i32.const 0 )
global.set $glob150
)
)
)
br $1193
)
(block $1200
(block $1202
(block $1201
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1201
(block $1203
(i32.const 1 )
global.set $glob150
)
br $1202
)
(block $1204
(i32.const 0 )
global.set $glob150
)
)
)
)
)
)
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
br $1044
)
)
)
br $1041
)
(block $1206
(block $1205
local.get $loc0
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1205
(block $1207
(i32.const 0 )
local.set $loc1
(block $1208
(loop $1209
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1208
(block $1210
(block $1212
(block $1211
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1211
(block $1213
(i32.const 5 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $1215
(block $1214
global.get $glob50
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1214
(block $1216
(block $1218
(block $1217
(block $1219
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1219
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1217
(block $1220
(i32.const 1 )
global.set $glob151
)
br $1218
)
(block $1221
(i32.const 0 )
global.set $glob151
)
)
)
br $1215
)
(block $1222
(block $1224
(block $1223
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1223
(block $1225
(i32.const 1 )
global.set $glob151
)
br $1224
)
(block $1226
(i32.const 0 )
global.set $glob151
)
)
)
)
)
br $1212
)
(block $1228
(block $1227
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1227
(block $1229
(i32.const 5 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $1231
(block $1230
global.get $glob51
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1230
(block $1232
(block $1234
(block $1233
(block $1235
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1235
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1233
(block $1236
(i32.const 1 )
global.set $glob152
)
br $1234
)
(block $1237
(i32.const 0 )
global.set $glob152
)
)
)
br $1231
)
(block $1238
(block $1240
(block $1239
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1239
(block $1241
(i32.const 1 )
global.set $glob152
)
br $1240
)
(block $1242
(i32.const 0 )
global.set $glob152
)
)
)
)
)
br $1228
)
(block $1244
(block $1243
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1243
(block $1245
(i32.const 5 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $1247
(block $1246
global.get $glob52
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1246
(block $1248
(block $1250
(block $1249
(block $1251
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1251
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1249
(block $1252
(i32.const 1 )
global.set $glob153
)
br $1250
)
(block $1253
(i32.const 0 )
global.set $glob153
)
)
)
br $1247
)
(block $1254
(block $1256
(block $1255
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1255
(block $1257
(i32.const 1 )
global.set $glob153
)
br $1256
)
(block $1258
(i32.const 0 )
global.set $glob153
)
)
)
)
)
br $1244
)
(block $1260
(block $1259
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1259
(block $1261
(i32.const 5 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $1263
(block $1262
global.get $glob53
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1262
(block $1264
(block $1266
(block $1265
(block $1267
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1267
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1265
(block $1268
(i32.const 1 )
global.set $glob154
)
br $1266
)
(block $1269
(i32.const 0 )
global.set $glob154
)
)
)
br $1263
)
(block $1270
(block $1272
(block $1271
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1271
(block $1273
(i32.const 1 )
global.set $glob154
)
br $1272
)
(block $1274
(i32.const 0 )
global.set $glob154
)
)
)
)
)
br $1260
)
(block $1276
(block $1275
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1275
(block $1277
(i32.const 5 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $1279
(block $1278
global.get $glob54
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1278
(block $1280
(block $1282
(block $1281
(block $1283
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1283
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1281
(block $1284
(i32.const 1 )
global.set $glob155
)
br $1282
)
(block $1285
(i32.const 0 )
global.set $glob155
)
)
)
br $1279
)
(block $1286
(block $1288
(block $1287
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1287
(block $1289
(i32.const 1 )
global.set $glob155
)
br $1288
)
(block $1290
(i32.const 0 )
global.set $glob155
)
)
)
)
)
br $1276
)
(block $1292
(block $1291
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1291
(block $1293
(i32.const 5 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $1295
(block $1294
global.get $glob55
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1294
(block $1296
(block $1298
(block $1297
(block $1299
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1299
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1297
(block $1300
(i32.const 1 )
global.set $glob156
)
br $1298
)
(block $1301
(i32.const 0 )
global.set $glob156
)
)
)
br $1295
)
(block $1302
(block $1304
(block $1303
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1303
(block $1305
(i32.const 1 )
global.set $glob156
)
br $1304
)
(block $1306
(i32.const 0 )
global.set $glob156
)
)
)
)
)
br $1292
)
(block $1308
(block $1307
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1307
(block $1309
(i32.const 5 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $1311
(block $1310
global.get $glob56
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1310
(block $1312
(block $1314
(block $1313
(block $1315
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1315
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1313
(block $1316
(i32.const 1 )
global.set $glob157
)
br $1314
)
(block $1317
(i32.const 0 )
global.set $glob157
)
)
)
br $1311
)
(block $1318
(block $1320
(block $1319
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1319
(block $1321
(i32.const 1 )
global.set $glob157
)
br $1320
)
(block $1322
(i32.const 0 )
global.set $glob157
)
)
)
)
)
br $1308
)
(block $1324
(block $1323
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1323
(block $1325
(i32.const 5 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $1327
(block $1326
global.get $glob57
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1326
(block $1328
(block $1330
(block $1329
(block $1331
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1331
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1329
(block $1332
(i32.const 1 )
global.set $glob158
)
br $1330
)
(block $1333
(i32.const 0 )
global.set $glob158
)
)
)
br $1327
)
(block $1334
(block $1336
(block $1335
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1335
(block $1337
(i32.const 1 )
global.set $glob158
)
br $1336
)
(block $1338
(i32.const 0 )
global.set $glob158
)
)
)
)
)
br $1324
)
(block $1340
(block $1339
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1339
(block $1341
(i32.const 5 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $1343
(block $1342
global.get $glob58
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1342
(block $1344
(block $1346
(block $1345
(block $1347
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1347
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1345
(block $1348
(i32.const 1 )
global.set $glob159
)
br $1346
)
(block $1349
(i32.const 0 )
global.set $glob159
)
)
)
br $1343
)
(block $1350
(block $1352
(block $1351
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1351
(block $1353
(i32.const 1 )
global.set $glob159
)
br $1352
)
(block $1354
(i32.const 0 )
global.set $glob159
)
)
)
)
)
br $1340
)
(block $1355
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1355
(block $1356
(i32.const 5 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $1358
(block $1357
global.get $glob59
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1357
(block $1359
(block $1361
(block $1360
(block $1362
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1362
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1360
(block $1363
(i32.const 1 )
global.set $glob160
)
br $1361
)
(block $1364
(i32.const 0 )
global.set $glob160
)
)
)
br $1358
)
(block $1365
(block $1367
(block $1366
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1366
(block $1368
(i32.const 1 )
global.set $glob160
)
br $1367
)
(block $1369
(i32.const 0 )
global.set $glob160
)
)
)
)
)
)
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
br $1209
)
)
)
br $1206
)
(block $1371
(block $1370
local.get $loc0
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1370
(block $1372
(i32.const 0 )
local.set $loc1
(block $1373
(loop $1374
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1373
(block $1375
(block $1377
(block $1376
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1376
(block $1378
(i32.const 6 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $1380
(block $1379
global.get $glob60
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1379
(block $1381
(block $1383
(block $1382
(block $1384
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1384
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1382
(block $1385
(i32.const 1 )
global.set $glob161
)
br $1383
)
(block $1386
(i32.const 0 )
global.set $glob161
)
)
)
br $1380
)
(block $1387
(block $1389
(block $1388
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1388
(block $1390
(i32.const 1 )
global.set $glob161
)
br $1389
)
(block $1391
(i32.const 0 )
global.set $glob161
)
)
)
)
)
br $1377
)
(block $1393
(block $1392
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1392
(block $1394
(i32.const 6 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $1396
(block $1395
global.get $glob61
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1395
(block $1397
(block $1399
(block $1398
(block $1400
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1400
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1398
(block $1401
(i32.const 1 )
global.set $glob162
)
br $1399
)
(block $1402
(i32.const 0 )
global.set $glob162
)
)
)
br $1396
)
(block $1403
(block $1405
(block $1404
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1404
(block $1406
(i32.const 1 )
global.set $glob162
)
br $1405
)
(block $1407
(i32.const 0 )
global.set $glob162
)
)
)
)
)
br $1393
)
(block $1409
(block $1408
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1408
(block $1410
(i32.const 6 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $1412
(block $1411
global.get $glob62
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1411
(block $1413
(block $1415
(block $1414
(block $1416
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1416
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1414
(block $1417
(i32.const 1 )
global.set $glob163
)
br $1415
)
(block $1418
(i32.const 0 )
global.set $glob163
)
)
)
br $1412
)
(block $1419
(block $1421
(block $1420
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1420
(block $1422
(i32.const 1 )
global.set $glob163
)
br $1421
)
(block $1423
(i32.const 0 )
global.set $glob163
)
)
)
)
)
br $1409
)
(block $1425
(block $1424
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1424
(block $1426
(i32.const 6 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $1428
(block $1427
global.get $glob63
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1427
(block $1429
(block $1431
(block $1430
(block $1432
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1432
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1430
(block $1433
(i32.const 1 )
global.set $glob164
)
br $1431
)
(block $1434
(i32.const 0 )
global.set $glob164
)
)
)
br $1428
)
(block $1435
(block $1437
(block $1436
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1436
(block $1438
(i32.const 1 )
global.set $glob164
)
br $1437
)
(block $1439
(i32.const 0 )
global.set $glob164
)
)
)
)
)
br $1425
)
(block $1441
(block $1440
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1440
(block $1442
(i32.const 6 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $1444
(block $1443
global.get $glob64
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1443
(block $1445
(block $1447
(block $1446
(block $1448
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1448
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1446
(block $1449
(i32.const 1 )
global.set $glob165
)
br $1447
)
(block $1450
(i32.const 0 )
global.set $glob165
)
)
)
br $1444
)
(block $1451
(block $1453
(block $1452
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1452
(block $1454
(i32.const 1 )
global.set $glob165
)
br $1453
)
(block $1455
(i32.const 0 )
global.set $glob165
)
)
)
)
)
br $1441
)
(block $1457
(block $1456
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1456
(block $1458
(i32.const 6 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $1460
(block $1459
global.get $glob65
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1459
(block $1461
(block $1463
(block $1462
(block $1464
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1464
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1462
(block $1465
(i32.const 1 )
global.set $glob166
)
br $1463
)
(block $1466
(i32.const 0 )
global.set $glob166
)
)
)
br $1460
)
(block $1467
(block $1469
(block $1468
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1468
(block $1470
(i32.const 1 )
global.set $glob166
)
br $1469
)
(block $1471
(i32.const 0 )
global.set $glob166
)
)
)
)
)
br $1457
)
(block $1473
(block $1472
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1472
(block $1474
(i32.const 6 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $1476
(block $1475
global.get $glob66
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1475
(block $1477
(block $1479
(block $1478
(block $1480
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1480
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1478
(block $1481
(i32.const 1 )
global.set $glob167
)
br $1479
)
(block $1482
(i32.const 0 )
global.set $glob167
)
)
)
br $1476
)
(block $1483
(block $1485
(block $1484
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1484
(block $1486
(i32.const 1 )
global.set $glob167
)
br $1485
)
(block $1487
(i32.const 0 )
global.set $glob167
)
)
)
)
)
br $1473
)
(block $1489
(block $1488
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1488
(block $1490
(i32.const 6 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $1492
(block $1491
global.get $glob67
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1491
(block $1493
(block $1495
(block $1494
(block $1496
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1496
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1494
(block $1497
(i32.const 1 )
global.set $glob168
)
br $1495
)
(block $1498
(i32.const 0 )
global.set $glob168
)
)
)
br $1492
)
(block $1499
(block $1501
(block $1500
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1500
(block $1502
(i32.const 1 )
global.set $glob168
)
br $1501
)
(block $1503
(i32.const 0 )
global.set $glob168
)
)
)
)
)
br $1489
)
(block $1505
(block $1504
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1504
(block $1506
(i32.const 6 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $1508
(block $1507
global.get $glob68
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1507
(block $1509
(block $1511
(block $1510
(block $1512
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1512
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1510
(block $1513
(i32.const 1 )
global.set $glob169
)
br $1511
)
(block $1514
(i32.const 0 )
global.set $glob169
)
)
)
br $1508
)
(block $1515
(block $1517
(block $1516
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1516
(block $1518
(i32.const 1 )
global.set $glob169
)
br $1517
)
(block $1519
(i32.const 0 )
global.set $glob169
)
)
)
)
)
br $1505
)
(block $1520
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1520
(block $1521
(i32.const 6 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $1523
(block $1522
global.get $glob69
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1522
(block $1524
(block $1526
(block $1525
(block $1527
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1527
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1525
(block $1528
(i32.const 1 )
global.set $glob170
)
br $1526
)
(block $1529
(i32.const 0 )
global.set $glob170
)
)
)
br $1523
)
(block $1530
(block $1532
(block $1531
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1531
(block $1533
(i32.const 1 )
global.set $glob170
)
br $1532
)
(block $1534
(i32.const 0 )
global.set $glob170
)
)
)
)
)
)
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
br $1374
)
)
)
br $1371
)
(block $1536
(block $1535
local.get $loc0
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1535
(block $1537
(i32.const 0 )
local.set $loc1
(block $1538
(loop $1539
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1538
(block $1540
(block $1542
(block $1541
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1541
(block $1543
(i32.const 7 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $1545
(block $1544
global.get $glob70
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1544
(block $1546
(block $1548
(block $1547
(block $1549
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1549
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1547
(block $1550
(i32.const 1 )
global.set $glob171
)
br $1548
)
(block $1551
(i32.const 0 )
global.set $glob171
)
)
)
br $1545
)
(block $1552
(block $1554
(block $1553
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1553
(block $1555
(i32.const 1 )
global.set $glob171
)
br $1554
)
(block $1556
(i32.const 0 )
global.set $glob171
)
)
)
)
)
br $1542
)
(block $1558
(block $1557
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1557
(block $1559
(i32.const 7 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $1561
(block $1560
global.get $glob71
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1560
(block $1562
(block $1564
(block $1563
(block $1565
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1565
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1563
(block $1566
(i32.const 1 )
global.set $glob172
)
br $1564
)
(block $1567
(i32.const 0 )
global.set $glob172
)
)
)
br $1561
)
(block $1568
(block $1570
(block $1569
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1569
(block $1571
(i32.const 1 )
global.set $glob172
)
br $1570
)
(block $1572
(i32.const 0 )
global.set $glob172
)
)
)
)
)
br $1558
)
(block $1574
(block $1573
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1573
(block $1575
(i32.const 7 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $1577
(block $1576
global.get $glob72
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1576
(block $1578
(block $1580
(block $1579
(block $1581
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1581
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1579
(block $1582
(i32.const 1 )
global.set $glob173
)
br $1580
)
(block $1583
(i32.const 0 )
global.set $glob173
)
)
)
br $1577
)
(block $1584
(block $1586
(block $1585
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1585
(block $1587
(i32.const 1 )
global.set $glob173
)
br $1586
)
(block $1588
(i32.const 0 )
global.set $glob173
)
)
)
)
)
br $1574
)
(block $1590
(block $1589
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1589
(block $1591
(i32.const 7 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $1593
(block $1592
global.get $glob73
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1592
(block $1594
(block $1596
(block $1595
(block $1597
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1597
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1595
(block $1598
(i32.const 1 )
global.set $glob174
)
br $1596
)
(block $1599
(i32.const 0 )
global.set $glob174
)
)
)
br $1593
)
(block $1600
(block $1602
(block $1601
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1601
(block $1603
(i32.const 1 )
global.set $glob174
)
br $1602
)
(block $1604
(i32.const 0 )
global.set $glob174
)
)
)
)
)
br $1590
)
(block $1606
(block $1605
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1605
(block $1607
(i32.const 7 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $1609
(block $1608
global.get $glob74
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1608
(block $1610
(block $1612
(block $1611
(block $1613
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1613
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1611
(block $1614
(i32.const 1 )
global.set $glob175
)
br $1612
)
(block $1615
(i32.const 0 )
global.set $glob175
)
)
)
br $1609
)
(block $1616
(block $1618
(block $1617
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1617
(block $1619
(i32.const 1 )
global.set $glob175
)
br $1618
)
(block $1620
(i32.const 0 )
global.set $glob175
)
)
)
)
)
br $1606
)
(block $1622
(block $1621
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1621
(block $1623
(i32.const 7 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $1625
(block $1624
global.get $glob75
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1624
(block $1626
(block $1628
(block $1627
(block $1629
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1629
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1627
(block $1630
(i32.const 1 )
global.set $glob176
)
br $1628
)
(block $1631
(i32.const 0 )
global.set $glob176
)
)
)
br $1625
)
(block $1632
(block $1634
(block $1633
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1633
(block $1635
(i32.const 1 )
global.set $glob176
)
br $1634
)
(block $1636
(i32.const 0 )
global.set $glob176
)
)
)
)
)
br $1622
)
(block $1638
(block $1637
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1637
(block $1639
(i32.const 7 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $1641
(block $1640
global.get $glob76
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1640
(block $1642
(block $1644
(block $1643
(block $1645
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1645
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1643
(block $1646
(i32.const 1 )
global.set $glob177
)
br $1644
)
(block $1647
(i32.const 0 )
global.set $glob177
)
)
)
br $1641
)
(block $1648
(block $1650
(block $1649
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1649
(block $1651
(i32.const 1 )
global.set $glob177
)
br $1650
)
(block $1652
(i32.const 0 )
global.set $glob177
)
)
)
)
)
br $1638
)
(block $1654
(block $1653
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1653
(block $1655
(i32.const 7 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $1657
(block $1656
global.get $glob77
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1656
(block $1658
(block $1660
(block $1659
(block $1661
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1661
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1659
(block $1662
(i32.const 1 )
global.set $glob178
)
br $1660
)
(block $1663
(i32.const 0 )
global.set $glob178
)
)
)
br $1657
)
(block $1664
(block $1666
(block $1665
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1665
(block $1667
(i32.const 1 )
global.set $glob178
)
br $1666
)
(block $1668
(i32.const 0 )
global.set $glob178
)
)
)
)
)
br $1654
)
(block $1670
(block $1669
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1669
(block $1671
(i32.const 7 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $1673
(block $1672
global.get $glob78
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1672
(block $1674
(block $1676
(block $1675
(block $1677
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1677
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1675
(block $1678
(i32.const 1 )
global.set $glob179
)
br $1676
)
(block $1679
(i32.const 0 )
global.set $glob179
)
)
)
br $1673
)
(block $1680
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
(i32.const 1 )
global.set $glob179
)
br $1682
)
(block $1684
(i32.const 0 )
global.set $glob179
)
)
)
)
)
br $1670
)
(block $1685
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1685
(block $1686
(i32.const 7 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $1688
(block $1687
global.get $glob79
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1687
(block $1689
(block $1691
(block $1690
(block $1692
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1692
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1690
(block $1693
(i32.const 1 )
global.set $glob180
)
br $1691
)
(block $1694
(i32.const 0 )
global.set $glob180
)
)
)
br $1688
)
(block $1695
(block $1697
(block $1696
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1696
(block $1698
(i32.const 1 )
global.set $glob180
)
br $1697
)
(block $1699
(i32.const 0 )
global.set $glob180
)
)
)
)
)
)
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
br $1539
)
)
)
br $1536
)
(block $1701
(block $1700
local.get $loc0
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1700
(block $1702
(i32.const 0 )
local.set $loc1
(block $1703
(loop $1704
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1703
(block $1705
(block $1707
(block $1706
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1706
(block $1708
(i32.const 8 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $1710
(block $1709
global.get $glob80
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1709
(block $1711
(block $1713
(block $1712
(block $1714
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1714
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1712
(block $1715
(i32.const 1 )
global.set $glob181
)
br $1713
)
(block $1716
(i32.const 0 )
global.set $glob181
)
)
)
br $1710
)
(block $1717
(block $1719
(block $1718
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1718
(block $1720
(i32.const 1 )
global.set $glob181
)
br $1719
)
(block $1721
(i32.const 0 )
global.set $glob181
)
)
)
)
)
br $1707
)
(block $1723
(block $1722
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1722
(block $1724
(i32.const 8 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $1726
(block $1725
global.get $glob81
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1725
(block $1727
(block $1729
(block $1728
(block $1730
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1730
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1728
(block $1731
(i32.const 1 )
global.set $glob182
)
br $1729
)
(block $1732
(i32.const 0 )
global.set $glob182
)
)
)
br $1726
)
(block $1733
(block $1735
(block $1734
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1734
(block $1736
(i32.const 1 )
global.set $glob182
)
br $1735
)
(block $1737
(i32.const 0 )
global.set $glob182
)
)
)
)
)
br $1723
)
(block $1739
(block $1738
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1738
(block $1740
(i32.const 8 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $1742
(block $1741
global.get $glob82
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1741
(block $1743
(block $1745
(block $1744
(block $1746
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1746
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1744
(block $1747
(i32.const 1 )
global.set $glob183
)
br $1745
)
(block $1748
(i32.const 0 )
global.set $glob183
)
)
)
br $1742
)
(block $1749
(block $1751
(block $1750
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1750
(block $1752
(i32.const 1 )
global.set $glob183
)
br $1751
)
(block $1753
(i32.const 0 )
global.set $glob183
)
)
)
)
)
br $1739
)
(block $1755
(block $1754
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1754
(block $1756
(i32.const 8 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $1758
(block $1757
global.get $glob83
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1757
(block $1759
(block $1761
(block $1760
(block $1762
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1762
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1760
(block $1763
(i32.const 1 )
global.set $glob184
)
br $1761
)
(block $1764
(i32.const 0 )
global.set $glob184
)
)
)
br $1758
)
(block $1765
(block $1767
(block $1766
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1766
(block $1768
(i32.const 1 )
global.set $glob184
)
br $1767
)
(block $1769
(i32.const 0 )
global.set $glob184
)
)
)
)
)
br $1755
)
(block $1771
(block $1770
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1770
(block $1772
(i32.const 8 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $1774
(block $1773
global.get $glob84
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1773
(block $1775
(block $1777
(block $1776
(block $1778
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1778
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1776
(block $1779
(i32.const 1 )
global.set $glob185
)
br $1777
)
(block $1780
(i32.const 0 )
global.set $glob185
)
)
)
br $1774
)
(block $1781
(block $1783
(block $1782
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1782
(block $1784
(i32.const 1 )
global.set $glob185
)
br $1783
)
(block $1785
(i32.const 0 )
global.set $glob185
)
)
)
)
)
br $1771
)
(block $1787
(block $1786
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1786
(block $1788
(i32.const 8 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $1790
(block $1789
global.get $glob85
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1789
(block $1791
(block $1793
(block $1792
(block $1794
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1794
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1792
(block $1795
(i32.const 1 )
global.set $glob186
)
br $1793
)
(block $1796
(i32.const 0 )
global.set $glob186
)
)
)
br $1790
)
(block $1797
(block $1799
(block $1798
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1798
(block $1800
(i32.const 1 )
global.set $glob186
)
br $1799
)
(block $1801
(i32.const 0 )
global.set $glob186
)
)
)
)
)
br $1787
)
(block $1803
(block $1802
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1802
(block $1804
(i32.const 8 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $1806
(block $1805
global.get $glob86
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1805
(block $1807
(block $1809
(block $1808
(block $1810
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1810
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1808
(block $1811
(i32.const 1 )
global.set $glob187
)
br $1809
)
(block $1812
(i32.const 0 )
global.set $glob187
)
)
)
br $1806
)
(block $1813
(block $1815
(block $1814
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1814
(block $1816
(i32.const 1 )
global.set $glob187
)
br $1815
)
(block $1817
(i32.const 0 )
global.set $glob187
)
)
)
)
)
br $1803
)
(block $1819
(block $1818
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1818
(block $1820
(i32.const 8 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $1822
(block $1821
global.get $glob87
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1821
(block $1823
(block $1825
(block $1824
(block $1826
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1826
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1824
(block $1827
(i32.const 1 )
global.set $glob188
)
br $1825
)
(block $1828
(i32.const 0 )
global.set $glob188
)
)
)
br $1822
)
(block $1829
(block $1831
(block $1830
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1830
(block $1832
(i32.const 1 )
global.set $glob188
)
br $1831
)
(block $1833
(i32.const 0 )
global.set $glob188
)
)
)
)
)
br $1819
)
(block $1835
(block $1834
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1834
(block $1836
(i32.const 8 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $1838
(block $1837
global.get $glob88
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1837
(block $1839
(block $1841
(block $1840
(block $1842
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1842
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1840
(block $1843
(i32.const 1 )
global.set $glob189
)
br $1841
)
(block $1844
(i32.const 0 )
global.set $glob189
)
)
)
br $1838
)
(block $1845
(block $1847
(block $1846
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1846
(block $1848
(i32.const 1 )
global.set $glob189
)
br $1847
)
(block $1849
(i32.const 0 )
global.set $glob189
)
)
)
)
)
br $1835
)
(block $1850
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1850
(block $1851
(i32.const 8 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $1853
(block $1852
global.get $glob89
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1852
(block $1854
(block $1856
(block $1855
(block $1857
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1857
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1855
(block $1858
(i32.const 1 )
global.set $glob190
)
br $1856
)
(block $1859
(i32.const 0 )
global.set $glob190
)
)
)
br $1853
)
(block $1860
(block $1862
(block $1861
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1861
(block $1863
(i32.const 1 )
global.set $glob190
)
br $1862
)
(block $1864
(i32.const 0 )
global.set $glob190
)
)
)
)
)
)
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
br $1704
)
)
)
br $1701
)
(block $1865
local.get $loc0
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1865
(block $1866
(i32.const 0 )
local.set $loc1
(block $1867
(loop $1868
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1867
(block $1869
(block $1871
(block $1870
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1870
(block $1872
(i32.const 9 )
(i32.const 0 )
call $neighbours
local.set $loc3
(block $1874
(block $1873
global.get $glob90
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1873
(block $1875
(block $1877
(block $1876
(block $1878
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1878
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1876
(block $1879
(i32.const 1 )
global.set $glob191
)
br $1877
)
(block $1880
(i32.const 0 )
global.set $glob191
)
)
)
br $1874
)
(block $1881
(block $1883
(block $1882
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1882
(block $1884
(i32.const 1 )
global.set $glob191
)
br $1883
)
(block $1885
(i32.const 0 )
global.set $glob191
)
)
)
)
)
br $1871
)
(block $1887
(block $1886
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1886
(block $1888
(i32.const 9 )
(i32.const 1 )
call $neighbours
local.set $loc3
(block $1890
(block $1889
global.get $glob91
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1889
(block $1891
(block $1893
(block $1892
(block $1894
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1894
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1892
(block $1895
(i32.const 1 )
global.set $glob192
)
br $1893
)
(block $1896
(i32.const 0 )
global.set $glob192
)
)
)
br $1890
)
(block $1897
(block $1899
(block $1898
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1898
(block $1900
(i32.const 1 )
global.set $glob192
)
br $1899
)
(block $1901
(i32.const 0 )
global.set $glob192
)
)
)
)
)
br $1887
)
(block $1903
(block $1902
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1902
(block $1904
(i32.const 9 )
(i32.const 2 )
call $neighbours
local.set $loc3
(block $1906
(block $1905
global.get $glob92
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1905
(block $1907
(block $1909
(block $1908
(block $1910
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1910
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1908
(block $1911
(i32.const 1 )
global.set $glob193
)
br $1909
)
(block $1912
(i32.const 0 )
global.set $glob193
)
)
)
br $1906
)
(block $1913
(block $1915
(block $1914
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1914
(block $1916
(i32.const 1 )
global.set $glob193
)
br $1915
)
(block $1917
(i32.const 0 )
global.set $glob193
)
)
)
)
)
br $1903
)
(block $1919
(block $1918
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1918
(block $1920
(i32.const 9 )
(i32.const 3 )
call $neighbours
local.set $loc3
(block $1922
(block $1921
global.get $glob93
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1921
(block $1923
(block $1925
(block $1924
(block $1926
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1926
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1924
(block $1927
(i32.const 1 )
global.set $glob194
)
br $1925
)
(block $1928
(i32.const 0 )
global.set $glob194
)
)
)
br $1922
)
(block $1929
(block $1931
(block $1930
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1930
(block $1932
(i32.const 1 )
global.set $glob194
)
br $1931
)
(block $1933
(i32.const 0 )
global.set $glob194
)
)
)
)
)
br $1919
)
(block $1935
(block $1934
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1934
(block $1936
(i32.const 9 )
(i32.const 4 )
call $neighbours
local.set $loc3
(block $1938
(block $1937
global.get $glob94
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1937
(block $1939
(block $1941
(block $1940
(block $1942
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1942
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1940
(block $1943
(i32.const 1 )
global.set $glob195
)
br $1941
)
(block $1944
(i32.const 0 )
global.set $glob195
)
)
)
br $1938
)
(block $1945
(block $1947
(block $1946
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1946
(block $1948
(i32.const 1 )
global.set $glob195
)
br $1947
)
(block $1949
(i32.const 0 )
global.set $glob195
)
)
)
)
)
br $1935
)
(block $1951
(block $1950
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1950
(block $1952
(i32.const 9 )
(i32.const 5 )
call $neighbours
local.set $loc3
(block $1954
(block $1953
global.get $glob95
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1953
(block $1955
(block $1957
(block $1956
(block $1958
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1958
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1956
(block $1959
(i32.const 1 )
global.set $glob196
)
br $1957
)
(block $1960
(i32.const 0 )
global.set $glob196
)
)
)
br $1954
)
(block $1961
(block $1963
(block $1962
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1962
(block $1964
(i32.const 1 )
global.set $glob196
)
br $1963
)
(block $1965
(i32.const 0 )
global.set $glob196
)
)
)
)
)
br $1951
)
(block $1967
(block $1966
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1966
(block $1968
(i32.const 9 )
(i32.const 6 )
call $neighbours
local.set $loc3
(block $1970
(block $1969
global.get $glob96
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1969
(block $1971
(block $1973
(block $1972
(block $1974
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1974
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1972
(block $1975
(i32.const 1 )
global.set $glob197
)
br $1973
)
(block $1976
(i32.const 0 )
global.set $glob197
)
)
)
br $1970
)
(block $1977
(block $1979
(block $1978
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1978
(block $1980
(i32.const 1 )
global.set $glob197
)
br $1979
)
(block $1981
(i32.const 0 )
global.set $glob197
)
)
)
)
)
br $1967
)
(block $1983
(block $1982
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1982
(block $1984
(i32.const 9 )
(i32.const 7 )
call $neighbours
local.set $loc3
(block $1986
(block $1985
global.get $glob97
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1985
(block $1987
(block $1989
(block $1988
(block $1990
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $1990
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1988
(block $1991
(i32.const 1 )
global.set $glob198
)
br $1989
)
(block $1992
(i32.const 0 )
global.set $glob198
)
)
)
br $1986
)
(block $1993
(block $1995
(block $1994
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1994
(block $1996
(i32.const 1 )
global.set $glob198
)
br $1995
)
(block $1997
(i32.const 0 )
global.set $glob198
)
)
)
)
)
br $1983
)
(block $1999
(block $1998
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $1998
(block $2000
(i32.const 9 )
(i32.const 8 )
call $neighbours
local.set $loc3
(block $2002
(block $2001
global.get $glob98
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2001
(block $2003
(block $2005
(block $2004
(block $2006
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $2006
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2004
(block $2007
(i32.const 1 )
global.set $glob199
)
br $2005
)
(block $2008
(i32.const 0 )
global.set $glob199
)
)
)
br $2002
)
(block $2009
(block $2011
(block $2010
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2010
(block $2012
(i32.const 1 )
global.set $glob199
)
br $2011
)
(block $2013
(i32.const 0 )
global.set $glob199
)
)
)
)
)
br $1999
)
(block $2014
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2014
(block $2015
(i32.const 9 )
(i32.const 9 )
call $neighbours
local.set $loc3
(block $2017
(block $2016
global.get $glob99
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2016
(block $2018
(block $2020
(block $2019
(block $2021
local.get $loc3
(i32.const 2 )
i32.eq
i32.const 1
i32.eq
global.set $boolTemp
global.get $boolTemp
br_if $2021
local.get $loc3
(i32.const 3 )
i32.eq
global.set $boolTemp
)
global.get $boolTemp
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2019
(block $2022
(i32.const 1 )
global.set $glob200
)
br $2020
)
(block $2023
(i32.const 0 )
global.set $glob200
)
)
)
br $2017
)
(block $2024
(block $2026
(block $2025
local.get $loc3
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2025
(block $2027
(i32.const 1 )
global.set $glob200
)
br $2026
)
(block $2028
(i32.const 0 )
global.set $glob200
)
)
)
)
)
)
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
br $1868
)
)
)
)
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
br $378
)
)
(i32.const 0 )
local.set $loc0
(block $2029
(loop $2030
local.get $loc0
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2029
(block $2031
(block $2033
(block $2032
local.get $loc0
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2032
(block $2034
(i32.const 0 )
local.set $loc1
(block $2035
(loop $2036
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2035
(block $2037
(block $2039
(block $2038
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2038
(block $2040
global.get $glob101
global.set $glob0
)
br $2039
)
(block $2042
(block $2041
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2041
(block $2043
global.get $glob102
global.set $glob1
)
br $2042
)
(block $2045
(block $2044
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2044
(block $2046
global.get $glob103
global.set $glob2
)
br $2045
)
(block $2048
(block $2047
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2047
(block $2049
global.get $glob104
global.set $glob3
)
br $2048
)
(block $2051
(block $2050
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2050
(block $2052
global.get $glob105
global.set $glob4
)
br $2051
)
(block $2054
(block $2053
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2053
(block $2055
global.get $glob106
global.set $glob5
)
br $2054
)
(block $2057
(block $2056
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2056
(block $2058
global.get $glob107
global.set $glob6
)
br $2057
)
(block $2060
(block $2059
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2059
(block $2061
global.get $glob108
global.set $glob7
)
br $2060
)
(block $2063
(block $2062
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2062
(block $2064
global.get $glob109
global.set $glob8
)
br $2063
)
(block $2065
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2065
(block $2066
global.get $glob110
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
local.get $loc1
(i32.const 1 )
i32.add
local.set $loc1
)
br $2036
)
)
)
br $2033
)
(block $2068
(block $2067
local.get $loc0
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2067
(block $2069
(i32.const 0 )
local.set $loc1
(block $2070
(loop $2071
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2070
(block $2072
(block $2074
(block $2073
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2073
(block $2075
global.get $glob111
global.set $glob10
)
br $2074
)
(block $2077
(block $2076
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2076
(block $2078
global.get $glob112
global.set $glob11
)
br $2077
)
(block $2080
(block $2079
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2079
(block $2081
global.get $glob113
global.set $glob12
)
br $2080
)
(block $2083
(block $2082
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2082
(block $2084
global.get $glob114
global.set $glob13
)
br $2083
)
(block $2086
(block $2085
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2085
(block $2087
global.get $glob115
global.set $glob14
)
br $2086
)
(block $2089
(block $2088
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2088
(block $2090
global.get $glob116
global.set $glob15
)
br $2089
)
(block $2092
(block $2091
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2091
(block $2093
global.get $glob117
global.set $glob16
)
br $2092
)
(block $2095
(block $2094
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2094
(block $2096
global.get $glob118
global.set $glob17
)
br $2095
)
(block $2098
(block $2097
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2097
(block $2099
global.get $glob119
global.set $glob18
)
br $2098
)
(block $2100
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2100
(block $2101
global.get $glob120
global.set $glob19
)
)
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
br $2071
)
)
)
br $2068
)
(block $2103
(block $2102
local.get $loc0
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2102
(block $2104
(i32.const 0 )
local.set $loc1
(block $2105
(loop $2106
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2105
(block $2107
(block $2109
(block $2108
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2108
(block $2110
global.get $glob121
global.set $glob20
)
br $2109
)
(block $2112
(block $2111
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2111
(block $2113
global.get $glob122
global.set $glob21
)
br $2112
)
(block $2115
(block $2114
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2114
(block $2116
global.get $glob123
global.set $glob22
)
br $2115
)
(block $2118
(block $2117
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2117
(block $2119
global.get $glob124
global.set $glob23
)
br $2118
)
(block $2121
(block $2120
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2120
(block $2122
global.get $glob125
global.set $glob24
)
br $2121
)
(block $2124
(block $2123
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2123
(block $2125
global.get $glob126
global.set $glob25
)
br $2124
)
(block $2127
(block $2126
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2126
(block $2128
global.get $glob127
global.set $glob26
)
br $2127
)
(block $2130
(block $2129
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2129
(block $2131
global.get $glob128
global.set $glob27
)
br $2130
)
(block $2133
(block $2132
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2132
(block $2134
global.get $glob129
global.set $glob28
)
br $2133
)
(block $2135
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2135
(block $2136
global.get $glob130
global.set $glob29
)
)
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
br $2106
)
)
)
br $2103
)
(block $2138
(block $2137
local.get $loc0
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2137
(block $2139
(i32.const 0 )
local.set $loc1
(block $2140
(loop $2141
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2140
(block $2142
(block $2144
(block $2143
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2143
(block $2145
global.get $glob131
global.set $glob30
)
br $2144
)
(block $2147
(block $2146
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2146
(block $2148
global.get $glob132
global.set $glob31
)
br $2147
)
(block $2150
(block $2149
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2149
(block $2151
global.get $glob133
global.set $glob32
)
br $2150
)
(block $2153
(block $2152
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2152
(block $2154
global.get $glob134
global.set $glob33
)
br $2153
)
(block $2156
(block $2155
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2155
(block $2157
global.get $glob135
global.set $glob34
)
br $2156
)
(block $2159
(block $2158
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2158
(block $2160
global.get $glob136
global.set $glob35
)
br $2159
)
(block $2162
(block $2161
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2161
(block $2163
global.get $glob137
global.set $glob36
)
br $2162
)
(block $2165
(block $2164
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2164
(block $2166
global.get $glob138
global.set $glob37
)
br $2165
)
(block $2168
(block $2167
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2167
(block $2169
global.get $glob139
global.set $glob38
)
br $2168
)
(block $2170
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2170
(block $2171
global.get $glob140
global.set $glob39
)
)
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
br $2141
)
)
)
br $2138
)
(block $2173
(block $2172
local.get $loc0
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2172
(block $2174
(i32.const 0 )
local.set $loc1
(block $2175
(loop $2176
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2175
(block $2177
(block $2179
(block $2178
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2178
(block $2180
global.get $glob141
global.set $glob40
)
br $2179
)
(block $2182
(block $2181
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2181
(block $2183
global.get $glob142
global.set $glob41
)
br $2182
)
(block $2185
(block $2184
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2184
(block $2186
global.get $glob143
global.set $glob42
)
br $2185
)
(block $2188
(block $2187
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2187
(block $2189
global.get $glob144
global.set $glob43
)
br $2188
)
(block $2191
(block $2190
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2190
(block $2192
global.get $glob145
global.set $glob44
)
br $2191
)
(block $2194
(block $2193
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2193
(block $2195
global.get $glob146
global.set $glob45
)
br $2194
)
(block $2197
(block $2196
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2196
(block $2198
global.get $glob147
global.set $glob46
)
br $2197
)
(block $2200
(block $2199
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2199
(block $2201
global.get $glob148
global.set $glob47
)
br $2200
)
(block $2203
(block $2202
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2202
(block $2204
global.get $glob149
global.set $glob48
)
br $2203
)
(block $2205
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2205
(block $2206
global.get $glob150
global.set $glob49
)
)
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
br $2176
)
)
)
br $2173
)
(block $2208
(block $2207
local.get $loc0
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2207
(block $2209
(i32.const 0 )
local.set $loc1
(block $2210
(loop $2211
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2210
(block $2212
(block $2214
(block $2213
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2213
(block $2215
global.get $glob151
global.set $glob50
)
br $2214
)
(block $2217
(block $2216
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2216
(block $2218
global.get $glob152
global.set $glob51
)
br $2217
)
(block $2220
(block $2219
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2219
(block $2221
global.get $glob153
global.set $glob52
)
br $2220
)
(block $2223
(block $2222
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2222
(block $2224
global.get $glob154
global.set $glob53
)
br $2223
)
(block $2226
(block $2225
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2225
(block $2227
global.get $glob155
global.set $glob54
)
br $2226
)
(block $2229
(block $2228
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2228
(block $2230
global.get $glob156
global.set $glob55
)
br $2229
)
(block $2232
(block $2231
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2231
(block $2233
global.get $glob157
global.set $glob56
)
br $2232
)
(block $2235
(block $2234
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2234
(block $2236
global.get $glob158
global.set $glob57
)
br $2235
)
(block $2238
(block $2237
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2237
(block $2239
global.get $glob159
global.set $glob58
)
br $2238
)
(block $2240
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2240
(block $2241
global.get $glob160
global.set $glob59
)
)
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
br $2211
)
)
)
br $2208
)
(block $2243
(block $2242
local.get $loc0
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2242
(block $2244
(i32.const 0 )
local.set $loc1
(block $2245
(loop $2246
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2245
(block $2247
(block $2249
(block $2248
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2248
(block $2250
global.get $glob161
global.set $glob60
)
br $2249
)
(block $2252
(block $2251
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2251
(block $2253
global.get $glob162
global.set $glob61
)
br $2252
)
(block $2255
(block $2254
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2254
(block $2256
global.get $glob163
global.set $glob62
)
br $2255
)
(block $2258
(block $2257
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2257
(block $2259
global.get $glob164
global.set $glob63
)
br $2258
)
(block $2261
(block $2260
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2260
(block $2262
global.get $glob165
global.set $glob64
)
br $2261
)
(block $2264
(block $2263
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2263
(block $2265
global.get $glob166
global.set $glob65
)
br $2264
)
(block $2267
(block $2266
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2266
(block $2268
global.get $glob167
global.set $glob66
)
br $2267
)
(block $2270
(block $2269
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2269
(block $2271
global.get $glob168
global.set $glob67
)
br $2270
)
(block $2273
(block $2272
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2272
(block $2274
global.get $glob169
global.set $glob68
)
br $2273
)
(block $2275
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2275
(block $2276
global.get $glob170
global.set $glob69
)
)
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
br $2246
)
)
)
br $2243
)
(block $2278
(block $2277
local.get $loc0
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2277
(block $2279
(i32.const 0 )
local.set $loc1
(block $2280
(loop $2281
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2280
(block $2282
(block $2284
(block $2283
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2283
(block $2285
global.get $glob171
global.set $glob70
)
br $2284
)
(block $2287
(block $2286
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2286
(block $2288
global.get $glob172
global.set $glob71
)
br $2287
)
(block $2290
(block $2289
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2289
(block $2291
global.get $glob173
global.set $glob72
)
br $2290
)
(block $2293
(block $2292
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2292
(block $2294
global.get $glob174
global.set $glob73
)
br $2293
)
(block $2296
(block $2295
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2295
(block $2297
global.get $glob175
global.set $glob74
)
br $2296
)
(block $2299
(block $2298
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2298
(block $2300
global.get $glob176
global.set $glob75
)
br $2299
)
(block $2302
(block $2301
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2301
(block $2303
global.get $glob177
global.set $glob76
)
br $2302
)
(block $2305
(block $2304
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2304
(block $2306
global.get $glob178
global.set $glob77
)
br $2305
)
(block $2308
(block $2307
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2307
(block $2309
global.get $glob179
global.set $glob78
)
br $2308
)
(block $2310
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2310
(block $2311
global.get $glob180
global.set $glob79
)
)
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
br $2281
)
)
)
br $2278
)
(block $2313
(block $2312
local.get $loc0
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2312
(block $2314
(i32.const 0 )
local.set $loc1
(block $2315
(loop $2316
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2315
(block $2317
(block $2319
(block $2318
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2318
(block $2320
global.get $glob181
global.set $glob80
)
br $2319
)
(block $2322
(block $2321
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2321
(block $2323
global.get $glob182
global.set $glob81
)
br $2322
)
(block $2325
(block $2324
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2324
(block $2326
global.get $glob183
global.set $glob82
)
br $2325
)
(block $2328
(block $2327
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2327
(block $2329
global.get $glob184
global.set $glob83
)
br $2328
)
(block $2331
(block $2330
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2330
(block $2332
global.get $glob185
global.set $glob84
)
br $2331
)
(block $2334
(block $2333
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2333
(block $2335
global.get $glob186
global.set $glob85
)
br $2334
)
(block $2337
(block $2336
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2336
(block $2338
global.get $glob187
global.set $glob86
)
br $2337
)
(block $2340
(block $2339
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2339
(block $2341
global.get $glob188
global.set $glob87
)
br $2340
)
(block $2343
(block $2342
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2342
(block $2344
global.get $glob189
global.set $glob88
)
br $2343
)
(block $2345
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2345
(block $2346
global.get $glob190
global.set $glob89
)
)
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
br $2316
)
)
)
br $2313
)
(block $2347
local.get $loc0
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2347
(block $2348
(i32.const 0 )
local.set $loc1
(block $2349
(loop $2350
local.get $loc1
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2349
(block $2351
(block $2353
(block $2352
local.get $loc1
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2352
(block $2354
global.get $glob191
global.set $glob90
)
br $2353
)
(block $2356
(block $2355
local.get $loc1
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2355
(block $2357
global.get $glob192
global.set $glob91
)
br $2356
)
(block $2359
(block $2358
local.get $loc1
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2358
(block $2360
global.get $glob193
global.set $glob92
)
br $2359
)
(block $2362
(block $2361
local.get $loc1
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2361
(block $2363
global.get $glob194
global.set $glob93
)
br $2362
)
(block $2365
(block $2364
local.get $loc1
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2364
(block $2366
global.get $glob195
global.set $glob94
)
br $2365
)
(block $2368
(block $2367
local.get $loc1
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2367
(block $2369
global.get $glob196
global.set $glob95
)
br $2368
)
(block $2371
(block $2370
local.get $loc1
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2370
(block $2372
global.get $glob197
global.set $glob96
)
br $2371
)
(block $2374
(block $2373
local.get $loc1
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2373
(block $2375
global.get $glob198
global.set $glob97
)
br $2374
)
(block $2377
(block $2376
local.get $loc1
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2376
(block $2378
global.get $glob199
global.set $glob98
)
br $2377
)
(block $2379
local.get $loc1
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2379
(block $2380
global.get $glob200
global.set $glob99
)
)
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
br $2350
)
)
)
)
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
br $2030
)
)
local.get $loc2
call $printboard
local.get $loc2
(i32.const 1 )
i32.add
local.set $loc2
)
br $375
)
)
)
)
)
(start $main)
(func $neighbours
(param $loc202 i32)
(param $loc203 i32)
(result i32)
(local $ret204 i32)
(local $loc4 i32)
(block $2381
(block $2382
(i32.const 0 )
local.set $loc4
(block $2384
(block $2383
local.get $loc202
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2383
(block $2385
(block $2387
(block $2386
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2386
(block $2388
(block $2389
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2389
(block $2390
(block $2391
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2391
(block $2392
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2393
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2393
(block $2394
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2395
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2395
(block $2396
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $2397
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2397
(block $2398
local.get $loc4
global.get $glob1
i32.add
local.set $loc4
)
)
(block $2399
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2399
(block $2400
(block $2401
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2401
(block $2402
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob10
i32.add
local.set $loc4
(block $2403
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2403
(block $2404
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
)
)
)
)
)
br $2387
)
(block $2406
(block $2405
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2405
(block $2407
(block $2408
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2408
(block $2409
(block $2410
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2410
(block $2411
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2412
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2412
(block $2413
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2414
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2414
(block $2415
local.get $loc4
global.get $glob0
i32.add
local.set $loc4
)
)
(block $2416
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2416
(block $2417
local.get $loc4
global.get $glob2
i32.add
local.set $loc4
)
)
(block $2418
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2418
(block $2419
(block $2420
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2420
(block $2421
local.get $loc4
global.get $glob10
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
(block $2422
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2422
(block $2423
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
)
)
)
)
)
br $2406
)
(block $2425
(block $2424
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2424
(block $2426
(block $2427
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2427
(block $2428
(block $2429
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2429
(block $2430
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2431
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2431
(block $2432
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2433
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2433
(block $2434
local.get $loc4
global.get $glob1
i32.add
local.set $loc4
)
)
(block $2435
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2435
(block $2436
local.get $loc4
global.get $glob3
i32.add
local.set $loc4
)
)
(block $2437
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2437
(block $2438
(block $2439
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2439
(block $2440
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
(block $2441
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2441
(block $2442
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
)
)
)
)
)
br $2425
)
(block $2444
(block $2443
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2443
(block $2445
(block $2446
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2446
(block $2447
(block $2448
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2448
(block $2449
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2450
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2450
(block $2451
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2452
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2452
(block $2453
local.get $loc4
global.get $glob2
i32.add
local.set $loc4
)
)
(block $2454
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2454
(block $2455
local.get $loc4
global.get $glob4
i32.add
local.set $loc4
)
)
(block $2456
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2456
(block $2457
(block $2458
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2458
(block $2459
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
(block $2460
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2460
(block $2461
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
)
)
)
)
)
br $2444
)
(block $2463
(block $2462
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2462
(block $2464
(block $2465
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2465
(block $2466
(block $2467
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2467
(block $2468
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2469
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2469
(block $2470
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2471
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2471
(block $2472
local.get $loc4
global.get $glob3
i32.add
local.set $loc4
)
)
(block $2473
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2473
(block $2474
local.get $loc4
global.get $glob5
i32.add
local.set $loc4
)
)
(block $2475
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2475
(block $2476
(block $2477
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2477
(block $2478
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
(block $2479
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2479
(block $2480
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
)
)
)
)
)
br $2463
)
(block $2482
(block $2481
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2481
(block $2483
(block $2484
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2484
(block $2485
(block $2486
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2486
(block $2487
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2488
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2488
(block $2489
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2490
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2490
(block $2491
local.get $loc4
global.get $glob4
i32.add
local.set $loc4
)
)
(block $2492
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2492
(block $2493
local.get $loc4
global.get $glob6
i32.add
local.set $loc4
)
)
(block $2494
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2494
(block $2495
(block $2496
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2496
(block $2497
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
(block $2498
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2498
(block $2499
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
)
)
)
)
)
br $2482
)
(block $2501
(block $2500
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2500
(block $2502
(block $2503
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2503
(block $2504
(block $2505
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2505
(block $2506
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2507
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2507
(block $2508
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2509
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2509
(block $2510
local.get $loc4
global.get $glob5
i32.add
local.set $loc4
)
)
(block $2511
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2511
(block $2512
local.get $loc4
global.get $glob7
i32.add
local.set $loc4
)
)
(block $2513
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2513
(block $2514
(block $2515
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2515
(block $2516
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
(block $2517
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2517
(block $2518
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
)
)
)
)
)
br $2501
)
(block $2520
(block $2519
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2519
(block $2521
(block $2522
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2522
(block $2523
(block $2524
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2524
(block $2525
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2526
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2526
(block $2527
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2528
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2528
(block $2529
local.get $loc4
global.get $glob6
i32.add
local.set $loc4
)
)
(block $2530
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2530
(block $2531
local.get $loc4
global.get $glob8
i32.add
local.set $loc4
)
)
(block $2532
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2532
(block $2533
(block $2534
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2534
(block $2535
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
(block $2536
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2536
(block $2537
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
)
)
)
)
)
br $2520
)
(block $2539
(block $2538
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2538
(block $2540
(block $2541
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2541
(block $2542
(block $2543
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2543
(block $2544
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2545
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2545
(block $2546
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2547
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2547
(block $2548
local.get $loc4
global.get $glob7
i32.add
local.set $loc4
)
)
(block $2549
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2549
(block $2550
local.get $loc4
global.get $glob9
i32.add
local.set $loc4
)
)
(block $2551
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2551
(block $2552
(block $2553
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2553
(block $2554
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
(block $2555
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2555
(block $2556
local.get $loc4
global.get $glob19
i32.add
local.set $loc4
)
)
)
)
)
br $2539
)
(block $2557
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2557
(block $2558
(block $2559
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2559
(block $2560
(block $2561
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2561
(block $2562
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $2563
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2563
(block $2564
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2565
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2565
(block $2566
local.get $loc4
global.get $glob8
i32.add
local.set $loc4
)
)
(block $2567
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2567
(block $2568
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $2569
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2569
(block $2570
(block $2571
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2571
(block $2572
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob19
i32.add
local.set $loc4
(block $2573
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2573
(block $2574
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $2384
)
(block $2576
(block $2575
local.get $loc202
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2575
(block $2577
(block $2579
(block $2578
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2578
(block $2580
(block $2581
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2581
(block $2582
(block $2583
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2583
(block $2584
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob0
i32.add
local.set $loc4
(block $2585
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2585
(block $2586
local.get $loc4
global.get $glob1
i32.add
local.set $loc4
)
)
)
)
(block $2587
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2587
(block $2588
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $2589
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2589
(block $2590
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
)
)
(block $2591
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2591
(block $2592
(block $2593
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2593
(block $2594
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob20
i32.add
local.set $loc4
(block $2595
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2595
(block $2596
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
)
)
)
)
)
br $2579
)
(block $2598
(block $2597
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2597
(block $2599
(block $2600
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2600
(block $2601
(block $2602
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2602
(block $2603
local.get $loc4
global.get $glob0
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob1
i32.add
local.set $loc4
(block $2604
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2604
(block $2605
local.get $loc4
global.get $glob2
i32.add
local.set $loc4
)
)
)
)
(block $2606
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2606
(block $2607
local.get $loc4
global.get $glob10
i32.add
local.set $loc4
)
)
(block $2608
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2608
(block $2609
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
)
)
(block $2610
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2610
(block $2611
(block $2612
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2612
(block $2613
local.get $loc4
global.get $glob20
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
(block $2614
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2614
(block $2615
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
)
)
)
)
)
br $2598
)
(block $2617
(block $2616
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2616
(block $2618
(block $2619
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2619
(block $2620
(block $2621
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2621
(block $2622
local.get $loc4
global.get $glob1
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob2
i32.add
local.set $loc4
(block $2623
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2623
(block $2624
local.get $loc4
global.get $glob3
i32.add
local.set $loc4
)
)
)
)
(block $2625
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2625
(block $2626
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
)
)
(block $2627
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2627
(block $2628
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
)
)
(block $2629
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2629
(block $2630
(block $2631
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2631
(block $2632
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
(block $2633
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2633
(block $2634
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
)
)
)
)
)
br $2617
)
(block $2636
(block $2635
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2635
(block $2637
(block $2638
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2638
(block $2639
(block $2640
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2640
(block $2641
local.get $loc4
global.get $glob2
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob3
i32.add
local.set $loc4
(block $2642
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2642
(block $2643
local.get $loc4
global.get $glob4
i32.add
local.set $loc4
)
)
)
)
(block $2644
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2644
(block $2645
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
)
)
(block $2646
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2646
(block $2647
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
)
)
(block $2648
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2648
(block $2649
(block $2650
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2650
(block $2651
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
(block $2652
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2652
(block $2653
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
)
)
)
)
)
br $2636
)
(block $2655
(block $2654
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2654
(block $2656
(block $2657
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2657
(block $2658
(block $2659
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2659
(block $2660
local.get $loc4
global.get $glob3
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob4
i32.add
local.set $loc4
(block $2661
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2661
(block $2662
local.get $loc4
global.get $glob5
i32.add
local.set $loc4
)
)
)
)
(block $2663
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2663
(block $2664
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
)
)
(block $2665
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2665
(block $2666
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
)
)
(block $2667
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2667
(block $2668
(block $2669
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2669
(block $2670
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
(block $2671
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2671
(block $2672
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
)
)
)
)
)
br $2655
)
(block $2674
(block $2673
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2673
(block $2675
(block $2676
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2676
(block $2677
(block $2678
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2678
(block $2679
local.get $loc4
global.get $glob4
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob5
i32.add
local.set $loc4
(block $2680
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2680
(block $2681
local.get $loc4
global.get $glob6
i32.add
local.set $loc4
)
)
)
)
(block $2682
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2682
(block $2683
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
)
)
(block $2684
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2684
(block $2685
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
)
)
(block $2686
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2686
(block $2687
(block $2688
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2688
(block $2689
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
(block $2690
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2690
(block $2691
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
)
)
)
)
)
br $2674
)
(block $2693
(block $2692
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2692
(block $2694
(block $2695
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2695
(block $2696
(block $2697
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2697
(block $2698
local.get $loc4
global.get $glob5
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob6
i32.add
local.set $loc4
(block $2699
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2699
(block $2700
local.get $loc4
global.get $glob7
i32.add
local.set $loc4
)
)
)
)
(block $2701
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2701
(block $2702
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
)
)
(block $2703
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2703
(block $2704
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
)
)
(block $2705
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2705
(block $2706
(block $2707
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2707
(block $2708
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
(block $2709
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2709
(block $2710
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
)
)
)
)
)
br $2693
)
(block $2712
(block $2711
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2711
(block $2713
(block $2714
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2714
(block $2715
(block $2716
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2716
(block $2717
local.get $loc4
global.get $glob6
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob7
i32.add
local.set $loc4
(block $2718
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2718
(block $2719
local.get $loc4
global.get $glob8
i32.add
local.set $loc4
)
)
)
)
(block $2720
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2720
(block $2721
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
)
)
(block $2722
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2722
(block $2723
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
)
)
(block $2724
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2724
(block $2725
(block $2726
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2726
(block $2727
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
(block $2728
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2728
(block $2729
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
)
)
)
)
)
br $2712
)
(block $2731
(block $2730
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2730
(block $2732
(block $2733
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2733
(block $2734
(block $2735
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2735
(block $2736
local.get $loc4
global.get $glob7
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob8
i32.add
local.set $loc4
(block $2737
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2737
(block $2738
local.get $loc4
global.get $glob9
i32.add
local.set $loc4
)
)
)
)
(block $2739
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2739
(block $2740
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
)
)
(block $2741
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2741
(block $2742
local.get $loc4
global.get $glob19
i32.add
local.set $loc4
)
)
(block $2743
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2743
(block $2744
(block $2745
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2745
(block $2746
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
(block $2747
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2747
(block $2748
local.get $loc4
global.get $glob29
i32.add
local.set $loc4
)
)
)
)
)
br $2731
)
(block $2749
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2749
(block $2750
(block $2751
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2751
(block $2752
(block $2753
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2753
(block $2754
local.get $loc4
global.get $glob8
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob9
i32.add
local.set $loc4
(block $2755
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2755
(block $2756
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2757
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2757
(block $2758
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
)
)
(block $2759
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2759
(block $2760
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $2761
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2761
(block $2762
(block $2763
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2763
(block $2764
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob29
i32.add
local.set $loc4
(block $2765
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2765
(block $2766
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $2576
)
(block $2768
(block $2767
local.get $loc202
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2767
(block $2769
(block $2771
(block $2770
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2770
(block $2772
(block $2773
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2773
(block $2774
(block $2775
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2775
(block $2776
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob10
i32.add
local.set $loc4
(block $2777
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2777
(block $2778
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
)
)
)
)
(block $2779
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2779
(block $2780
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $2781
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2781
(block $2782
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
)
)
(block $2783
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2783
(block $2784
(block $2785
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2785
(block $2786
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob30
i32.add
local.set $loc4
(block $2787
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2787
(block $2788
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
)
)
)
)
)
br $2771
)
(block $2790
(block $2789
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2789
(block $2791
(block $2792
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2792
(block $2793
(block $2794
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2794
(block $2795
local.get $loc4
global.get $glob10
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
(block $2796
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2796
(block $2797
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
)
)
)
)
(block $2798
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2798
(block $2799
local.get $loc4
global.get $glob20
i32.add
local.set $loc4
)
)
(block $2800
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2800
(block $2801
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
)
)
(block $2802
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2802
(block $2803
(block $2804
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2804
(block $2805
local.get $loc4
global.get $glob30
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
(block $2806
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2806
(block $2807
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
)
)
)
)
)
br $2790
)
(block $2809
(block $2808
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2808
(block $2810
(block $2811
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2811
(block $2812
(block $2813
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2813
(block $2814
local.get $loc4
global.get $glob11
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
(block $2815
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2815
(block $2816
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
)
)
)
)
(block $2817
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2817
(block $2818
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
)
)
(block $2819
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2819
(block $2820
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
)
)
(block $2821
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2821
(block $2822
(block $2823
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2823
(block $2824
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
(block $2825
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2825
(block $2826
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
)
)
)
)
)
br $2809
)
(block $2828
(block $2827
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2827
(block $2829
(block $2830
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2830
(block $2831
(block $2832
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2832
(block $2833
local.get $loc4
global.get $glob12
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
(block $2834
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2834
(block $2835
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
)
)
)
)
(block $2836
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2836
(block $2837
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
)
)
(block $2838
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2838
(block $2839
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
)
)
(block $2840
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2840
(block $2841
(block $2842
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2842
(block $2843
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
(block $2844
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2844
(block $2845
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
)
)
)
)
)
br $2828
)
(block $2847
(block $2846
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2846
(block $2848
(block $2849
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2849
(block $2850
(block $2851
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2851
(block $2852
local.get $loc4
global.get $glob13
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
(block $2853
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2853
(block $2854
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
)
)
)
)
(block $2855
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2855
(block $2856
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
)
)
(block $2857
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2857
(block $2858
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
)
)
(block $2859
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2859
(block $2860
(block $2861
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2861
(block $2862
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
(block $2863
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2863
(block $2864
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
)
)
)
)
)
br $2847
)
(block $2866
(block $2865
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2865
(block $2867
(block $2868
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2868
(block $2869
(block $2870
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2870
(block $2871
local.get $loc4
global.get $glob14
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
(block $2872
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2872
(block $2873
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
)
)
)
)
(block $2874
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2874
(block $2875
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
)
)
(block $2876
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2876
(block $2877
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
)
)
(block $2878
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2878
(block $2879
(block $2880
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2880
(block $2881
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
(block $2882
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2882
(block $2883
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
)
)
)
)
)
br $2866
)
(block $2885
(block $2884
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2884
(block $2886
(block $2887
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2887
(block $2888
(block $2889
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2889
(block $2890
local.get $loc4
global.get $glob15
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
(block $2891
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2891
(block $2892
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
)
)
)
)
(block $2893
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2893
(block $2894
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
)
)
(block $2895
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2895
(block $2896
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
)
)
(block $2897
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2897
(block $2898
(block $2899
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2899
(block $2900
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
(block $2901
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2901
(block $2902
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
)
)
)
)
)
br $2885
)
(block $2904
(block $2903
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2903
(block $2905
(block $2906
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2906
(block $2907
(block $2908
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2908
(block $2909
local.get $loc4
global.get $glob16
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
(block $2910
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2910
(block $2911
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
)
)
)
)
(block $2912
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2912
(block $2913
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
)
)
(block $2914
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2914
(block $2915
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
)
)
(block $2916
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2916
(block $2917
(block $2918
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2918
(block $2919
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
(block $2920
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2920
(block $2921
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
)
)
)
)
)
br $2904
)
(block $2923
(block $2922
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2922
(block $2924
(block $2925
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2925
(block $2926
(block $2927
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2927
(block $2928
local.get $loc4
global.get $glob17
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
(block $2929
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2929
(block $2930
local.get $loc4
global.get $glob19
i32.add
local.set $loc4
)
)
)
)
(block $2931
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2931
(block $2932
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
)
)
(block $2933
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2933
(block $2934
local.get $loc4
global.get $glob29
i32.add
local.set $loc4
)
)
(block $2935
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2935
(block $2936
(block $2937
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2937
(block $2938
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
(block $2939
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2939
(block $2940
local.get $loc4
global.get $glob39
i32.add
local.set $loc4
)
)
)
)
)
br $2923
)
(block $2941
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2941
(block $2942
(block $2943
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2943
(block $2944
(block $2945
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2945
(block $2946
local.get $loc4
global.get $glob18
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob19
i32.add
local.set $loc4
(block $2947
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2947
(block $2948
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $2949
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2949
(block $2950
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
)
)
(block $2951
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2951
(block $2952
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $2953
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2953
(block $2954
(block $2955
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2955
(block $2956
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob39
i32.add
local.set $loc4
(block $2957
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2957
(block $2958
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $2768
)
(block $2960
(block $2959
local.get $loc202
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2959
(block $2961
(block $2963
(block $2962
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2962
(block $2964
(block $2965
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2965
(block $2966
(block $2967
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2967
(block $2968
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob20
i32.add
local.set $loc4
(block $2969
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2969
(block $2970
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
)
)
)
)
(block $2971
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2971
(block $2972
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $2973
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2973
(block $2974
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
)
)
(block $2975
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2975
(block $2976
(block $2977
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2977
(block $2978
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob40
i32.add
local.set $loc4
(block $2979
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2979
(block $2980
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
)
)
)
)
)
br $2963
)
(block $2982
(block $2981
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2981
(block $2983
(block $2984
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2984
(block $2985
(block $2986
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2986
(block $2987
local.get $loc4
global.get $glob20
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
(block $2988
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2988
(block $2989
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
)
)
)
)
(block $2990
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2990
(block $2991
local.get $loc4
global.get $glob30
i32.add
local.set $loc4
)
)
(block $2992
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2992
(block $2993
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
)
)
(block $2994
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2994
(block $2995
(block $2996
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2996
(block $2997
local.get $loc4
global.get $glob40
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
(block $2998
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $2998
(block $2999
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
)
)
)
)
)
br $2982
)
(block $3001
(block $3000
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3000
(block $3002
(block $3003
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3003
(block $3004
(block $3005
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3005
(block $3006
local.get $loc4
global.get $glob21
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
(block $3007
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3007
(block $3008
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
)
)
)
)
(block $3009
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3009
(block $3010
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
)
)
(block $3011
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3011
(block $3012
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
)
)
(block $3013
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3013
(block $3014
(block $3015
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3015
(block $3016
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
(block $3017
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3017
(block $3018
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
)
)
)
)
)
br $3001
)
(block $3020
(block $3019
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3019
(block $3021
(block $3022
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3022
(block $3023
(block $3024
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3024
(block $3025
local.get $loc4
global.get $glob22
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
(block $3026
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3026
(block $3027
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
)
)
)
)
(block $3028
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3028
(block $3029
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
)
)
(block $3030
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3030
(block $3031
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
)
)
(block $3032
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3032
(block $3033
(block $3034
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3034
(block $3035
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
(block $3036
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3036
(block $3037
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
)
)
)
)
)
br $3020
)
(block $3039
(block $3038
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3038
(block $3040
(block $3041
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3041
(block $3042
(block $3043
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3043
(block $3044
local.get $loc4
global.get $glob23
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
(block $3045
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3045
(block $3046
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
)
)
)
)
(block $3047
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3047
(block $3048
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
)
)
(block $3049
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3049
(block $3050
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
)
)
(block $3051
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3051
(block $3052
(block $3053
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3053
(block $3054
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
(block $3055
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3055
(block $3056
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
)
)
)
)
)
br $3039
)
(block $3058
(block $3057
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3057
(block $3059
(block $3060
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3060
(block $3061
(block $3062
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3062
(block $3063
local.get $loc4
global.get $glob24
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
(block $3064
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3064
(block $3065
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
)
)
)
)
(block $3066
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3066
(block $3067
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
)
)
(block $3068
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3068
(block $3069
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
)
)
(block $3070
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3070
(block $3071
(block $3072
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3072
(block $3073
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
(block $3074
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3074
(block $3075
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
)
)
)
)
)
br $3058
)
(block $3077
(block $3076
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3076
(block $3078
(block $3079
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3079
(block $3080
(block $3081
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3081
(block $3082
local.get $loc4
global.get $glob25
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
(block $3083
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3083
(block $3084
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
)
)
)
)
(block $3085
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3085
(block $3086
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
)
)
(block $3087
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3087
(block $3088
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
)
)
(block $3089
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3089
(block $3090
(block $3091
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3091
(block $3092
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
(block $3093
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3093
(block $3094
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
)
)
)
)
)
br $3077
)
(block $3096
(block $3095
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3095
(block $3097
(block $3098
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3098
(block $3099
(block $3100
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3100
(block $3101
local.get $loc4
global.get $glob26
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
(block $3102
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3102
(block $3103
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
)
)
)
)
(block $3104
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3104
(block $3105
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
)
)
(block $3106
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3106
(block $3107
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
)
)
(block $3108
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3108
(block $3109
(block $3110
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3110
(block $3111
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
(block $3112
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3112
(block $3113
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
)
)
)
)
)
br $3096
)
(block $3115
(block $3114
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3114
(block $3116
(block $3117
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3117
(block $3118
(block $3119
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3119
(block $3120
local.get $loc4
global.get $glob27
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
(block $3121
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3121
(block $3122
local.get $loc4
global.get $glob29
i32.add
local.set $loc4
)
)
)
)
(block $3123
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3123
(block $3124
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
)
)
(block $3125
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3125
(block $3126
local.get $loc4
global.get $glob39
i32.add
local.set $loc4
)
)
(block $3127
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3127
(block $3128
(block $3129
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3129
(block $3130
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
(block $3131
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3131
(block $3132
local.get $loc4
global.get $glob49
i32.add
local.set $loc4
)
)
)
)
)
br $3115
)
(block $3133
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3133
(block $3134
(block $3135
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3135
(block $3136
(block $3137
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3137
(block $3138
local.get $loc4
global.get $glob28
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob29
i32.add
local.set $loc4
(block $3139
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3139
(block $3140
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $3141
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3141
(block $3142
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
)
)
(block $3143
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3143
(block $3144
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3145
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3145
(block $3146
(block $3147
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3147
(block $3148
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob49
i32.add
local.set $loc4
(block $3149
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3149
(block $3150
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $2960
)
(block $3152
(block $3151
local.get $loc202
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3151
(block $3153
(block $3155
(block $3154
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3154
(block $3156
(block $3157
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3157
(block $3158
(block $3159
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3159
(block $3160
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob30
i32.add
local.set $loc4
(block $3161
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3161
(block $3162
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
)
)
)
)
(block $3163
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3163
(block $3164
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3165
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3165
(block $3166
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
)
)
(block $3167
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3167
(block $3168
(block $3169
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3169
(block $3170
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob50
i32.add
local.set $loc4
(block $3171
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3171
(block $3172
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
)
)
)
)
)
br $3155
)
(block $3174
(block $3173
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3173
(block $3175
(block $3176
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3176
(block $3177
(block $3178
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3178
(block $3179
local.get $loc4
global.get $glob30
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
(block $3180
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3180
(block $3181
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
)
)
)
)
(block $3182
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3182
(block $3183
local.get $loc4
global.get $glob40
i32.add
local.set $loc4
)
)
(block $3184
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3184
(block $3185
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
)
)
(block $3186
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3186
(block $3187
(block $3188
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3188
(block $3189
local.get $loc4
global.get $glob50
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
(block $3190
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3190
(block $3191
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
)
)
)
)
)
br $3174
)
(block $3193
(block $3192
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3192
(block $3194
(block $3195
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3195
(block $3196
(block $3197
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3197
(block $3198
local.get $loc4
global.get $glob31
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
(block $3199
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3199
(block $3200
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
)
)
)
)
(block $3201
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3201
(block $3202
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
)
)
(block $3203
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3203
(block $3204
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
)
)
(block $3205
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3205
(block $3206
(block $3207
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3207
(block $3208
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
(block $3209
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3209
(block $3210
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
)
)
)
)
)
br $3193
)
(block $3212
(block $3211
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3211
(block $3213
(block $3214
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3214
(block $3215
(block $3216
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3216
(block $3217
local.get $loc4
global.get $glob32
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
(block $3218
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3218
(block $3219
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
)
)
)
)
(block $3220
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3220
(block $3221
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
)
)
(block $3222
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3222
(block $3223
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
)
)
(block $3224
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3224
(block $3225
(block $3226
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3226
(block $3227
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
(block $3228
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3228
(block $3229
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
)
)
)
)
)
br $3212
)
(block $3231
(block $3230
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3230
(block $3232
(block $3233
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3233
(block $3234
(block $3235
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3235
(block $3236
local.get $loc4
global.get $glob33
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
(block $3237
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3237
(block $3238
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
)
)
)
)
(block $3239
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3239
(block $3240
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
)
)
(block $3241
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3241
(block $3242
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
)
)
(block $3243
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3243
(block $3244
(block $3245
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3245
(block $3246
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
(block $3247
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3247
(block $3248
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
)
)
)
)
)
br $3231
)
(block $3250
(block $3249
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3249
(block $3251
(block $3252
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3252
(block $3253
(block $3254
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3254
(block $3255
local.get $loc4
global.get $glob34
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
(block $3256
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3256
(block $3257
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
)
)
)
)
(block $3258
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3258
(block $3259
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
)
)
(block $3260
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3260
(block $3261
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
)
)
(block $3262
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3262
(block $3263
(block $3264
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3264
(block $3265
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
(block $3266
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3266
(block $3267
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
)
)
)
)
)
br $3250
)
(block $3269
(block $3268
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3268
(block $3270
(block $3271
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3271
(block $3272
(block $3273
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3273
(block $3274
local.get $loc4
global.get $glob35
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
(block $3275
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3275
(block $3276
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
)
)
)
)
(block $3277
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3277
(block $3278
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
)
)
(block $3279
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3279
(block $3280
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
)
)
(block $3281
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3281
(block $3282
(block $3283
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3283
(block $3284
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
(block $3285
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3285
(block $3286
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
)
)
)
)
)
br $3269
)
(block $3288
(block $3287
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3287
(block $3289
(block $3290
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3290
(block $3291
(block $3292
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3292
(block $3293
local.get $loc4
global.get $glob36
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
(block $3294
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3294
(block $3295
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
)
)
)
)
(block $3296
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3296
(block $3297
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
)
)
(block $3298
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3298
(block $3299
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
)
)
(block $3300
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3300
(block $3301
(block $3302
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3302
(block $3303
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
(block $3304
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3304
(block $3305
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
)
)
)
)
)
br $3288
)
(block $3307
(block $3306
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3306
(block $3308
(block $3309
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3309
(block $3310
(block $3311
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3311
(block $3312
local.get $loc4
global.get $glob37
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
(block $3313
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3313
(block $3314
local.get $loc4
global.get $glob39
i32.add
local.set $loc4
)
)
)
)
(block $3315
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3315
(block $3316
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
)
)
(block $3317
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3317
(block $3318
local.get $loc4
global.get $glob49
i32.add
local.set $loc4
)
)
(block $3319
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3319
(block $3320
(block $3321
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3321
(block $3322
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
(block $3323
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3323
(block $3324
local.get $loc4
global.get $glob59
i32.add
local.set $loc4
)
)
)
)
)
br $3307
)
(block $3325
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3325
(block $3326
(block $3327
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3327
(block $3328
(block $3329
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3329
(block $3330
local.get $loc4
global.get $glob38
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob39
i32.add
local.set $loc4
(block $3331
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3331
(block $3332
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $3333
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3333
(block $3334
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
)
)
(block $3335
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3335
(block $3336
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3337
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3337
(block $3338
(block $3339
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3339
(block $3340
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob59
i32.add
local.set $loc4
(block $3341
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3341
(block $3342
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $3152
)
(block $3344
(block $3343
local.get $loc202
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3343
(block $3345
(block $3347
(block $3346
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3346
(block $3348
(block $3349
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3349
(block $3350
(block $3351
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3351
(block $3352
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob40
i32.add
local.set $loc4
(block $3353
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3353
(block $3354
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
)
)
)
)
(block $3355
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3355
(block $3356
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3357
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3357
(block $3358
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
)
)
(block $3359
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3359
(block $3360
(block $3361
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3361
(block $3362
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob60
i32.add
local.set $loc4
(block $3363
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3363
(block $3364
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
)
)
)
)
)
br $3347
)
(block $3366
(block $3365
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3365
(block $3367
(block $3368
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3368
(block $3369
(block $3370
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3370
(block $3371
local.get $loc4
global.get $glob40
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
(block $3372
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3372
(block $3373
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
)
)
)
)
(block $3374
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3374
(block $3375
local.get $loc4
global.get $glob50
i32.add
local.set $loc4
)
)
(block $3376
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3376
(block $3377
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
)
)
(block $3378
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3378
(block $3379
(block $3380
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3380
(block $3381
local.get $loc4
global.get $glob60
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
(block $3382
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3382
(block $3383
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
)
)
)
)
)
br $3366
)
(block $3385
(block $3384
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3384
(block $3386
(block $3387
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3387
(block $3388
(block $3389
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3389
(block $3390
local.get $loc4
global.get $glob41
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
(block $3391
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3391
(block $3392
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
)
)
)
)
(block $3393
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3393
(block $3394
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
)
)
(block $3395
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3395
(block $3396
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
)
)
(block $3397
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3397
(block $3398
(block $3399
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3399
(block $3400
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
(block $3401
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3401
(block $3402
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
)
)
)
)
)
br $3385
)
(block $3404
(block $3403
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3403
(block $3405
(block $3406
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3406
(block $3407
(block $3408
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3408
(block $3409
local.get $loc4
global.get $glob42
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
(block $3410
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3410
(block $3411
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
)
)
)
)
(block $3412
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3412
(block $3413
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
)
)
(block $3414
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3414
(block $3415
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
)
)
(block $3416
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3416
(block $3417
(block $3418
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3418
(block $3419
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
(block $3420
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3420
(block $3421
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
)
)
)
)
)
br $3404
)
(block $3423
(block $3422
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3422
(block $3424
(block $3425
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3425
(block $3426
(block $3427
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3427
(block $3428
local.get $loc4
global.get $glob43
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
(block $3429
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3429
(block $3430
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
)
)
)
)
(block $3431
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3431
(block $3432
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
)
)
(block $3433
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3433
(block $3434
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
)
)
(block $3435
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3435
(block $3436
(block $3437
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3437
(block $3438
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
(block $3439
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3439
(block $3440
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
)
)
)
)
)
br $3423
)
(block $3442
(block $3441
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3441
(block $3443
(block $3444
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3444
(block $3445
(block $3446
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3446
(block $3447
local.get $loc4
global.get $glob44
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
(block $3448
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3448
(block $3449
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
)
)
)
)
(block $3450
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3450
(block $3451
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
)
)
(block $3452
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3452
(block $3453
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
)
)
(block $3454
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3454
(block $3455
(block $3456
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3456
(block $3457
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
(block $3458
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3458
(block $3459
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
)
)
)
)
)
br $3442
)
(block $3461
(block $3460
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3460
(block $3462
(block $3463
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3463
(block $3464
(block $3465
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3465
(block $3466
local.get $loc4
global.get $glob45
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
(block $3467
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3467
(block $3468
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
)
)
)
)
(block $3469
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3469
(block $3470
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
)
)
(block $3471
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3471
(block $3472
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
)
)
(block $3473
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3473
(block $3474
(block $3475
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3475
(block $3476
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
(block $3477
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3477
(block $3478
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
)
)
)
)
)
br $3461
)
(block $3480
(block $3479
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3479
(block $3481
(block $3482
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3482
(block $3483
(block $3484
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3484
(block $3485
local.get $loc4
global.get $glob46
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
(block $3486
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3486
(block $3487
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
)
)
)
)
(block $3488
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3488
(block $3489
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
)
)
(block $3490
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3490
(block $3491
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
)
)
(block $3492
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3492
(block $3493
(block $3494
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3494
(block $3495
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
(block $3496
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3496
(block $3497
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
)
)
)
)
)
br $3480
)
(block $3499
(block $3498
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3498
(block $3500
(block $3501
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3501
(block $3502
(block $3503
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3503
(block $3504
local.get $loc4
global.get $glob47
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
(block $3505
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3505
(block $3506
local.get $loc4
global.get $glob49
i32.add
local.set $loc4
)
)
)
)
(block $3507
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3507
(block $3508
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
)
)
(block $3509
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3509
(block $3510
local.get $loc4
global.get $glob59
i32.add
local.set $loc4
)
)
(block $3511
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3511
(block $3512
(block $3513
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3513
(block $3514
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
(block $3515
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3515
(block $3516
local.get $loc4
global.get $glob69
i32.add
local.set $loc4
)
)
)
)
)
br $3499
)
(block $3517
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3517
(block $3518
(block $3519
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3519
(block $3520
(block $3521
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3521
(block $3522
local.get $loc4
global.get $glob48
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob49
i32.add
local.set $loc4
(block $3523
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3523
(block $3524
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $3525
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3525
(block $3526
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
)
)
(block $3527
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3527
(block $3528
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3529
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3529
(block $3530
(block $3531
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3531
(block $3532
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob69
i32.add
local.set $loc4
(block $3533
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3533
(block $3534
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $3344
)
(block $3536
(block $3535
local.get $loc202
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3535
(block $3537
(block $3539
(block $3538
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3538
(block $3540
(block $3541
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3541
(block $3542
(block $3543
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3543
(block $3544
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob50
i32.add
local.set $loc4
(block $3545
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3545
(block $3546
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
)
)
)
)
(block $3547
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3547
(block $3548
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3549
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3549
(block $3550
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
)
)
(block $3551
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3551
(block $3552
(block $3553
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3553
(block $3554
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob70
i32.add
local.set $loc4
(block $3555
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3555
(block $3556
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
)
)
)
)
)
br $3539
)
(block $3558
(block $3557
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3557
(block $3559
(block $3560
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3560
(block $3561
(block $3562
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3562
(block $3563
local.get $loc4
global.get $glob50
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
(block $3564
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3564
(block $3565
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
)
)
)
)
(block $3566
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3566
(block $3567
local.get $loc4
global.get $glob60
i32.add
local.set $loc4
)
)
(block $3568
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3568
(block $3569
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
)
)
(block $3570
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3570
(block $3571
(block $3572
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3572
(block $3573
local.get $loc4
global.get $glob70
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
(block $3574
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3574
(block $3575
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
)
)
)
)
)
br $3558
)
(block $3577
(block $3576
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3576
(block $3578
(block $3579
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3579
(block $3580
(block $3581
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3581
(block $3582
local.get $loc4
global.get $glob51
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
(block $3583
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3583
(block $3584
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
)
)
)
)
(block $3585
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3585
(block $3586
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
)
)
(block $3587
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3587
(block $3588
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
)
)
(block $3589
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3589
(block $3590
(block $3591
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3591
(block $3592
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
(block $3593
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3593
(block $3594
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
)
)
)
)
)
br $3577
)
(block $3596
(block $3595
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3595
(block $3597
(block $3598
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3598
(block $3599
(block $3600
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3600
(block $3601
local.get $loc4
global.get $glob52
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
(block $3602
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3602
(block $3603
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
)
)
)
)
(block $3604
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3604
(block $3605
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
)
)
(block $3606
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3606
(block $3607
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
)
)
(block $3608
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3608
(block $3609
(block $3610
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3610
(block $3611
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
(block $3612
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3612
(block $3613
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
)
)
)
)
)
br $3596
)
(block $3615
(block $3614
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3614
(block $3616
(block $3617
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3617
(block $3618
(block $3619
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3619
(block $3620
local.get $loc4
global.get $glob53
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
(block $3621
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3621
(block $3622
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
)
)
)
)
(block $3623
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3623
(block $3624
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
)
)
(block $3625
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3625
(block $3626
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
)
)
(block $3627
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3627
(block $3628
(block $3629
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3629
(block $3630
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
(block $3631
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3631
(block $3632
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
)
)
)
)
)
br $3615
)
(block $3634
(block $3633
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3633
(block $3635
(block $3636
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3636
(block $3637
(block $3638
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3638
(block $3639
local.get $loc4
global.get $glob54
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
(block $3640
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3640
(block $3641
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
)
)
)
)
(block $3642
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3642
(block $3643
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
)
)
(block $3644
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3644
(block $3645
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
)
)
(block $3646
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3646
(block $3647
(block $3648
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3648
(block $3649
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
(block $3650
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3650
(block $3651
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
)
)
)
)
)
br $3634
)
(block $3653
(block $3652
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3652
(block $3654
(block $3655
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3655
(block $3656
(block $3657
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3657
(block $3658
local.get $loc4
global.get $glob55
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
(block $3659
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3659
(block $3660
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
)
)
)
)
(block $3661
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3661
(block $3662
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
)
)
(block $3663
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3663
(block $3664
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
)
)
(block $3665
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3665
(block $3666
(block $3667
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3667
(block $3668
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
(block $3669
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3669
(block $3670
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
)
)
)
)
)
br $3653
)
(block $3672
(block $3671
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3671
(block $3673
(block $3674
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3674
(block $3675
(block $3676
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3676
(block $3677
local.get $loc4
global.get $glob56
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
(block $3678
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3678
(block $3679
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
)
)
)
)
(block $3680
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3680
(block $3681
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
)
)
(block $3682
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3682
(block $3683
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
)
)
(block $3684
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3684
(block $3685
(block $3686
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3686
(block $3687
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
(block $3688
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3688
(block $3689
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
)
)
)
)
)
br $3672
)
(block $3691
(block $3690
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3690
(block $3692
(block $3693
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3693
(block $3694
(block $3695
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3695
(block $3696
local.get $loc4
global.get $glob57
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
(block $3697
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3697
(block $3698
local.get $loc4
global.get $glob59
i32.add
local.set $loc4
)
)
)
)
(block $3699
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3699
(block $3700
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
)
)
(block $3701
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3701
(block $3702
local.get $loc4
global.get $glob69
i32.add
local.set $loc4
)
)
(block $3703
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3703
(block $3704
(block $3705
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3705
(block $3706
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
(block $3707
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3707
(block $3708
local.get $loc4
global.get $glob79
i32.add
local.set $loc4
)
)
)
)
)
br $3691
)
(block $3709
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3709
(block $3710
(block $3711
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3711
(block $3712
(block $3713
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3713
(block $3714
local.get $loc4
global.get $glob58
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob59
i32.add
local.set $loc4
(block $3715
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3715
(block $3716
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $3717
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3717
(block $3718
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
)
)
(block $3719
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3719
(block $3720
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3721
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3721
(block $3722
(block $3723
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3723
(block $3724
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob79
i32.add
local.set $loc4
(block $3725
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3725
(block $3726
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $3536
)
(block $3728
(block $3727
local.get $loc202
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3727
(block $3729
(block $3731
(block $3730
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3730
(block $3732
(block $3733
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3733
(block $3734
(block $3735
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3735
(block $3736
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob60
i32.add
local.set $loc4
(block $3737
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3737
(block $3738
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
)
)
)
)
(block $3739
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3739
(block $3740
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3741
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3741
(block $3742
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
)
)
(block $3743
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3743
(block $3744
(block $3745
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3745
(block $3746
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob80
i32.add
local.set $loc4
(block $3747
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3747
(block $3748
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
)
)
)
)
)
br $3731
)
(block $3750
(block $3749
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3749
(block $3751
(block $3752
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3752
(block $3753
(block $3754
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3754
(block $3755
local.get $loc4
global.get $glob60
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
(block $3756
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3756
(block $3757
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
)
)
)
)
(block $3758
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3758
(block $3759
local.get $loc4
global.get $glob70
i32.add
local.set $loc4
)
)
(block $3760
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3760
(block $3761
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
)
)
(block $3762
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3762
(block $3763
(block $3764
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3764
(block $3765
local.get $loc4
global.get $glob80
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
(block $3766
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3766
(block $3767
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
)
)
)
)
)
br $3750
)
(block $3769
(block $3768
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3768
(block $3770
(block $3771
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3771
(block $3772
(block $3773
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3773
(block $3774
local.get $loc4
global.get $glob61
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
(block $3775
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3775
(block $3776
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
)
)
)
)
(block $3777
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3777
(block $3778
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
)
)
(block $3779
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3779
(block $3780
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
)
)
(block $3781
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3781
(block $3782
(block $3783
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3783
(block $3784
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
(block $3785
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3785
(block $3786
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
)
)
)
)
)
br $3769
)
(block $3788
(block $3787
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3787
(block $3789
(block $3790
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3790
(block $3791
(block $3792
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3792
(block $3793
local.get $loc4
global.get $glob62
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
(block $3794
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3794
(block $3795
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
)
)
)
)
(block $3796
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3796
(block $3797
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
)
)
(block $3798
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3798
(block $3799
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
)
)
(block $3800
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3800
(block $3801
(block $3802
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3802
(block $3803
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
(block $3804
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3804
(block $3805
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
)
)
)
)
)
br $3788
)
(block $3807
(block $3806
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3806
(block $3808
(block $3809
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3809
(block $3810
(block $3811
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3811
(block $3812
local.get $loc4
global.get $glob63
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
(block $3813
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3813
(block $3814
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
)
)
)
)
(block $3815
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3815
(block $3816
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
)
)
(block $3817
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3817
(block $3818
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
)
)
(block $3819
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3819
(block $3820
(block $3821
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3821
(block $3822
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
(block $3823
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3823
(block $3824
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
)
)
)
)
)
br $3807
)
(block $3826
(block $3825
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3825
(block $3827
(block $3828
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3828
(block $3829
(block $3830
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3830
(block $3831
local.get $loc4
global.get $glob64
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
(block $3832
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3832
(block $3833
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
)
)
)
)
(block $3834
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3834
(block $3835
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
)
)
(block $3836
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3836
(block $3837
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
)
)
(block $3838
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3838
(block $3839
(block $3840
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3840
(block $3841
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
(block $3842
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3842
(block $3843
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
)
)
)
)
)
br $3826
)
(block $3845
(block $3844
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3844
(block $3846
(block $3847
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3847
(block $3848
(block $3849
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3849
(block $3850
local.get $loc4
global.get $glob65
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
(block $3851
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3851
(block $3852
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
)
)
)
)
(block $3853
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3853
(block $3854
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
)
)
(block $3855
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3855
(block $3856
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
)
)
(block $3857
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3857
(block $3858
(block $3859
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3859
(block $3860
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
(block $3861
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3861
(block $3862
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
)
)
)
)
)
br $3845
)
(block $3864
(block $3863
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3863
(block $3865
(block $3866
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3866
(block $3867
(block $3868
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3868
(block $3869
local.get $loc4
global.get $glob66
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
(block $3870
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3870
(block $3871
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
)
)
)
)
(block $3872
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3872
(block $3873
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
)
)
(block $3874
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3874
(block $3875
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
)
)
(block $3876
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3876
(block $3877
(block $3878
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3878
(block $3879
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
(block $3880
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3880
(block $3881
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
)
)
)
)
)
br $3864
)
(block $3883
(block $3882
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3882
(block $3884
(block $3885
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3885
(block $3886
(block $3887
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3887
(block $3888
local.get $loc4
global.get $glob67
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
(block $3889
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3889
(block $3890
local.get $loc4
global.get $glob69
i32.add
local.set $loc4
)
)
)
)
(block $3891
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3891
(block $3892
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
)
)
(block $3893
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3893
(block $3894
local.get $loc4
global.get $glob79
i32.add
local.set $loc4
)
)
(block $3895
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3895
(block $3896
(block $3897
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3897
(block $3898
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
(block $3899
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3899
(block $3900
local.get $loc4
global.get $glob89
i32.add
local.set $loc4
)
)
)
)
)
br $3883
)
(block $3901
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3901
(block $3902
(block $3903
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3903
(block $3904
(block $3905
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3905
(block $3906
local.get $loc4
global.get $glob68
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob69
i32.add
local.set $loc4
(block $3907
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3907
(block $3908
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $3909
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3909
(block $3910
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
)
)
(block $3911
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3911
(block $3912
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3913
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3913
(block $3914
(block $3915
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3915
(block $3916
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob89
i32.add
local.set $loc4
(block $3917
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3917
(block $3918
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $3728
)
(block $3920
(block $3919
local.get $loc202
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3919
(block $3921
(block $3923
(block $3922
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3922
(block $3924
(block $3925
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3925
(block $3926
(block $3927
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3927
(block $3928
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob70
i32.add
local.set $loc4
(block $3929
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3929
(block $3930
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
)
)
)
)
(block $3931
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3931
(block $3932
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $3933
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3933
(block $3934
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
)
)
(block $3935
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3935
(block $3936
(block $3937
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3937
(block $3938
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob90
i32.add
local.set $loc4
(block $3939
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3939
(block $3940
local.get $loc4
global.get $glob91
i32.add
local.set $loc4
)
)
)
)
)
br $3923
)
(block $3942
(block $3941
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3941
(block $3943
(block $3944
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3944
(block $3945
(block $3946
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3946
(block $3947
local.get $loc4
global.get $glob70
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
(block $3948
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3948
(block $3949
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
)
)
)
)
(block $3950
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3950
(block $3951
local.get $loc4
global.get $glob80
i32.add
local.set $loc4
)
)
(block $3952
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3952
(block $3953
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
)
)
(block $3954
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3954
(block $3955
(block $3956
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3956
(block $3957
local.get $loc4
global.get $glob90
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob91
i32.add
local.set $loc4
(block $3958
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3958
(block $3959
local.get $loc4
global.get $glob92
i32.add
local.set $loc4
)
)
)
)
)
br $3942
)
(block $3961
(block $3960
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3960
(block $3962
(block $3963
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3963
(block $3964
(block $3965
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3965
(block $3966
local.get $loc4
global.get $glob71
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
(block $3967
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3967
(block $3968
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
)
)
)
)
(block $3969
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3969
(block $3970
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
)
)
(block $3971
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3971
(block $3972
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
)
)
(block $3973
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3973
(block $3974
(block $3975
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3975
(block $3976
local.get $loc4
global.get $glob91
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob92
i32.add
local.set $loc4
(block $3977
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3977
(block $3978
local.get $loc4
global.get $glob93
i32.add
local.set $loc4
)
)
)
)
)
br $3961
)
(block $3980
(block $3979
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3979
(block $3981
(block $3982
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3982
(block $3983
(block $3984
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3984
(block $3985
local.get $loc4
global.get $glob72
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
(block $3986
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3986
(block $3987
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
)
)
)
)
(block $3988
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3988
(block $3989
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
)
)
(block $3990
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3990
(block $3991
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
)
)
(block $3992
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3992
(block $3993
(block $3994
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3994
(block $3995
local.get $loc4
global.get $glob92
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob93
i32.add
local.set $loc4
(block $3996
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3996
(block $3997
local.get $loc4
global.get $glob94
i32.add
local.set $loc4
)
)
)
)
)
br $3980
)
(block $3999
(block $3998
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $3998
(block $4000
(block $4001
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4001
(block $4002
(block $4003
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4003
(block $4004
local.get $loc4
global.get $glob73
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
(block $4005
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4005
(block $4006
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
)
)
)
)
(block $4007
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4007
(block $4008
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
)
)
(block $4009
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4009
(block $4010
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
)
)
(block $4011
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4011
(block $4012
(block $4013
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4013
(block $4014
local.get $loc4
global.get $glob93
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob94
i32.add
local.set $loc4
(block $4015
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4015
(block $4016
local.get $loc4
global.get $glob95
i32.add
local.set $loc4
)
)
)
)
)
br $3999
)
(block $4018
(block $4017
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4017
(block $4019
(block $4020
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4020
(block $4021
(block $4022
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4022
(block $4023
local.get $loc4
global.get $glob74
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
(block $4024
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4024
(block $4025
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
)
)
)
)
(block $4026
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4026
(block $4027
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
)
)
(block $4028
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4028
(block $4029
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
)
)
(block $4030
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4030
(block $4031
(block $4032
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4032
(block $4033
local.get $loc4
global.get $glob94
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob95
i32.add
local.set $loc4
(block $4034
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4034
(block $4035
local.get $loc4
global.get $glob96
i32.add
local.set $loc4
)
)
)
)
)
br $4018
)
(block $4037
(block $4036
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4036
(block $4038
(block $4039
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4039
(block $4040
(block $4041
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4041
(block $4042
local.get $loc4
global.get $glob75
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
(block $4043
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4043
(block $4044
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
)
)
)
)
(block $4045
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4045
(block $4046
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
)
)
(block $4047
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4047
(block $4048
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
)
)
(block $4049
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4049
(block $4050
(block $4051
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4051
(block $4052
local.get $loc4
global.get $glob95
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob96
i32.add
local.set $loc4
(block $4053
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4053
(block $4054
local.get $loc4
global.get $glob97
i32.add
local.set $loc4
)
)
)
)
)
br $4037
)
(block $4056
(block $4055
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4055
(block $4057
(block $4058
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4058
(block $4059
(block $4060
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4060
(block $4061
local.get $loc4
global.get $glob76
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
(block $4062
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4062
(block $4063
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
)
)
)
)
(block $4064
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4064
(block $4065
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
)
)
(block $4066
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4066
(block $4067
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
)
)
(block $4068
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4068
(block $4069
(block $4070
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4070
(block $4071
local.get $loc4
global.get $glob96
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob97
i32.add
local.set $loc4
(block $4072
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4072
(block $4073
local.get $loc4
global.get $glob98
i32.add
local.set $loc4
)
)
)
)
)
br $4056
)
(block $4075
(block $4074
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4074
(block $4076
(block $4077
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4077
(block $4078
(block $4079
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4079
(block $4080
local.get $loc4
global.get $glob77
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
(block $4081
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4081
(block $4082
local.get $loc4
global.get $glob79
i32.add
local.set $loc4
)
)
)
)
(block $4083
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4083
(block $4084
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
)
)
(block $4085
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4085
(block $4086
local.get $loc4
global.get $glob89
i32.add
local.set $loc4
)
)
(block $4087
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4087
(block $4088
(block $4089
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4089
(block $4090
local.get $loc4
global.get $glob97
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob98
i32.add
local.set $loc4
(block $4091
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4091
(block $4092
local.get $loc4
global.get $glob99
i32.add
local.set $loc4
)
)
)
)
)
br $4075
)
(block $4093
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4093
(block $4094
(block $4095
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4095
(block $4096
(block $4097
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4097
(block $4098
local.get $loc4
global.get $glob78
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob79
i32.add
local.set $loc4
(block $4099
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4099
(block $4100
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $4101
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4101
(block $4102
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
)
)
(block $4103
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4103
(block $4104
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $4105
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4105
(block $4106
(block $4107
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4107
(block $4108
local.get $loc4
global.get $glob98
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob99
i32.add
local.set $loc4
(block $4109
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4109
(block $4110
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
br $3920
)
(block $4111
local.get $loc202
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4111
(block $4112
(block $4114
(block $4113
local.get $loc203
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4113
(block $4115
(block $4116
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4116
(block $4117
(block $4118
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4118
(block $4119
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob80
i32.add
local.set $loc4
(block $4120
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4120
(block $4121
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
)
)
)
)
(block $4122
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4122
(block $4123
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $4124
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4124
(block $4125
local.get $loc4
global.get $glob91
i32.add
local.set $loc4
)
)
(block $4126
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4126
(block $4127
(block $4128
(i32.const 0 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4128
(block $4129
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4130
(i32.const 0 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4130
(block $4131
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4114
)
(block $4133
(block $4132
local.get $loc203
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4132
(block $4134
(block $4135
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4135
(block $4136
(block $4137
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4137
(block $4138
local.get $loc4
global.get $glob80
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
(block $4139
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4139
(block $4140
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
)
)
)
)
(block $4141
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4141
(block $4142
local.get $loc4
global.get $glob90
i32.add
local.set $loc4
)
)
(block $4143
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4143
(block $4144
local.get $loc4
global.get $glob92
i32.add
local.set $loc4
)
)
(block $4145
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4145
(block $4146
(block $4147
(i32.const 1 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4147
(block $4148
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4149
(i32.const 1 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4149
(block $4150
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4133
)
(block $4152
(block $4151
local.get $loc203
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4151
(block $4153
(block $4154
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4154
(block $4155
(block $4156
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4156
(block $4157
local.get $loc4
global.get $glob81
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
(block $4158
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4158
(block $4159
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
)
)
)
)
(block $4160
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4160
(block $4161
local.get $loc4
global.get $glob91
i32.add
local.set $loc4
)
)
(block $4162
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4162
(block $4163
local.get $loc4
global.get $glob93
i32.add
local.set $loc4
)
)
(block $4164
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4164
(block $4165
(block $4166
(i32.const 2 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4166
(block $4167
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4168
(i32.const 2 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4168
(block $4169
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4152
)
(block $4171
(block $4170
local.get $loc203
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4170
(block $4172
(block $4173
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4173
(block $4174
(block $4175
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4175
(block $4176
local.get $loc4
global.get $glob82
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
(block $4177
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4177
(block $4178
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
)
)
)
)
(block $4179
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4179
(block $4180
local.get $loc4
global.get $glob92
i32.add
local.set $loc4
)
)
(block $4181
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4181
(block $4182
local.get $loc4
global.get $glob94
i32.add
local.set $loc4
)
)
(block $4183
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4183
(block $4184
(block $4185
(i32.const 3 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4185
(block $4186
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4187
(i32.const 3 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4187
(block $4188
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4171
)
(block $4190
(block $4189
local.get $loc203
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4189
(block $4191
(block $4192
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4192
(block $4193
(block $4194
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4194
(block $4195
local.get $loc4
global.get $glob83
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
(block $4196
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4196
(block $4197
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
)
)
)
)
(block $4198
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4198
(block $4199
local.get $loc4
global.get $glob93
i32.add
local.set $loc4
)
)
(block $4200
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4200
(block $4201
local.get $loc4
global.get $glob95
i32.add
local.set $loc4
)
)
(block $4202
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4202
(block $4203
(block $4204
(i32.const 4 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4204
(block $4205
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4206
(i32.const 4 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4206
(block $4207
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4190
)
(block $4209
(block $4208
local.get $loc203
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4208
(block $4210
(block $4211
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4211
(block $4212
(block $4213
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4213
(block $4214
local.get $loc4
global.get $glob84
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
(block $4215
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4215
(block $4216
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
)
)
)
)
(block $4217
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4217
(block $4218
local.get $loc4
global.get $glob94
i32.add
local.set $loc4
)
)
(block $4219
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4219
(block $4220
local.get $loc4
global.get $glob96
i32.add
local.set $loc4
)
)
(block $4221
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4221
(block $4222
(block $4223
(i32.const 5 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4223
(block $4224
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4225
(i32.const 5 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4225
(block $4226
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4209
)
(block $4228
(block $4227
local.get $loc203
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4227
(block $4229
(block $4230
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4230
(block $4231
(block $4232
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4232
(block $4233
local.get $loc4
global.get $glob85
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
(block $4234
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4234
(block $4235
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
)
)
)
)
(block $4236
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4236
(block $4237
local.get $loc4
global.get $glob95
i32.add
local.set $loc4
)
)
(block $4238
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4238
(block $4239
local.get $loc4
global.get $glob97
i32.add
local.set $loc4
)
)
(block $4240
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4240
(block $4241
(block $4242
(i32.const 6 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4242
(block $4243
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4244
(i32.const 6 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4244
(block $4245
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4228
)
(block $4247
(block $4246
local.get $loc203
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4246
(block $4248
(block $4249
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4249
(block $4250
(block $4251
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4251
(block $4252
local.get $loc4
global.get $glob86
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
(block $4253
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4253
(block $4254
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
)
)
)
)
(block $4255
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4255
(block $4256
local.get $loc4
global.get $glob96
i32.add
local.set $loc4
)
)
(block $4257
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4257
(block $4258
local.get $loc4
global.get $glob98
i32.add
local.set $loc4
)
)
(block $4259
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4259
(block $4260
(block $4261
(i32.const 7 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4261
(block $4262
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4263
(i32.const 7 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4263
(block $4264
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4247
)
(block $4266
(block $4265
local.get $loc203
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4265
(block $4267
(block $4268
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4268
(block $4269
(block $4270
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4270
(block $4271
local.get $loc4
global.get $glob87
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
(block $4272
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4272
(block $4273
local.get $loc4
global.get $glob89
i32.add
local.set $loc4
)
)
)
)
(block $4274
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4274
(block $4275
local.get $loc4
global.get $glob97
i32.add
local.set $loc4
)
)
(block $4276
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4276
(block $4277
local.get $loc4
global.get $glob99
i32.add
local.set $loc4
)
)
(block $4278
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4278
(block $4279
(block $4280
(i32.const 8 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4280
(block $4281
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4282
(i32.const 8 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4282
(block $4283
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
br $4266
)
(block $4284
local.get $loc203
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4284
(block $4285
(block $4286
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4286
(block $4287
(block $4288
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4288
(block $4289
local.get $loc4
global.get $glob88
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob89
i32.add
local.set $loc4
(block $4290
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4290
(block $4291
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
(block $4292
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4292
(block $4293
local.get $loc4
global.get $glob98
i32.add
local.set $loc4
)
)
(block $4294
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4294
(block $4295
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
(block $4296
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4296
(block $4297
(block $4298
(i32.const 9 )
(i32.const 0 )
i32.gt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4298
(block $4299
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
(block $4300
(i32.const 9 )
(i32.const 9 )
i32.lt_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4300
(block $4301
local.get $loc4
global.get $glob100
i32.add
local.set $loc4
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
)
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
local.set $ret204
br $2381
)
)
(local.get $ret204)
)
(func $printboard
(param $loc205 i32)
(local $loc5 i32)
(local $loc6 i32)
(block $4302
(block $4303
i32.const 9
i32.const 20
call $prints
local.get $loc205
call $printi
i32.const 20
i32.const 22
call $prints
(i32.const 0 )
local.set $loc5
(block $4304
(loop $4305
local.get $loc5
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4304
(block $4306
(block $4308
(block $4307
local.get $loc5
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4307
(block $4309
(i32.const 0 )
local.set $loc6
(block $4310
(loop $4311
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4310
(block $4312
(block $4314
(block $4313
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4313
(block $4315
global.get $glob0
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4314
)
(block $4317
(block $4316
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4316
(block $4318
global.get $glob1
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4317
)
(block $4320
(block $4319
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4319
(block $4321
global.get $glob2
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4320
)
(block $4323
(block $4322
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4322
(block $4324
global.get $glob3
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4323
)
(block $4326
(block $4325
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4325
(block $4327
global.get $glob4
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4326
)
(block $4329
(block $4328
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4328
(block $4330
global.get $glob5
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4329
)
(block $4332
(block $4331
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4331
(block $4333
global.get $glob6
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4332
)
(block $4335
(block $4334
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4334
(block $4336
global.get $glob7
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4335
)
(block $4338
(block $4337
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4337
(block $4339
global.get $glob8
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4338
)
(block $4340
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4340
(block $4341
global.get $glob9
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4311
)
)
)
br $4308
)
(block $4343
(block $4342
local.get $loc5
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4342
(block $4344
(i32.const 0 )
local.set $loc6
(block $4345
(loop $4346
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4345
(block $4347
(block $4349
(block $4348
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4348
(block $4350
global.get $glob10
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4349
)
(block $4352
(block $4351
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4351
(block $4353
global.get $glob11
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4352
)
(block $4355
(block $4354
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4354
(block $4356
global.get $glob12
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4355
)
(block $4358
(block $4357
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4357
(block $4359
global.get $glob13
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4358
)
(block $4361
(block $4360
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4360
(block $4362
global.get $glob14
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4361
)
(block $4364
(block $4363
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4363
(block $4365
global.get $glob15
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4364
)
(block $4367
(block $4366
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4366
(block $4368
global.get $glob16
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4367
)
(block $4370
(block $4369
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4369
(block $4371
global.get $glob17
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4370
)
(block $4373
(block $4372
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4372
(block $4374
global.get $glob18
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4373
)
(block $4375
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4375
(block $4376
global.get $glob19
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4346
)
)
)
br $4343
)
(block $4378
(block $4377
local.get $loc5
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4377
(block $4379
(i32.const 0 )
local.set $loc6
(block $4380
(loop $4381
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4380
(block $4382
(block $4384
(block $4383
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4383
(block $4385
global.get $glob20
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4384
)
(block $4387
(block $4386
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4386
(block $4388
global.get $glob21
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4387
)
(block $4390
(block $4389
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4389
(block $4391
global.get $glob22
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4390
)
(block $4393
(block $4392
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4392
(block $4394
global.get $glob23
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4393
)
(block $4396
(block $4395
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4395
(block $4397
global.get $glob24
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4396
)
(block $4399
(block $4398
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4398
(block $4400
global.get $glob25
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4399
)
(block $4402
(block $4401
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4401
(block $4403
global.get $glob26
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4402
)
(block $4405
(block $4404
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4404
(block $4406
global.get $glob27
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4405
)
(block $4408
(block $4407
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4407
(block $4409
global.get $glob28
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4408
)
(block $4410
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4410
(block $4411
global.get $glob29
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4381
)
)
)
br $4378
)
(block $4413
(block $4412
local.get $loc5
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4412
(block $4414
(i32.const 0 )
local.set $loc6
(block $4415
(loop $4416
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4415
(block $4417
(block $4419
(block $4418
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4418
(block $4420
global.get $glob30
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4419
)
(block $4422
(block $4421
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4421
(block $4423
global.get $glob31
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4422
)
(block $4425
(block $4424
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4424
(block $4426
global.get $glob32
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4425
)
(block $4428
(block $4427
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4427
(block $4429
global.get $glob33
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4428
)
(block $4431
(block $4430
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4430
(block $4432
global.get $glob34
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4431
)
(block $4434
(block $4433
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4433
(block $4435
global.get $glob35
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4434
)
(block $4437
(block $4436
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4436
(block $4438
global.get $glob36
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4437
)
(block $4440
(block $4439
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4439
(block $4441
global.get $glob37
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4440
)
(block $4443
(block $4442
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4442
(block $4444
global.get $glob38
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4443
)
(block $4445
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4445
(block $4446
global.get $glob39
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4416
)
)
)
br $4413
)
(block $4448
(block $4447
local.get $loc5
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4447
(block $4449
(i32.const 0 )
local.set $loc6
(block $4450
(loop $4451
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4450
(block $4452
(block $4454
(block $4453
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4453
(block $4455
global.get $glob40
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4454
)
(block $4457
(block $4456
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4456
(block $4458
global.get $glob41
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4457
)
(block $4460
(block $4459
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4459
(block $4461
global.get $glob42
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4460
)
(block $4463
(block $4462
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4462
(block $4464
global.get $glob43
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4463
)
(block $4466
(block $4465
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4465
(block $4467
global.get $glob44
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4466
)
(block $4469
(block $4468
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4468
(block $4470
global.get $glob45
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4469
)
(block $4472
(block $4471
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4471
(block $4473
global.get $glob46
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4472
)
(block $4475
(block $4474
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4474
(block $4476
global.get $glob47
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4475
)
(block $4478
(block $4477
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4477
(block $4479
global.get $glob48
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4478
)
(block $4480
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4480
(block $4481
global.get $glob49
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4451
)
)
)
br $4448
)
(block $4483
(block $4482
local.get $loc5
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4482
(block $4484
(i32.const 0 )
local.set $loc6
(block $4485
(loop $4486
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4485
(block $4487
(block $4489
(block $4488
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4488
(block $4490
global.get $glob50
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4489
)
(block $4492
(block $4491
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4491
(block $4493
global.get $glob51
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4492
)
(block $4495
(block $4494
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4494
(block $4496
global.get $glob52
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4495
)
(block $4498
(block $4497
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4497
(block $4499
global.get $glob53
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4498
)
(block $4501
(block $4500
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4500
(block $4502
global.get $glob54
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4501
)
(block $4504
(block $4503
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4503
(block $4505
global.get $glob55
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4504
)
(block $4507
(block $4506
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4506
(block $4508
global.get $glob56
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4507
)
(block $4510
(block $4509
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4509
(block $4511
global.get $glob57
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4510
)
(block $4513
(block $4512
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4512
(block $4514
global.get $glob58
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4513
)
(block $4515
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4515
(block $4516
global.get $glob59
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4486
)
)
)
br $4483
)
(block $4518
(block $4517
local.get $loc5
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4517
(block $4519
(i32.const 0 )
local.set $loc6
(block $4520
(loop $4521
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4520
(block $4522
(block $4524
(block $4523
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4523
(block $4525
global.get $glob60
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4524
)
(block $4527
(block $4526
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4526
(block $4528
global.get $glob61
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4527
)
(block $4530
(block $4529
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4529
(block $4531
global.get $glob62
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4530
)
(block $4533
(block $4532
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4532
(block $4534
global.get $glob63
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4533
)
(block $4536
(block $4535
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4535
(block $4537
global.get $glob64
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4536
)
(block $4539
(block $4538
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4538
(block $4540
global.get $glob65
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4539
)
(block $4542
(block $4541
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4541
(block $4543
global.get $glob66
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4542
)
(block $4545
(block $4544
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4544
(block $4546
global.get $glob67
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4545
)
(block $4548
(block $4547
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4547
(block $4549
global.get $glob68
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4548
)
(block $4550
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4550
(block $4551
global.get $glob69
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4521
)
)
)
br $4518
)
(block $4553
(block $4552
local.get $loc5
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4552
(block $4554
(i32.const 0 )
local.set $loc6
(block $4555
(loop $4556
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4555
(block $4557
(block $4559
(block $4558
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4558
(block $4560
global.get $glob70
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4559
)
(block $4562
(block $4561
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4561
(block $4563
global.get $glob71
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4562
)
(block $4565
(block $4564
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4564
(block $4566
global.get $glob72
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4565
)
(block $4568
(block $4567
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4567
(block $4569
global.get $glob73
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4568
)
(block $4571
(block $4570
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4570
(block $4572
global.get $glob74
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4571
)
(block $4574
(block $4573
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4573
(block $4575
global.get $glob75
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4574
)
(block $4577
(block $4576
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4576
(block $4578
global.get $glob76
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4577
)
(block $4580
(block $4579
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4579
(block $4581
global.get $glob77
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4580
)
(block $4583
(block $4582
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4582
(block $4584
global.get $glob78
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4583
)
(block $4585
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4585
(block $4586
global.get $glob79
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4556
)
)
)
br $4553
)
(block $4588
(block $4587
local.get $loc5
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4587
(block $4589
(i32.const 0 )
local.set $loc6
(block $4590
(loop $4591
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4590
(block $4592
(block $4594
(block $4593
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4593
(block $4595
global.get $glob80
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4594
)
(block $4597
(block $4596
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4596
(block $4598
global.get $glob81
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4597
)
(block $4600
(block $4599
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4599
(block $4601
global.get $glob82
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4600
)
(block $4603
(block $4602
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4602
(block $4604
global.get $glob83
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4603
)
(block $4606
(block $4605
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4605
(block $4607
global.get $glob84
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4606
)
(block $4609
(block $4608
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4608
(block $4610
global.get $glob85
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4609
)
(block $4612
(block $4611
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4611
(block $4613
global.get $glob86
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4612
)
(block $4615
(block $4614
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4614
(block $4616
global.get $glob87
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4615
)
(block $4618
(block $4617
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4617
(block $4619
global.get $glob88
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4618
)
(block $4620
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4620
(block $4621
global.get $glob89
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4591
)
)
)
br $4588
)
(block $4622
local.get $loc5
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4622
(block $4623
(i32.const 0 )
local.set $loc6
(block $4624
(loop $4625
local.get $loc6
(i32.const 9 )
i32.le_s
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4624
(block $4626
(block $4628
(block $4627
local.get $loc6
(i32.const 0 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4627
(block $4629
global.get $glob90
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4628
)
(block $4631
(block $4630
local.get $loc6
(i32.const 1 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4630
(block $4632
global.get $glob91
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4631
)
(block $4634
(block $4633
local.get $loc6
(i32.const 2 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4633
(block $4635
global.get $glob92
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4634
)
(block $4637
(block $4636
local.get $loc6
(i32.const 3 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4636
(block $4638
global.get $glob93
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4637
)
(block $4640
(block $4639
local.get $loc6
(i32.const 4 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4639
(block $4641
global.get $glob94
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4640
)
(block $4643
(block $4642
local.get $loc6
(i32.const 5 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4642
(block $4644
global.get $glob95
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4643
)
(block $4646
(block $4645
local.get $loc6
(i32.const 6 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4645
(block $4647
global.get $glob96
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4646
)
(block $4649
(block $4648
local.get $loc6
(i32.const 7 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4648
(block $4650
global.get $glob97
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4649
)
(block $4652
(block $4651
local.get $loc6
(i32.const 8 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4651
(block $4653
global.get $glob98
call $printi
i32.const 22
i32.const 23
call $prints
)
br $4652
)
(block $4654
local.get $loc6
(i32.const 9 )
i32.eq
i32.const 1
i32.add
i32.const 2
i32.rem_s
br_if $4654
(block $4655
global.get $glob99
call $printi
i32.const 22
i32.const 23
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
local.get $loc6
(i32.const 1 )
i32.add
local.set $loc6
)
br $4625
)
)
)
)
)
)
)
)
)
)
)
)
)
i32.const 122
i32.const 123
call $prints
local.get $loc5
(i32.const 1 )
i32.add
local.set $loc5
)
br $4305
)
)
)
)
)
(func $morerandom
(result i32)
(local $ret206 i32)
(block $4656
(block $4657
call $INTERNALrandom
(i32.const 57 )
i32.rem_s
local.set $ret206
br $4656
call $INTERNALrandom
drop
)
)
(local.get $ret206)
)
(func $INTERNALseed
(param $loc207 i32)
(block $4658
(block $4659
local.get $loc207
global.set $glob201
)
)
)
(func $INTERNALrandom
(result i32)
(local $ret208 i32)
(block $4660
(block $4661
(i32.const 17 )
global.get $glob201
i32.mul
(i32.const 13 )
i32.add
(i32.const 32768 )
i32.rem_s
global.set $glob201
global.get $glob201
local.set $ret208
br $4660
)
)
(local.get $ret208)
)
)
