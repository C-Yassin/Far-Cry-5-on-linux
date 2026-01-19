-- Initialization
local ply = game:GetService("Players").LocalPlayer
local Root = ply.Character.HumanoidRootPart
local replicated = game:GetService("ReplicatedStorage")
-- ... (Service definitions)

-- World Detection
local World1 = (game.PlaceId == 2753915549) -- Example IDs
local World2 = (game.PlaceId == 4442272183)
local World3 = (game.PlaceId == 7449423635)

-- Configuration based on World
if World1 then
    BossList = { --[[ List of World 1 Bosses ]] }
    MaterialList = { --[[ List of World 1 Materials ]] }
elseif World2 then
    BossList = { --[[ List of World 2 Bosses ]] }
    -- ...
elseif World3 then
    BossList = { --[[ List of World 3 Bosses ]] }
    -- ...
end

-- Auto Farm Logic (BringEnemy)
local BringEnemy = function()
    if not _B then return end -- _B is likely the toggle for Auto Farm
    if not PosMon then return end -- PosMon is the position of the monster
    
    -- Loop through workspace enemies
    for K, X in pairs(workspace.Enemies:GetChildren()) do
        -- Check if enemy is a Boss or valid target
        -- If valid, teleport logic is applied:
        if (X.HumanoidRootPart.Position - Root.Position).Magnitude <= Distance then
             -- Tween or Teleport to Enemy
             _tp(X.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)) -- Behind/Above enemy
        end
    end
end

-- Auto Skills
local Useskills = function(i, K)
    -- Checks cooldowns and presses keys
    vim1:SendKeyEvent(true, "Z", false, game)
    vim1:SendKeyEvent(false, "Z", false, game)
    -- Repeats for other skills
end