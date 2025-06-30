-- Loader with Key System and Whitelist

local ValidKey = "VOIDOnTop"
local KeyLink = "https://www.facebook.com/2u0580qw1u"

-- Whitelist Table (add usernames you want to whitelist here)
local Whitelist = {
    ["jakesandot10"] = true,
    ["Vinzkylele"] = true,
    ["theflamming_fire] true,
    -- Add more usernames here
}

-- Services
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

-- Whitelist Check
local LocalPlayer = Players.LocalPlayer
if not Whitelist[LocalPlayer.Name] then
    LocalPlayer:Kick("You are not whitelisted to use this script.")
    return
end

-- UI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 170)
Frame.Position = UDim2.new(0.5, -150, 0.5, -85)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Text = "Key System"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.Parent = Frame

local KeyBox = Instance.new("TextBox")
KeyBox.PlaceholderText = "Enter Key Here..."
KeyBox.Size = UDim2.new(0.8, 0, 0, 35)
KeyBox.Position = UDim2.new(0.1, 0, 0, 45)
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.Font = Enum.Font.SourceSans
KeyBox.TextSize = 18
KeyBox.Parent = Frame

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Text = "Get Key"
GetKeyBtn.Size = UDim2.new(0.45, -5, 0, 35)
GetKeyBtn.Position = UDim2.new(0.05, 0, 0, 90)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 80, 200)
GetKeyBtn.TextColor3 = Color3.new(1,1,1)
GetKeyBtn.Font = Enum.Font.SourceSansBold
GetKeyBtn.TextSize = 18
GetKeyBtn.Parent = Frame

local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Text = "Check Key"
CheckKeyBtn.Size = UDim2.new(0.45, -5, 0, 35)
CheckKeyBtn.Position = UDim2.new(0.5, 5, 0, 90)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 80)
CheckKeyBtn.TextColor3 = Color3.new(1,1,1)
CheckKeyBtn.Font = Enum.Font.SourceSansBold
CheckKeyBtn.TextSize = 18
CheckKeyBtn.Parent = Frame

local MessageLbl = Instance.new("TextLabel")
MessageLbl.Text = ""
MessageLbl.Size = UDim2.new(1, -20, 0, 30)
MessageLbl.Position = UDim2.new(0, 10, 0, 135)
MessageLbl.BackgroundTransparency = 1
MessageLbl.TextColor3 = Color3.new(1,1,1)
MessageLbl.Font = Enum.Font.SourceSans
MessageLbl.TextSize = 18
MessageLbl.Parent = Frame

-- Clipboard Copy Function (Krnl, Synapse, and others)
local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
    elseif syn and syn.write_clipboard then
        syn.write_clipboard(text)
    elseif Clipboard then
        Clipboard.set(text)
    end
end

-- Get Key button
GetKeyBtn.MouseButton1Click:Connect(function()
    copyToClipboard(KeyLink)
    MessageLbl.Text = "Key link copied to clipboard!"
end)

-- Check Key button
CheckKeyBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == ValidKey then
        MessageLbl.Text = "The Key is Correct!!"
        StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = "The Key is Correct!!",
            Duration = 4
        })
        -- Load your script here:
        loadstring(game:HttpGet('https://raw.githubusercontent.com/SenScriptsReworkVoidVersion/ClanOwners-Zen-Sen/refs/heads/main/Zenzzhsh'))()
        wait(1)
        ScreenGui:Destroy()
    else
        MessageLbl.Text = "Invalid Key!"
        StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = "Invalid Key!",
            Duration = 3
        })
    end
end)
