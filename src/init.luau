--!nocheck

return require("core/Manager.luau")

--[==[
    --// Imports
    local ESPManager = require("core/Manager.luau")

    --// Services
    local Players = game:GetService("Players")

    --// Functions
    local function CreatePlayerESPObject(Player: Player)
        if not Player.Character then
            Player.CharacterAdded:Wait()
        end

        local Object = ESPManager.InstanceObject.new(Player.Character)

        Object:Add("BoxSquare")
        Object:Add("Tracer")
        Object:Add("Header", { Type = "Name" })
        Object:Add("Header", { Type = "Distance" })
        Object:Add("Header", { Type = "Weapon", Weapon = "AK-47" })
        Object:Add("Header", { Type = "MiscTop", Value = "Cool Person" })
        Object:Add("Header", { Type = "MiscBottom", Value = "Bottom Text" })
        Object:Add("Healthbar")
        Object:Add("OffArrow")
        Object:Add("Box3D")

        local Connection
        Connection = Players.PlayerRemoving:Connect(function(_Player)
            if _Player == Player then
                Object:Destroy()
                Connection:Disconnect()
            end
        end)

        return Object
    end

    --// Initialize 
    local PlayerLookup = Players:GetPlayers()

    for i = 2, #PlayerLookup do
        CreatePlayerESPObject(PlayerLookup[i])
    end

    Players.PlayerAdded:Connect(CreatePlayerESPObject)
]==]