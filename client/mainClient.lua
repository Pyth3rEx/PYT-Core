--[[ Client Event: PYT-Core:Client:DebugPrinter
    Description:
        Will print a debug message to the client
    Argument:
        message [string]: message to be printed to the client
]]--
RegisterNetEvent('PYT-Core:Client:DebugPrinter')
AddEventHandler('PYT-Core:Client:DebugPrinter', function (message)
    print(tostring(message))
end)