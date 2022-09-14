--local UIHelico	= {x = 0.3, y = 0.43} 				-- Original place // Emplacement original
--local UIHelico	= {x = 0.36, y = 0.19} 				-- Good Place top of M-HUD // Bien placé au dessus du M-HUD
local UIHelico	= {x = 0.00, y = 0.42}  				-- Middle screen // Placé au centre de l'écran
-- Local UIHelicoSpeed in Mph = 2.4, in Km/h = 3.6
local UIHelicoSpeed = 3.6						-- Réglé en Km/h


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		local playerPed = PlayerPedId()

		if IsPedInAnyVehicle(playerPed, false) then
			local PedVehicle = GetVehiclePedIsIn(playerPed,false)
			local Heli = IsPedInAnyHeli(playerPed)

			local HelicoOuiNon = IsPedInAnyHeli(playerPed)

			if HelicoOuiNon then

				local HeliSpeed		  = GetEntitySpeed(GetVehiclePedIsIn(playerPed, false)) * UIHelicoSpeed
				local HeliEngine 	  = GetIsVehicleEngineRunning(PedVehicle)
				local HeliHeight 	  = GetEntityHeightAboveGround(PedVehicle)
				local HeliMainRotorHealth = GetHeliMainRotorHealth(PedVehicle)
				local HeliTailRotorHealth = GetHeliTailRotorHealth(PedVehicle)		
				local HeliFuel 		  = GetVehicleFuelLevel(PedVehicle)

				-- engine display
				if HeliEngine then
					Text("~g~ENG", UIHelico.x + 0.375, UIHelico.y + 0.476, 0.55)
					Text("~g~__", UIHelico.x + 0.375, UIHelico.y + 0.47, 0.79)
				elseif HeliEngine == false then
					Text("~r~ENG", UIHelico.x + 0.375, UIHelico.y + 0.476, 0.55)
					Text("~r~__", UIHelico.x + 0.375, UIHelico.y + 0.47, 0.79)
				end

				-- Main rotor display
				if HeliMainRotorHealth > 800 and HeliEngine then
					Text("~g~MAIN", UIHelico.x + 0.425, UIHelico.y + 0.476, 0.55)
					Text("~g~__", UIHelico.x + 0.425, UIHelico.y + 0.47, 0.79)
				elseif HeliMainRotorHealth > 200 and HeliMainRotorHealth < 800 and HeliEngine then
					Text("~y~MAIN", UIHelico.x + 0.425, UIHelico.y + 0.476, 0.55)
					Text("~y~__", UIHelico.x + 0.425, UIHelico.y + 0.47, 0.79)
				elseif HeliMainRotorHealth < 200 and HeliEngine then
					Text("~r~MAIN", UIHelico.x + 0.425, UIHelico.y + 0.476, 0.55)
					Text("~r~__", UIHelico.x + 0.425, UIHelico.y + 0.47, 0.79)
				elseif HeliEngine == false then
					Text("~r~MAIN", UIHelico.x + 0.425, UIHelico.y + 0.476, 0.55)
					Text("~r~__", UIHelico.x + 0.425, UIHelico.y + 0.47, 0.79)
				end

				-- Tail rotor display
				if HeliTailRotorHealth > 300 and HeliEngine then
					Text("~g~TAIL", UIHelico.x + 0.475, UIHelico.y + 0.476, 0.55)
					Text("~g~__", UIHelico.x + 0.475, UIHelico.y + 0.47, 0.79)
				elseif HeliTailRotorHealth > 100 and HeliTailRotorHealth < 300 and HeliEngine then
					Text("~y~TAIL", UIHelico.x + 0.475, UIHelico.y + 0.476, 0.55)
					Text("~y~__", UIHelico.x + 0.475, UIHelico.y + 0.47, 0.79)
				elseif HeliTailRotorHealth < 100 and HeliEngine then
					Text("~r~TAIL", UIHelico.x + 0.475, UIHelico.y + 0.476, 0.55)
					Text("~r~__", UIHelico.x + 0.475, UIHelico.y + 0.47, 0.79)
				elseif HeliEngine == false then
					Text("~r~TAIL", UIHelico.x + 0.475, UIHelico.y + 0.476, 0.55)
					Text("~r~__", UIHelico.x + 0.475, UIHelico.y + 0.47, 0.79)
				end

				-- Altitude display
				Text(math.ceil(HeliHeight), UIHelico.x + 0.525, UIHelico.y + 0.476, 0.45)
				Text("ALTITUDE", UIHelico.x + 0.525, UIHelico.y + 0.502, 0.29)

				-- Speed display
				Text(math.ceil(HeliSpeed), UIHelico.x + 0.575, UIHelico.y + 0.476, 0.45)
				Text("AIR SPEED", UIHelico.x + 0.575, UIHelico.y + 0.502, 0.29)
				if HeliSpeed < 0.9 and HeliSpeed > 0.1 then
					Text("1", UIHelico.x + 0.575, UIHelico.y + 0.476, 0.45)
				elseif HeliSpeed == 0.0 then
				Text("0", UIHelico.x + 0.575, UIHelico.y + 0.476, 0.45)
				end

				-- Fuel display
				Text(math.ceil(HeliFuel), UIHelico.x + 0.625, UIHelico.y + 0.476, 0.45)
				Text("FUEL", UIHelico.x + 0.625, UIHelico.y + 0.502, 0.29)

				-- Big rectangels on the UIHelico
				DrawRect(UIHelico.x + 0.5, UIHelico.y + 0.5, 0.30, 0.085, 25, 25, 25, 255)
				DrawRect(UIHelico.x + 0.5, UIHelico.y + 0.5, 0.294, 0.075, 51, 51, 51, 255)

				-- Smaller squares in the rectangels.
				DrawRect(UIHelico.x + 0.375, UIHelico.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
				DrawRect(UIHelico.x + 0.425, UIHelico.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
				DrawRect(UIHelico.x + 0.475, UIHelico.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
				DrawRect(UIHelico.x + 0.525, UIHelico.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
				DrawRect(UIHelico.x + 0.575, UIHelico.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
				DrawRect(UIHelico.x + 0.625, UIHelico.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)				

				-- Slows down helicopter on landing and takeoff but not if it's flying fast close to the ground.
				if HeliSpeed > 15.0 and HeliHeight < 30.0 then
					SetEntityMaxSpeed(PedVehicle, 300.0)
				elseif HeliSpeed > 15.0 and HeliHeight < 10.0 then
					SetEntityMaxSpeed(PedVehicle, 20.0)
				elseif HeliHeight < 3.0 then
					SetEntityMaxSpeed(PedVehicle, 1.0)
				elseif HeliHeight < 5.0 then
					SetEntityMaxSpeed(PedVehicle, 2.0)
				elseif HeliHeight > 5.0 and HeliHeight < 10.0 then
					SetEntityMaxSpeed(PedVehicle, 3.0)
				elseif HeliHeight > 10.0 and HeliHeight < 15.0 then
					SetEntityMaxSpeed(PedVehicle, 4.0)
				elseif HeliHeight > 15.0 and HeliHeight < 20.0 then
					SetEntityMaxSpeed(PedVehicle, 6.0)
				elseif HeliHeight > 20.0 and HeliHeight < 25.0 then
					SetEntityMaxSpeed(PedVehicle, 7.0)
				elseif HeliHeight > 25.0 and HeliHeight < 30.0 then
					SetEntityMaxSpeed(PedVehicle, 10.0)
				elseif HeliHeight > 30.0 then
					SetEntityMaxSpeed(PedVehicle, 300.0)
				end
					
			end -- END if HelioOuiNon

		end -- END if Ped is any vehicle
	end -- END While true
end)

-- Disable the thread that poweroff engine when landing complete. Keep here for respect orginal work
-- J'ai désactivé ce thread qui coupe le moteur une fois atteri. Je l'ai gardé ici par respect du travail original
--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

		local Ped = GetPlayerPed(-1)
		local Heli = IsPedInAnyHeli(Ped)
		local PedVehicle = GetVehiclePedIsIn(GetPlayerPed(-1),false)
		local HeliSpeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24
		local Engine = GetIsVehicleEngineRunning(PedVehicle)
		local Height = GetEntityHeightAboveGround(PedVehicle)

		-- Shuts down engine 5 seconds after landing.
		if Heli then
			if Height < 3.0 and HeliSpeed == 0 and Engine then
				Citizen.Wait(5000)
				SetVehicleEngineOn(PedVehicle, false, true, true)
			end
		end
	end
end)]]--

function Text(text, x, y, scale)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextOutline()
	SetTextJustification(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

print("This resource is a fork of by Andyyy#7666 -- https://github.com/Andyyy7666/HelicopterHUD")
print("I modifiy this to add Fuel information. if you find any buggs or need support please let me know on Discord : HarryMEYERS#6408")
