

if( oldPrint == nil ) then 
	oldPrint = print

	function ResetDebugLog()
		debugLog = { "Debug log:" }
	end 
	
	ResetDebugLog() -- create our debug log for print stuff to go to 

--	print = function (...)
--		if( getn(arg) > 0 ) then 
--			local count = getn(debugLog)
--			debugLog[count+1] = arg[1]
--		end
--		oldPrint(unpack(arg))
--	end 
	
	
	print = function ( a1, a2, a3, a4, a5)
		if( a1 ~= nil and a2 == "debug" ) then 
			local count = getn(debugLog)
			debugLog[count+1] = a1 
		end 
		
		if( a5 ~= nil ) then 
			oldPrint(">"..a1, a2, a3, a4, a5)
		elseif( a4 ~= nil) then 
			oldPrint(">"..a1, a2, a3, a4)
		elseif( a3 ~= nil) then 
			oldPrint(">"..a1, a2, a3)
		elseif( a2 ~= nil) then 
			oldPrint(">"..a1, a2)
		else 
			oldPrint(">"..a1)
		end 
		
	end 

end 

if ( SetDebugStuffOnCredits == nil ) then 
	function SetDebugStuffOnCredits( listOfStrings )
		local numberOfStrings = getn(listOfStrings)
		local numCredits = getn(CreditLines)
		local debugStringIndex = 1
		local creditIndex = 1
		
		--print("SetDebugStuffOnCredits numCredits:" .. numCredits .. " numberOfStrings: " .. numberOfStrings )
			
		while ( debugStringIndex <= numberOfStrings and creditIndex <= numCredits ) do 
			if( CreditLines[creditIndex]["str"] ~= nil ) then 
				CreditLines[creditIndex]["str"] = listOfStrings[debugStringIndex]
				debugStringIndex = debugStringIndex +1
			end 
			creditIndex = creditIndex + 1
		end 
	end 
end 


--ifs_movietrans_PushScreen(ifs_credits)
if( old_ifs_movietrans_PushScreen == nil ) then 
	old_ifs_movietrans_PushScreen = ifs_movietrans_PushScreen
	ifs_movietrans_PushScreen = function(theScreen)
		if( theScreen == ifs_credits) then 
			SetDebugStuffOnCredits( debugLog )
		end 
		old_ifs_movietrans_PushScreen(theScreen)
	end 
end 


ResetDebugLog()
print("end debug", "debug")
