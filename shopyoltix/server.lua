ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('yoltix_shop:acheterpain')
AddEventHandler('yoltix_shop:acheterpain', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 10 then
		xPlayer.addInventoryItem('bread', 1)
		xPlayer.removeMoney(10)
		TriggerClientEvent('esx:showNotification', source, "Vous avez bien reçu votre ~g~Pain ~s~!")
	else
		TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~10$ ~s~!")
	end
end)

RegisterNetEvent('yoltix_shop:achetereau')
AddEventHandler('yoltix_shop:achetereau', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 10 then
		xPlayer.addInventoryItem('water', 1)
		xPlayer.removeMoney(10)
		TriggerClientEvent('esx:showNotification', source, "Vous avez bien reçu votre ~g~Eau ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~10$ ~s~!")	
	end	
end)

RegisterNetEvent('yoltix_shop:achetertel')
AddEventHandler('yoltix_shop:achetertel', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 150 then
		xPlayer.addInventoryItem('tel', 1)
		xPlayer.removeMoney(150)
		TriggerClientEvent('esx:showNotification', source, "Vous avez bien reçu votre ~g~Telephone ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~150$ ~s~!")	
	end	
end)


RegisterNetEvent('yoltix_shop:achetersim')
AddEventHandler('yoltix_shop:achetersim', function(v, quantite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= 50 then
		xPlayer.addInventoryItem('sim', 1)
		xPlayer.removeMoney(50)
		TriggerClientEvent('esx:showNotification', source, "Vous avez bien reçu votre ~g~Sim ~s~! ")
	else
		TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~50$ ~s~!")	
	end	
end)