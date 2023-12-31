repeat task.wait() until
game:IsLoaded()

function RobloxNotification(first, second, time)
    game.StarterGui:SetCore("SendNotification", {
        Title = first;
        Text = second;
        Duration = time;
    })
end

RobloxNotification("Protection", "Anti Mail Stealer Has Been Enabled!", 5)

local function SendNotification()
    RobloxNotification("⚠️", "There was an attempt to use mailbox!", 5)
end
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if not checkcaller() and method == "InvokeServer" and tostring(self) == "Mailbox: Send" then
        return SendNotification()
    end
    return oldNamecall(self, ...)
end))
