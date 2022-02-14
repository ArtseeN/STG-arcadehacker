ESX = nil 
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterNetEvent("art-laptopal")
AddEventHandler("art-laptopal", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.setQuantity("bandage")
    xPlayer.setInventoryItem("laptop, 1")
end)