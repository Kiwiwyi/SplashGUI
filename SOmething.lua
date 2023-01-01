local Players = {}
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(Players, v.Name)
end


local keygithub = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kiwiwyi/SplashGUI/main/code'))()
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Kiwiwyi/SplashGUI/main/Library.lua'))()

local Window = Rayfield:CreateWindow({
	Name = "Kiwi's GUI",
	LoadingTitle = "Kiwi's GUI (Loading)",
	LoadingSubtitle = "by Kiwi",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Kiwi's GUI"
	},
        Discord = {
        	Enabled = true,
        	Invite = "kiwis", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "Kiwi's GUI",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/kiwis)",
		FileName = "KiwisKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = keygithub
	}

})
local Tab_01 = Window:CreateTab("Home", 11976537894) -- Title, Image
local Tab_02 = Window:CreateTab("Player stats")
local Tab_03 = Window:CreateTab("Misc")
local Tab_04 = Window:CreateTab("Unlocks")
local Tab_05 = Window:CreateTab("coming soon")

local Slider_01 = Tab_02:CreateSlider({
    	Name = "Walkspeed",
    	Range = {0, 100},
    	Increment = 1,
    	Suffix = "Miles per Hour",
    	CurrentValue = 22,
    	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    	Callback = function(Walkspeedtxt)
    		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeedtxt
    		-- The function that takes place when the slider changes
        		-- The variable (Value) is a number which correlates to the value the slider is currently at
    	end,
})
local Label = Tab_01:CreateLabel("Welcome to the GUI")
local Slider_01 = Tab_02:CreateSlider({
    	Name = "Jumppower",
    	Range = {0, 200},
    	Increment = 1,
    	Suffix = "Watts per Kilogram",
    	CurrentValue = 50,
    	Flag = "Slider1", 
    	Callback = function(JPtxt)
    		game.Players.LocalPlayer.Character.Humanoid.JumpPower = JPtxt
    	end,
})

local Toggle_01 = Tab_03:CreateToggle({
	Name = "Auto Vote DJ Set",
	CurrentValue = false,
	Flag = "Toggle_01", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(HeartFeedback)

	end,
})

task.spawn(function()
    while task.wait() do
        if Toggle_01.CurrentValue then -- if variable name's current value is true then, another alternative is Rayfield.Flags.FlagName.CurrentValue
            local args = {
                [1] = 4,
                [2] = "heart"
            }
            game:GetService("ReplicatedStorage").ReactionEvent:FireServer(unpack(args))
            wait(1)
        end
    end
end)

local Button_01 = Tab_04:CreateButton({
	Name = "Button Example",
	Callback = function()
		game:GetService("ReplicatedStorage").SilverVIPFameRequired.Value = 0
        game:GetService("ReplicatedStorage").GoldVIPFameRequired.Value = 0
        game:GetService("ReplicatedStorage").DiamondVIPFameRequired.Value = 0
        game:GetService("ReplicatedStorage").FameRequiredForEffects.Value = 0
        game:GetService("ReplicatedStorage").FameRequiredForCombos.Value = 0
        game:GetService("ReplicatedStorage").FameRequiredForCustomAudio.Value = 0
        game:GetService("ReplicatedStorage").MaxCombosPerPack.Value = 11
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_NEONJAPANGamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_HALLOWEEN2021Gamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_CHRISTMAS2021Gamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_FESTIVAL2022Gamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_BANDS2022Gamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_ROBOTS2022Gamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_ROBOTS2022_ELITEGamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_NEONJAPAN_ELITEGamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasSEASONPASS_FESTIVAL2022_ELITEGamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasMOREPAINTGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasEXTRALAYERSGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"]["hasFASHION_SHOPGamepass"].Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasCLUBRADIOGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasSKATEPROGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasMVPGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasMERCIMERCYGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasDANCEMONKEYGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasPROPADSGamepass.Value = true
        game:GetService("Players")["DJ_Chr0nic"].hasMASHUPGamepass.Value = true
	end,
})

local PlayerDropdown = Tab_03:CreateDropdown({
    Name = "Player Favorites (Press E after select)",
    Options = Players,
    CurrentOption = "",
    Flag = "SelectedPlayer",
    Callback = function(Option)
        local PlayerInfo = Option
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        local key1 = true
        local PlayerName
        
        local WindowCreateKiwi = function()
            local ScreenGui_01 = Instance.new("ScreenGui")
            local Frame_01 = Instance.new("Frame")
            local CloseButton = Instance.new("TextButton")
            local TextLabel_01 = Instance.new("TextLabel")ScreenGui_01.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            ScreenGui_01.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            
            
            Frame_01.Parent = ScreenGui_01
            Frame_01.AnchorPoint = Vector2.new(1, 1)
            Frame_01.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Frame_01.Position = UDim2.new(1, 0, 1, 0)
            Frame_01.Size = UDim2.new(0, 189, 0, 290)
            Frame_01.Draggable = true
            
            CloseButton.Name = "CloseButton"
            CloseButton.Parent = Frame_01
            CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            CloseButton.Size = UDim2.new(0, 19, 0, 19)
            CloseButton.Font = Enum.Font.SourceSans
            CloseButton.Text = "X"
            CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            CloseButton.TextSize = 14.000
            CloseButton.MouseButton1Click:Connect(function()
            	Frame_01.ClipsDescendants = true -- Groups the UI to ensure that it shrinks the buttons, etc.
            	Frame_01:TweenSize(UDim2.new(0,0,0,0),"In","Linear",0.3,false,nil)
            	wait(0.3)
            	Frame_01.Visible = false
            end)
            
            TextLabel_01.Parent = Frame_01
            TextLabel_01.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            TextLabel_01.Position = UDim2.new(0.0476190448, 0, 0.117241375, 0)
            TextLabel_01.Size = UDim2.new(0, 171, 0, 243)
            TextLabel_01.Font = Enum.Font.SourceSans
            TextLabel_01.Text = PlayerInfo
            TextLabel_01.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_01.TextSize = 13.000
            TextLabel_01.TextWrapped = true
        end

        mouse.KeyDown:connect(function(key) -- Check if any key is pressed.
        key=key:lower()
        if key:lower() == "e" and key1 == true then -- Check for a specific key. Change "e" to the key you want.
            wait(1)
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Name == Option then
                   PlayerInfo = v:FindFirstChild("packFavoritesJSON").Value
                   PlayerName = v.Name
                end
            end
            key1 = false
            Window:Prompt({
            	Title = 'Player Stats',
            	SubTitle = [[Please select other player after pressing "gotcha"]],
            	Content = "PlayerInfo: " .. PlayerName,
            	Actions = {
            		Accept = {
            			Name = 'Gotcha',
            			Callback = function()
                            WindowCreateKiwi()
            			end,
            		}
            	}
            })
        end
        end)

    end,
})

game:GetService("Players").PlayerAdded:Connect(function(PlayerAdded)
    PlayerDropdown:Add(PlayerAdded.Name)
end)

game:GetService("Players").PlayerRemoving:Connect(function(PlayerRemoving)
    PlayerDropdown:Remove(PlayerRemoving.Name)
end)



Rayfield:Notify({
    Title = "Welcome",
    Content = "This is the original GUI from きうぃゐ#1970 (Beta 7R). Feel free to add me on discord for help.",
    Duration = 6.5,
    Image = 11976537894,
    Actions = { -- Notification Buttons
        Ignore = {
            Name = "Copy",
            Callback = function()
                setclipboard("discord.gg/kiwis")
            end
		},
	},
})
