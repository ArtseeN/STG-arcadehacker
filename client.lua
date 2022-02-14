ESX = nil

Citizen.CreateThread(function()
while ESX == nil do
    TriggerEvent("getSharedObject", function(obj)
    ESX = obj
    end)
    Citizen.Await(250)
   end
end)

Citizen.CreateThread(function()
  while true do
    local sleep = 9000
    local player = PlayerPedId()
    local playercoords = GetEntityCoords(player)
    local dst = GetDistanceBetweenCoords(playercoords, Config.laptopal.x, Config.laptopal.y, Config.laptopal.z, true)
    local dst2 = GetDistanceBetweenCoords(playercoords, Config.laptopal.x, Config.laptopal.y, Config.laptopal.z, true)
    if dst2 < 40 then
        sleep = 10
        DrawMarker(2, Config.laptopal.x, Config.laptopal.y, Config.laptopal.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
        if dst2 < 5 then 
            DrawText3Ds(Config.laptopal.x, Config.laptopal.y, Config.laptopal.z + 0.5, "[E] Laptop`u Raftan Al")
            if IsControlJustReleased(0, 38) then
              TriggerEvent("mythic_progbar:client:progress", {
              name = "laptopal",
              duration = 25000,
              label = "Laptopu Alıyorsun.",
              useWhileDead = false,
              canCancel = true,
              controlDisables = {
                  disableMovement = true,
                  disableCarMovement = true,
                  disableMouse = false,
                  disableCombat = true,
              },
              animation = {
                  animDict = "amb@prop_human_bum_bin@idle_a",
                  anim = "idle_a",
                  flags = 49,
              },
              prop = {
                  model = "prop_ld_scrap",
                  bone = -0,
                  coords = { x = -0, y = -0, z = -0 },
                  rotation = { x = 100.0, y = 150.00, z = 140.0 },
              },
          }, function(status)
              if not status then
                  TriggerServerEvent("art-laptop") 
                  exports['mythic_notify']:SendAlert('inform', 'Laptop`u üstüne aldın.', 5000)
              end
          end)
      end
  end
end
Citizen.Wait(sleep)
end
end)
