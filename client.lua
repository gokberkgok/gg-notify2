function SendNotify(title, message, type, time)
    if type == nil or time == nil then
        type = "info"
        message = title
        title = nil
    end
    title = title or 'Title'
    type = type or 'info'
    time = time or 3000
    SendNUIMessage({
        action = 'notify',
        title = title,
        message = message,
        type = type,
        time = time
    })
end
RegisterNetEvent('notify:show')
AddEventHandler('notify:show', function(title, message, type, time)
	SendNotify(title, message, type, time)
end)

RegisterCommand('testnoti', function()
    SendNotify('City Bank', 'You have deposit 10$', 'success',3000)
    Wait(1000)
    SendNotify('Error', 'This car is not yours', 'error', 3000)
    Wait(1000)
    SendNotify('Test Title', 'This is a very long test message', 'info', 3000)
end, false)

RegisterCommand('testnoti2', function()
    SendNotify('Lorem ipsum dolor, sit amet consectetur adipisicing elit.', 2000)
end, false)
RegisterCommand('testnoti3', function()
   SendNotify('Lorem ipsum dolor, sit amet consectetur adipisicing elit.')
end, false)


--Usage
--TriggerEvent('notify:show','Title','Message','info',3000)